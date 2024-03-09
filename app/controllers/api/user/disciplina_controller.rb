class Api::User::DisciplinaController < ApplicationController
  def index
    @disciplinas = []
    @permissoes = Permissao.where(aluno_id: session[:currID])
    @permissoes.each{ |perm| @disciplinas.push(Disciplina.find(perm.disciplina_id)) }

    render status: 200, json: @disciplinas
  end
end
