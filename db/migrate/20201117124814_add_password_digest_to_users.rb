class AddPasswordDigestToSuers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :passwotd_digest, :string
  end
end
