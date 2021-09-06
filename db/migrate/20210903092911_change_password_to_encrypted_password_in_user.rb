class ChangePasswordToEncryptedPasswordInUser < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.rename :password, :encrypted_password
    end
  end
end
