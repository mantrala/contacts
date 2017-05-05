class AddIndexToEmailAddress < ActiveRecord::Migration
  def change
    add_index(:contacts, :email_address)
  end
end
