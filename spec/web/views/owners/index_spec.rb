require 'spec_helper'
require_relative '../../../../apps/web/views/owners/index'

describe Web::Views::Owners::Index do
  let(:exposures) { Hash[owners: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/owners/index.html.erb') }
  let(:view)      { Web::Views::Owners::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #owners' do
    view.owners.must_equal exposures.fetch(:owners)
  end

  describe 'when there are no owners' do
    it 'shows a placeholder message' do
      rendered.must_include('<p class="placeholder">There are no owners yet.</p>')
    end
  end

  describe 'when there are owners' do
    @author = AuthorRepository.new.create_with_books(name: 'Martin Fowler', books: [{title: 'Refactoring'}], owner: 'me')
    @author = AuthorRepository.new.create_with_books(name: 'Eric Evans', books: [{title: 'Domain Driven Design'}], owner: 'Bob')

    let(:owner1)     { OwnerRepository.new.find(1) }
    let(:owner2)     { OwnerRepository.new.find(2) }
    # let(:book1)     { Book.new(title: 'Refactoring', author: 'Martin Fowler') }
    # let(:book2)     { Book.new(title: 'Domain Driven Design', author: 'Eric Evans') }
    let(:exposures) { Hash[owners: [owner1, owner2]] }

    it 'lists them all' do
      rendered.scan(/class="owner"/).count.must_equal 2
      rendered.must_include('me')
      rendered.must_include('Bob')
    end

    it 'hides the placeholder message' do
      rendered.wont_include('<p class="placeholder">There are no books yet.</p>')
    end
  end

end
