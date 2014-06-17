require 'spec_helper'

describe Page do
  #before_each { page = build(:page) }
  
  it 'is not valid w/o a title' do
    page = build(:page, title: '')
    page.should_not be_valid
  end
  
  it 'is not valid w/o content' do
    page = build(:page, content: '')
    page.should_not be_valid
  end
  
  it 'ensures title uniqueness' do
    page = create(:page)
    page2 = build(:page)
    page2.should_not be_valid
  end
  
  it 'calls for a slug when assigned a new title' do
    new_title = 'newtitle'
    page = build(:page)
    page.should_receive(:slugify).with(new_title).and_return(new_title)
    
    
    page.title = new_title
    page.slug.should == new_title
    
  end
end
