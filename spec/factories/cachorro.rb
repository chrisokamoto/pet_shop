FactoryGirl.define do
  factory :cachorro do
    nome            'Nina'
    nome_dono       'Lorena'
    raca            'Dachshund'
    genero          'femea'
    data_nascimento { rand(30).days.ago }
    telefone        '12341234'
  end

  factory :poodle, parent: :cachorro do
    nome            'Lilica'
    nome_dono       'Gabriel'
    raca            'Poodle'
    genero          'femea'
    data_nascimento { rand(30).days.ago }
    telefone        '12341234'
  end

  factory :labrador, parent: :cachorro do
    nome            'Ringo'
    nome_dono       'Débora'
    raca            'Labrador'
    genero          'macho'
    data_nascimento { rand(30).days.ago }
    telefone        '12341234'
  end
end
