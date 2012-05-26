class ConfigurationHelper
  def self.using_aws?
    [ENV['AWS_BUCKET_NAME'], ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'], ENV['REGION']].all?(&:present?)
  end
end