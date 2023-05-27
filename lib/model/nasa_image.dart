class NasaImage {
  int id;
  Camera camera;
  String imageSrc;
  Rover rover;

  NasaImage({
    required this.id,
    required this.camera,
    required this.imageSrc,
    required this.rover,
  });

  factory NasaImage.fromJson(Map<String, dynamic> json) {
    return NasaImage(
      id: json['id'],
      camera: Camera.fromJson(json['camera']),
      imageSrc: json['img_src'],
      rover: Rover.fromJson(json['rover']),
    );
  }
}

class Camera {
  String name;
  String fullName;

  Camera({required this.name, required this.fullName});

  factory Camera.fromJson(Map<String, dynamic> json) {
    return Camera(
      name: json['name'],
      fullName: json['full_name'],
    );
  }
}

class Rover {
  String name;

  Rover({required this.name});

  factory Rover.fromJson(Map<String, dynamic> json) {
    return Rover(name: json['name']);
  }
}
