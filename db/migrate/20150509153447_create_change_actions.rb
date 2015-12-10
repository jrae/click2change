class CreateChangeActions < ActiveRecord::Migration
  def change
    create_table :change_actions do |t|
      t.string      :title, null: false
      t.string      :external_link
      t.string      :email_links, array: true, default: []
      t.string      :external_id
      t.references  :organisation
      t.timestamps
    end
  end
end
