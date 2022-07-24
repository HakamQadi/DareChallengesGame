import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dares/Screens/main/adsManger.dart';
import 'package:dares/Screens/players%20number/players.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final adInitialize = MobileAds.instance.initialize();
  final adManger = AdsManager(initialization: adInitialize);

  runApp(Provider.value(
      value: adManger,
      child: MaterialApp(
          theme: ThemeData(textTheme: GoogleFonts.notoKufiArabicTextTheme()),
          home: MyApp())));

//   runApp(MaterialApp(
//       home:MyApp()));
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: Home(),
      splashIconSize: 120,
      backgroundColor: Color.fromARGB(214, 234, 231, 50),
      duration: 1000,
      splashTransition: SplashTransition.sizeTransition,
      pageTransitionType: PageTransitionType.rightToLeft,
      curve: Curves.bounceOut,
      animationDuration: Duration(seconds: 3),
      splash: Column(
        children: [
          Material(
            child: Image.asset("images/logo.png"),
            elevation: 15,
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            clipBehavior: Clip.antiAlias,
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ///------- AdMobAds ----------- ///
  BannerAd? _bottomBannerAd;
  bool isLoaded = false;
  late AdsManager adManager;

  void getBottomBannerAd(AdsManager adManager) {
    _bottomBannerAd = BannerAd(
      adUnitId: adManager.bannerAdUnitId,
      size: AdSize.largeBanner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            isLoaded = true;
            print('Ad loaded to load: $isLoaded !!!!!!');
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          //ad.dispose();
          print('Ad failed to load: $error');
        },
      ),
    )..load();
  }

  Widget showAd() {
    return isLoaded
        ? Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xffffda11),
              ),
              //color: Color(0xffffda11),
            ),
            alignment: Alignment.center,
            height: _bottomBannerAd!.size.height.toDouble(),
            width: _bottomBannerAd!.size.width.toDouble(),
            child: AdWidget(ad: _bottomBannerAd!),
          )
        : Container(
            color: Colors.black87,
            alignment: Alignment.center,
            width: double.infinity,
            height: 50,
          );
  }
//------- AdMobAds -----------

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
//------- AdMobAds -----------
    adManager = Provider.of<AdsManager>(context);
    adManager.initialization.then((value) {
      getBottomBannerAd(adManager);
    });
    //------- AdMobAds -----------
  }

  @override
  void dispose() {
    super.dispose();
    _bottomBannerAd!.dispose(); //------- AdMobAds -----------
  }

  ///------- AdMobAds ----------- ///
  @override
  Widget build(BuildContext context) {
    return PlayersNum();
  }
}
