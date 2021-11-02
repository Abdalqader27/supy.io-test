import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import 'close_widget.dart';
import 'loading_widget.dart';

class ImageView extends StatelessWidget {
  final String image;
  final bool showBack;

  const ImageView({Key? key, required this.image, this.showBack = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PhotoView(
            maxScale: 3.0,
            minScale: PhotoViewComputedScale.contained,
            loadingBuilder: (_, __) {
              return const Center(child: LoadingWidget());
            },
            imageProvider: CachedNetworkImageProvider(image)),
        if (showBack)
          const Positioned(top: 100, left: 10, child: CloseWidget(dim: 10))
      ],
    ));
  }
}
