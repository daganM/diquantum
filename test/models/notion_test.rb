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

require 'test_helper'

class NotionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
