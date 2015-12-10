class EmailAggregator

  def create_change_action_from(email, organisation)
    begin
      action = ChangeAction.find_or_create_by(external_id: email.msg_id.to_s, title: email.envelope.subject).tap do |action|

        if action.new_record?
          envelope =  email.envelope
          action.raw_email.new(
            sent_at: envelope.date,
            sent_by: "#{envelope.from.first.mailbox}@#{envelope.from.first.host}",
            email_links: email.html_part.body.to_s.each_line.select{ |line|
                            line.match(/<a(.*)<\/a>/)
                          }.collect{ |lin|
                            lin.match(/<a(.*)<\/a>/).to_s
                          }
            )
        end
        action.organisation_id = organisation.id
      end
      action.save
    rescue Exception => e
      debugger
      puts "failed to save id #{email.msg_id.to_s} subject #{email.subject} so trying wo trying to convert to utf-8"
      action.save
      puts "Managed to save by converting to ISO-8859-1"
    end
  end
end