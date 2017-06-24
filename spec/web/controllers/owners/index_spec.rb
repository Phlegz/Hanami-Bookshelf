require 'spec_helper'
require_relative '../../../../apps/web/controllers/owners/index'

describe Web::Controllers::Owners::Index do
  let(:action) { Web::Controllers::Owners::Index.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
