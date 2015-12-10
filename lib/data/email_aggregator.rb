class EmailAggregator

  def create_change_action_from(email, organisation)
    begin
      envelope =  email.envelope
      action = ChangeAction.find_or_create_by(external_id: email.msg_id.to_s, title: envelope.subject).tap do |action|
        action.start_date = envelope.date
        action.email_links = extract_links(email)
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

  def extract_links(email)
    (email.html_part || email).body.to_s.each_line.select{ |line|
                            line.match(/<a(.*)<\/a>/)
                          }.collect{ |lin|
                            lin.match(/<a(.*)<\/a>/).to_s
                          }
  end
end