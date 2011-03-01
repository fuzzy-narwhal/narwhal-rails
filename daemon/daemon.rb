require "../config/environment.rb"
require 'restclient'
require 'json'

#$KCODE='u' 
#require 'jcode' 

def header (s)
  return unless s
  line = "****************************************************************"
  puts line
  puts line
  puts "***************** "+s
  puts line
  puts line  
end

=begin
add_column :pages, :name, :string
add_column :pages, :picture, :string
add_column :pages, :link, :string
add_column :pages, :category, :string
add_column :pages, :city, :string
add_column :pages, :state, :string
add_column :pages, :country, :string
add_column :pages, :zip, :string
add_column :pages, :street_parking, :boolean
add_column :pages, :lot_parking, :boolean
add_column :pages, :public_transit, :string
add_column :pages, :likes, :integer
add_column :pages, :username, :string
{
   "id": "39740541374",
   "name": "Coolidge Corner Theatre",
   "picture": "http://profile.ak.fbcdn.net/hprofile-ak-snc4/50492_39740541374_282286_s.jpg",
   "link": "http://www.facebook.com/thecoolidge",
   "category": "Local business",
   "website": "www.coolidge.org",
   "username": "thecoolidge",
   "location": {
      "street": "290 Harvard Street",
      "city": "Brookline",
      "state": "MA",
      "country": "United States",
      "zip": "02446"
   },
   "parking": {
      "street": 1,
      "lot": 1
   },
   "public_transit": "By train: take the Green Line (C branch to Cleveland Circle) trolley from downtown to Coolidge Corner via Beacon Street. The Coolidge Corner stop is at Harvard Street, 5-10 minutes from Kenmore Square.\n\nBy bus: take bus #66, Dudley/Harvard Square. All buses and trolleys stop at the Harvard Street/ Beacon Street intersection.",
   "phone": " 617.734.2500 ",
   "likes": 3675
}
=end

def save_page(page)
  facebook_url = 'https://graph.facebook.com/' + page.page_id
  response = RestClient.get(facebook_url)
  json = JSON.parse(response)
  page.name = json['name'] 
  page.picture = json['picture'] 
  page.link = json['link'] 
  if json['location'] 
    begin
      page.street = json['location']['street'] 
      page.city = json['location']['city'] 
      page.state = json['location']['MA'] 
      page.country = json['location']['country'] 
      page.zip = json['location']['zip'] 
    rescue
    end
  end
  page.category = json['category'] 
  page.website = json['website'] 
  page.username = json['username'] 
  page.street_parking = json['parking']['street'] rescue
  page.lot_parking = json['parking']['lot'] rescue
  page.public_transit = json['public_transit']
  page.phone = json['phone']
  page.likes = json['likes']
  page.save
end

def save_posts(page, url)
  response = RestClient.get(url)
  json = JSON.parse(response)
  count = 0
  
  json['data'].each do |j|
    if Post.find_by_post_id(j['id']).nil?
      post = page.posts.new()
      post[:post_id] = j['id']
      post[:message] = j['message']
      post[:picture] = j['picture']
      post[:link_url] = j['link']
      post[:link_name] = j['name']
      post[:link_caption] = j['caption']
      post[:link_description] = j['description']
      post[:movie_url] = j['source']
      post[:icon] = j['icon']
      post[:attribution] = j['attribution']
      post[:created_time] = j['created_time']
      post[:updated_time] = j['updated_time']
      post[:typ] = j['type']
      post[:page_id] = page.page_id

      if j.has_key? 'likes'
        post[:likes] = j['likes']['count']
      end

      if j.has_key? 'from'
        post[:from] = j['from']['id']
      end

      if j.has_key? 'comments'
        post[:comments] = j['comments']['count']
      end
      post.page_id=page.id
      post.save!
      count = count + 1
    else
      puts j['id'] + ' already seeded.'
    end
    
    puts count.to_s + ' posts saved'
  end
end

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

def load_and_save_event(post,eid)
  graph_url = "https://graph.facebook.com/#{eid}"
  response = RestClient.get(graph_url)
  json = JSON.parse(response)
  event_id = json['id']
  event = Event.find_by_event_id(event_id)
  event = Event.new if not event
  
  event.event_id = event_id
  event.page_id=json['owner']['id'] 
  event.name = json['name']
  event.description = json['description']
  event.start_time = json['start_time']
  event.end_time = json['end_time']
  event.privacy = json['privacy']
  event.location = json['location']
  if json['venue']
    event.venue_street=json['venue']['street']
    event.venue_city=json['venue']['city']
    event.venue_state=json['venue']['state']
    event.venue_country=json['venue']['country']
    event.venue_latitude=json['venue']['latitude']
    event.venue_longitude=json['venue']['langitude']
  end
  puts "event: #{event.event_id} #{event.name} #{post.page.name}"
  event.save
end

def process_events

  posts = Post.find_with_events
  puts "found #{posts.size} posts with events"
  posts.each{|post|
    event_url = post.link_url
#    puts event_url
    matches = event_url.match /\d+/
    eid=matches[0]
#    puts eid
    begin
      load_and_save_event(post,eid)
    rescue Exception => e
      puts "Error on #{post.link_url}, #{eid}"
    end
      
    }
end

def import_pages(filename)
  if File.exists?(filename)
    text =  File.read(filename)
  else
    puts "can't find file"
  end
  puts text.size
  lines = text.split("\r")
  lines.each{|line|
    begin
      tokens = line.split(",")
      page_id = tokens[0].strip
      section = tokens[1].strip.downcase
      categories = tokens[2].split("|")
      puts "#{page_id} #{section} #{categories}"
      unless Page.find_by_page_id(page_id)
        page = Page.new
        page.page_id=page_id
        page.section = Section.find_by_name(section)
        page.category_tags=categories
        page.save
      end
    rescue =>e
      puts e.message
#      puts e.backtrace.join("\n")  
    end
  }
end

def crawl_pages
  Page.find(:all).each do |page|
    begin
      puts 'working on ' + page.page_id
      save_page(page)
      puts page.name
    rescue =>e
      puts e.message  
    end
  end
end

def crawl_posts
  Page.find(:all).each do |page|
    begin
      facebook_url = 'https://graph.facebook.com/' + page.page_id + '/posts'
      puts 'working on ' + facebook_url
#      save_page(page)
      save_posts page, facebook_url
    rescue =>e
      puts e.message  
    end
  end
end

def main(args)
  begin
    _crawl_posts = false
    _crawl_pages = false
    _import_pages = false
    _import_pages = false
    _process_events = false
    $debug = false;
    _crawl_posts=true if args.index("crawl_posts")
    _crawl_pages=true if args.index("crawl_pages")
    _import_pages=true if args.index("import_pages")
    _process_events=true if args.index("process_events")
    filename = args[1]
    $debug=true if args.index("debug")
    @logger = Logger.new("daemon.log")
    @logger.level = Logger::DEBUG
    if _import_pages
      header "importing pages"
      import_pages(filename)
    end
    if _crawl_pages
      header "crawling pages"
      crawl_pages
    end
    if _crawl_posts
      header "crawling posts"
      crawl_posts
    end
    if _process_events
      header "processing events"
      process_events
    end
    

#  rescue => e
#    handle_exception e
  end
end

def handle_exception (e)
begin
  ExceptionMailer.logger=@logger
  ExceptionMailer.template_root="../app/views"
  ExceptionMailer::deliver_snapshot("#{@metro_code} daemon",e) 
  puts e if e
  puts e.backtrace.join("\n") if e
rescue 
rescue Timeout::Error
end
end



# program entry point
if (!ARGV.index("help").nil? or ARGV.empty?)
  puts "Narwhal Daemon"
  puts <<-S
    Usage: ruby daemon.rb (crawl_pages | crawl_posts | import_pages <filepath> | process_events)
    S
  puts "(c) Fuzzy Narwhal Feb 2011"
  exit
else
  puts "for usage: ruby narwhal.rb help"
end
main(ARGV)
