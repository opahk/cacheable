require 'active_support/concern'
require 'active_support/core_ext'
require 'cacheable/base'
require 'cacheable/memoize'
require 'cacheable/class_methods'
require 'cacheable/version'

# TODO
#   tests
#   dependencies: rails4?
#   readme
#   move global config to initializer
#   method arguments
#   call cacheable before method declaration

module Cacheable
  extend ActiveSupport::Concern
  include Memoize

  EXPIRES_IN = 6.hours
  NAMESPACE = 'models'
end
