class Api::User::AulasController < ApplicationController
  def index
    @perm = Permissao.find_by(disciplina_id: params[:di_id],
                              aluno_id: session[:currID])
    if @perm
      @aulas = Aula.where(disciplina_id: params[:di_id])
      render status: 200, json: @aulas
    else
      render status: :unauthorized, json: { msg: "Usuário não autorizado" }
    end
  end

  def show
    @aula = Aula.find(params[:id])
    if aula
      render status: 200, json: @aula
    else
      render status: 404, json: { msg: "aula não achada" }
    end
  end
end
