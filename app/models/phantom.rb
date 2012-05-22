class Phantom
  RASTERIZE = Rails.root.join('lib', 'rasterize.js')
  TMP_DIRECTORY = Rails.root.join('tmp', 'screenshots')

  def initialize(url)
    @url = url
  end

  def grab_screenshot
   filename = clean_filename
   Phantomjs.run(RASTERIZE.to_s, @url, filename) 
   filename
  end

  def clean_filename
    Rails.logger.info(TMP_DIRECTORY)
    "#{TMP_DIRECTORY}/#{@url.delete('/.:?!')}.png"
  end
end