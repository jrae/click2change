class CreateRawEmails < ActiveRecord::Migration
  def change
    create_table :raw_emails do |t|
      t.boolean   :contains_petition
      t.text      :body
      t.string    :subject
      t.string    :body_content_type
      t.string    :gmail_message_id
      t.timestamps
    end
  end
end
