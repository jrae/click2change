class PetitionAggregator

  def create_raw_email_from(email, organisation)
    if email.msg_id == 1511675848579150666
      begin
        raw = RawEmail.find_or_create_by(gmail_message_id: email.msg_id.to_s).tap do |mail|
          if email.try(:text_part).try(:body).present?
            mail.body = email.text_part.body.to_s
          else
            mail.body = email.body.to_s
          end
          mail.subject = email.envelope.subject
          mail.gmail_message_id = email.msg_id

          envelope =  email.envelope
          mail.sent_at = envelope.date

          mail.sent_by = "#{envelope.from.first.mailbox}@#{envelope.from.first.host}"
        end
        raw.organisation_id = organisation.id
        raw.save
      rescue
        raw.body = Iconv.conv("ISO-8859-1", "utf-8", email.text_part.encoded)
        puts "failed to save id #{email.msg_id.to_s} subject #{email.subject} so trying wo trying to convert to utf-8"
        raw.save
        puts "Managed to save by converting to ISO-8859-1"
      end
    end
  end
end