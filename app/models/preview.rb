class Preview < ActiveRecord::Base
  mount_uploader :screenshot, ScreenshotUploader

  attr_accessible :url


  def url=(site)
    self[:url] = site
    filename = Phantom.new(site).grab_screenshot

    Rails.logger.info filename + ' is the cool thing'
    self.screenshot.store!(File.open(filename))
  end
end
