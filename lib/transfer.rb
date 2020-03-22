require 'pry'
class Transfer
  # your code here
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @status = "pending"
    @amount = amount 
end

def valid? 
  @sender.valid? && @receiver.valid? ? true : false 
end 

def execute_transaction
  #binding.pry
  if @sender.balance > amount && @status == "pending" && valid?
    @sender.balance -= amount
    @receiver.balance += amount 
    @status = "complete"
   
else 
  @status = "rejected"
  return "Transaction rejected. Please check your account balance."
end 
end

def reverse_transfer
  if @status == "complete" && valid? && @receiver.balance > amount
    @sender.balance += amount
    @receiver.balance -= amount
    @status = "reversed"
    else 
  @status = "rejected"
  return "Transaction rejected. Please check your account balance."

  end 
  end 
end 
