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

require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
