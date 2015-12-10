class CreateRawEmails < ActiveRecord::Migration
  def change
    create_table :raw_emails do |t|
      t.text        :email_links, array: true, default: []
      t.string      :sent_by
      t.datetime    :sent_at
      t.references  :change_action
    end
  end
end
