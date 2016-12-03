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

require 'test_helper'

class IntroductionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
