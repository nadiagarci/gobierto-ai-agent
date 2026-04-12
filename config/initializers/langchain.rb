# Initialize the OpenAI client using encrypted credentials.
# We are using gpt-4o-mini for its balance between speed and cost-efficiency,
# which is ideal for parsing large procurement documents (Tenders).
#OPENAI_CLIENT = Langchain::LLM::OpenAI.new(
#  api_key: Rails.application.credentials.openai[:api_key],  default_options: {
#    # Main model for chat and reasoning
#    chat_completion_model_name: "gpt-4o-mini",
#    
#    # Model used to generate vectors for our pgvector database
#    embeddings_model_name: "text-embedding-3-small"
#  }
#)
require "dotenv/load" # <--- ESTA LÍNEA ES VITAL

# Usamos una configuración más estándar para evitar el error de mapeo de tokens
OPENAI_CLIENT = Langchain::LLM::OpenAI.new(
  api_key: ENV['OPENAI_ACCESS_TOKEN'],
  default_options: {
    # Cambiamos temporalmente a "gpt-4" para asegurar compatibilidad con la gema
    chat_completion_model_name: "gpt-4",
    # Usamos gpt-4o-mini: es 10 veces más barato y mucho más rápido
    # chat_completion_model_name: "gpt-4o-mini",
    embeddings_model_name: "text-embedding-3-small"
  }
)