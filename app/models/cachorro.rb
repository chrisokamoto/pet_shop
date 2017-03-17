class Cachorro < ActiveRecord::Base
  GENEROS = %w(F M)

  validates :raca, presence: true
  validates :genero, inclusion: { in: GENEROS }
  validates :data_nascimento, presence: true
  validates :nome, presence: true
  validates :nome_dono, presence: true
  validates :telefone, presence: true
end
