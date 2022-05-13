class Reminder{
  final int id;
  final String serviceName;
  final int userId;
  final String description;
  final String date;


  Reminder(this.id, this.userId, this.serviceName, this.description,this.date){}

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user': userId,
      'service': serviceName,
      'description': description,
      'date': date
    };
  }

  @override
  String toString() {
    return '''$id - $userId - $serviceName - $description -  $date''';
  }

}