# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# == Schema Information
#
# Table name: posts
#
#  id               :integer         not null, primary key
#  likes            :integer
#  post_id          :string(255)
#  from             :string(255)
#  to               :string(255)
#  message          :string(255)
#  picture          :string(255)
#  link_url         :string(255)
#  link_name        :string(255)
#  link_caption     :string(255)
#  link_description :string(255)
#  movie_url        :string(255)
#  icon             :string(255)
#  attribution      :string(255)
#  created_time     :datetime
#  updated_time     :datetime
#  comments         :integer
#  created_at       :datetime
#  updated_at       :datetime
#

# grabs the latest from coolidge corner theater
require 'restclient'
require 'json'

response = RestClient.get('https://graph.facebook.com/39740541374/posts')
json = JSON.parse(response)

json['data'].each do |j|
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
end

                  