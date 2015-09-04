class CreateRawEmails < ActiveRecord::Migration
  def change
    create_table :raw_emails do |t|
      t.boolean   :contains_petition
      t.text      :body
      t.string    :subject
      t.string    :gmail_message_id
      t.string    :sent_by
      t.datetime  :sent_at
    end
  end
end
