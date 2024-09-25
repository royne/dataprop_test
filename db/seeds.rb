user1 = User.create!(email: "user1@mail.com", password: "123456")
user2 = User.create!(email: "user2@mail.com", password: "123456")
user3 = User.create!(email: "user3@mail.com", password: "123456")

property1 = Property.new(
  user: user1,
  property_type: 'rent',
  price: 500000,
  currency: 'CLP',
  commune: 'Santiago',
  address: 'Calle Falsa 123',
  area: 80,
  bedrooms: 3,
  bathrooms: 2,
  latitude: -33.4489,
  longitude: -70.6693,
  description: 'Hermosa propiedad con vista al parque.'
)

property2 = Property.new(
  user: user1,
  property_type: 'sale',
  price: 12000000,
  currency: 'USD',
  commune: 'Las Condes',
  address: 'Avenida Siempreviva 742',
  area: 150,
  bedrooms: 4,
  bathrooms: 3,
  latitude: -33.4086,
  longitude: -70.5706,
  description: 'Propiedad de lujo cerca del centro comercial.'
)

property3 = Property.new(
  user: user2,
  property_type: 'rent',
  price: 300000,
  currency: 'CLP',
  commune: 'Providencia',
  address: 'Calle Alegría 456',
  area: 60,
  bedrooms: 2,
  bathrooms: 1,
  latitude: -33.4246,
  longitude: -70.6095,
  description: 'Acogedor departamento en el corazón de Providencia.'
)

property1.photo.attach(
  io: File.open(Rails.root.join('app/assets/images/property1.jpg')),
  filename: 'property1.jpg',
  content_type: 'image/jpg'
)

property2.photo.attach(
  io: File.open(Rails.root.join('app/assets/images/property2.jpg')),
  filename: 'property2.jpg',
  content_type: 'image/jpg'
)

property3.photo.attach(
  io: File.open(Rails.root.join('app/assets/images/property3.jpg')),
  filename: 'property3.jpg',
  content_type: 'image/jpg'
)
property1.save
property2.save
property3.save

pp 'created seeds'
