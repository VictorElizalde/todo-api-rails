require 'rails_helper'

  describe "get all todos route", :type => :request do
    let!(:todos) {FactoryBot.create_list(:todo, 20)}

  before {get '/api/v1/todos'}

  it 'returns all todos' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    assert_response :success
  end
end