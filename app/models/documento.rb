class Documento < ApplicationRecord

  def self.crear(params)
    if params['NumeroDocumento'].present?
      doc = Documento.create!(identificador: params['NumeroDocumento'],
                          fecha_nacimiento: params['FechaNacimiento'])
      doc.generar_pdf(params)
    elsif params['Nit'].present?
      doc = Documento.create!(identificador: params['Nit'])
      doc.generar_pdf(params)
    end
    doc
  end

  def generar_qr
    datos = Rails.application.routes.url_helpers.documentos_url(
              self, host: Rails.application.secrets.rails_host)
    RQRCode::QRCode.new(datos, size: 4, level: :q)
  end

  def generar_pdf(params)
    ac = ActionController::Base.new()
    qr = generar_qr
    # Make a PDF in memory
    pdf_file = ac.render_to_string(
      pdf: 'certificado.pdf',
      layout: 'pdf.html',
      template: 'documentos/show.html.haml',
      disposition: 'attachment',
      orientation: 'portrait',
      page_size: 'Letter',
      locals: { documento: params, qr: qr },
      margin: {
        top: 20,
        bottom: 10,
        left: 5,
        right: 5
      })

    # Write it to tempfile
    tempfile = Tempfile.new(['invoice', '.pdf'], Rails.root.join('tmp'))
    tempfile.binmode
    tempfile.write pdf_file
    tempfile.close
    # Attach that tempfile to the invoice
    unless pdf_file.blank?
      self.pdf = Base64.encode64(File.open(tempfile.path) { |io| io.read })
      self.save
      tempfile.unlink
    end
  end
end
