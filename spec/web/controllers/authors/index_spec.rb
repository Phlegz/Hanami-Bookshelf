require 'spec_helper'
require_relative '../../../../apps/web/controllers/authors/index'

describe Web::Controllers::Authors::Index do
  let(:action) { Web::Controllers::Authors::Index.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
