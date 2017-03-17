class CreateCachorros < ActiveRecord::Migration
  def change
    create_table :cachorros do |t|
      t.string :raca
      t.string :genero
      t.boolean :castrado
      t.date :data_nascimento
      t.string :nome
      t.string :nome_dono
      t.string :telefone
      t.date :data_ultima_consulta

      t.timestamps
    end
  end
end
