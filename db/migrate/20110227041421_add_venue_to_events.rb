class AddVenueToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :venue_street, :string
    add_column :events, :venue_city, :string
    add_column :events, :venue_state, :string
    add_column :events, :venue_country, :string
    add_column :events, :venue_latitude, :string
    add_column :events, :venue_longitude, :string
    remove_column :events, :startime
    remove_column :events, :end_time
    add_column :events, :start_time, :datetime
    add_column :events, :end_time, :datetime
  end

  def self.down
  end
end

=begin
{
   "id": "128181030587904",
   "owner": {
      "name": "Regent Theatre Arlington",
      "category": "Local business",
      "id": "293881312777"
   },
   "name": "Bellyqueen:  Journeys along the Silk Road",
   "description": "**Bellyqueen\n~Journeys along the Silk Road\n\nFriday Mar. 18, 8:00PM\nTickets: Reserved Seating\n$17 in advance, $20 day of show\nphone/online orders include additional service charge\n{781} 646-4849\n\nTickets: Reserved Seating\n$17 in advance, $20 day of show\nphone/online orders include additional service charge\n\nSpecial $50 Dinner / Show Package with Tryst Restaurant available by calling the box office 781-646-4849. \n(Please call Tryst (781) 641-2227 to make a reservation)\n**You must present your Regent Theatre ticket at Tryst on arrival at the restaurant. \n\nJourneys along the Silk Road\nConnecting Dances From East to West\n\nFor hundreds of years the Silk Road was the link between East and West. A trade route where merchants from Asia, Europe and the Middle East exchanged goods and culture.\n\nTake a journey through these exotic lands and see the dances from the rich cultures of the Silk Road encompassing Egypt, Saudi Arabia, Turkey, Central Asia and China.\n\nFeaturing Bellyqueen Dance Theater\nwith Kaeshi Chai, Elisheva, Sandralis Gines, Irina Akulenko and many more.\n\nThe evening will also include opening performances from Boston, New York, New England, New Hampshire, & Maine Based Bellydancers:  Ombellyco, Lindsey Feeney, Johara SnakeDance, Tempeststarii-Tribal, Phaedra Rose, Za-Beth\nhttp://www.za-beth.com\n\nhttp://www.youtube.com/watch?v=oFZ-vUlOWkc\n\nwww.bellyqueen.com\n\nGrande Dame \u201cViva la Diva\u201d Productions\nhttp://www.za-beth.com   http://www.youtube.com/zabeth44   Contact: zills\u0040earthlink.net \n\n\n",
   "start_time": "2011-03-18T20:00:00",
   "end_time": "2011-03-18T22:30:00",
   "location": "Regent Theater",
   "venue": {
      "street": "7 Medford Street",
      "city": "Arlington",
      "state": "Massachusetts",
      "country": "United States",
      "latitude": 42.4153,
      "longitude": -71.1569
   },
   "privacy": "OPEN",
   "updated_time": "2011-02-22T17:34:07+0000"
}
=end
