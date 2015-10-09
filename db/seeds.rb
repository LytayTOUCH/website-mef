# procurement_type seed data

[
  {name: 'លទ្ធកម្មទំនិញ​'},
  {name: 'លទ្ធកម្មសំណង់'},
  {name: 'លទ្ធកម្មសេវាកម្ម'},
  {name: 'លទ្ធកម្មការព្រឹក្សា'}
].each do |type|
  ProcurementType.create_with(name: type[:name]).find_or_create_by(name: type[:name])
end

[
  {email: 'administrator@email.com', password: '!@#$%^&*()', password_confirmation:'!@#$%^&*()', username: 'AdminUser'}
].each do |admin|
  Administrator.create_with(email: admin[:email], password: admin[:password], password_confirmation: admin[:password_confirmation], username: admin[:username] ).find_or_create_by(email: admin[:email])
end
