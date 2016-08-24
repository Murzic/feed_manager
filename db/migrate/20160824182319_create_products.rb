class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :feed, index: true, foreign_key: true
      t.string :title
      t.string :aff_code
      t.string :price
      t.string :campaign_name
      t.string :image_urls
      t.string :description

      t.timestamps null: false
    end
  end
end
