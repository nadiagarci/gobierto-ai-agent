require 'pdf/reader'

class TenderEvaluator
  # --- TU PERFIL DE EMPRESA ---
  COMPANY_PROFILE = {
    name: "TechSoluciones S.L.",
    annual_revenue: 600_000,
    team_size: 8,
    key_experience: "Desarrollo web con Ruby on Rails, integraciones de IA, 1 contrato previo con administración pública (80k€)",
    certifications: ["ISO 9001", "ISO 27001"]
  }.freeze

  def initialize(tender)
    @tender = tender
    @pdf_file = tender.pdf
  end

  def call
    return false unless @pdf_file.attached?

    begin
      raw_text = extract_text_from_pdf
      
      instructions = <<~PROMPT
        Actúa como consultor experto de Gobierto. Analiza el siguiente pliego de licitación.
        Vas a analizar un fragmento de las primeras páginas de un pliego de licitación pública. 
        Céntrate en extraer el objeto, presupuesto y requisitos de solvencia técnica/económica que suelen aparecer en estos primeros capítulos.
        

        ### REGLAS DE ORO PARA EL VEREDICTO:
        1. LA SOLVENCIA TÉCNICA ES ELIMINATORIA: Si el pliego exige experiencia previa en una actividad (ej. "Cines de Verano") y el perfil de la empresa NO la tiene explícitamente, el veredicto DEBE ser "No-Go". 
        2. NO PROMEDIES: Tener mucha solvencia económica NO compensa la falta de experiencia técnica. Un fallo técnico = No-Go automático.
        3. DETECCIÓN DE RIESGOS: En 'puntos_clave', busca activamente términos como "no cumple", "falta de experiencia", "riesgo de exclusión" o "insuficiente".

        IMPORTANTE PARA 'puntos_clave':
        Si el veredicto es No-Go, redacta los puntos clave indicando claramente la falta o el riesgo. 
        Ejemplo: En lugar de "Experiencia en murales", escribe "Falta de experiencia en murales de arte urbano".
        
      
        
        PERFIL DE MI EMPRESA:
        #{COMPANY_PROFILE.to_json}
        
        TEXTO DEL PLIEGO (Extracto):
        #{raw_text}

        TAREA:
        
        Responde ÚNICAMENTE con un objeto JSON válido (sin texto extra):
        {
          "presupuesto": "importe con moneda",
          "viabilidad": "Go / No-Go / Review",
          "analisis_solvencia": "Explicación de por qué #{COMPANY_PROFILE[:name]} cumple o no",
          "resumen_ejecutivo": "3-4 líneas sobre el objeto del contrato y plazos",
          "puntos_clave": ["requisito 1", "requisito 2", "requisito 3"]
        }
      PROMPT

      # Llamada a OpenAI
      response = OPENAI_CLIENT.chat(prompt: instructions)
      completion = response.respond_to?(:completion) ? response.completion : response
      
      # Parseamos el JSON que nos da la IA
      analysis = JSON.parse(completion)

      # Guardamos el JSON en la nueva columna
      @tender.update!(
        analysis_data: analysis,
        description: "Veredicto: #{analysis['viabilidad']} - #{analysis['resumen_ejecutivo']}"
      )
      true
    rescue => e
      Rails.logger.error "TenderEvaluator Error: #{e.message}"
      @tender.update!(description: "Error técnico: #{e.message}")
      false
    end
  end

  private

  def extract_text_from_pdf
    @pdf_file.open do |file|
      reader = PDF::Reader.new(file.path)
      # Cogemos los primeros 20000 caracteres para no pasarnos de tokens
      reader.pages.map(&:text).join("\n").truncate(20000)
    end
  end
end