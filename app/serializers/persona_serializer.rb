class PersonaSerializer < ActiveModel::Serializer
  attributes :documento, :nombres, :apellido_primero, :apellido_segundo,
             :fecha_nacimiento
  def documento
    object.documento
  end

  def nombres
    object.nombres
  end

  def apellido_primero
    object.apellido_primero
  end

  def apellido_segundo
    object.apellido_segundo
  end

  def fecha_nacimiento
    object.fecha_nacimiento
  end
end
