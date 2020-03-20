class BankAccount

attr_accessor :balance, :status
attr_reader :name

  def initialize(name, balance = 1000, status = "open")
    @name = "Avi"
    @balance = balance
    @status = status
  end

  def balance
    @balance
  end

  def status
    @status
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def valid?
    @balance > 0 && @status == "open"
  end

  def close_account
    @status = "closed"
  end
end
