module Api
  module V1
    class PersonasController < ApiController
      def index
        persona = Persona.fetch(params[:doc], params[:fna])
        if persona.present?
          render json: PersonaSerializer.new(persona)
        else
          render json: {}
        end
      end
    end
  end
end
