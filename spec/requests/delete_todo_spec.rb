require 'rails_helper'

describe "delete question route" do
  before(:each) do
    @todo_one = FactoryBot.create(:todo)
    @todo_two = FactoryBot.create(:todo)
  end

  it 'should delete the todo' do
    get "/api/v1/todos"

    expect(response.status).to eq(200)
    expect(JSON.parse(response.body)).to eq([YAML.load(@todo_two.to_json),YAML.load(@todo_one.to_json)])

    delete "/api/v1/todos/#{@todo_one.id}"
    
    expect(response.status).to eq(204)

    get "/api/v1/todos"

    expect(JSON.parse(response.body)).to eq([YAML.load(@todo_two.to_json)])
  end
end