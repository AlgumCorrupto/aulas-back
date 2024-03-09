class Api::Admin::PermissaoController < ApplicationController
 def create
   @dup = Permissao.find_by(aluno_id: params[:aluno_id], disciplina_id: params[:disciplina_id])
   if @dup == nil
     @aluno = Aluno.find(params[:aluno_id])
     @disciplina = Disciplina.find(params[:disciplina_id])
     @permissao = Permissao.new(aluno_id: @aluno.id, disciplina_id: @disciplina.id)
     if @permissao.save
       render status: :created, json: {msg: "created"}
     else
       render status: 422, json: {msg: "error processing"}
     end
   else
     render status: 406, json:{msg: "already created"}
   end
 end
end
