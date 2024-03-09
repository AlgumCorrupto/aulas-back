class Disciplina < ApplicationRecord
  belongs_to :professor, class_name: "Professor", foreign_key: "professor_id"
  has_many :aulas

  validates :nome, presence: true, length: { maximum: 50 }, uniqueness: true
end
