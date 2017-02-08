module Api
  module V1
    class EmpresasController < ApplicationController
      def index
        empresa = Empresa.fetch(params[:nit])
        if empresa.present?
          render json: empresa.to_json
        else
          render json: {}
        end
      end
    end
  end
end
