import 'package:flutter_svg/flutter_svg.dart';

class AppSvgs {
  AppSvgs._();

  // system UI
  static const check = 'assets/svgs/check.svg';
  static const plus = 'assets/svgs/plus.svg';
  static const threeDots = 'assets/svgs/three-dots.svg';
  static const delete = 'assets/svgs/delete.svg';
  static const navigationClose = 'assets/svgs/navigation-close.svg';
  static const navigationBack = 'assets/svgs/navigation-back.svg';

  // tasks
  static const basketball = 'assets/svgs/basketball-ball.svg';
  static const beer = 'assets/svgs/beer.svg';
  static const bike = 'assets/svgs/bike.svg';
  static const book = 'assets/svgs/book.svg';
  static const carrot = 'assets/svgs/carrot.svg';
  static const chef = 'assets/svgs/chef.svg';
  static const dentalFloss = 'assets/svgs/dental-floss.svg';
  static const dog = 'assets/svgs/dog.svg';
  static const dumbell = 'assets/svgs/dumbell.svg';
  static const guitar = 'assets/svgs/guitar.svg';
  static const homework = 'assets/svgs/homework.svg';
  static const html = 'assets/svgs/html-coding.svg';
  static const karate = 'assets/svgs/karate.svg';
  static const mask = 'assets/svgs/mask.svg';
  static const meditation = 'assets/svgs/meditation.svg';
  static const painting = 'assets/svgs/paint-board-and-brush.svg';
  static const phone = 'assets/svgs/phone.svg';
  static const pushups = 'assets/svgs/pushups-man.svg';
  static const rest = 'assets/svgs/rest.svg';
  static const run = 'assets/svgs/run.svg';
  static const smoking = 'assets/svgs/smoking.svg';
  static const stretching = 'assets/svgs/stretching-exercises.svg';
  static const sun = 'assets/svgs/sun.svg';
  static const swimmer = 'assets/svgs/swimmer.svg';
  static const toothbrush = 'assets/svgs/toothbrush.svg';
  static const vitamins = 'assets/svgs/vitamins.svg';
  static const washHands = 'assets/svgs/wash-hands.svg';
  static const water = 'assets/svgs/water.svg';

  static const allTaskIcons = [
    basketball,
    beer,
    bike,
    book,
    carrot,
    chef,
    dentalFloss,
    dog,
    dumbell,
    guitar,
    homework,
    html,
    karate,
    mask,
    meditation,
    painting,
    phone,
    pushups,
    rest,
    run,
    smoking,
    stretching,
    sun,
    swimmer,
    toothbrush,
    vitamins,
    washHands,
    water,
  ];

  static Future<void> preloadSVGs() async {
    final assets = [
      // system UI
      check,
      plus,
      threeDots,
      delete,
      navigationClose,
      navigationBack,
      // tasks
      ...allTaskIcons,
    ];
    for (final asset in assets) {
      await precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, asset),
        null,
      );
    }
  }
}
