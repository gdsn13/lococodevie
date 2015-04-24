module Admin
  class Notifications < ActionMailer::Base

    default :from => Locomotive.config.mailer_sender

    def new_content_instance(account, content)
      @account, @content = account, content

      subject = subject = @content.send('titre')

      mail :subject => subject, :to => account.email
    end
  end

end