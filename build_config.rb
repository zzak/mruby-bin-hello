MRuby::Build.new do |conf|
  toolchain :gcc
  conf.gem :core => 'mruby-print'
  conf.gem File.expand_path(File.dirname(__FILE__))
end


MRuby::CrossBuild.new('x86_64-apple-darwin14') do |conf|
  toolchain :clang

  conf.gem File.expand_path(File.dirname(__FILE__))

  [conf.cc, conf.objc, conf.asm].each do |cc|
    cc.command = 'x86_64-apple-darwin14-clang'
  end
  conf.cxx.command = 'x86_64-apple-darwin14-clang++'
  conf.linker.command = 'x86_64-apple-darwin14-clang'
  conf.archiver.command = 'x86_64-apple-darwin14-ar'
end

MRuby::CrossBuild.new('mingw-w64') do |conf|
  toolchain :gcc

  conf.gem File.expand_path(File.dirname(__FILE__))

  conf.cc.command = 'x86_64-w64-mingw32-gcc'
  conf.cxx.command = 'x86_64-w64-mingw32-cpp'
  conf.linker.command = 'x86_64-w64-mingw32-gcc'
  conf.archiver.command = 'x86_64-w64-mingw32-gcc-ar'

  conf.exts.executable = ".exe"
end
