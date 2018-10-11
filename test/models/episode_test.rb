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

require 'test_helper'

class EpisodeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
