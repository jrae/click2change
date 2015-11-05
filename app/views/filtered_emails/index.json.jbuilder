json.@emails.each do |json, email|
  json.extract! email, :id, :subject
  json.email_url email_path(email)
end
