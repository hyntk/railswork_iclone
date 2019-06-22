class PostMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
  
    mail(to: @user.email, subject: "お問い合わせの確認メール")
  end
end
