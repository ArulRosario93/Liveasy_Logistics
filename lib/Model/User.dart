class User {
  final String MobileNumber;
  final String uid;
  final String selected;
  final String language;

  User(
      {required this.MobileNumber,
      required this.uid,
      required this.selected,
      required this.language});

  Map<String, dynamic> toJson() => {
        "Mobile Number": MobileNumber,
        "uid": uid,
        'uopt': selected,
        "language": language,
      };
}
