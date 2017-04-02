# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ActiveRecord::Base
  # include Tire::Model::Search
  # include Tire::Model::Callbacks
  has_and_belongs_to_many :notions
  has_and_belongs_to_many :accounts
  belongs_to :language

#   def self.search(params)
#   tire.search(load: true) do
#     query { string params[:query], default_operator: "AND" } if params[:query].present?
#     filter :range, published_at: {lte: Time.zone.now}
#   end
# end
end
