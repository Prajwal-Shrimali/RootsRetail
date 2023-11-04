import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ta'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? taText = '',
  }) =>
      [enText, taText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // LoginPage
  {
    '1gau6rn2': {
      'en': 'Tribals',
      'ta': 'பழங்குடியினர்',
    },
    'ndfer5fi': {
      'en': 'Merchant',
      'ta': 'வணிகர்',
    },
    'xyfw3412': {
      'en': 'Welcome Back',
      'ta': 'மீண்டும் வருக',
    },
    'houhgelx': {
      'en': 'Email',
      'ta': 'மின்னஞ்சல்',
    },
    'awyvdoh0': {
      'en': 'Password',
      'ta': 'கடவுச்சொல்',
    },
    'jrv5553q': {
      'en': 'Sign in',
      'ta': 'உள்நுழைக',
    },
    'fc6y3i0v': {
      'en': 'Or sign in with',
      'ta': 'அல்லது உடன் உள்நுழையவும்',
    },
    'ai1x4vx9': {
      'en': 'Continue with Google',
      'ta': 'Google உடன் தொடரவும்',
    },
    '2qyol94u': {
      'en': 'Dont have a account.',
      'ta': 'கணக்கு இல்லை.',
    },
    'dvt8z5sp': {
      'en': ' Sign Up',
      'ta': 'பதிவு செய்யவும்',
    },
    'kgy2nycs': {
      'en': 'Tribal',
      'ta': 'பழங்குடி',
    },
    'c8qp0mlb': {
      'en': 'Welcome Back',
      'ta': 'மீண்டும் வருக',
    },
    '6p2s5kx8': {
      'en': 'Sign In',
      'ta': 'உள்நுழையவும்',
    },
    'yquvr059': {
      'en': 'Dont have a account.',
      'ta': 'கணக்கு இல்லை.',
    },
    'mhbd3t4o': {
      'en': ' Sign Up',
      'ta': 'பதிவு செய்யவும்',
    },
    'qrdaipew': {
      'en': 'Home',
      'ta': 'வீடு',
    },
  },
  // MerchantAccountCreation
  {
    '7wiaoksj': {
      'en': 'Tribals',
      'ta': 'பழங்குடியினர்',
    },
    'o8dk0pbs': {
      'en': 'Merchant',
      'ta': 'வணிகர்',
    },
    'yasc1srs': {
      'en': 'Create an account',
      'ta': 'ஒரு கணக்கை உருவாக்க',
    },
    'b46edqw3': {
      'en': 'Email',
      'ta': 'மின்னஞ்சல்',
    },
    'ip6pvfj5': {
      'en': 'Password',
      'ta': 'கடவுச்சொல்',
    },
    'vin203tb': {
      'en': 'Confirm Password',
      'ta': 'கடவுச்சொல்லை உறுதிப்படுத்தவும்',
    },
    'qkppbe6e': {
      'en': 'Create Account',
      'ta': 'உங்கள் கணக்கை துவங்குங்கள்',
    },
    '2oypa2xq': {
      'en': 'OR',
      'ta': 'அல்லது',
    },
    'r1g0bgm2': {
      'en': 'Continue with Google',
      'ta': 'Google உடன் தொடரவும்',
    },
    'qtf8mkka': {
      'en': 'Already have an account? ',
      'ta': 'ஏற்கனவே ஒரு கணக்கு உள்ளதா?',
    },
    'ezj9cep6': {
      'en': ' Sign In here',
      'ta': 'இங்கே உள்நுழையவும்',
    },
    'r56km4dl': {
      'en': 'UserName',
      'ta': 'பயனர்பெயர்',
    },
    '4xt5uy9s': {
      'en': 'Overall',
      'ta': 'ஒட்டுமொத்த',
    },
    'fis3nxcf': {
      'en': '5',
      'ta': '5',
    },
    'urgk2091': {
      'en':
          'Nice outdoor courts, solid concrete and good hoops for the neighborhood.',
      'ta':
          'நல்ல வெளிப்புற நீதிமன்றங்கள், திடமான கான்கிரீட் மற்றும் சுற்றுப்புறத்திற்கு நல்ல வளையங்கள்.',
    },
    'gtcuiywa': {
      'en': 'Home',
      'ta': 'வீடு',
    },
  },
  // TribalsDashboard
  {
    'ulkj4eri': {
      'en': 'Tribal Dashboard',
      'ta': 'பழங்குடியினர் டாஷ்போர்டு',
    },
    'o8xt4uor': {
      'en': 'Update Inventory',
      'ta': 'சரக்குகளைப் புதுப்பிக்கவும்',
    },
    'g1t9imdz': {
      'en': '',
      'ta': 'பங்கு பொருட்கள்',
    },
    'h4an8zzx': {
      'en': 'View Merchant Request',
      'ta': 'வணிகர் கோரிக்கையைப் பார்க்கவும்',
    },
    'gtai3as3': {
      'en': 'Market Report',
      'ta': 'சந்தை அறிக்கை',
    },
    'bl5ry228': {
      'en': 'Home',
      'ta': 'வீடு',
    },
  },
  // TribalsSignUp
  {
    '9taxauo0': {
      'en': 'Tribals',
      'ta': 'பழங்குடியினர்',
    },
    'u3o2uue7': {
      'en': 'Sign Up',
      'ta': 'பதிவு செய்யவும்',
    },
    'vt0uyaqf': {
      'en': 'Tribal Chief Name',
      'ta': 'பழங்குடியின தலைவர் பெயர்',
    },
    'hhese7mv': {
      'en': 'Tribal Name',
      'ta': 'பழங்குடி பெயர்',
    },
    'd7j3oqfz': {
      'en': 'Your Start Produce',
      'ta': 'உங்கள் தொடக்க தயாரிப்பு',
    },
    '65dccg2z': {
      'en': 'Create Account',
      'ta': 'உங்கள் கணக்கை துவங்குங்கள்',
    },
    '3u56gp9a': {
      'en': 'Home',
      'ta': 'வீடு',
    },
  },
  // MerchantDashboard
  {
    'mf8ex31g': {
      'en': 'Below is a summary of your Orders',
      'ta': 'உங்கள் நாளின் சுருக்கம் கீழே உள்ளது.',
    },
    '5d5v430s': {
      'en': '16',
      'ta': '16',
    },
    '9of8m427': {
      'en': 'Ongoing Order',
      'ta': 'தொடர்ந்து ஆர்டர்',
    },
    's2v1p9l9': {
      'en': '25',
      'ta': '25',
    },
    'atrbtt99': {
      'en': 'Accepted',
      'ta': 'ஏற்றுக்கொள்ளப்பட்டது',
    },
    'oo5rrbke': {
      'en': '1',
      'ta': '1',
    },
    'lr7m46xl': {
      'en': 'Rejected',
      'ta': 'நிராகரிக்கப்பட்டது',
    },
    'i36kpmqw': {
      'en': 'Order Status',
      'ta': 'ஆர்டர் நிலை',
    },
    'q5ysi83d': {
      'en': 'An overview of your Order.',
      'ta': 'உங்கள் ஆர்டரின் கண்ணோட்டம்.',
    },
    'totxfmjg': {
      'en': '15/26',
      'ta': '15/26',
    },
    '7333i9pm': {
      'en': 'Order progress',
      'ta': 'ஆர்டர் முன்னேற்றம்',
    },
    'qt0z930i': {
      'en': 'Generate Order',
      'ta': 'ஆர்டரை உருவாக்கவும்',
    },
    'ua8af1yg': {
      'en': 'Generate your Order.',
      'ta': 'உங்கள் ஆர்டரை உருவாக்கவும்.',
    },
    'k081bgdi': {
      'en': 'Merchant Dashboard',
      'ta': 'டாஷ்போர்டு',
    },
    'ei791vnw': {
      'en': 'Home',
      'ta': 'வீடு',
    },
  },
  // Tribal_OrderConfirmation
  {
    'lo9hz1f5': {
      'en': 'Your Listing',
      'ta': 'உங்கள் பட்டியல்',
    },
    'y3rjx2dg': {
      'en': 'Onion',
      'ta': 'வெங்காயம்',
    },
    'ufs5j8rb': {
      'en': 'Size: ',
      'ta': 'அளவு:',
    },
    'jkafbvu5': {
      'en': '12',
      'ta': '12',
    },
    'azfhox2g': {
      'en': '\$124.00',
      'ta': '\$124.00',
    },
    '0toxxx1q': {
      'en': 'Patato',
      'ta': 'பட்டாடோ',
    },
    'fj6ducdm': {
      'en': 'Size: ',
      'ta': 'அளவு:',
    },
    'd4t835xj': {
      'en': '12',
      'ta': '12',
    },
    'h1d4tj6y': {
      'en': '\$117.00',
      'ta': '\$117.00',
    },
    '8ofynfay': {
      'en': 'Order Summary',
      'ta': 'ஆர்டர் சுருக்கம்',
    },
    'm5ocldnd': {
      'en': 'Price Breakdown',
      'ta': 'விலை முறிவு',
    },
    '3c9lkdxr': {
      'en': 'Base Price',
      'ta': 'அடிப்படை விலை',
    },
    'biauvwrg': {
      'en': '\$156.00',
      'ta': '\$156.00',
    },
    'fd1561k9': {
      'en': 'Taxes',
      'ta': 'வரிகள்',
    },
    '3s3ph3i5': {
      'en': '\$24.20',
      'ta': '\$24.20',
    },
    'f8wixhge': {
      'en': 'Cleaning Fee',
      'ta': 'சுத்தம் கட்டணம்',
    },
    'r9ac6wmk': {
      'en': '\$40.00',
      'ta': '\$40.00',
    },
    '1hzjemaa': {
      'en': 'Estimated Earnings',
      'ta': 'மதிப்பிடப்பட்ட வருவாய்',
    },
    'fyp2xvi4': {
      'en': '\$230.20',
      'ta': '\$230.20',
    },
    'yae85ddk': {
      'en': 'Continue ',
      'ta': 'தொடரவும்',
    },
    'ud787yaj': {
      'en': 'Home',
      'ta': 'வீடு',
    },
  },
  // TribalDataEntry
  {
    'qp382i31': {
      'en': 'Data Input Page',
      'ta': 'தரவு உள்ளீட்டு பக்கம்',
    },
    'ilp8cu8u': {
      'en': 'Quantity',
      'ta': 'அளவு',
    },
    'q519tetj': {
      'en': 'Enter quantity...',
      'ta': 'அளவை உள்ளிடவும்...',
    },
    'zyn8canv': {
      'en': 'Produce',
      'ta': 'உற்பத்தி செய்',
    },
    're7urrwn': {
      'en': 'Submit',
      'ta': 'சமர்ப்பிக்கவும்',
    },
  },
  // TribalSuccessPage
  {
    '3nt6gy3v': {
      'en': 'Congrats!',
      'ta': 'வாழ்த்துக்கள்!',
    },
    'o1wzpncs': {
      'en': 'Next',
      'ta': 'அடுத்தது',
    },
    'zjttu923': {
      'en': 'Home',
      'ta': 'வீடு',
    },
  },
  // MerchantOrderGenerate
  {
    'cylcdrj3': {
      'en': 'Order Generating Screen',
      'ta': 'ஆர்டர் உருவாக்கும் திரை',
    },
    '6abc9hc2': {
      'en': 'Produce Required',
      'ta': 'தயாரிப்பு தேவை',
    },
    'qcu8jsur': {
      'en': 'Enter produce name',
      'ta': 'தயாரிப்பின் பெயரை உள்ளிடவும்',
    },
    'af467bp6': {
      'en': 'Quantity Required',
      'ta': 'தேவையான அளவு',
    },
    'c0efnrnq': {
      'en': 'Enter quantity',
      'ta': 'அளவை உள்ளிடவும்',
    },
    '7d2nxgjo': {
      'en': 'Expected Earnings',
      'ta': 'பழங்குடி பெயர்',
    },
    'ttuui46p': {
      'en': 'Enter approximate earnings',
      'ta': 'பழங்குடி பெயரை உள்ளிடவும்',
    },
    'c2y5vg40': {
      'en': 'Generate Order',
      'ta': 'ஆர்டரை உருவாக்கவும்',
    },
  },
  // MerchantProfile
  {
    'ah6hq3ey': {
      'en': 'Naachiyapan S',
      'ta': '',
    },
    'j47t60t7': {
      'en': 'Your Account',
      'ta': '',
    },
    'ndf5hm09': {
      'en': 'Edit Profile',
      'ta': '',
    },
    'miume6bo': {
      'en': 'Notification Settings',
      'ta': '',
    },
    'cgv94jar': {
      'en': 'App Settings',
      'ta': '',
    },
    'wuw7zged': {
      'en': 'Support',
      'ta': '',
    },
    '5ivvyeou': {
      'en': 'Terms of Service',
      'ta': '',
    },
    'n1upgyxm': {
      'en': 'Log Out',
      'ta': '',
    },
    'axb21k05': {
      'en': 'Home',
      'ta': '',
    },
  },
  // MerchantNotificationSettings
  {
    '5540e15d': {
      'en': 'Notification Settings',
      'ta': '',
    },
    'rva238n1': {
      'en': 'Push Notifications',
      'ta': '',
    },
    'vcq0gih1': {
      'en': 'Email Notifications',
      'ta': '',
    },
    'iq5csodg': {
      'en': 'SMS Notifications',
      'ta': '',
    },
    '5mfpemo5': {
      'en': 'Event Reminders',
      'ta': '',
    },
    '49rxwpag': {
      'en': 'Sound Notifications',
      'ta': '',
    },
    '3v2tnbki': {
      'en': 'Light Notifications',
      'ta': '',
    },
    '1dru33n8': {
      'en': 'Do Not Disturb',
      'ta': '',
    },
  },
  // MerchantHelperBot
  {
    '0e2ocsnv': {
      'en': 'Merchant Help Bot',
      'ta': '',
    },
    'c3y4ux3l': {
      'en': 'Home',
      'ta': '',
    },
  },
  // TribalNewsSection
  {
    'o52v793z': {
      'en': 'Market News',
      'ta': '',
    },
    '82k4giby': {
      'en': 'Home',
      'ta': '',
    },
  },
  // Miscellaneous
  {
    'f22njexg': {
      'en': '',
      'ta': '',
    },
    's2cf5lrp': {
      'en': '',
      'ta': '',
    },
    'sw7e5e4e': {
      'en': '',
      'ta': '',
    },
    '5vlzcan6': {
      'en': '',
      'ta': '',
    },
    'rkwdb68c': {
      'en': '',
      'ta': '',
    },
    '7g559813': {
      'en': '',
      'ta': '',
    },
    'e2xkp0q1': {
      'en': '',
      'ta': '',
    },
    'njib9epr': {
      'en': '',
      'ta': '',
    },
    'ly0350yf': {
      'en': '',
      'ta': '',
    },
    'ahflx7ia': {
      'en': '',
      'ta': '',
    },
    '0snh1jtj': {
      'en': '',
      'ta': '',
    },
    'f5hr1074': {
      'en': '',
      'ta': '',
    },
    's15iqiah': {
      'en': '',
      'ta': '',
    },
    'q3h9uo4w': {
      'en': '',
      'ta': '',
    },
    'y2du2mmp': {
      'en': '',
      'ta': '',
    },
    '92fogjy7': {
      'en': '',
      'ta': '',
    },
    'j2p8i1zq': {
      'en': '',
      'ta': '',
    },
    'qpajpjoa': {
      'en': '',
      'ta': '',
    },
    'ori6qbcd': {
      'en': '',
      'ta': '',
    },
    'nkavj5j7': {
      'en': '',
      'ta': '',
    },
    '4gr7j3tr': {
      'en': '',
      'ta': '',
    },
    'fwu4y5cf': {
      'en': '',
      'ta': '',
    },
    '1xhnqony': {
      'en': '',
      'ta': '',
    },
  },
].reduce((a, b) => a..addAll(b));
