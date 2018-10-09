# == Schema Information
#
# Table name: movies
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  intro      :string
#  score      :integer
#  url        :string
#  img_url    :string
#  source     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Movie < ApplicationRecord
	enum source: {iqiyi: 0}

	validates :title, presence: true
	validates :title, uniqueness: true

  scope :sorted, -> {order(created_at: :asc)}
end
