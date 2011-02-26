class Status < ActiveRecord::Base
end

# == Schema Information
#
# Table name: statuses
#
#  id             :integer         not null, primary key
#  fb_id          :string(255)
#  from           :string(255)
#  message        :string(255)
#  updated_time   :datetime
#  comments_count :integer
#  likes_count    :integer
#  created_at     :datetime
#  updated_at     :datetime
#

