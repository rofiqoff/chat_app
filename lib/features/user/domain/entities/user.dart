class User {
  final String id;
  final String name;
  final String phone;
  final String avatarUrl;
  final String status;
  final double distance;

  User({
    required this.id,
    required this.name,
    required this.phone,
    this.avatarUrl = '',
    this.status = 'Available',
    this.distance = 0.0,
  });

  User copyWith({
    String? id,
    String? name,
    String? phone,
    String? avatarUrl,
    String? status,
    double? distance,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      status: status ?? this.status,
      distance: distance ?? this.distance,
    );
  }
}
