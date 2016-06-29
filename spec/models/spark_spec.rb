require 'rails_helper'

RSpec.describe Spark, type: :model do
  let(:guinea_pig) { FactoryGirl.create(:spark) }

  it 'should be valid' do
    expect(guinea_pig).to be_valid
  end

  it 'defaults published to true' do
    expect(guinea_pig.published).to eq(true)
  end

  context 'no title' do
    let(:spark) { FactoryGirl.build_stubbed(:spark, title: nil) }

    it 'should NOT be valid' do
      expect(spark).not_to be_valid
    end
  end

  context 'no summary' do
    let(:spark) { FactoryGirl.build_stubbed(:spark, summary: nil) }

    it 'should NOT be valid' do
      expect(spark).not_to be_valid
    end
  end

  context 'has valid video link' do
    context 'youtube.com' do
      let(:guinea_pig) { FactoryGirl.create(:spark, video_url: 'https://www.youtube.com/watch?v=wZZ7oFKsKzY') }
      it 'should be valid' do
        expect(guinea_pig).to be_valid
      end
    end
    context 'youtu.be' do
      let(:guinea_pig) { FactoryGirl.create(:spark, video_url: 'https://youtu.be/wZZ7oFKsKzY') }
      it 'should be valid' do
        expect(guinea_pig).to be_valid
      end
    end

    context 'vimeo.com' do
      let(:guinea_pig) { FactoryGirl.create(:spark, video_url: 'https://vimeo.com/139094998') }
      it 'should be valid' do
        expect(guinea_pig).to be_valid
      end
    end
  end

  context 'invalid video link' do
    let(:guinea_pig) { FactoryGirl.build_stubbed(:spark, video_url: 'http://www.dailymotion.com/video/x42ky7a_want-to-know-if-your-bae-is-cheating-on-tinder-that-ll-be-5-please_tech') }
    it 'should be valid' do
      expect(guinea_pig).not_to be_valid
    end
  end

end