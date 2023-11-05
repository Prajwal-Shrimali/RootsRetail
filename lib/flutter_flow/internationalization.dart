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
      'en': 'RootRetails',
      'ta': 'ரூட் ரீடெய்ல்ஸ்',
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
      'en': 'Consumer',
      'ta': 'நுகர்வோர்',
    },
    'c8qp0mlb': {
      'en': 'Welcome Chief!',
      'ta': 'வருக தலைவரே!',
    },
    '6p2s5kx8': {
      'en': '',
      'ta': 'உள்நுழையவும்',
    },
    'jg2qp1o1': {
      'en': 'Kindly place your finger here.',
      'ta': 'தயவுசெய்து உங்கள் விரலை இங்கே வைக்கவும்.',
    },
    'sifvr60l': {
      'en': 'Press Here!',
      'ta': 'இங்கே அழுத்தவும்!',
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
      'en': 'View Live Costs',
      'ta': 'நேரலைச் செலவுகளைக் காண்க',
    },
    'h4an8zzx': {
      'en': 'View Merchant Request',
      'ta': 'வணிகர் கோரிக்கையைப் பார்க்கவும்',
    },
    'gtai3as3': {
      'en': 'Market Report',
      'ta': 'சந்தை அறிக்கை',
    },
    'a9smp9kl': {
      'en': 'Logout',
      'ta': 'வெளியேறு',
    },
    'bl5ry228': {
      'en': 'Home',
      'ta': 'வீடு',
    },
  },
  // TribalsSignUp
  {
    '9taxauo0': {
      'en': 'RootsRetail',
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
      'en': 'Your Star Produce',
      'ta': 'உங்கள் நட்சத்திர தயாரிப்பு',
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
      'ta': 'உங்கள் ஆர்டர்களின் சுருக்கம் கீழே உள்ளது',
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
      'en': 'Pending',
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
    '3g92iyv0': {
      'en': 'My Orders',
      'ta': 'என் கட்டளைகள்',
    },
    'w332544j': {
      'en': 'Generate your Orders',
      'ta': 'உங்கள் ஆர்டர்களை உருவாக்கவும்',
    },
    'k081bgdi': {
      'en': 'Merchant Dashboard',
      'ta': 'வணிக டாஷ்போர்டு',
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
      'en': 'Quantity: ',
      'ta': 'அளவு:',
    },
    'jkafbvu5': {
      'en': '12 Quintal',
      'ta': '12 குவிண்டால்',
    },
    'azfhox2g': {
      'en': '124.00Rs',
      'ta': '124.00ரூ',
    },
    '0toxxx1q': {
      'en': 'Patato',
      'ta': 'பட்டாடோ',
    },
    'fj6ducdm': {
      'en': 'Quantity: ',
      'ta': 'அளவு:',
    },
    'd4t835xj': {
      'en': '8 Quintal',
      'ta': '8 குவிண்டால்',
    },
    'h1d4tj6y': {
      'en': '117.00Rs',
      'ta': '117.00ரூ',
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
      'en': '40000',
      'ta': '40000',
    },
    'fd1561k9': {
      'en': 'Taxes',
      'ta': 'வரிகள்',
    },
    '3s3ph3i5': {
      'en': '5000',
      'ta': '5000',
    },
    '1hzjemaa': {
      'en': 'Estimated Earnings',
      'ta': 'மதிப்பிடப்பட்ட வருவாய்',
    },
    'fyp2xvi4': {
      'en': '35000Rs',
      'ta': '35000ரூ',
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
      'en': 'Inventory Update Page',
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
    '59rlt8h7': {
      'en': 'Produce',
      'ta': 'அளவு',
    },
    'edbe3d38': {
      'en': 'Enter the name of the produce...',
      'ta': 'அளவை உள்ளிடவும்...',
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
      'ta': 'எதிர்பார்த்த வருமானம்',
    },
    'ttuui46p': {
      'en': 'Enter approximate earnings',
      'ta': 'தோராயமான வருமானத்தை உள்ளிடவும்',
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
      'ta': 'நாச்சியப்பன் எஸ்',
    },
    '2j85n8nr': {
      'en': 'Chennai,India',
      'ta': 'உங்கள் கணக்கு',
    },
    'j47t60t7': {
      'en': 'Your Account',
      'ta': 'உங்கள் கணக்கு',
    },
    'ndf5hm09': {
      'en': 'Edit Profile',
      'ta': 'சுயவிவரத்தைத் திருத்து',
    },
    'miume6bo': {
      'en': 'Notification Settings',
      'ta': 'அறிவிப்பு அமைப்புகள்',
    },
    'cgv94jar': {
      'en': 'App Settings',
      'ta': 'பயன்பாட்டு அமைப்புகள்',
    },
    'wuw7zged': {
      'en': 'Support',
      'ta': 'ஆதரவு',
    },
    '5ivvyeou': {
      'en': 'Terms of Service',
      'ta': 'சேவை விதிமுறைகள்',
    },
    'n1upgyxm': {
      'en': 'Log Out',
      'ta': 'வெளியேறு',
    },
    'axb21k05': {
      'en': 'Home',
      'ta': 'வீடு',
    },
  },
  // MerchantNotificationSettings
  {
    '5540e15d': {
      'en': 'Notification Settings',
      'ta': 'அறிவிப்பு அமைப்புகள்',
    },
    'rva238n1': {
      'en': 'Push Notifications',
      'ta': 'புஷ் அறிவிப்புகள்',
    },
    'vcq0gih1': {
      'en': 'Email Notifications',
      'ta': 'மின்னஞ்சல் அறிவிப்புகள்',
    },
    'iq5csodg': {
      'en': 'SMS Notifications',
      'ta': 'SMS அறிவிப்புகள்',
    },
    '5mfpemo5': {
      'en': 'Event Reminders',
      'ta': 'நிகழ்வு நினைவூட்டல்கள்',
    },
    '49rxwpag': {
      'en': 'Sound Notifications',
      'ta': 'ஒலி அறிவிப்புகள்',
    },
    '3v2tnbki': {
      'en': 'Light Notifications',
      'ta': 'ஒளி அறிவிப்புகள்',
    },
    '1dru33n8': {
      'en': 'Do Not Disturb',
      'ta': 'தொந்தரவு செய்யாதீர்',
    },
  },
  // MerchantHelperBot
  {
    '0e2ocsnv': {
      'en': 'Merchant Help Bot',
      'ta': 'வணிகர் உதவி பாட்',
    },
    'c3y4ux3l': {
      'en': 'Home',
      'ta': 'வீடு',
    },
  },
  // TribalNewsSection
  {
    'gqi4qe2i': {
      'en': 'Market News',
      'ta': 'சந்தை செய்திகள்',
    },
    '7b8ceomh': {
      'en': 'Home',
      'ta': 'வீடு',
    },
  },
  // TribalsLivePriceView
  {
    'qm00ikj9': {
      'en': 'Live Price Check',
      'ta': 'நேரடி விலை சரிபார்ப்பு',
    },
    'qegf45w9': {
      'en': 'Home',
      'ta': 'வீடு',
    },
  },
  // MerchantSuccessPage
  {
    'jqdqu19d': {
      'en': 'Congrats!',
      'ta': 'வாழ்த்துக்கள்!',
    },
    'cz0ck60g': {
      'en': 'Next',
      'ta': 'அடுத்தது',
    },
    'avyo2qkv': {
      'en': 'Home',
      'ta': 'வீடு',
    },
  },
  // TribalListingView
  {
    'oau9b430': {
      'en': 'Potatoes\n',
      'ta': 'உருளைக்கிழங்கு',
    },
    'ynm8kcrl': {
      'en': 'Quoted Price ',
      'ta': '',
    },
    'uoie7m5u': {
      'en': 'Rs. 4000',
      'ta': '',
    },
    'evndph9v': {
      'en': '40 Kgs',
      'ta': '40 கிலோ',
    },
    'otic78v0': {
      'en': 'Jai Singh',
      'ta': 'ஜெய் சிங்',
    },
    'm5lfkepg': {
      'en': 'Ludhiana',
      'ta': 'லூதியானா',
    },
    'uecaaxwh': {
      'en': '2 hours ago',
      'ta': '2 மணி நேரத்திற்கு முன்பு',
    },
    'yswfj5tc': {
      'en': 'Potatoes\n',
      'ta': 'உருளைக்கிழங்கு',
    },
    'm39vfqhu': {
      'en': 'Quoted Price ',
      'ta': '',
    },
    'oxyhnha1': {
      'en': 'Rs. 4000',
      'ta': '',
    },
    'd81fx5ul': {
      'en': '40 Kgs',
      'ta': '40 கிலோ',
    },
    '3jocy2sx': {
      'en': 'Surya Adhikari',
      'ta': 'சூர்யா அதிகாரி',
    },
    'vjs8hnip': {
      'en': 'Kolkata',
      'ta': 'கொல்கத்தா',
    },
    '0hzvtnn8': {
      'en': '4 hours ago',
      'ta': '4 மணி நேரத்திற்கு முன்பு',
    },
    'wy2atob8': {
      'en': 'Onions',
      'ta': 'உருளைக்கிழங்கு',
    },
    '2vd83u14': {
      'en': 'Quoted Price ',
      'ta': '',
    },
    'd7g6lp6p': {
      'en': 'Rs. 3587',
      'ta': '',
    },
    '5wngt9q1': {
      'en': '30 Kgs',
      'ta': '40 கிலோ',
    },
    'e1kzz22i': {
      'en': 'Prabhakaran S',
      'ta': 'பிரபாகரன் எஸ்',
    },
    'z78rwll7': {
      'en': 'Chennai',
      'ta': 'சென்னை',
    },
    '1p5mcihr': {
      'en': '8 hours ago',
      'ta': '8 மணி நேரத்திற்கு முன்பு',
    },
    '68rtj524': {
      'en': 'Your Listings',
      'ta': 'பட்டியல்கள்',
    },
    'pqdhjpiy': {
      'en': 'Home',
      'ta': 'வீடு',
    },
  },
  // TribalOrderAcceptanceMessage
  {
    'mmsij3bd': {
      'en': 'Success!',
      'ta': 'வெற்றி!',
    },
    '2fgx1mw4': {
      'en': 'You have accepted the Order',
      'ta': 'நீங்கள் ஆணையை ஏற்றுக்கொண்டீர்கள்',
    },
    'w966eaw4': {
      'en': 'Next',
      'ta': 'அடுத்தது',
    },
    'csz9ps2i': {
      'en': 'Home',
      'ta': 'வீடு',
    },
  },
  // MerchantMyOrderView
  {
    '9an2j5ju': {
      'en': 'Potatoes',
      'ta': '',
    },
    'bmswuizz': {
      'en': 'Rs. 4000',
      'ta': '',
    },
    'kh11k4o7': {
      'en': '40 Kgs',
      'ta': '40 கிலோ',
    },
    'talplx5h': {
      'en': '2 hours ago',
      'ta': '2 மணி நேரத்திற்கு முன்பு',
    },
    '8qib0qyz': {
      'en': 'Potatoes',
      'ta': '',
    },
    'ksj0ajrp': {
      'en': 'Rs. 3509',
      'ta': '',
    },
    'zpu0lt3u': {
      'en': '30 Kgs',
      'ta': '40 கிலோ',
    },
    'odwzvcgq': {
      'en': '2 hours ago',
      'ta': '2 மணி நேரத்திற்கு முன்பு',
    },
    '6tnrkdoe': {
      'en': 'Onion',
      'ta': '',
    },
    'et5no6ug': {
      'en': 'Rs. 9000',
      'ta': '',
    },
    'qh1ty95i': {
      'en': '40 Kgs',
      'ta': '40 கிலோ',
    },
    'nekwh0o4': {
      'en': '2 hours ago',
      'ta': '2 மணி நேரத்திற்கு முன்பு',
    },
    'floorfa9': {
      'en': 'Bananas',
      'ta': '',
    },
    '55yztehh': {
      'en': 'Rs. 4000',
      'ta': '',
    },
    'nuy0dxp1': {
      'en': '37 Kgs',
      'ta': '40 கிலோ',
    },
    'd4agblv7': {
      'en': '2 hours ago',
      'ta': '2 மணி நேரத்திற்கு முன்பு',
    },
    'waw9w5vd': {
      'en': 'Apples',
      'ta': '',
    },
    'oja9fo4i': {
      'en': 'Rs. 10000',
      'ta': '',
    },
    'kr2bpsum': {
      'en': '90 Kgs',
      'ta': '40 கிலோ',
    },
    'lljz6um3': {
      'en': '2 hours ago',
      'ta': '2 மணி நேரத்திற்கு முன்பு',
    },
    '4cpfpu8j': {
      'en': 'Your Orders',
      'ta': 'பட்டியல்கள்',
    },
    'vs9gr1i2': {
      'en': 'Home',
      'ta': 'வீடு',
    },
  },
  // Miscellaneous
  {
    'ng597stj': {
      'en': '',
      'ta': '',
    },
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
