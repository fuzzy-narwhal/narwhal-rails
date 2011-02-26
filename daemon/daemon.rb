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

def save_posts(url)
  response = RestClient.get(url)
  json = JSON.parse(response)
  count = 0

  json['data'].each do |j|
    if Post.find_by_post_id(j['id']).nil?
      post = Post.new()
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


def crawl
  Page.find(:all).each do |page|
    facebook_url = 'https://graph.facebook.com/' + page.page_id + '/posts'
    puts 'working on ' + facebook_url
    save_posts facebook_url
  end
      
end

def main(args)
  begin
    _crawl = false
    $debug = false;
    _crawl=true if args.index("crawl")
    $debug=true if args.index("debug")
    @logger = Logger.new("daemon.log")
    @logger.level = Logger::DEBUG
    if _crawl
      header "crawling"
      crawl 
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
    Usage: ruby narwhal.rb 
    [crawl]
    S
  puts "(c) Fuzzy Narwhal Feb 2011"
  exit
else
  puts "for usage: ruby narwhal.rb help"
end
main(ARGV)
