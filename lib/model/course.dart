class Course {
  final String courseId;
  final String name;
  final String description;
  final String artworkUrl;
  final String price;
  final String hour;

  Course(this.courseId, this.name, this.description, this.artworkUrl,
      this.price, this.hour);

  Course.fromJson(Map<String, dynamic> json)
      : courseId = json["id"],
        name = json["name"],
        description = json["detail"],
        artworkUrl = json["thumbnail"],
        price = json["price"],
        hour = json["hour"];
}
