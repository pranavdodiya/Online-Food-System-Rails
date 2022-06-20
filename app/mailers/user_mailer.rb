class UserMailer < ApplicationMailer
  default from: 'PMT <purvrajdodia@gmail.com>'

  def welcome_email
    @user = params[:user]
    mail(to: "pranavdodiya72@gmail.com", subject: 'Welcome to My Awesome Site')
  end

end
