class Api::Admin::DisciplinaController < ApplicationController
  def index
    @disciplinas = Disciplina.all
    @alunos = Aluno.all;


    render 200, json: [@disciplinas, @alunos]
  end

  def show
    @disciplina = Disciplina.find(params[:id])
    @aulas = Aula.find_by_disciplina_id(params[:id])
    @perms = Permissao.where(disciplina_id: params[:id])
    @alunos = Aluno.all;

    render 200, json: [@disciplina, @aulas, @perms, @alunos]
  end

  def create
    @disciplina = Disciplina.new(nome: params[:nome],
    professor_id: params[:professor_id])
    if @disciplina.save
      render status: :created, json: { msg: "disciplina criada" }
    else
      render status: 422, json: { msg: "disciplina não criada" }
    end
  end

  # def create
  #   @dup = Permissao.find_by(aluno_id: params[:aluno_id], disciplina_id: params[:disciplina_id])
  #   if @dup == nil
  #     @aluno = Aluno.find(params[:aluno_id])
  #     @disciplina = Disciplina.find(params[:disciplina_id])
  #     @permissao = Permissao.new(aluno_id: @aluno.id, disciplina_id: @disciplina.id)
  #     if @permissao.save
  #       render status: :created, json: {msg: "created"}
  #     else
  #       render status: 422, json: {msg: "error processing"}
  #     end
  #   else
  #     render status: 406, json:{msg: "already created"}
  #   end
  # end
end
