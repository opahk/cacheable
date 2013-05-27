module Cacheable
  module ClassMethods
    include Base

    # for caching instance methods
    def cacheable(*methods)
      methods.each do |method|
        define_method cached_alias(method), ->(options = {}) do
          memoize method, options
        end
        alias_method_chain method, :cache
      end
    end

    # for caching class methods
    def class_cacheable(*methods)
      methods.each do |method|
        # define singleton method instead of
        # instance method
        define_singleton_method cached_alias(method), ->(options = {}) do
          memoize method, options
        end

        # make method names available in singleton class through
        # class (instance) variables
        @@method = method
        @@cached_alias = cached_alias(method)
        @@uncached_alias = uncached_alias(method)
        # use singleton class to alias class methods
        class << self
          alias_method @@uncached_alias, @@method
          alias_method @@method, @@cached_alias
        end
      end
    end
  end
end
