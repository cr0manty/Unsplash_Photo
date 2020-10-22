class Author {
  String firstName;
  String lastName;
  String photo;

  Author({
    this.firstName,
    this.lastName,
    this.photo,
  });

  factory Author.fromJson(Map<String, dynamic> data) => Author(
        firstName: data['first_name'],
        lastName: data['last_name'],
        photo: data['profile_image']['medium'],
      );

  String get fullName {
    if (firstName == null || firstName.isEmpty) {
      return lastName;
    } else if (lastName == null || lastName.isEmpty) {
      return firstName;
    }
    return '$firstName $lastName';
  }
}
