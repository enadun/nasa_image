import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_images/model/nasa_image.dart';
import 'package:nasa_images/widgets/image_card.dart';

void main() {
  testWidgets('ImageCard widget test`', (WidgetTester tester) async {
    // given
    final image = NasaImage(
      id: 01,
      camera: Camera(name: 'ABC', fullName: 'AA BB CC'),
      imageSrc: 'http://abc.com/img.jpg',
      rover: Rover(name: 'Rover'),
    );

    // when
    await tester.pumpWidget(
      MaterialApp(
        home: ImageCard(image: image),
      ),
    );

    // then
    expect(find.text('AA BB CC'), findsOneWidget);
    expect(find.text('Rover'), findsOneWidget);
    expect(find.byType(Text), findsNWidgets(2));
    expect(find.byType(Card), findsOneWidget);
    expect(find.byType(CachedNetworkImage), findsOneWidget);
  });
}
