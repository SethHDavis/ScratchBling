require "rails_helper"

RSpec.describe "Scratchers API", type: :request do
  # initialize test data
  let!(:scratchers) { create_list(:scratcher, 10) }
  let(:scratcher_id) { scratchers.first.id }

  # Test suite for GET /scratchers
  describe "GET /scratchers" do
    # make HTTP get request before each example
    before { get "/scratchers" }

    it "returns scratchers" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /scratchers/:id
  describe "GET /scratchers/:id" do
    before { get "/scratchers/#{scratcher_id}" }

    context "when the record exists" do
      it "returns the scratcher" do
        expect(json).not_to be_empty
        expect(json["id"]).to eq(scratcher_id)
      end

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the record does not exist" do
      let(:scratcher_id) { 100 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Scratcher/)
      end
    end
  end

  # Test suite for POST /scratchers
  describe "POST /scratchers" do
    # valid payload
    let(:valid_attributes) { { name: "The Itcher", description: "Scratch any itch", size: "XL", price: 100.50 } }

    context "when the request is valid" do
      before { post "/scratchers", params: valid_attributes }

      it "creates a scratcher" do
        expect(json["name"]).to eq("The Itcher")
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when the request is invalid" do
      before { post "/scratchers", params: { name: "Foobar" } }

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end

      it "returns a validation failure message" do
        expect(response.body)
          .to match(/Validation failed: Description can't be blank, Size can't be blank, Price can't be blank/)
      end
    end
  end

  # Test suite for PUT /scratchers/:id
  describe "PUT /scratchers/:id" do
    let(:valid_attributes) { { name: "The Blinger" } }

    context "when the record exists" do
      before { put "/scratchers/#{scratcher_id}", params: valid_attributes }

      it "updates the record" do
        expect(response.body).to be_empty
      end

      it "returns status code 204" do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /scratchers/:id
  describe "DELETE /scratchers/:id" do
    before { delete "/scratchers/#{scratcher_id}" }

    it "returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end
end
