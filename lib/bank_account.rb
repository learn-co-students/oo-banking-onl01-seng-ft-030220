require "pry"

class BankAccount

  attr_accessor :balance, :status
  attr_reader :account, :name

  def initialize(account_name)
    @account = account
    @name = account_name
    @balance = 1000
    @status = "open"
  end

  def deposit(money)
    @balance += money
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
     if @status == "open" && @balance > 0
       @status = true
     else
       false
     end
  end

  def close_account
    @status = "closed"
  end

end
