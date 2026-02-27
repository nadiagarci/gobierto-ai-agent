# Gobierto AI Agent - Analista de Licitaciones 🚀

Este proyecto es una prueba técnica orientada a **Gobierto** que consiste en un agente de inteligencia artificial capaz de analizar pliegos de contratación pública y responder preguntas estratégicas mediante procesamiento de lenguaje natural.

## 🛠️ Stack Tecnológico
- **Framework:** Rails 8.1 (Propshaft & Importmaps)
- **Lenguaje:** Ruby 3.4.1
- **IA:** Langchainrb + pgvector (PostgreSQL)
- **Frontend:** Tailwind CSS

## 🎯 Visión del Producto
El objetivo es transformar archivos PDF densos y complejos en información accionable, permitiendo a las empresas entender los requisitos de una licitación en segundos.

### User Stories (Fase 1: MVP)
1. **Carga de Pliegos:** Como usuario, puedo subir un PDF de una licitación.
2. **Procesamiento de IA:** La IA desglosa el contenido y lo indexa vectorialmente.
3. **Consulta Estratégica:** Como usuario, puedo preguntar por requisitos de solvencia o fechas clave y obtener respuestas directas del documento.

## 📈 Roadmap
- [x] Configuración del entorno de desarrollo y gemas de IA.
- [x] Integración de Tailwind CSS para la interfaz.
- [ ] Implementación de `Active Storage` para subida de PDFs.
- [ ] Lógica de extracción de texto y embeddings con `langchainrb`.
- [ ] Chat interactivo para consultas sobre el pliego.