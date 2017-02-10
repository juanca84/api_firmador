module Api
  module V1
    class EmpresasController < ApiController
      def index
        empresa = Empresa.fetch(params[:nit])
        if empresa.present?
          render json: EmpresaSerializer.new(empresa)
        else
          render json: { mensaje: 'No se encontraron datos.' }
        end
      end
    end
  end
end
