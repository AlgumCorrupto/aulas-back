class Aula < ApplicationRecord
  validates :título, presence: true, length: { minimum: 3 }
  validates :corpo, presence: true, length: { minimum: 6 }
  belongs_to :disciplina, class_name: "Disciplina", foreign_key: "disciplina_id"
end
