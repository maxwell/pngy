class Preview < ActiveRecord::Base
  mount_uploader :screenshot, ScreenshotUploader

  attr_accessible :url


  def url=(site)
    self[:url] = site
    filename = Phantom.new(site).grab_screenshot
    self.screenshot.store!(File.open(filename))
  end
end
