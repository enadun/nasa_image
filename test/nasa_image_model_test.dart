import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_images/model/nasa_image.dart';

void main() {
  test('NasaImage model test', () {
    // given
    final jsonResponse = {
      'id': 102693,
      'camera': {'name': 'FHAZ', 'full_name': 'Front Hazard Avoidance Camera'},
      'img_src': 'http://abc.com/xyz.jpg',
      'rover': {
        'name': 'Curiosity',
      }
    };

    // when
    final nasaImage = NasaImage.fromJson(jsonResponse);

    // then
    expect(nasaImage.id, 102693);
    expect(nasaImage.imageSrc, 'http://abc.com/xyz.jpg');
    expect(nasaImage.camera.name, 'FHAZ');
    expect(nasaImage.camera.fullName, 'Front Hazard Avoidance Camera');
    expect(nasaImage.rover.name, 'Curiosity');
  });
}
