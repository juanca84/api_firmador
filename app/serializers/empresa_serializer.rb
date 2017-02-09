class EmpresaSerializer < ActiveModel::Serializer
  attributes :nit, :razon_social, :pdf

  def nit
    object.nit
  end

  def razon_social
    object.razon_social
  end

  def pdf
    object.pdf
  end
end
