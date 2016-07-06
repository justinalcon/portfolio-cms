FactoryGirl.define do

  factory :image, :class => 'Image' do
    location { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'files', 'test_image.jpg')) }
  end

end