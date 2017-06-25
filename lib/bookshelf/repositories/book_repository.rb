class BookRepository < Hanami::Repository

  def group_by(id)
    books.read("select title from books where owner_id = #{id}").to_a
  end
end
