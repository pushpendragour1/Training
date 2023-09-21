
require 'prawn'
require 'launchy'

puts "Hey! Welcome !"
puts "========================"
puts "Please enter your resume information:"
puts "========================"

=begin
def validName(name)
    if name.length >= 16
        return false
    end

   arr = name.split
   for ch in arr
     for

    i =0
    while i < 10
     flag = name.include?(i)
     if flag == true
      return false
     end
     i++
     if i == 10
        return true
     end
    end
    return true
end
=end
 def valid_email(email)
     email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
     !!(email =~ email_regex)
 end
 def isdigits?(str)
  /\A\d+\z/.match?(str)
 end
  
 #Input email 
 nameCheck = false
 ageCheck = false
 checkEmail = false
 checkMobileNo = false

 while nameCheck == false
  puts "Enter your name?"
  name = gets.chomp
   if name.length >= 16
     puts "Please Write the Invaild Name! "
     nameCheck = false
   else
    nameCheck = true
   end
 end
 puts "Hello, #{name}! hope your doing well!"
 #Input Age 
 while ageCheck == false
  puts "#{name}! please Enter you age"
  age = gets.chomp
  if(isdigits?(age) != true)
    puts "Age must be Integer :\n"
    ageCheck =false
  else
   age = age.to_i
   if age < 18 || age > 50 
     puts "Age must be 18+ \n "
     ageCheck = false
   else 
    ageCheck = true
   end
  end
 end

 #Input email 
 while checkEmail == false
  puts "#{name} please enter your Email :\n"
  email = gets.chomp
  checkEmail = valid_email(email)
  if checkEmail == false
    puts "Your Email is Invaild! :\n"
  else 
    checkEmail = true
  end
 end

  #Mobile number 
 while checkMobileNo == false
   puts "#{name} please enter your 10 Digit Mobile number : \n"
   phone = gets.chomp
   if phone.length == 10 
    checkMobileNo =true
   else
    puts "Your mobile number is Invalid :\n"
    checkMobileNo = false
   end
 end
   #higher Education 
 puts "Enter the higher Qualification :\n" 
 education = gets.chomp
 puts "Enter the branch : " 
 branch = gets.chomp

 puts "#{name} Enter the how Many Work Experience :\n"
 experience = gets.chomp

 File.open("textfile.txt", "w") do |f|  
    f.puts "Name : " + name  
    f.puts "Age  : #{age}"  
    f.puts "Mobile No : " + phone   
    f.puts "Email ID  : " + email  
    f.puts "Education : " + education 
    f.puts "Branch    : " + branch 
    f.puts "Experience: #{ experience }" 
 end 
#if we wanna convert Text File into PDF file so we required prawn
 def convert_to_pdf(input_file, output_file)
    Prawn::Document.generate(output_file) do

      text = File.read(input_file)
      text.gsub!(/\r\n?/, "\n")
      font_size 12
      text text
    end
  end
  
  input_file_path = 'textfile.txt'
  
  output_file_path = 'textfile.pdf'

  convert_to_pdf(input_file_path, output_file_path)
  puts "Conversion completed! Text file converted to PDF: #{output_file_path}\n"

  puts "Would you like to open the pdf file : \n "
  puts "Enter yes otherwise No : \n"
  input = gets.chomp
  
  if input == "yes"
    Launchy.open(output_file_path)
  else
    puts "Task Completed"
  end

