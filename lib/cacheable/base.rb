module Cacheable
  module Base

    private

      def cached_alias(method)
        alias_join method, '_with_cache'
      end

      def uncached_alias(method)
        alias_join method, '_without_cache'
      end

      def alias_join(method, suffix)
        aliased, punctuation = method.to_s.sub(/([?!=])$/, ''), $1
        "#{aliased}#{suffix}#{punctuation}"
      end

      def cacheable_key(method)
        [NAMESPACE, klass_key, method]
      end

      def klass_key
        respond_to?(:cache_key) ? cache_key : self.class.name.underscore
      end

      def cacheable_opts(options)
        { expires_in: EXPIRES_IN }.merge(options)
      end
  end
end
