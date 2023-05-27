import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nasa_images/model/nasa_image.dart';
import 'package:photo_view/photo_view.dart';

class ImageDetailsScreen extends StatelessWidget {
  final NasaImage image;
  const ImageDetailsScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(image.camera.name),
      ),
      body: PhotoView(
        imageProvider: CachedNetworkImageProvider(image.imageSrc),
      ),
    );
  }
}
