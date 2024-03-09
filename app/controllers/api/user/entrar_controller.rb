class Api::User::EntrarController < ApplicationController
  def index
    @acc = Aluno.find_by_cpf(params[:cpf])
      if @acc && @acc.credencial == params[:cred]
        session[:isLogged] = true
        session[:currID] = @acc.id;
        render 200, json: {msg: "proceed"}
      else
        render status: 402, json: {msg: "unproceed"}
      end

  end

  def create
    @acc = Aluno.new(cpf: params[:cpf], nome: params[:nome], credencial: params[:cred])
    if @acc.save
      render status: :created, json: { msg: "conta criada" }
    else
      render status: 422, json: { msg: "conta não criada" }
    end
  end
end
