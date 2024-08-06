# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(
  full_name: 'John Doe',
  phone: '2222222222',
  password: 'password2')

User.create!(
  full_name: 'Jane Doe',
  phone: '3333333333',
  password: 'password3')  

p "Patients are successfully created!"

AdminUser.create!(
  full_name: 'John Boss',
  phone: '1111111111',
  password: 'password1')

p "Admin is successfully created!"

Category.create!(
  name: 'therapist')  

Category.create!(
  name: 'cardiologist') 

Category.create!(
  name: 'urologist')  
  
Category.create!(
  name: 'surgeon') 

p "Categories are successfully created!"

Doctor.create!(  
  full_name: 'Doc One',
  phone: '4444444444',
  password: 'oneone',  
  category_id: 1)  

Doctor.create!(  
  full_name: 'Doc Two',
  phone: '5555555555',
  password: 'twotwo',
  category_id: 2)  

Doctor.create!(  
  full_name: 'Doc Three',
  phone: '6666666666',
  password: 'threethree',
  category_id: 3)      

p "Doctors are successfully created!"
