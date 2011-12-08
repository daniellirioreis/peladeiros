class GameMailer < ActionMailer::Base
  default :from => "nakeds.suport@gmail.com"

   def mensagem_boas_vindas(user, game)
     @user = user
     @game = game
     @city = game.place_now.city 
     @address  = game.place_now.description
     @escalations = game.escalations 
     @site = "http://naked.heroku.com"

     if @game.status == 1 
       @mensagem = "Nakeds - Novo Jogo Cadastrado"
      end

      if @game.status == 2
        @mensagem = "Nakeds - Jogo foi fechado"
       end
        
     mail(:to => user.email,
          :subject => @mensagem)
   end
end
