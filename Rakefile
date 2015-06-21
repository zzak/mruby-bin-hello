APP_ROOT=ENV["APP_ROOT"] || Dir.pwd
MRUBY_ROOT=ENV["MRUBY_ROOT"] || "#{APP_ROOT}/mruby"
MRUBY_CONFIG=File.expand_path(ENV["MRUBY_CONFIG"] || "build_config.rb")

file :mruby do
  sh "git clone git://github.com/mruby/mruby.git"
end

desc "compile binary"
task :compile => :mruby do
  sh "cd #{MRUBY_ROOT} && MRUBY_CONFIG=#{MRUBY_CONFIG} rake all"
end

desc "test"
task :test => :mruby do
  sh "cd #{MRUBY_ROOT} && MRUBY_CONFIG=#{MRUBY_CONFIG} rake all test"
end

desc "cleanup"
task :clean do
  sh "cd #{MRUBY_ROOT} && rake deep_clean"
end
