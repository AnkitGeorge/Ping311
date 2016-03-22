class StatusMailer < ApplicationMailer
  def status_email(user)
    @user = user
    @report = @user.subscribed_reports[0].address
    mail(to: @user.email, subject: "Status Update")
  end
end
