class Page < ActiveRecord::Base
  has_many :posts
end

# == Schema Information
#
# Table name: pages
#
#  id         :integer         not null, primary key
#  page_id    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

