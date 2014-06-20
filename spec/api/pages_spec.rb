require 'spec_helper'

describe '/api/pages' do
  it 'shows the list of pages' do
    pages = create_list(:unique_page, 2)
    
    get '/api/pages'
    
    response.should be_success
    json['data'].length.should == 2
    json['data'].any? { |e| e[:title] = pages.first[:title] }
  end
  
  context 'when getting a page by id' do
    it 'is ok with with valid id' do
      page = create(:page)
      
      get '/api/pages/' + page.id.to_s
      
      response.should be_success
      json['data']['title'].should == page.title
    end
    it 'fails with invalid id' do
      get '/api/pages/0'
      
      response.status.should == 404
      json['error'].should == 'Page not found'
    end
  end
  
  context 'when creating a page' do
    it 'is ok with valid params' do
      post '/api/pages/', page: build(:page, title: 'test').attributes
      page = Page.find_by_title('test')
      
      response.status.should == 201
      json['data']['title'].should == page.title
    end
    it 'fails with invalid params' do
      post '/api/pages', page: attributes_for(:page, title: '')
      
      response.status.should == 400
    end
  end
  
  context 'when deleting a page' do
    it 'is ok with valid id' do
      page = create(:page)
      
      delete '/api/pages/' + page.id.to_s
      
      response.should be_success
    end
    it 'fails with invalid id' do
      delete '/api/pages/0'
      
      response.status.should == 404
    end
  end
  
  context 'when updating a page' do
    it 'is ok with valid params' do
      page = create(:page)
      put '/api/pages/' + page.id.to_s, page: attributes_for(:page)
      
      response.should be_success
    end
    it 'fails if id is invalid' do
      put '/api/pages/0'
      
      response.status.should == 404
    end
    it 'fails if params are invalid' do
      page = create(:page)
      put '/api/pages/' + page.id.to_s, page: attributes_for(:page, title: '')
      
      response.status.should == 400
    end
  end
  
  
end