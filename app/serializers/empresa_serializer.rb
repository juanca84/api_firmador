class EmpresaSerializer < ActiveModel::Serializer
  attributes :nit, :razon_social, :id_doc, :pdf

  def nit
    object.nit
  end

  def razon_social
    object.razon_social
  end

  def pdf
    object.pdf
  end

  def id_doc
    object.id_doc
  end
end
