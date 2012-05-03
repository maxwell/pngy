class Phantom
  PLATFORM = RUBY_PLATFORM =~ /linux/ ? 'linux' : 'mac' 
  BINARY = Rails.root.join('lib', 'phantomjs', PLATFORM, 'bin', 'phantomjs')
  RASTERIZE = Rails.root.join('lib', 'rasterize.js')
  TMP_DIRECTORY = Rails.root.join('tmp', 'screenshots')


  def grab_screenshot(url)
    Phantom.command("#{RASTERIZE.to_s} #{url} #{Phantom.clean_filename(url)}.png")
  end

  def self.clean_filename(url)
    TMP_DIRECTORY + url.delete('/.:?!')
  end

  def self.command(exec)
    command = RUBY_PLATFORM =~ /linux/ ? BINARY : 'phantomjs'
    system("#{command} #{exec}")
  end
end