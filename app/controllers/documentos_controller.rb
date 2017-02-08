class DocumentosController < ApplicationController
  before_action :set_documentos, only: [:show, :update, :destroy]

  # GET /documentos/1
  def show
    @documento = Documento.find(params[:id])
    respond_to do |format|
      format.pdf do
        filename = 'inventario-de-activos-fijos'
        render pdf: filename,
               disposition: 'attachment',
               layout: 'pdf.html',
               template: 'documentos/show.html.haml',
               orientation: 'portrait',
               page_size: 'Letter',
               margin: { top: 20, bottom: 10, left: 5, right: 5 }
      end
    end
  end

end
