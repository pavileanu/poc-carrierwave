CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider => 'AWS',
  
      :aws_access_key_id => 'AKIATHFCQU2HZQJMKKUQ',
      :aws_secret_access_key => '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',
      :region => 'us-east-23'
  
      #:aws_access_key_id => 'NEA8362BELY40WH2GF5C',
      #:aws_secret_access_key => 'CJDNpBwdCn7gm6FyqKK5uILdzKA4PxmNntxJAbgJ',
      #:host => '10.217.132.80',
      #:endpoint => 'https://10.217.132.80/carrier-attachments'
    }
  
    #config.fog_directory = ''
    config.fog_directory = 'pavi-bucket'
  end