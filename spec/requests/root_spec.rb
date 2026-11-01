# frozen_string_literal: true

RSpec.describe "Root", type: :request do
  it "lists files" do
    get "/"

    expect(last_response.status).to be(200)
  end
end
