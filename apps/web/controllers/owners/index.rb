module Web::Controllers::Owners
  class Index
    include Web::Action

    expose :owners

    def call(params)
      @owners = OwnerRepository.new.all
    end

  end
end
