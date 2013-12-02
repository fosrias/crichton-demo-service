# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
5.times do |i|
  Drd.create(
    uuid: SecureRandom.uuid,
    name: "181#{i}",
    status: Random.rand(2) > 0 ? 'activated' : 'deactivated',
    kind: Random.rand(2) > 0 ? 'standard' : 'sentinel',
    leviathan_uuid: leviathan_uuid = SecureRandom.uuid,
    leviathan_url: "http://farscape.example.org/leviathan/#{leviathan_uuid}",
    built_at: Time.now
  )
end

5.times do |i|
  Order.create(
      uuid: SecureRandom.uuid,
      name: "order_#{i}",
      quantity: i,
      address: Random.rand(5) > i ? 'New York' : 'Dark side of the Moon',
      email: "email_#{i}@email.com",
      placed_on: Time.now,
      status: 'placed',
      express: 0
  )
end
