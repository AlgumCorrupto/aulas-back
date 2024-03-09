class Permissao < ApplicationRecord
  has_one :disciplina, class_name: "Disciplina", foreign_key: "disciplina_id"
  has_one :aluno, class_name: "Aluno", foreign_key: "aluno_id"
end
