module Cacheable
  module Memoize

    def memoize(method, options = {})
      Rails.cache.fetch(cacheable_key(method), cacheable_opts(options)) do
        send uncached_alias(method)
      end
    end
  end
end
