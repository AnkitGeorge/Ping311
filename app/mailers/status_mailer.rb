class StatusMailer < ApplicationMailer
  def status_email(user)
    @user = user
    mail(to: @user.email, subject: "Status Update")
  end
end
