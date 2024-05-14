class Ticket {
  String name;
  bool type;
  String time;
  String seat;

  Ticket(
      {required this.name,
      required this.type,
      required this.time,
      required this.seat});

  Map<String, dynamic> toJson() 
    => {'name': name, 'type': type, 'time': time, 'seat': seat};
  

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
        name: json['name'],
        type: json['type'],
        time: json['time'],
        seat: json['seat']);
  }
}
