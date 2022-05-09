
class Service{
  final int id;
  final String name;
  final String description;
  final String startTime;
  final String endTime;


  Service(this.id, this.name, this.description,this.startTime,this.endTime){}

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'begin': startTime,
      'end': endTime,
      'rooms': '',
      'subject': name
    };
  }

  @override
  String toString() {
    return '''$id - $name - $description - $startTime -  $endTime''';
  }

}