class DocumentosController < ApplicationController
  # GET /documentos/1
  def show
    @documento = Documento.find(params[:id])
    send_data(Base64.decode64(@documento.pdf), type: 'application/pdf',
              filename: 'certificado', disposition: 'inline')
  end
end
