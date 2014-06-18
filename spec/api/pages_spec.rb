require 'spec_helper'

describe '/api/pages' do
  it 'shows the list of pages' do
    create_list(:unique_page, 2)
    
    get '/api/pages'
    
    response.should be_success
    json['pages'].should == 2
  end
  
  it 'gets a page by id' do
    page = create(:page)
    
    get '/api/pages/' + page.id.to_s
    
    response.should be_success
    json['content'].should == page.content
  end
  
  
end