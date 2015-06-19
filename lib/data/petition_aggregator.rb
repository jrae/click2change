class PetitionAggregator

  def create_raw_email_from(email)
    RawEmail.find_or_create_by(gmail_message_id: email.msg_id.to_s).tap do |mail|
      if email.try(:html_part).try(:body).present?
        mail.body = email.html_part.body.to_s
        mail.body_content_type = 'text'
      else
        mail.body = email.body.to_s
        mail.body_content_type = 'html'
      end
      mail.subject = email.subject
      mail.gmail_message_id = email.msg_id
    end.save!
  end
end