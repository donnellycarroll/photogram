class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|
      t.integer :sender_id
      t.integer :reciever_id
      t.string :request_status

      t.timestamps
    end
  end
end
