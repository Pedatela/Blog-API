namespace :cem do

  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
        puts "Cadastrando os Usuarios..."

        100.times do |i|
            User.create!(
              nickname: Faker::Internet.user_name(5..8),
              name: Faker::Name.name,
              email: Faker::Internet.email,
              password: "12345678",
              password_confirmation: "12345678"
            )
        end

        puts "Cadastrando os tipos de Artigos..."

              categories= %w(Esportes Terror Romance)

              categories.each do |categories|
                Category.create!(
                  name: categories
                )
              end
          puts "Tipos de Artigos cadastrados com sucesso!"





        puts "Cadastrando os Artigos..."

        User.all.each do |user|
          Category.all.each do |category|
            Random.rand(5).times do |i|
              article = Article.new(title:Faker::Zelda.character, body: LeroleroGenerator.paragraph(3))
              user.articles << article
              category.articles << article
              user.save
              article.save
            end
          end
        end
        puts "Artigos cadastrados com sucesso!"

      end
end
