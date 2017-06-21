module Web::Controllers::Authors
  class Index
    include Web::Action

    expose :authors

    def call(params)
      @authors = AuthorRepository.new.order_by_book_number
    end

  end
end
