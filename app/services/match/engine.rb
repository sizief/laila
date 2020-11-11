module Match
  class Engine

    def initialize(request)
      @request = request
    end

    def self.run(request)
      new(request).run
    end

    def run
      return if match.nil?

      fulfilled = match.amount - request.amount
      target = fulfilled > 0  ? match : request

      FulfilledOrder.create(
        request_order_id: request.order_id,
        match_order_id: match.order_id,
        amount: request.amount,
        price: target.price
      )

      if fulfilled != 0
        ActiveOrder.create(
          position: target.position,
          amount: fulfilled.abs,
          price: target.price,
          order_id: target.order_id
        )
      end

      request.delete
      match.delete
    end

    attr_reader :request

    private

    def match
      operator = request.buy? ? "<=" : ">="

      @match ||= ActiveOrder
      .where(position: reverse_position)
      .where("price #{operator} ? ", request.price)
      .order('price ASC')
      .first
    end

    def reverse_position
      request.reverse_position
    end

  end
end
