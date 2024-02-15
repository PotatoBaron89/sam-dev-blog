# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

sam = User.find_or_initialize_by(email: 'samboy29@gmail.com')
sam.password = 'potato'
sam.password_confirmation = 'potato'
sam.save!

ror = Category.find_or_create_by!(name: 'Ruby on Rails', colour: 'bg-blue-300')
dev_ops = Category.find_or_create_by!(name: 'Dev Ops', colour: 'bg-yellow-300')
networking = Category.find_or_create_by!(name: 'Networking', colour: 'bg-green-300')
postgres = Category.find_or_create_by!(name: 'Postgres', colour: 'bg-fuchsia-300')

ror_article = ror.articles.find_or_create_by!(name: 'Ruby on Rails Placeholder 2')
ror_article.update!(content: 'Ruby on Rails is a web application framework written in Ruby under the MIT License. Rails is a model–view–controller (MVC) framework, providing default structures for a database, a web service, and web pages. It encourages and facilitates the use of web standards such as JSON or XML for data transfer and HTML, CSS and JavaScript for display and user interfacing. In addition to MVC, Rails emphasizes the use of other well-known software engineering patterns and paradigms, including convention over configuration (CoC), don\'t repeat yourself (DRY), and the active record pattern.')

postgres_article = postgres.articles.find_or_create_by!(name: 'Postgres Placeholder')
postgres_article.update!(content: 'PostgreSQL, also known as Postgres, is a free and open-source relational database management system emphasizing extensibility and SQL compliance. It was originally named POSTGRES, referring to its origins as a successor to the Ingres database developed at the University of California, Berkeley. In 1996, the project was renamed to PostgreSQL to reflect its support for SQL. After a review in 2007, the development team decided to keep the name PostgreSQL and the alias Postgres.')

admin_role = Role.find_or_create_by!(name: 'Admin')
registered_user_role = Role.find_or_create_by!(name: 'Registered User')

sam.roles << admin_role unless sam.roles.include?(admin_role)
sam.roles << registered_user_role unless sam.roles.include?(registered_user_role)