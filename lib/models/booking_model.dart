class Booking {
  final String providerId;
  final String service;
  final double price;
  final String date;
  final String time;
  final String userNotes;
  final double? latitude;
  final double? longitude;
  String status;
  final String address; // Added address field

  Booking({
    required this.providerId,
    required this.service,
    required this.price,
    required this.date,
    required this.time,
    required this.userNotes,
    this.latitude,
    this.longitude,
    this.status = 'Pending',
    required this.address, // Initialize address field
  });

  get additionalServices => null;

  Map<String, dynamic> toJson() {
    return {
      'providerId': providerId,
      'service': service,
      'price': price,
      'date': date,
      'time': time,
      'userNotes': userNotes,
      'latitude': latitude,
      'longitude': longitude,
      'status': status,
      'address': address, // Include address in JSON
    };
  }

  static Booking fromJson(Map<String, dynamic> json) {
    return Booking(
      providerId: json['providerId'],
      service: json['service'],
      price: json['price'],
      date: json['date'],
      time: json['time'],
      userNotes: json['userNotes'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      status: json['status'] ?? 'Pending',
      address: json['address'], // Initialize address from JSON
    );
  }
}
