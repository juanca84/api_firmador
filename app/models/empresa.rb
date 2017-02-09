class Empresa
  include ActiveModel::Model
  attr_accessor :nit, :razon_social, :pdf

  def initialize(nit, razon_social, pdf)
    @nit = nit
    @razon_social = razon_social
    @pdf = pdf
  end

  def self.fetch(nit_razon_social)
    return nil unless nit_razon_social.present?
    nit_razon_social = nit_razon_social.upcase
    url = Rails.application.secrets.urlFundEmpresaWS + '/v1/nit/' + nit_razon_social + '/matriculas'
    respuesta = RestClient.get(url, { 'Authorization' => "Bearer #{Rails.application.secrets.token}" })
    parse_response(respuesta.body)
  rescue
    begin
      url = Rails.application.secrets.urlFundEmpresaWS + '/v1/matriculas/buscar?texto=' + nit_razon_social
      respuesta = RestClient.get(url, { 'Authorization' => "Bearer #{Rails.application.secrets.token}" })
      parse_response(respuesta.body)
    rescue
      nil
    end
  end

  def self.parse_response(respuesta)
    parseador =
      if JSON.parse(respuesta)['SrvMatriculaConsultaNitResult'].present?
        JSON.parse(respuesta)['SrvMatriculaConsultaNitResult']['MatriculasResult'][0]
      elsif JSON.parse(respuesta)['SrvMatriculaConsultaRazonResult'].present?
        JSON.parse(respuesta)['SrvMatriculaConsultaRazonResult']['busquedaRazonSocial'][0]
      end
    return nil unless parseador.present?
    doc = Documento.crear(parseador)
    new(parseador['Nit'], parseador['RazonSocial'], doc.pdf)
  rescue
    nil
  end
end
