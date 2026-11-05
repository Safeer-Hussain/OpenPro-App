class EventEntity {
  final String id;
  final String title;
  final String organizer;
  final String organizerLogo;
  final String dateDescription;
  final String dateTime;
  final String locationOrLink;
  final bool isVirtual;
  final int attendeeCount;
  final bool isRsvp;
  final List<String> speakers;
  final List<String> tags;

  const EventEntity({
    required this.id,
    required this.title,
    required this.organizer,
    required this.organizerLogo,
    required this.dateDescription,
    required this.dateTime,
    required this.locationOrLink,
    required this.isVirtual,
    required this.attendeeCount,
    required this.isRsvp,
    required this.speakers,
    required this.tags,
  });

  EventEntity copyWith({
    String? id,
    String? title,
    String? organizer,
    String? organizerLogo,
    String? dateDescription,
    String? dateTime,
    String? locationOrLink,
    bool? isVirtual,
    int? attendeeCount,
    bool? isRsvp,
    List<String>? speakers,
    List<String>? tags,
  }) {
    return EventEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      organizer: organizer ?? this.organizer,
      organizerLogo: organizerLogo ?? this.organizerLogo,
      dateDescription: dateDescription ?? this.dateDescription,
      dateTime: dateTime ?? this.dateTime,
      locationOrLink: locationOrLink ?? this.locationOrLink,
      isVirtual: isVirtual ?? this.isVirtual,
      attendeeCount: attendeeCount ?? this.attendeeCount,
      isRsvp: isRsvp ?? this.isRsvp,
      speakers: speakers ?? this.speakers,
      tags: tags ?? this.tags,
    );
  }
}
