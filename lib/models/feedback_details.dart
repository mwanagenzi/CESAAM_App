class FeedbackDetails {
  final String description;
  final String responseType;
  String? urgencyLevel;
  String? firstName;
  String? surname;
  String? email;
  final bool respondToFeedback;

  FeedbackDetails({
    required this.description,
    required this.responseType,
    this.firstName,
    this.surname,
    this.email,
    required this.respondToFeedback,
    this.urgencyLevel,
  });

  Map<String, String> toJson() => {
        'description': description,
        'response_type': responseType,
        'first_name': firstName ?? '',
        'surname': surname ?? '',
        'email': email ?? '',
        'respond_to_feedback': respondToFeedback.toString(),
        'urgency_level': urgencyLevel ?? '0'
      };
}
