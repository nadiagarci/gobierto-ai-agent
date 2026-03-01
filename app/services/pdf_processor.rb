require 'pdf/reader'

class PdfProcessor
  # We initialize the service with a Tender object
  def initialize(tender)
    @tender = tender
    @pdf_file = tender.pdf
  end

  # This is the main method that "does the job"
  def call
    return false unless @pdf_file.attached?

    begin
      # 1. Download the PDF from Active Storage to a temporary file
      text = extract_text_from_pdf
      
      # 2. Update the tender description with the extracted text
      @tender.update!(description: text)
      
      true
    rescue => e
      Rails.logger.error "Error processing PDF: #{e.message}"
      false
    end
  end

  private

  def extract_text_from_pdf
    # Active Storage blobs can be opened as a local path
    @pdf_file.open do |file|
      reader = PDF::Reader.new(file.path)
      # Combine text from all pages into one string
      reader.pages.map(&:text).join("\n")
    end
  end
end