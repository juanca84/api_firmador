class Persona
  include ActiveModel::Model
  include ActiveModel::Validations::Callbacks

  attr_accessor :documento, :nombres, :apellido_primero, :apellido_segundo,
                :fecha_nacimiento, :pdf, :id_doc

  def initialize(documento, nombres, apellido_primero, apellido_segundo, fecha_nacimiento, pdf, id_doc)
    @documento = documento
    @nombres = nombres
    @apellido_primero = apellido_primero
    @apellido_segundo = apellido_segundo
    @fecha_nacimiento = fecha_nacimiento
    @pdf = pdf
    @id_doc = id_doc
  end

  def self.fetch(documento, fecha_nacimiento)
    return nil if !documento.present? || !fecha_nacimiento.present?
    url = Rails.application.secrets.urlSegipWS + '/v2/personas/' + documento
    respuesta = RestClient.get(url, headers = { 'Authorization' => "Bearer #{Rails.application.secrets.token}" })
    persona = parse_response(respuesta.body)
    return nil if fecha_nacimiento.to_date != persona.fecha_nacimiento.to_date
    persona
  rescue
    nil
  end

  def self.parse_response(respuesta)
    return nil if JSON.parse(respuesta)['res'].present?
    parseador = JSON.parse(respuesta)['ConsultaDatoPersonaEnJsonResult']['DatosPersonaEnFormatoJson']
    return nil unless parseador.present?
    parseador = JSON.parse(parseador)
    doc = Documento.crear(parseador)
    new(parseador['NumeroDocumento'], parseador['Nombres'],
        parseador['PrimerApellido'], parseador['SegundoApellido'],
        parseador['FechaNacimiento'], doc.pdf, doc.id)
  end
end
