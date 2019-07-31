class CreateTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :tokens do |t|
      t.string :digest_hash, null: false

      t.timestamps
    end
  end
end
