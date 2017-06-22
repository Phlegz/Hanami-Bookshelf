class AuthorRepository < Hanami::Repository
  associations do
    has_many :books
  end

# create an author with a collection of books:
# invoke the function in this way: create_with_books(name: "AuthorName", books: [{title: "Booktitle"}])
#This function is invoked when creating a new book and inserts the associated author to the db/ It also checks if the author already exists in the db and if it does, it just saves the book with the corresponding author_id
  def create_with_books(data)
    result = authors.read("select name from authors where name='#{data[:name]}'").to_a
    if ((result[0]) != nil)
      result = authors.read("select id from authors where name='#{data[:name]}'").to_a
      BookRepository.new.create(author_id: result[0].id, title: (data[:books][0])[:title])
    else
    assoc(:books).create(data)
    end
  end

#find the author whose id matches the author_id from the books table
  def find_with_books(id)
    aggregate(:books).where(id: id).as(Author).one
  end

  def order_by_book_number
    authors.read("select authors.id as id, authors.name as name, count(authors.name) as total from authors join books on authors.id = books.author_id group by authors.id order by count(authors.name) desc").to_a
  end

end
