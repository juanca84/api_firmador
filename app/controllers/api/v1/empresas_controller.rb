module Api
  module V1
    class EmpresasController < ApiController
      def index
        empresa = Empresa.fetch(params[:nit])
        if empresa.present?
          render json: EmpresaSerializer.new(empresa)
        else
          render json: {}
        end
      end
    end
  end
end
