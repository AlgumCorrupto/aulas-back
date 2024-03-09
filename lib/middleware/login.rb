
class Login
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    status, headers, response = @app.call(env)
    unless request.path == "/api/admin/entrar" || request.path == "/api/user/entrar"
     if request.path.include?("admin")
       if request.session[:isTeacher] == false
         status = 401 # unauthorized
         response = ["{\"err\": \"Professor não logado\"}"]
         headers = {"Content-Type" => "application/json"}
       end
     elsif request.path.include?("user")
       if (request.session[:isLogged] == false)
         status = 401 # unauthorized
         response = ['{"err": "Aluno não logado"}']
         headers = {"Content-Type" => "application/json"}
       end
     end
    end
    [status, headers, response]
  end


end
