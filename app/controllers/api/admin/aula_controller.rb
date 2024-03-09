class Api::Admin::AulaController < ApplicationController
  def index
    @aulas = []
    @disciplinas = Disciplina.all
    @disciplinas.each{|disc| @aulas.push(Aula.where("disciplina_id = #{disc.id}")) }
    render json: @aulas
  end

  def create
    @aula = Aula.new(título: params[:tit],
    corpo: params[:corpo],
    disciplina_id: params[:di_id])
    if @aula.save
      render status: :created, json: { msg: "aula criada com sucesso!" }
    else
      render status: 422, json: { msg: "aula não criada" }
    end
  end
end
