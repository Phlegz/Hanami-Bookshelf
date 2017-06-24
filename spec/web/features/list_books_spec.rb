require 'features_helper'

describe 'List books' do
  let(:repository) { BookRepository.new }
  before do
    repository.clear

    AuthorRepository.new.create_with_books(name: 'Martin Fowler', books: [{title: 'PoEAA'}])
    AuthorRepository.new.create_with_books(name: 'Kent Beck', books: [{title: 'TDD'}])

  end

  it 'displays each book on the page' do
    visit '/books'

    within '#books' do
      assert page.has_css?('.book', count: 2), 'Expected to find 2 books'
    end
  end
end
