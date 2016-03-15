class ChangeActionAggregator

  def petitions_from(data, organisation)
    begin
      data.each do |petition|
        ChangeAction.find_or_create_by(external_id: petition['id'].to_s, title:  petition['attributes']['action']).tap do |change_action|
          change_action.external_link =  petition['links']['self'].gsub('.json', '')
          change_action.organisation_id =  organisation.id
          change_action.start_date = petition['attributes']['open_at']
          #change_action.details =  petition['attributes']['background']
        end.save
      end
    rescue Exception => e
      puts "failed to save petition"
    end
  end

  def create_change_action_from(email, organisation)
    begin
      envelope =  email.envelope
      action = ChangeAction.find_or_create_by(external_id: email.msg_id.to_s, title: strip_windows_32_formatting(envelope.subject)).tap do |action|
        action.start_date = envelope.date
        action.email_body = (email.html_part || email).body.to_s
        action.organisation_id = organisation.id
      end
      action.save
    rescue Exception => e
      puts "failed to save id #{email.msg_id.to_s} subject #{email.subject}"
    end
  end

  def strip_windows_32_formatting(title)
    title.gsub('=?WINDOWS-1252?Q?', '').gsub('?=', '')
  end

  def extract_links(email)
    (email.html_part || email).body.to_s.each_line.select{ |line|
                            line.match(/<a(.*)<\/a>/)
                          }.collect{ |lin|
                            lin.match(/<a(.*)<\/a>/).to_s
                          }
  end
end
