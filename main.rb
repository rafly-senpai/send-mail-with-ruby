
require "mail" # run: (gem install mail) in terminal if not installed

your_email = "your_email"
your_password = "your_app_password" # Don't enter your regular Google password

print "Enter recipient email: "
recipient_email_input = gets.chomp

print "Enter subject: "
subject_input = gets.chomp

print "Enter message: "
message_input = gets.chomp

if recipient_email_input == "" || subject_input == "" || message_input == ""
  puts "Error."
else
   Mail.defaults do
      delivery_method :smtp, {
         address: "smtp.gmail.com",
         port: 587,
         user_name: your_email,
         password: your_password,
         authentication: "plain",
         enable_starttls_auto: true
      }
   end

   mail = Mail.new do
      from    your_email
      to      recipient_email_input
      subject subject_input
      body    message_input
   end

   mail.deliver!

  puts "Email sent successfully."
end