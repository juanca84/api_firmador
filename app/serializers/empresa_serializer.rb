class EmpresaSerializer < ActiveModel::Serializer
  attributes :nit, :razon_social

  def nit
    object.nit
  end

  def razon_social
    object.razon_social
  end
end
