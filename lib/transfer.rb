require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver 
    @amount = amount
    @status = "pending"
  end
  def valid?
    if @sender.valid? && @receiver.valid?
      return true 
    else 
      false 
    end 
  end 
  def execute_transaction
    if valid? && @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount 
      @status = "complete"
    
    else 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer 
    if self.status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount 
      @status = "reversed"
    else 
      
      self.status = "rejected"
      "Transaction rejected. Please check your account balance." 
  end 
end
end
