class BankAccount
    attr_reader :name
    attr_accessor :balance, :status

    def initialize(name)
        @name = name
        @balance = 1000
        @status = 'open'
    end

    def display_balance
        "Your balance is $#{balance}."
    end

    def deposit(amount)
        self.balance += amount
        
        balance
    end

    def close_account
        self.status = 'closed'
    end

    def valid?
        if balance > 0  && status == 'open'
            true 
        else 
            close_account 
            false
        end
    end

end
