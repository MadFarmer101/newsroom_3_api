RSpec.describe "POST /article", type: :request do
  let(:journalist) { create(:user, role: "journalist") }
  let(:journalist_credentials) { journalist.create_new_auth_token }
  let(:journalist_headers) do
    { HTTP_ACCEPT: "application/json" }.merge!(journalist_credentials)
  end
  let(:reg_user) { create(:user, role: "reg_user") }
  let(:reg_user_credentials) { reg_user.create_new_auth_token }
  let(:reg_user_headers) do
    { HTTP_ACCEPT: "application/json" }.merge!(reg_user_credentials)
  end
  let(:image) do
    {
      type: "application/jpg",
      encoder: "name=new_image.jpg:base64",
      data: "GHJKFNKSJHFUDHFdnfkdjfjkshuhFNLNKLFDFJLkjksldjflkgdmsk248273rendlksfn",
      extension: "jpg",
    }
  end

  describe "successfull" do
    before do
      post "/api/v1/admin",
           params: {
             article: {
               title: "No more room in space",
               snippet: "Its all gone, sorry",
               content: "Govenor says this aint good",
               category: "tech",
               image: image,
             },
           },
           headers: journalist_headers
    end

    it "returns 200 status" do
      expect(response.status).to eq 200
    end

    it "displays correct title" do
      expect(
        response.request.params["article"]["title"]
      ).to eq "No more room in space"
    end

    it "displays correct snippet" do
      expect(
        response.request.params["article"]["snippet"]
      ).to eq "Its all gone, sorry"
    end

    it "displays correct content" do
      expect(
        response.request.params["article"]["content"]
      ).to eq "Govenor says this aint good"
    end

    it "displays correct category" do
      expect(response.request.params["article"]["category"]).to eq "tech"
    end

    it "article has an image attached to it" do
      article = Article.where(title: response.request.params["article"]["title"])
      expect(article.first.image.attached?).to eq true
    end
  end

  describe "sad path" do
    before do
      post "/api/v1/admin",
           params: {
             article: {
               title: "",
               snippet: "this is text",
               content: "content text",
               category: "tech",
               image: image,
             },
           },
           headers: journalist_headers
    end

    it "displays error of incomplete article" do
      expect(response.status).to eq 422
    end

    it "displays error message on empty title" do
      expect(JSON.parse(response.body)["message"]).to eq "Title can't be blank"
    end
  end
  describe "sad path" do
    before do
      post "/api/v1/admin",
           params: {
             article: {
               title: "Cool title",
               snippet: "",
               content: "content text",
               category: "tech",
               image: image,
             },
           },
           headers: journalist_headers
    end

    it "displays error of incomplete article" do
      expect(response.status).to eq 422
    end

    it "displays error message on empty snippet" do
      expect(
        JSON.parse(response.body)["message"]
      ).to eq "Snippet can't be blank"
    end
  end

  describe "sad path" do
    before do
      post "/api/v1/admin",
           params: {
             article: {
               title: "Yes a title",
               snippet: "this is text",
               content: "",
               category: "tech",
               image: image,
             },
           },
           headers: journalist_headers
    end

    it "displays error of incomplete article" do
      expect(response.status).to eq 422
    end

    it "displays error message on empty content" do
      expect(
        JSON.parse(response.body)["message"]
      ).to eq "Content can't be blank"
    end
  end

  describe "sad path" do
    before do
      post "/api/v1/admin",
           params: {
             article: {
               title: "Yes a title",
               snippet: "this is text",
               content: "content text",
               category: "",
               image: image,
             },
           },
           headers: journalist_headers
    end

    it "displays error of incomplete article" do
      expect(response.status).to eq 422
    end

    it "displays error message on empty category" do
      expect(
        JSON.parse(response.body)["message"]
      ).to eq "Category can't be blank"
    end
  end

  describe "can not create article as user" do
    before do
      post "/api/v1/admin",
           params: {
             article: {
               title: "No more room in space",
               snippet: "Its all gone, sorry",
               content: "Govenor says this aint good",
               category: "tech",
               image: image,
             },
           },
           headers: reg_user_headers
    end

    it "returns 401 status" do
      expect(response.status).to eq 401
    end

    it "returns error message" do
      expect(
        response_json["message"]
      ).to eq "You are not authenticated to create an article"
    end
  end
end
