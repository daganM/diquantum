# == Schema Information
#
# Table name: languages
#
#  id         :integer          not null, primary key
#  code       :string
#  int_title  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Language < ActiveRecord::Base
  has_many :articles
end
