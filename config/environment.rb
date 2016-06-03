require 'bundler'
Bundler.require

module Concerns
  def self.included(base)
    base.extend(ClassMethods)
    base.include(InstanceMethods)
    base.extend(Findable)
  end
end

require_all 'lib'
