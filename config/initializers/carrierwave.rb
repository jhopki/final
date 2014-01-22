CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp')
  config.cache_dir = 'carrierwave'

  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      =>  ENV['#{ENV["S3_KEY"]}'],
    :aws_secret_access_key  =>  ENV['#{ENV["S3_SECRET"]}'],
    :region					=>	ENV['S3_REGION']
  }

  config.fog_directory  = 'transresourcestoronto'

end