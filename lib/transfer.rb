class Transfer

  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender_account, receiver_account, money)
    @transfer = money
    @sender = sender_account
    @receiver = receiver_account
    @status = "pending"
    @amount = 50
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.valid? && sender.balance > @amount && self.status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"

    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if execute_transaction
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end


  end



end
