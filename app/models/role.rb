# == Schema Information
#
# Table name: roles
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  title       :string(255)      not null
#  description :text(65535)      not null
#  the_role    :text(65535)      not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Role < ActiveRecord::Base
  include TheRole::Api::Role
end
