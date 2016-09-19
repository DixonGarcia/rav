class CreateRecomendations < ActiveRecord::Migration[5.0]
  def change
    create_table :recomendations do |t|
      t.integer :user_id
      t.string :tema
      t.string :seccion
      t.string :recomendacion
      t.timestamps
    end
  end
end
