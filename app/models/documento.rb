class Documento < ApplicationRecord
  def create_pdf_copy
    wicked = WickedPdf.new

    # Make a PDF in memory
    pdf_file = wicked.pdf_from_string(
      pdf: 'certificado.pdf',
      disposition: 'attachment',
      orientation: 'portrait',
      page_size: 'Letter',
      margin: {
        top: 20,
        bottom: 10,
        left: 5,
        right: 5
      }
    )

    # Write it to tempfile
    tempfile = Tempfile.new(['invoice', '.pdf'], Rails.root.join('tmp'))
    tempfile.binmode
    tempfile.write pdf_file
    tempfile.close
    # Attach that tempfile to the invoice
    unless pdf_file.blank?
        self.uploads.clear
        self.uploads.create(:fileinfo => File.open(tempfile.path), :job_id => self.job.id)
        tempfile.unlink
    end
  end
end
