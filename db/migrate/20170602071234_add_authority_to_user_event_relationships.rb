class AddAuthorityToUserEventRelationships < ActiveRecord::Migration[5.1]
  def change
  	add_column :user_event_relationships, :authority, :json
  end
end
