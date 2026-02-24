// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/eye-slash.png
  AssetGenImage get eyeSlash =>
      const AssetGenImage('assets/icons/eye-slash.png');

  /// File path: assets/icons/google.png
  AssetGenImage get google => const AssetGenImage('assets/icons/google.png');

  /// File path: assets/icons/lock.png
  AssetGenImage get lock => const AssetGenImage('assets/icons/lock.png');

  /// File path: assets/icons/phone.png
  AssetGenImage get phone => const AssetGenImage('assets/icons/phone.png');

  /// File path: assets/icons/sms.png
  AssetGenImage get sms => const AssetGenImage('assets/icons/sms.png');

  /// File path: assets/icons/user.png
  AssetGenImage get user => const AssetGenImage('assets/icons/user.png');
  /// File path: assets/icons/Group 5.png
  AssetGenImage get Group5 => const AssetGenImage('assets/icons/Group 5');
  /// File path: assets/icons/User-4.png
  AssetGenImage get User4 => const AssetGenImage('assets/icons/User-4.png');

  /// List of all assets
  List<AssetGenImage> get values => [eyeSlash, google, lock, phone, sms, user, Group5,  User4];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/EG.png
  AssetGenImage get eg => const AssetGenImage('assets/images/EG.png');

  /// File path: assets/images/LR.png
  AssetGenImage get lr => const AssetGenImage('assets/images/LR.png');

  /// File path: assets/images/Logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/Logo.png');

  /// File path: assets/images/avatar1.png
  AssetGenImage get avatar1 => const AssetGenImage('assets/images/avatar1.png');

  /// File path: assets/images/avatar2.png
  AssetGenImage get avatar2 => const AssetGenImage('assets/images/avatar2.png');

  /// File path: assets/images/avatar3.png
  AssetGenImage get avatar3 => const AssetGenImage('assets/images/avatar3.png');

  /// File path: assets/images/avatar4.png
  AssetGenImage get avatar4 => const AssetGenImage('assets/images/avatar4.png');

  /// File path: assets/images/avatar5.png
  AssetGenImage get avatar5 => const AssetGenImage('assets/images/avatar5.png');

  /// File path: assets/images/avatar6.png
  AssetGenImage get avatar6 => const AssetGenImage('assets/images/avatar6.png');

  /// File path: assets/images/avatar7.png
  AssetGenImage get avatar7 => const AssetGenImage('assets/images/avatar7.png');

  /// File path: assets/images/avatar8.png
  AssetGenImage get avatar8 => const AssetGenImage('assets/images/avatar8.png');

  /// File path: assets/images/avatar9.png
  AssetGenImage get avatar9 => const AssetGenImage('assets/images/avatar9.png');
  /// File path: assets/images/gamer (1).png
  AssetGenImage get gamer1 => const AssetGenImage('assets/images/gamer (1).png');
  /// File path: assets/images/ Component1.png
  AssetGenImage get Component1 => const AssetGenImage('assets/images/Component 11 – 1.png');
  /// File path: assets/images/ Component2.png
  AssetGenImage get Component2 => const AssetGenImage('assets/images/Component 11 – 2.png');
  /// File path: assets/images/ Component4.png
  AssetGenImage get Component4 => const AssetGenImage('assets/images/Component 11 – 4.png');
  /// File path: assets/images/ Component5.png
  AssetGenImage get Component5 => const AssetGenImage('assets/images/Component 11 – 5.png');
  /// File path: assets/images/ Component6.png
  AssetGenImage get Component6 => const AssetGenImage('assets/images/Component 11 – 6.png');
  /// File path: assets/images/ Component7.png
  AssetGenImage get Component7 => const AssetGenImage('assets/images/Component 11 – 7.png');
  /// File path: assets/images/ Component8.png
  AssetGenImage get Component8 => const AssetGenImage('assets/images/Component 11 – 8.png');
  /// File path: assets/images/ Component9.png
  AssetGenImage get Component9 => const AssetGenImage('assets/images/Component 11 – 9.png');
  /// File path: assets/images/ Component10.png
  AssetGenImage get Component10 => const AssetGenImage('assets/images/Component 11 – 10.png');

  /// File path: assets/images/forget_password.png
  AssetGenImage get forgetPassword =>
      const AssetGenImage('assets/images/forget_password.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    eg,
    lr,
    logo,
    avatar1,
    avatar2,
    avatar3,
    avatar4,
    avatar5,
    avatar6,
    avatar7,
    avatar8,
    avatar9,
    gamer1,
    Component1,
    Component2,
    Component4,
    Component5,
    Component6,
    Component7,
    Component8,
    Component9,
    Component10,




    forgetPassword,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
