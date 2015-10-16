class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :name
    end
    add_column :raw_emails, :organisation_id, :integer
  end
end
