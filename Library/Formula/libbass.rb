require 'formula'

class Libbass64 <Formula
  url 'http://www.un4seen.com/stuff/bass-osx-x64.zip'
  md5 'b02c8a48bd58b570dadbe889eb6770a1'
  version '2.4'
end

class Libbass <Formula
  url 'http://uk.un4seen.com/files/bass24-osx.zip'
  homepage 'http://un4seen.com/'
  md5 'c3b00d88afed1016207570eb56e1964e'
  version '2.4'

  def install
    if Hardware.is_64_bit? and not ARGV.include? '--32bit'
      Libbass64.new.brew { lib.install Dir["*.dylib"] }
    else
      lib.install Dir["*.dylib"]
    end
    include.install Dir["bass.h"]
  end
end
