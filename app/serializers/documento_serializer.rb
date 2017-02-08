class DocumentoSerializer < ActiveModel::Serializer
  attributes :id, :identificador, :fecha_nacimiento, :pdf
end
