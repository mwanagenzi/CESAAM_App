class FeedbackDetails {
  late final String description;
  late final String responseType;
  String? firstName;
  String? surname;
  String? email;
  late bool respondToFeedback;

  FeedbackDetails({
    required this.description,
    required this.responseType,
    this.firstName,
    this.surname,
    this.email,
    required this.respondToFeedback,
  });

  Map<String, String> toJson() => {
        'description': description,
        'response_type': responseType,
        'first_name': firstName ?? '',
        'surname': surname ?? '',
        'email': email ?? '',
        'respond_to_feedback': respondToFeedback.toString()
      };
}
