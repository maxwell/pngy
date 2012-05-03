require 'spec_helper'

describe PreviewsController do
  describe 'create' do

    it 'works' do
      post :create, :preview => {:url => 'http://google.com'}

      response.should be_success
    end
  end
end