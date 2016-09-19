class AddFieldsToRecomendations < ActiveRecord::Migration[5.0]
  def change
    add_column :recomendations, :titulo, :string
    add_column :recomendations, :trigger, :string
    add_column :recomendations, :efecto, :string
    add_column :recomendations, :accion, :string
    add_column :recomendations, :mitigacion, :string
    add_column :recomendations, :imagen, :string
  end
end
