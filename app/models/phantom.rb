class Phantom
  PLATFORM = RUBY_PLATFORM =~ /linux/ ? 'linux' : 'mac' 
  BINARY = Rails.root.join('lib', 'phantomjs', PLATFORM, 'bin', 'phantomjs')
  RASTERIZE = Rails.root.join('lib', 'rasterize.js')
  TMP_DIRECTORY = Rails.root.join('tmp', 'screenshots')

  def initialize(url)
    @url = url
  end

  def grab_screenshot
    Phantom.command("#{RASTERIZE.to_s} #{@url} #{clean_filename}.png")
  end

  def clean_filename
    TMP_DIRECTORY + @url.delete('/.:?!')
  end

  def self.command(exec)
    command = RUBY_PLATFORM =~ /linux/ ? BINARY : 'phantomjs'
    `#{command} #{exec}`.chomp
  end
end