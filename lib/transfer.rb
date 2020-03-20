class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
  
  @@transferred=[]
  
  def initialize(sender,receiver,amount)
    @sender=sender
    @receiver=receiver
    @status="pending"
    @amount=amount
  end 
  
  def valid?
    @sender.valid? && @receiver.valid?
  end 
  
  def execute_transaction
    
    if @sender.balance > @amount && self.valid? && @status=="pending"
      @receiver.balance +=@amount
      @sender.balance -=@amount 
      @status="complete"
      @@transferred << @amount
      
    else
      @status="rejected"
      return "Transaction rejected. Please check your account balance."
    end 
      
  end 
      
      
  def reverse_transfer
    if @status=="complete"
      @receiver.balance-=@@transferred[-1]
      @sender.balance +=@@transferred[-1]
      @status="reversed"
    end 
    
  end 
  
    
        
      
      
    
   
      
      
      
      
    
  
  
end
