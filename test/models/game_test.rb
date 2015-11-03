# == Schema Information
#
# Table name: games
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  description  :text(65535)
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  checked_in   :boolean          default(TRUE)
#  last_checkin :datetime
#

require 'test_helper'

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
