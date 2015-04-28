module Admin
  class Notifications < ActionMailer::Base

    default :from => Locomotive.config.mailer_sender

    def new_content_instance(account, content)
      @account, @content = account, content

      subject = @content.send('object')

      mail :subject => subject, :to => account.email
    end
  end

end