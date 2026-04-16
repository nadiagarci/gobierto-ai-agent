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


<!-- # 🤖 Gobierto AI Agent

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
*Developed with ❤️ for the AI Agent Challenge.* -->

<!-- # 🤖 Gobierto AI Agent (v2.0)

An intelligent tender management system built with **Ruby on Rails 8.1**. This agent automatically processes PDF documents to evaluate public procurement opportunities, determining business viability and extracting technical requirements using OpenAI's GPT-4.

🚀 Key Features

* **Tender Evaluation:** Automatic decision-making (Go / No-Go) based on a custom company profile.
* **Intelligent Extraction:** Summarizes budget, solvency requirements, and executive summaries into structured JSON.
* **Safe Credentials:** Hybrid environment configuration using `.env` for agile development, bypassing complex encrypted credentials.
* **Robust Service Architecture:** Business logic encapsulated in `TenderEvaluator` for high maintainability.

🛠️ Technical Stack

* **Framework:** Ruby on Rails 8.1
* **AI Orchestration:** Langchainrb
* **LLM:** OpenAI (GPT-4)
* **PDF Parsing:** pdf-reader
* **Database:** PostgreSQL with `jsonb` for persisting AI analysis.

🧠 Project Memory: Why this architecture?

* **From Extraction to Evaluation:** We evolved from `PdfProcessor` to `TenderEvaluator`. The goal shifted from just reading text to comparing tender requirements against a real company profile (`COMPANY_PROFILE`).
* **The Credentials Pivot:** We moved away from `credentials.yml.enc` toward a `.env` approach. This was a strategic decision to avoid "Master Key" dependency issues across different development environments.
* **JSONB Persistence:** Analysis results are stored in a PostgreSQL `jsonb` column, allowing the UI to render structured data without re-calling the LLM.

🚧 Upcoming Milestones (Roadmap)

* **[DONE]** Core AI Logic & JSON Parsing.
* **[NEXT]** UI/UX Enhancement: Modernize the tender index with Tailwind CSS "cards" for the AI verdict.
* **Interactive Agent:** A chat sidebar to ask "What is the penalty for late delivery?" without reading the whole PDF.

🔧 Installation & Setup

1. **Clone the repo:** `git clone https://github.com/nadiagarci/gobierto-ai-agent.git`
2. **Setup Keys:** Create a `.env` file in the root and add:
   `OPENAI_ACCESS_TOKEN="your_sk_key_here"`
3. **Install & Migrate:** `bundle install && bin/rails db:migrate`
4. **Run Dev Suite:** `bin/dev` (Launches Rails + Tailwind)

Developed with ❤️ by Nadia Garcia. -->

# 🤖 AI-Powered Procurement Analyzer

An intelligent tender management system built with **Ruby on Rails 8.1**. This agent automatically processes PDF documents to evaluate public procurement opportunities, determining business viability and extracting technical requirements using a **RAG-ready architecture**.

🚀 **Key Features**

* **Tender Evaluation:** Automatic decision-making (Go / No-Go) based on a custom company profile.
* **Intelligent Extraction:** Summarizes budget, solvency requirements, and executive summaries into structured JSON.
* **Vectorized Memory:** Prepared for semantic search and RAG (Retrieval-Augmented Generation) using vector embeddings.
* **Zero-Downtime Pipeline:** Modern deployment and task management without the overhead of Redis via Solid Queue.

🛠️ **Technical Stack**

* **Framework:** Ruby on Rails 8.1 (Edge)
* **AI Orchestration:** Langchainrb
* **LLM:** OpenAI (GPT-4)
* **Vector DB:** PostgreSQL + `pgvector`
* **UX/UI:** Hotwire (Turbo & Stimulus) + Tailwind CSS
* **Infrastructure:** Kamal (Deployment / Docker-based orchestration) and Solid Stack (Queue/Cache).

🧠 **Project Memory: Why this architecture?**

* **The RAG Pivot:** We integrated `pgvector` to move beyond simple text parsing. The goal shifted from just reading text to creating a "Corporate Memory" that compares tenders against historical company data.
* **Infrastructure Minimalism:** By adopting `Solid Queue` and `Solid Cache`, we eliminated the need for Redis. This ensures a "One Person Framework" approach: powerful but easy to maintain.
* **JSONB Persistence:** Analysis results are stored in a PostgreSQL `jsonb` column, allowing the UI to render structured data without re-calling the LLM.

🚧 **Upcoming Milestones (Roadmap)**

* **[DONE]** Core AI Logic & JSON Parsing.
* **[DONE]** Rails 8 Migration & Solid Stack integration.
* **[NEXT]** Semantic Search: Implementation of RAG to query company experience against tender requirements.
* **Interactive Agent:** A chat sidebar to ask "What is the penalty for late delivery?" using vectorized document chunks.

🔧 **Installation & Setup**

1. **Clone the repo:** `git clone https://github.com/nadiagarci/gobierto-ai-agent.git`
2. **Setup Keys:** Create a `.env` file in the root and add:
   `OPENAI_ACCESS_TOKEN="your_sk_key_here"`
3. **Install & Setup:** `bundle install && bin/rails db:prepare`
4. **Run Dev Suite:** `bin/dev` (Launches Rails + Tailwind + Solid Queue)

Developed with ❤️ by Nadia Garcia.