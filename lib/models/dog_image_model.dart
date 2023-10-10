class DogImageModel {
  final String message;
  final String status;

  const DogImageModel({
    required this.message,
    required this.status,
  });

  factory DogImageModel.fromJson(Map<String, dynamic> json) {
    return DogImageModel(
      message: json['message'] as String,
      status: json['status'] as String,
    );
  }
}
