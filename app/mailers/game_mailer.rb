class GameMailer < ActionMailer::Base
  default :from => "nakeds.suport@gmail.com"

   def mensagem_boas_vindas(user)
     @user = user
     @site = "http://redplace.heroku.com"
     mail(:to => user.email,
          :subject => "Seja bem-vindo ao meu site")
   end
end
