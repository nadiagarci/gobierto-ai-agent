# app/services/pdf_processor.rb
require 'pdf/reader'

class PdfProcessor
  def initialize(tender)
    @tender = tender
    @pdf_file = tender.pdf
  end

  # Main entry point for the service
  def call
    # Verification: ensure a PDF is attached before proceeding
    return false unless @pdf_file.attached?

    begin
      # 1. Extract text from the PDF file
      raw_text = extract_text_from_pdf
      
      # 2. Get the smart summary from the AI
      summary = ask_ai_to_summarize(raw_text)
      
      # 3. Persistence: update the tender description with the AI result
      # We add a check to ensure we actually got a response
      if summary.present?
        @tender.update!(description: summary)
      else
        @tender.update!(description: "AI Error: The model returned an empty summary.")
      end
      
      true
    rescue => e
      # Log the error in the Rails console for debugging
      Rails.logger.error "PdfProcessor Error: #{e.message}"
      # Provide feedback directly in the UI during this development phase
      @tender.update!(description: "System Error: #{e.message}")
      false
    end
  end

  private

  # Helper method to extract text using the pdf-reader gem
  def extract_text_from_pdf
    @pdf_file.open do |file|
      reader = PDF::Reader.new(file.path)
      # We join page text and truncate to avoid token limits (approx 2000 chars)
      reader.pages.map(&:text).join("\n").truncate(2000)
    end
  end

  # Helper method to communicate with the Langchain OpenAI client
  def ask_ai_to_summarize(text)
    instructions = "Summarize the following document in 3 clear bullet points, focusing on the main professional skills or requirements: #{text}"
    
    # Probamos con la llave ':prompt' que es la que el error dice que espera
    response = OPENAI_CLIENT.chat(prompt: instructions)
    
    # Extraemos el texto
    response.respond_to?(:completion) ? response.completion : response
  end
end