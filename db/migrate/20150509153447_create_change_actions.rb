class CreateChangeActions < ActiveRecord::Migration
  def change
    create_table :change_actions do |t|
      t.string      :title, null: false
      t.string      :external_link
      t.string      :external_id
      t.text        :email_body
      t.datetime    :start_date
      t.references  :organisation
      t.timestamps
    end
  end
end
