class Call {
  final String id;
  final String name;
  final String time;
  final bool isVideo;
  final bool isMissed;
  final bool isIncoming;

  Call({
    required this.id,
    required this.name,
    required this.time,
    this.isVideo = false,
    this.isMissed = false,
    this.isIncoming = false,
  });

  Call copyWith({
    String? id,
    String? name,
    String? time,
    bool? isVideo,
    bool? isMissed,
    bool? isIncoming,
  }) {
    return Call(
      id: id ?? this.id,
      name: name ?? this.name,
      time: time ?? this.time,
      isVideo: isVideo ?? this.isVideo,
      isMissed: isMissed ?? this.isMissed,
      isIncoming: isIncoming ?? this.isIncoming,
    );
  }
}
