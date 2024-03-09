class Api::Admin::EntrarController < ApplicationController
  def index
    @acc = Professor.find_by_cpf(params[:cpf])
    unless @acc == nil
      if @acc.credencial == params[:cred]
        session[:isLogged] = true
        session[:isTeacher] = true
        session[:currProfID] = @acc.id;
        render 200, json: {msg: "proceed"}
      end
    else
      render 402, json: {msg: "unproceed"}
    end
  end

  def create
    @acc = Professor.new(cpf: params[:cpf], nome: params[:nome], credencial: params[:cred])
    if @acc.save
      render status: :created, json: { msg: "conta criada" }
    else
      render status: 422, json: { msg: "conta não criada" }
    end
  end
end
