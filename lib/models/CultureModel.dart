class CultureModel {
  final String type;

  CultureModel(this.type);

  Map<String, dynamic> toJson() {
    return {
      'type': type,
    };
  }
}