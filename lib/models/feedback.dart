class Feedback {
  late final String description;
  late final String responseType;
  String? firstName;
  String? surname;
  String? email;
  late bool respondToFeedback;

  Map<String, dynamic> toJson() => {
        'description': description,
        'response_type': responseType,
        'first_name': firstName ?? '',
        'surname': surname ?? '',
        'email': email ?? '',
        'respond_to_feedback': respondToFeedback
      };
}
