# == Schema Information
#
# Table name: introductions
#
#  id         :integer          not null, primary key
#  text       :text
#  notion_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Introduction < ActiveRecord::Base
  belongs_to :notion
end
