require 'pry'

class Transfer
    attr_reader :sender, :receiver, :amount
    attr_accessor :status

    def initialize(sender, receiver, amount = 50)
        @sender = sender
        @receiver = receiver
        @amount = amount
        @status = 'pending'
    end

    def valid? 
        sender.valid? && receiver.valid? 
    end

    def execute_transaction
      if (valid? && sender.balance >= amount) && status != "complete"
        sender.balance -= amount
        receiver.balance += amount

        self.status = "complete"
      else
        reject_transfer
      end

    end

    def reject_transfer
      if !valid? || sender.balance < amount
          self.status = 'rejected'

          "Transaction rejected. Please check your account balance."
      end
    end

    def reverse_transfer
        if status == "complete"
            sender.balance += amount
            sender
            receiver.balance -= amount
            receiver

            self.status = "reversed"
        end
    end

end

# binding.pry
# '1'
