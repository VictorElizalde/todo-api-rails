require 'rails_helper'

describe "PUT /api/v1/todos/:id" do
  before(:each) do
    @todo = FactoryBot.create(:todo)
  end

  it "updates a todo" do
    @new_title = Faker::Lorem.sentence
    @new_done = Faker::Boolean.boolean(true_ratio: 1)

    put "/api/v1/todos/#{@todo.id}", params: {
      todo: {
        title: @new_title,
        done: @new_done
      }
    }
    
    assert_response :accepted

    get "/api/v1/todos"

    expect(JSON.parse(response.body).first['title']).to eq(@new_title)
    expect(JSON.parse(response.body).first['done']).to eq(@new_done)
  end
end
