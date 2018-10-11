# == Schema Information
#
# Table name: episodes
#
#  id         :bigint(8)        not null, primary key
#  video_id   :integer
#  duration   :string
#  img_url    :string
#  url        :string
#  number     :integer
#  intro      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Episode < ApplicationRecord

	validates :url, :number, presence: true

	belongs_to :video

end
