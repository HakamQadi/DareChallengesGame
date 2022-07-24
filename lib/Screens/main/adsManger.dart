import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsManager {
  bool _testMode = true;
  Future<InitializationStatus> initialization;
  AdsManager({required this.initialization});


  String get appId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3941330558670124~4296656784";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  String get bannerAdUnitId {
    if (_testMode == true) {
      return "ca-app-pub-3941330558670124/6151829789"; //test bannerAdUnitId
    } else if (Platform.isAndroid) {
      return "ca-app-pub-3941330558670124/6151829789";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  BannerAdListener get adListener => _adListener;

  final BannerAdListener _adListener = BannerAdListener(
    onAdLoaded: (Ad ad) => print('Ad loaded.'),
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      ad.dispose();
      print('Ad failed to load: $error');
    },
    // Called when an ad opens an overlay that covers the screen.
    onAdOpened: (Ad ad) => print('Ad opened.'),
    // Called when an ad removes an overlay that covers the screen.
    onAdClosed: (Ad ad) => print('Ad closed.'),
    // Called when an impression occurs on the ad.
    onAdImpression: (Ad ad) => print('Ad impression.'),
  );
}