class Flight {
  final String id;
  final String origin;
  final String destination;
  final DateTime date;
  final double price;

  Flight({
    required this.id,
    required this.origin,
    required this.destination,
    required this.date,
    required this.price,
  });

  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
      id: json['id'],
      origin: json['origin'],
      destination: json['destination'],
      date: DateTime.parse(json['date']),
      price: json['price'].toDouble(),
    );
  }
}
