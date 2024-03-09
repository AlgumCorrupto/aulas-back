class Professor < ApplicationRecord
  has_many :disciplinas
  validates :nome, presence: true, length: { minimum: 3 }
  validates :cpf, presence: true, length: { minimum: 11}, uniqueness: true
  validates :credencial, presence: true, length: { minimum: 3 }
end
