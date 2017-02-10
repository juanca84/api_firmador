module Api
  module V1
    class DocumentosController < ApiController
      def update
        documento = Documento.find(params[:id])
        if params[:pdf].present?
          if documento.update_attributes(pdf: params[:pdf])
            render json: { mensaje: 'La actualización se realizó correctamente.' }
          else
            render json: { error: 'Se produjo un error al actualizar el pdf.' }
          end
        else
          render json: { error: 'Debe adjuntar un archivo pdf.' }
        end
      end
    end
  end
end
