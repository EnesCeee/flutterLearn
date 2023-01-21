import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({super.key});
  final String _imagePath =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Apple-book.svg/1018px-Apple-book.svg.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        SizedBox(
          height: 100,
          width: 300,
          child: PngImage(name: ImageItems().appleBookWithoutPath),
        ),
        Image.network(
          _imagePath,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.abc_outlined),
        ),
      ]),
    );
  }
}

class ImageItems {
  final String appleWithBook =
      'assets/png/1024px-Books_with_Apple_Flat_Icon_Vector.png';
  final String appleBookWithoutPath =
      'apple_book';
}

class PngImage extends StatelessWidget {
  const PngImage({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _nameWithPath,
      fit: BoxFit.cover,
    );
  }

  String get _nameWithPath => 'assets/png/$name.png';
}
