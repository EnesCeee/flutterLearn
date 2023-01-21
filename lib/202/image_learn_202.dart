import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/global/resource_context.dart';
import 'package:provider/provider.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({super.key});

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<ResourceContext>().clear();
              },
              icon: const Icon(Icons.remove))
        ],
        title: Text(context.read<ResourceContext>().model?.data?.length.toString() ?? ''),
      ),
      body: ImagePaths.apple_book.toWidget(height: 100),
    );
  }
}

enum ImagePaths {
  apple_book,
}

extension ImagePathsExtension on ImagePaths {
  String path() {
    return 'assets/png/$name.png';
  }

  Widget toWidget({double height = 24}) {
    return Image.asset(
      path(),
      height: height,
    );
  }
}
