import 'dart:convert';
import 'dart:io';

import 'package:uni/model/entities/service.dart';

class ServiceMock{
  List<Service> services;



  /*List<Service> setServices(){
    final file = File('services.json');
    final data = file.readAsStringSync();

    var jsonFile = json.decode(data);
    List<Service> services;

    for(var serv in jsonFile){
      var service = Service(serv['id'],serv['name'],serv['desc'],serv['startTime'],serv['closeTime']);
      services.add(service);
    }

    return services;
  }*/

  static List<String> getNames(){
    List<Service> list1 = getServices();
    List<String> list = [];
    for(Service service in list1){
      list.add(service.name);
    }
    return list;

  }

  static Service getService(String service1){
    List<Service> list1 = getServices();
    List<String> list = [];
    for(Service service in list1){
      if(service.name == service1){
        return service;
      }
    }


  }

  static List<Service> getServices(){

    var data = [
      {
        "id": 1,
        "name": "SERAC",
        "desc": "Garantir as atividades no âmbito da administração, gestão e apoio na área de gestão de curso; a área do acesso, ingresso e certificação; a área de gestão de estudante, de acordo com as instruções tutelares e as diretivas dos Órgãos de Gestão, constituindo a relação com o estudante o vetor essencial da sua atuação.",
        "startTime": "11:00",
        "closeTime": "16:00"
      },
      {
        "id": 2,
        "name": "SDInf",
        "desc": "Aos Serviços de Documentação e Informação compete gerir os recursos de informação cientifico-técnica e de cariz pedagógico, a documentação administrativa e os recursos patrimoniais de componente cultural, científica ou tecnológica, numa abordagem teórica e funcional que integram a Biblioteconomia, Arquivologia e Museologia, dando centralidade ao documento, à informação e ao seu uso e gestão em contexto organizacional. Os SDI integram as unidades de Arquivo, Biblioteca, Museu e Serviços Eletrónicos, com missões, recursos e pessoal específicos mas numa prática integradora onde as novas tecnologias de criação, armazenamento, difusão e comunicação da informação ganham um papel relevante.",
        "startTime": "08:30",
        "closeTime": "19:30"
      },
      {
        "id": 3,
        "name": "SICC",
        "desc": "Os Serviços de Imagem, Comunicação e Cooperação têm por missão construir relações de confiança e uma reputação institucional excelente, e valorizar o conhecimento e cultivar o talento da comunidade intercultural e global da FEUP.",
        "startTime": "09:30-13:00",
        "closeTime": "14:00-17:00"
      },
      {
        "id": 4,
        "name": "SRH",
        "desc": "Os Serviços de Recursos Humanos tem como missão o recrutamento, a selecção e a integração, a gestão e o desenvolvimento dos recursos humanos da FEUP.",
        "startTime": "10:00-12:00",
        "closeTime": "14:30-16:30"
      },
      {
        "id": 5,
        "name": "SEF",
        "desc": "Os SEF têm como Missão assegurar a atividade económica e financeira da FEUP, de acordo com as instruções tutelares e as diretivas dos Órgãos de Gestão.",
        "startTime": "09:00",
        "closeTime": "16:00"
      },
      {
        "id": 6,
        "name": "STMA",
        "desc": "Gestão e manutenção dos espaços e dos equipamentos da Escola, de modo a garantir as melhores condições para o ensino de excelência na área das engenharias.",
        "startTime": "09:00-12:30",
        "closeTime": "14:00-17:30"
      }
    ];

    //final file = File('services.json');
    //final data = file.readAsStringSync();
    //var jsonFile = json.decode(data);
    List<Service> services = [];
    Service service;

    for(var serv in data){



      service = Service(serv['id'],serv['name'],serv['desc'],serv['startTime'],serv['closeTime']);

      services.add(service);
    }

    return services;


  }


  
}
