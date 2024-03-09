class Aluno < ApplicationRecord
  validates :nome, presence: true, length: { minimum: 3 }
  validates :cpf, presence: true, length: { minimum: 11, maximun: 12 }, uniqueness: true
  validates :credencial, presence: true, length: { minimum: 3 }
end
