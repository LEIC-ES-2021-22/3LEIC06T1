import 'package:uni/model/entities/service.dart';

class ServiceMock{
  
  static List<Service> getServices(){
    return [
      Service(1,'SERAC' , 
          'Garantir as atividades no âmbito da administração, gestão e apoio na área de gestão de curso; a área do acesso, ingresso e certificação; a área de gestão de estudante, de acordo com as instruções tutelares e as diretivas dos Órgãos de Gestão, constituindo a relação com o estudante o vetor essencial da sua atuação.', 
          '11:00', '16:00'),
      
      Service(2, 'SDInf',
          'Aos Serviços de Documentação e Informação compete gerir os recursos de informação cientifico-técnica e de cariz pedagógico, a documentação administrativa e os recursos patrimoniais de componente cultural, científica ou tecnológica, numa abordagem teórica e funcional que integram a Biblioteconomia, Arquivologia e Museologia, dando centralidade ao documento, à informação e ao seu uso e gestão em contexto organizacional. Os SDI integram as unidades de Arquivo, Biblioteca, Museu e Serviços Eletrónicos, com missões, recursos e pessoal específicos mas numa prática integradora onde as novas tecnologias de criação, armazenamento, difusão e comunicação da informação ganham um papel relevante.'
          , '08:30', '19:30'),
      
      Service(3, 'SICC',
          '	Os Serviços de Imagem, Comunicação e Cooperação têm por missão construir relações de confiança e uma reputação institucional excelente, e valorizar o conhecimento e cultivar o talento da comunidade intercultural e global da FEUP.',
          '9:30-13:00', '14:00-17:00'),

      Service(4, 'SRH',
          'Os Serviços de Recursos Humanos tem como missão o recrutamento, a selecção e a integração, a gestão e o desenvolvimento dos recursos humanos da FEUP.',
          '10:00-12:00', '14:30-16:30'),

      Service(5, 'SEF',
          'Os SEF têm como Missão assegurar a atividade económica e financeira da FEUP, de acordo com as instruções tutelares e as diretivas dos Órgãos de Gestão.',
          '9:00', '16:00'),

      Service(6, 'STMA',
          'Gestão e manutenção dos espaços e dos equipamentos da Escola, de modo a garantir as melhores condições para o ensino de excelência na área das engenharias.',
          '09:00-12:30', '14:00-17:30')
      
    ];
  }
  
}