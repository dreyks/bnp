require 'spec_helper'

describe Page do
  subject { create :page }
  
  it { should be_valid }
  it { should validate_presence_of :title }
  it { should validate_presence_of :content }
  it { should validate_uniqueness_of :title }
  
  describe 'when assigned a new title' do
    let(:page) { build(:page) }
    before do
      @new_title = 'new title'
      @new_slug = 'new-title'
      page.stub(:slugify).and_return(@new_slug)
    end
    
    it 'calls for a slug' do
      page.should_receive(:slugify).with(@new_title)
      page.title = @new_title
    end
    it 'assings the slug' do
      page.title = @new_title
      page.slug.should == @new_slug
    end
  end
end
