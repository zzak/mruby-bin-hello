MRuby::Gem::Specification.new('mruby-bin-hello') do |spec|
  spec.license = 'MIT'
  spec.author  = 'zzak'
  spec.summary = 'just a gem'

  spec.bins = ["hello"]
end
