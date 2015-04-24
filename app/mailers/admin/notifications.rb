module Admin
  class Notifications < ActionMailer::Base

    default :from => Locomotive.config.mailer_sender

    def new_content_instance(account, content)
      @account, @content = account, content

      if @content.send('titre') != '' :from => @content.send('email')

      subject = @content.send('object'), :type => content.content_type.name, :locale => account.locale)

      mail :subject => subject, :to => account.email
    end
  end

end