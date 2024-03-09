class Api::Admin::AlunoController < ApplicationController
  def index
    @alunos = Aluno.all;
    @disciplinas = Disciplina.all

    render 200, json: [@alunos, @disciplinas]
  end

  def show
    @aluno = Aluno.find(params[:id])
    @perms = Permissao.where(aluno_id: params[:id])
    @disciplinas = Disciplina.all;

    render 200, json: [@aluno, @perms, @disciplinas]
  end

  def create
    @aluno = Aluno.new(cpf: params[:cpf], nome: params[:nome], credencial: params[:cred])
    if @aluno.save
      render status: :created, json: { msg: "conta criada" }
    else
      render status: 422, json: { msg: "conta não criada" }
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
