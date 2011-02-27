=begin
{
   "id": "144301898918054",
   "owner": {
      "name": "Coolidge Corner",
      "category": "Local business",
      "id": "91650683998"
   },
   "name": "Coolidge Corner Sidewalk Sale",
   "description": "Come to Coolidge Corner this weekend to get amazing deals at 25 different local businesses. The fun starts at 10am on Saturday and continues on Sunday. \n\nHere's the list of participating businesses:\nBeauty and Style (Saturday only)\nBrookline Bank (Saturday only)\nBrookline Booksmith\nBrookline Chamber of Commerce (Saturday only)\nBrookline Food Pantry\nBrookline Teen Center\nDelaria Salon\nEureka Puzzles\nMagic Beans\nCause to Paws\nEva B Consignment (Saturday only)\nFinale\nFire Opal\nGourmet Curry House\nHair by Dennis (Saturday only)\nMattei Galleria (Saturday only)\nMint Julep\nEden ~ Spa for Well-being\nMelt\nParty Favors\nPear Tree\nRosaline's Skin Care\nSimons Shoes\nVintage\nWainwright Bank (Saturday only)",
   "start_time": "2010-07-17T10:00:00",
   "end_time": "2010-07-18T16:00:00",
   "location": "Coolidge Corner",
   "privacy": "OPEN",
   "updated_time": "2010-07-16T12:18:39+0000"
}
=end

class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.integer :event_id
      t.integer :page_id
      t.string :name
      t.text :description
      t.datetime :startime
      t.datetime :endtime
      t.string :location
      t.string :privacy
      t.datetime :updated_time
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
