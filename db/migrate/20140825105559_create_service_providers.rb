class CreateServiceProviders < ActiveRecord::Migration
  def change
    create_table :service_providers do |t|
      t.string :firstname
      t.string :lastname

      t.timestamps
    end
  end
end
