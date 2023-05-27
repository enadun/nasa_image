import 'package:flutter/material.dart';
import 'package:nasa_images/api/app_api.dart';
import 'package:nasa_images/constants/app_strings.dart';
import 'package:nasa_images/model/nasa_image.dart';
import 'package:nasa_images/screens/details_screen.dart';

import '../constants/app_colors.dart';
import '../widgets/image_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;
  List<NasaImage>? _images;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    final images = await AppApi.getImages();
    _isLoading = false;
    setState(() {
      _images = images;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.nasaImages),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _images == null
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        AppStrings.loadingError,
                        style: TextStyle(
                          color: AppColors.kColorE40513,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      TextButton(
                          onPressed: () => setState(() {
                                _isLoading = true;
                                _loadData();
                              }),
                          child: const Text(AppStrings.reTry)),
                    ],
                  ),
                )
              : Container(
                  color: AppColors.kColorB9DBFB,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final image = _images![index];
                      return InkWell(
                        child: ImageCard(image: image),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ImageDetailsScreen(
                                  image: image,
                                ),
                              ));
                        },
                      );
                    },
                    itemCount: _images!.length,
                  ),
                ),
    );
  }
}
