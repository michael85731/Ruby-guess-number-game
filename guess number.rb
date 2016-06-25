Rand_num = Random.new.rand(100).to_i

def is_number?(arg)
  /\d/.match(arg)
end

def check(arg)
  if arg[:user] <= arg[:max] and arg[:user] >= arg[:min] #在提示範圍內
    if arg[:user] > Rand_num
      {:result => false, :max => arg[:user], :min => arg[:min]}
    elsif arg[:user] < Rand_num
    	{:result => false, :max => arg[:max], :min => arg[:user]}
    else
    	{:result => true}
    end
  else  #在提示範圍外
    if arg[:user] > arg[:max] 
      #大於max
      puts "猜太大la，請猜範圍內的數字"
      puts 
      sleep(1)
      {:result => false, :max => arg[:max], :min => arg[:min]}
    else  
      #小於min
      puts "猜太小la，請猜範圍內的數字"
      puts 
      sleep(1)
      {:result => false, :max => arg[:max], :min => arg[:min]}
    end
  end
end

while(1)
  times ||= 1
  max ||= 1000
  min ||= 0
  puts 
  puts "enter your number, between #{min} and #{max}"
  user_guess = gets.gsub("\s+","")

  if is_number?(user_guess)
    result = check(user:user_guess.to_i, max:max, min:min)
    if result[:result]
      puts "答對惹，答案是 #{Rand_num}，你猜了 #{times} 次" 
    	break
    else
      #更新max或min
      max = result[:max]
      min = result[:min]
      puts 
  	  times += 1
    end
  else
    puts "請輸入數字，不要亂打la"
    puts 
    sleep(1)
  end
end