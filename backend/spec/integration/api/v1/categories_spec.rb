RSpec.describe 'api/v1/categories', type: :integration do
  describe 'GET list' do
    before { do_get }

    it 'returns 200 HTTP code' do
      expect(last_response.status).to eq(200)
    end

    it 'returns valid format' do
      content_type = last_response.header['Content-Type']
      expect(content_type).to eq('application/json')
    end

    it 'returns valid response format' do
      response = json(last_response)
      expect(response).to have_key(:categories)
      expect(response[:categories]).to_not be_empty
    end

    def do_get
      get 'api/v1/categories'
    end
  end
end
