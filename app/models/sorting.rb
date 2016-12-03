# == Schema Information
#
# Table name: sortings
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  notion_id  :integer
#  article_id :integer
#

class Sorting < ActiveRecord::Base
end
