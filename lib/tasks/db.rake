namespace :db do
  @racas = ["American Bully", "American pit bull terrier", "American staffordshire terrier", "Boston terrier", "Boxer", "Broholmer", "Buldogue",
  "Bull terrier", "Bull-mastiff brasileiro", "Bully Kutta", "Cane corso", "Cão de Fila de São Miguel", "Cão pastor", "Catahoula Cur",
  "Cimarron uruguayo", "Dálmata", "Dachshund", "Dobermann", "Dogue de Bordéus", "Dogue brasileiro", "Dogue canário", "Fila brasileiro",
  "Foxhound americano", "Hound", "Husky siberiano", "Mastim Inglês", "Old English Bulldog", "Pastor-alemão", "Patterdale Terrier",
  "Pinscher alemão", "Pinscher miniatura", "Labrador retriever", "Rottweiler", "São-bernardo", "Shih-tzu", "Terrier", "Terrier brasileiro"]
  @genero = ['femea', 'macho']
  @castrado = [true, false]
  @nomes = ["Akira", "Babalu", "Cacau", "Capitu", "Dara", "Eddie", "Elvis", "Fanny", "Kako", "Laika", "Lana", "Lilica", "Lucy", "Madonna", "Negão",
    "Nina", "Panda", "Porpeta", "Quixote", "Rayka", "Rex", "Ringo", "Sacha", "Thor", "Urso", "Wally", "Wendy", "Yoko", "Yuri", "Zaira"
  ]
  @nomes_dono = ["Miguel",	"Alice", "Arthur", "Sophia", "Davi", "Laura", "Bernardo", "Valentina", "Heitor", "Helena", "Gabriel", "Isabella", "Pedro", "Manuela",
  "Lorenzo", "Júlia", "Lucas", "Luiza", "Matheus", "Lívia", "Enzo", "Giovanna", "Theo", "Maria Luiza", "Benjamin", "Heloísa", "Rafael",
  "Maria Eduarda", "Nicolas", "Maria Clara"]
  @sobrenomes_dono = ["Silva", "Souza", "Costa", "Santos", "Oliveira", "Pereira", "Rodrigues", "Almeida", "Nascimento", "Lima", "Araújo", "Fernandes", "Carvalho",
  "Gomes", "Martins", "Rocha", "Ribeiro", "Alves", "Monteiro", "Mendes", "Barros", "Freitas", "Barbosa", "Pinto", "Moura", "Cavalcanti",
  "Dias", "Castro", "Campos", "Cardoso"]

  task populate: :environment do
    bd_clear
    populate_database
  end

  def rand_data_nascimento
    rand(1000).days.ago
  end

  def rand_ultima_consulta
    rand(30).days.ago
  end

  def rand_telefone
    "3" + 7.times.map{rand(10)}.join
  end

  def populate_database
    populate_cachorros
    puts 'Povoação do banco de dados concluída.'
  end

  def bd_clear
    print '> apagando os registros do banco de dados...'
    Cachorro.delete_all
    puts 'ok'
  end

  def populate_cachorros
    print '> Criando cachorros'
    1000.times.each do |cachorro|
      Cachorro.create!(raca: @racas.sample, genero: @genero.sample, castrado: @castrado.sample, data_nascimento: rand_data_nascimento, nome: @nomes.sample, nome_dono: @nomes_dono.sample + ' ' + @sobrenomes_dono.sample, telefone: rand_telefone, data_ultima_consulta: rand_ultima_consulta)
      print '.'
    end
    puts 'ok'
  end
end
