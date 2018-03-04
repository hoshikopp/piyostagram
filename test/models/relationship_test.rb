require 'test_helper'
class RelationshipTest < ActiveSupport::TestCase
  belongs_to :followed, class_name: "User"
  belongs_to :follower, class_name: "User"

end
