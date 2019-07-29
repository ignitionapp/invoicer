module FakeGems
  class Stripe
    def self.Send(attrs)
      sleep(500)
    end
  end
end