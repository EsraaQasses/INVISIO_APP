// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../style/repo.dart';

// Don't froget error and loading
// هاد كومبوننت جاهز حطلنا ياه بالستركشر

class AppImage extends StatelessWidget {
  final String path;
  final ImageType
      type; // هنن الكاش نيتورك ايمج و النيتورك العادية والفايل والاست
  // بالتالي هدول الأربع أنواع صار ئلهن لودر واحد و ايرور واحد
  final BoxFit fit;
  final Widget errorWidget;
  final Widget loadingWidget;
  final double? height;
  final double? width;
  final BoxDecoration? decoration;
  final EdgeInsets? margin;
  final BoxConstraints? constraints;

  const AppImage({
    super.key,
    required this.path,
    required this.type,
    this.fit = BoxFit.cover,
    this.errorWidget = const ImageError(),
    this.loadingWidget = const ImageLoading(),
    this.height,
    this.width,
    this.margin,
    this.decoration,
    this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: decoration,
      constraints: constraints,
      child: LayoutBuilder(
        builder: (context, constraints) {
          BorderRadiusGeometry effectiveBorderRadius =
              decoration?.borderRadius ?? BorderRadius.zero;
          if (decoration != null && decoration!.shape == BoxShape.circle) {
            effectiveBorderRadius =
                BorderRadius.circular(constraints.maxHeight / 2);
          }
          return ClipRRect(
            // اذا مرقتلو بوردر ريديس فالمفروض حط كليب أر حتى تقص الصورة  لانو الصورة اذا كانت بنت للكونتينر مابتنقص فالكليب أر ركت هية بتقص
            // اذا كنت عامل شيب سيركل كمان الكونتينر مابقص ف بخليه يعمل بوردر ريديس بحيث تطلع دائرة بقسم الطول الموجود معي على 2
            //
            borderRadius: effectiveBorderRadius,
            child: switch (type) {
              ImageType.CachedNetwork => CachedNetworkImage(
                  imageUrl: path,
                  fit: fit,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      loadingWidget,
                  errorWidget: (context, e, i) => errorWidget,
                ),
              ImageType.Network => Image.network(
                  path,
                  errorBuilder: (context, _, i) => errorWidget,
                  loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) =>
                      loadingProgress == null ? child : loadingWidget,
                  fit: fit,
                ),
              ImageType.File => Image.file(
                  File(path),
                  fit: fit,
                  errorBuilder: (context, _, i) => errorWidget,
                ),
              ImageType.Asset => Image.asset(
                  path,
                  errorBuilder: (context, _, i) => errorWidget,
                  fit: fit,
                )
            },
          );
        },
      ),
    );
  }
}

enum ImageType { Network, File, CachedNetwork, Asset }

class ImageError extends StatelessWidget {
  const ImageError({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder();
    // return Container(
    //   padding: const EdgeInsets.all(12),
    //   decoration: const BoxDecoration(color: StyleRepo.softGrey),
    //   child: Center(
    //     child: SvgIcon(Assets.icons.logo, color: StyleRepo.grey),
    //   ),
    // );
  }
}

class ImageLoading extends StatelessWidget {
  const ImageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      // هاد التأثير منستخدمو كرمال اللودنغ كمان عنا مكتبة اسمها شيمر
      baseColor: StyleRepo
          .darkGrey, // هدول اللونين يلي رح يصير عليهن تدرج ويفتلو بقلب العنصر
      highlightColor: StyleRepo.lightGrey,
      child: Container(
        color: StyleRepo.white,
        // height: double.infinity,
        // width: double.infinity,
      ),
    );
  }
}
