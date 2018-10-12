# == Schema Information
#
# Table name: videos
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  intro      :string
#  img_url    :string
#  url        :string
#  actors     :jsonb
#  source     :integer
#  score      :string
#  duration   :string
#  video_type :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Video < ApplicationRecord
	enum video_type: {movie: 0, teleplay: 2, cartoon: 3}
	has_many :episodes, dependent: :destroy

	scope :sorted, -> { order(created_at: :asc) }

	def actors_html
		actors.join(",").gsub(",", " ")
	end

end
