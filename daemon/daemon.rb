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
      post[:created_at] = j['created_time']
      
      if j.has_key? 'likes'
        post[:likes] = j['likes']['count']
      end

      if j.has_key? 'from'
        post[:from] = j['from']['id']
      end

      if j.has_key? 'comments'
        post[:comments] = j['comments']['count']
      end

      post.save!
      count = count + 1
    else
      puts j['id'] + ' already seeded.'
    end
    
    puts count.to_s + ' posts saved'
  end
  
  
end

def crawl_pages
  Page.find(:all).each do |page|
    puts 'working on ' + page.page_id
    save_page(page)
    puts page.name
  end
end

def crawl_posts
  Page.find(:all).each do |page|
    facebook_url = 'https://graph.facebook.com/' + page.page_id + '/posts'
    puts 'working on ' + facebook_url
    save_page(page)
    save_posts page, facebook_url
  end
      
end

def main(args)
  begin
    _crawl_posts = false
    _crawl_pages = false
    $debug = false;
    _crawl_posts=true if args.index("crawl_posts")
    _crawl_pages=true if args.index("crawl_pages")
    $debug=true if args.index("debug")
    @logger = Logger.new("daemon.log")
    @logger.level = Logger::DEBUG
    if _crawl_pages
      header "crawling pages"
      crawl_pages
    end
    if _crawl_posts
      header "crawling posts"
      crawl_posts
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
  puts "Narwhwal Daemon"
  puts <<-S
    Usage: ruby narwhal.rb (crawl_pages | crawl_posts)
    S
  puts "(c) Fuzzy Narwhal Feb 2011"
  exit
else
  puts "for usage: ruby narwhal.rb help"
end
main(ARGV)
