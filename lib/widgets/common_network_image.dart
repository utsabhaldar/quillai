import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_svg/svg.dart';

class CommonNetworkImageView extends StatelessWidget {
  ///[url] is required parameter for fetching network image
  final String url;
  final double height;
  final double width;
  final BoxFit fit;
  final String errorImage;
  final String errorText;
  final Color? color;
  final bool showPlaceHolder;
  final bool isPDF;
  final String? cacheKey;

  CommonNetworkImageView({
    required this.url,
    this.height = 30,
    this.width = 30,
    this.fit = BoxFit.contain,
    this.errorImage = 'assets/images/image_not_found.png',
    this.errorText = '',
    this.showPlaceHolder = true,
    this.color,
    this.isPDF = false,
    this.cacheKey,
  });

  @override
  Widget build(BuildContext context) {
    if (!url.trim().toLowerCase().contains('http')) {
      if (url.trim().toLowerCase().contains('.svg')) {
        return (SvgPicture.asset(
          url,
          height: height,
          width: width,
          fit: fit,
          color: color,
        ));
      } else {
        return Image.asset(
          url,
          height: height,
          width: width,
          fit: fit,
          errorBuilder: (context, error, stackTrace) => errorWidget(),
        );
      }
    } else if (url.trim().toLowerCase().contains('.pdf')) {
      return FutureBuilder<File>(
        future: DefaultCacheManager().getSingleFile(url),
        builder: (context, snapshot) => (snapshot.hasData)
            ? PDFView(
                swipeHorizontal: false,
                enableSwipe: false,
                filePath: snapshot.data!.path,
              )
            : CachedNetworkImage(
                // httpHeaders: {"Connection": "Keep-Alive"},
                height: height,
                width: width,
                fit: fit,
                imageUrl: url,
                color: color,
                // cacheKey: cacheKey,
                placeholder: (context, url) {
                  return SizedBox(
                    height: height,
                    width: width,
                    child: (showPlaceHolder)
                        ? LinearProgressIndicator(
                            color: Colors.grey.shade200,
                            backgroundColor: Colors.grey.shade100,
                          )
                        : null,
                  );
                },
                errorWidget: (context, url, error) => errorWidget(),
              ),
      );
    } else {
      return url.isEmpty
          ? Image.asset(
              errorImage,
              height: height,
              width: width,
              fit: fit,
            )
          : (url.trim().endsWith('.svg'))
              ? SvgPicture.network(url,
                  height: height, width: width, fit: fit, color: color)
              : CachedNetworkImage(
                  httpHeaders: {"Connection": "Keep-Alive"},
                  height: height,
                  width: width,
                  fit: fit,
                  imageUrl: url,
                  color: color,
                  placeholder: (context, url) {
                    return SizedBox(
                      height: height,
                      width: width,
                      child: (showPlaceHolder)
                          ? LinearProgressIndicator(
                              color: Colors.grey.shade200,
                              backgroundColor: Colors.grey.shade100,
                            )
                          : errorWidget(),
                    );
                  },
                  errorWidget: (context, url, error) => errorWidget(),
                );
    }
  }

  Widget errorWidget() {
    if (errorText == "") {
      return Image.asset(
        errorImage,
        fit: BoxFit.contain,
      );
    } else {
      return Center(
          child: Text(
        errorText,
      ));
    }
  }

  static Future<Iterable> cacheImages(
      BuildContext context, List<String> imgUrls) {
    return Future.wait<void>(imgUrls.map((url) {
      if (url.trim().endsWith(".svg")) {
        return precacheSvgPicture(url);
      } else {
        return precacheImage(
            CachedNetworkImageProvider(url,
                headers: {"Connection": "Keep-Alive"}),
            context);
      }
    }));
  }

  ///updated flutter svg to 2.0.7
  static Future precacheSvgPicture(String svgPath) async {
    final logo = SvgAssetLoader(svgPath);
    await svg.cache
        .putIfAbsent(logo.cacheKey(null), () => logo.loadBytes(null));
  }
}
