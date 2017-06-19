module Web::Controllers::Books
  class Index
    include Web::Action

    expose :books
    expose :authors

    def call(params)
      @books = BookRepository.new.all
    end
  end

end
