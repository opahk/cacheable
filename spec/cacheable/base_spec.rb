require 'spec_helper'

describe Cacheable::Base do
  include Cacheable::Base

  describe '#cached_alias' do
    it 'turns method into method_with_cache' do
      cached_alias(:method).should == 'method_with_cache'
    end

    it 'turns method! into method_with_cache!' do
      cached_alias(:method!).should == 'method_with_cache!'
    end
  end

  describe '#uncached_alias' do
    it 'turns method into method_without_cache' do
      uncached_alias(:method).should == 'method_without_cache'
    end

    it 'turns method! into method_without_cache!' do
      uncached_alias(:method!).should == 'method_without_cache!'
    end
  end

  describe '#klass_key and #cacheable_key' do
    context 'when cache_key is not set' do
      it 'returns rspec cache key' do
        klass_key.should eq(
          'r_spec/core/example_group/nested_1/nested_3/nested_1')
        cacheable_key(:method).should == ['models',
          'r_spec/core/example_group/nested_1/nested_3/nested_1', :method]
      end
    end

    context 'when cache_key is not set' do
      before do
        define_singleton_method('cache_key') { 'super_key' }
      end

      it 'returns custom key' do
        klass_key.should == 'super_key'
        cacheable_key(:method).should == ['models', 'super_key', :method]
      end
    end
  end

  describe '#cacheable_opts' do

  end
end
