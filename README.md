<!-- # Gobierto AI Agent - Analista de Licitaciones 🚀

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
- [ ] Chat interactivo para consultas sobre el pliego. -->


# 🤖 Gobierto AI Agent

An intelligent tender management system built with **Ruby on Rails 8**. This agent automatically processes PDF documents to extract and summarize key professional requirements using OpenAI's GPT models through Langchain.

## 🚀 Key Features

* **PDF Analysis:** Automatic text extraction from uploaded PDF files using the `pdf-reader` gem.
* **AI Summarization:** Integration with OpenAI (via Langchainrb) to generate concise 3-point summaries focusing on professional skills.
* **Service-Oriented Architecture:** Business logic encapsulated in `PdfProcessor` service for maintainability and clean code.
* **Modern Rails Stack:** Built with Active Storage for file management and the latest Rails 8 features.

## 🛠️ Technical Stack

* **Framework:** Ruby on Rails 8
* **AI Orchestration:** Langchainrb
* **LLM:** OpenAI (GPT-4)
* **Database:** PostgreSQL (Ready for production scale)
* **Storage:** Active Storage (Local Disk)

## 🧠 Project Memory: Why this architecture?

* **Service Objects:** I moved the AI logic out of the Controller into `app/services/pdf_processor.rb` to follow the Single Responsibility Principle and keep the codebase scalable.
* **Langchain Integration:** I opted for Langchain to wrap our LLM calls, discovering that specific versions require the `:prompt` argument for optimal compatibility with GPT-4.
* **PostgreSQL:** Chosen for its robustness and seamless deployment to modern cloud platforms.

## 🚧 Upcoming Milestones (Roadmap)

* **UI/UX Enhancement:** Modernize the frontend using Tailwind CSS/CSS for a professional look.
* **Interactive Agent:** Implement a Q&A feature to ask specific questions about the PDF content.
* **Live Deployment:** Deploy the application to a production environment.

## 🔧 Installation & Setup

1.  **Clone the repo:**
    ```bash
    git clone [https://github.com/your-user/gobierto-ai-agent.git](https://github.com/your-user/gobierto-ai-agent.git)
    ```
2.  **Install dependencies:**
    ```bash
    bundle install
    ```
3.  **Set up credentials:**
    Add your `openai_api_key` to Rails credentials.
4.  **Run the server:**
    ```bash
    bin/rails s
    ```

---
*Developed with ❤️ as part of the Gobierto AI Agent project.*