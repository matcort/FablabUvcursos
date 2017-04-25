class SessionsController < ApplicationController
  def new
  end

 def create
    user = Usuario.find_by(rut: params[:session][:rut].downcase)
    if user && user.authenticate(params[:session][:password])
      
       log_in user
       
      if user.rol == "1" || user.rol == "2"
        redirect_to curso_dictados_path  
      end

    else
      flash[:danger] = 'rut/password Combinacion Invalida' # Not quite right!
      render 'new'
    end
    
  end

 def destroy
    log_out
    redirect_to root_url
  end
  
end
