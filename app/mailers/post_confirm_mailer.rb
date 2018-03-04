class PostConfirmMailer < ApplicationMailer
  def confirm_mail(post_user)
    @post_user = post_user
    mail to: @post_user.email, subject: "投稿確認メール"
  end
end
