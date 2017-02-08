class CreateDocumentos < ActiveRecord::Migration[5.0]
  def change
    create_table :documentos do |t|
      t.string :identificador
      t.string :fecha_nacimiento
      t.string :data
      t.string :pdf

      t.timestamps
    end
  end
end
