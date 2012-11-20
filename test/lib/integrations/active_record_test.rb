require 'test_helper'

module Integrations
  # Test ActiveRecord integration
  class ActiveRecordTest < ::TestCase
    # Test setup
    def setup
      @integration_name = :active_record
    end

    def test_should_integration_finded_by_name
      assert_equal FormObject::Integrations::ActiveRecord, FormObject::Integrations.find_by_name(@integration_name)
    end

    def test_should_match_active_record_integration
      assert_equal FormObject::Integrations::ActiveRecord, FormObject::Integrations.match(User)
    end

  end
end
