require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  get "/reversename/:name" do
    @user_name = params[:name].reverse
    "#{@user_name}"
  end
  
  get "/square/:num1" do
    @squared = params[:num1].to_i * params[:num1].to_i
    "#{@squared}"
  end

  get "/say/:number/:phrase" do 
    @phrase = params[:number].to_i.times.collect { params[:phrase] }.join(' ')
    "#{@phrase}"
  end

  get "/say/:word1/:word2/:word3/:word4/:word5" do 
    @words = 6.times.collect.with_index(1) { |index| params["word#{index}"] }.join(' ') + '.'
    "#{@words}"
  end

  get "/:operation/:number1/:number2" do 
    @operation = params[:operation]
    @num1 = params[:number1].to_i
    @num2 = params[:number2].to_i

    case @operation
      when "add"
        "#{@num1 + @num2}"
      when "subtract"
        "#{@num2 - @num1}"
      when "multiply"
        "#{@num1 * @num2}"
      when "divide"
        "#{@num1 / @num2}"
    end
  end
end