class PostMailer < ApplicationMailer
  def contact_mail(feed)
    @user = feed.user
    mail(to: @user.email, subject: "お問い合わせの確認メール")
  end
end
