class BankAccount

attr_accessor :balance, :status, :deposit, :close_account, :transfer 
attr_reader :name

@@accounts = [] 

  def initialize(name, balance=1000)
    @name = name
    @balance = balance
    @status = "open" 
    @@accounts << self
  end 
  
  def deposit(amount)
    @balance = @balance+amount
  end 
  
  def display_balance
    "Your balance is $#{@balance}."
  end 

  def valid?
    if @status == "open" && balance > 0
      true 
    else 
      false 
    end 
  end 
  
  def close_account 
    @status = "closed"
  end 
  
  def sender(sender)
    @sender << [self.name,self.balance, self.status]
  end 

end
