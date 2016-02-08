require "forwardable"
require "solid_assert/null_assert"
require "solid_assert/assert"

module SolidAssert
  extend Forwardable

  def_delegators "SolidAssert.assert_instance", :assert, :invariant

  class << self
    def assert_instance
      if @assertions_enabled
        Assert.instance
      else
        NullAssert.instance
      end
    end

    def enable_assertions
      @assertions_enabled = true
    end

    def disable_assertions
      @assertions_enabled = false
    end
  end
end

SolidAssert.disable_assertions

Object.class_eval do
  include SolidAssert
end
