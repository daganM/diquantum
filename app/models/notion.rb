# == Schema Information
#
# Table name: notions
#
#  id              :integer          not null, primary key
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  introduction_id :integer
#

class Notion < ActiveRecord::Base
  has_one :introduction
  has_many :articles, through: :sortings
end
