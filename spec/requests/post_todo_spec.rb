require 'rails_helper'

describe "post a todo route", :type => :request do
  before do
    post '/api/v1/todos', params: { 
        todo: {
          :title => 'Buy milk',
          :done => true
        }
    }
  end

  it 'returns the todo\'s title' do
    expect(JSON.parse(response.body)['title']).to eq('Buy milk')
  end

  it 'returns the todo\'s done' do
    expect(JSON.parse(response.body)['done']).to eq(true)
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end
