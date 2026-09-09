class OnBoarding {
  final String imgPath;
  final String title;
  final String description;

  OnBoarding({
    required this.imgPath,
    required this.title,
    required this.description,
  });

  static List<OnBoarding> onBoardingList = [
    OnBoarding(
      imgPath: 'assets/images/welcome.png',
      title: 'Welcome To Islmi App',
      description: '',
    ),
    OnBoarding(
      imgPath: 'assets/images/kabba.png',
      title: 'Welcome To Islami',
      description: 'We Are Very Excited To Have You In Our Community',
    ),
    OnBoarding(
      imgPath: 'assets/images/quran.png',
      title: 'Reading the Quran',
      description: 'Read, and your Lord is the Most Generous',
    ),
    OnBoarding(
      imgPath: 'assets/images/bearish.png',
      title: 'Bearish',
      description: 'Praise the name of your Lord, the Most High',
    ),
    OnBoarding(
      imgPath: 'assets/images/radio.png',
      title: 'Holy Quran Radio',
      description:
          'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];
}
