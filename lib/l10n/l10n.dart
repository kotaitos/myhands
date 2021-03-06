
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';
import 'l10n_ja.dart';

/// Callers can lookup localized strings with an instance of L10n returned
/// by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'l10n/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n? of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja')
  ];

  /// No description provided for @ui__home__title.
  ///
  /// In ja, this message translates to:
  /// **'ホーム'**
  String get ui__home__title;

  /// No description provided for @ui__accounts__button1.
  ///
  /// In ja, this message translates to:
  /// **'ログアウト'**
  String get ui__accounts__button1;

  /// No description provided for @ui__accounts__popup1__to_logout.
  ///
  /// In ja, this message translates to:
  /// **'ログアウトしますか？'**
  String get ui__accounts__popup1__to_logout;

  /// No description provided for @ui__accounts__popup1__cancel.
  ///
  /// In ja, this message translates to:
  /// **'キャンセル'**
  String get ui__accounts__popup1__cancel;

  /// No description provided for @ui__accounts__popup1__ok.
  ///
  /// In ja, this message translates to:
  /// **'OK'**
  String get ui__accounts__popup1__ok;

  /// No description provided for @ui__signin__title.
  ///
  /// In ja, this message translates to:
  /// **'サインイン'**
  String get ui__signin__title;

  /// No description provided for @ui__signin__mail.
  ///
  /// In ja, this message translates to:
  /// **'メールアドレス'**
  String get ui__signin__mail;

  /// No description provided for @ui__signin__password.
  ///
  /// In ja, this message translates to:
  /// **'パスワード（８〜２０文字）'**
  String get ui__signin__password;

  /// No description provided for @ui__signin__button1.
  ///
  /// In ja, this message translates to:
  /// **'サインイン'**
  String get ui__signin__button1;

  /// No description provided for @ui__signin__reset_mail.
  ///
  /// In ja, this message translates to:
  /// **'上記メールアドレスにパスワード再設定メールを送信'**
  String get ui__signin__reset_mail;

  /// No description provided for @ui__signin__button2.
  ///
  /// In ja, this message translates to:
  /// **'アカウントを作成する'**
  String get ui__signin__button2;

  /// No description provided for @ui__signup__title.
  ///
  /// In ja, this message translates to:
  /// **'サインアップ'**
  String get ui__signup__title;

  /// No description provided for @ui__signup__mail.
  ///
  /// In ja, this message translates to:
  /// **'メールアドレス'**
  String get ui__signup__mail;

  /// No description provided for @ui__signup__password.
  ///
  /// In ja, this message translates to:
  /// **'パスワード（８〜２０文字）'**
  String get ui__signup__password;

  /// No description provided for @ui__signup__verify_password.
  ///
  /// In ja, this message translates to:
  /// **'パスワード確認用'**
  String get ui__signup__verify_password;

  /// No description provided for @ui__signup__button1.
  ///
  /// In ja, this message translates to:
  /// **'サインアップ'**
  String get ui__signup__button1;

  /// No description provided for @ui__signup__button2.
  ///
  /// In ja, this message translates to:
  /// **'既にアカウントをお持ちの場合'**
  String get ui__signup__button2;

  /// No description provided for @ui__signup__password_is_not_matched.
  ///
  /// In ja, this message translates to:
  /// **'パスワードが一致しません。'**
  String get ui__signup__password_is_not_matched;

  /// No description provided for @ui__signup__password_is_not__8_or_more_characters.
  ///
  /// In ja, this message translates to:
  /// **'パスワードは8文字以上です。'**
  String get ui__signup__password_is_not__8_or_more_characters;

  /// No description provided for @ui__home__your_post.
  ///
  /// In ja, this message translates to:
  /// **'あなたの投稿'**
  String get ui__home__your_post;

  /// No description provided for @ui__home__new.
  ///
  /// In ja, this message translates to:
  /// **'new'**
  String get ui__home__new;

  /// No description provided for @ui__view__edit__app_bar_title.
  ///
  /// In ja, this message translates to:
  /// **'新規作成'**
  String get ui__view__edit__app_bar_title;

  /// No description provided for @ui__view__edit__saved.
  ///
  /// In ja, this message translates to:
  /// **'保存しました'**
  String get ui__view__edit__saved;

  /// No description provided for @ui__view__edit__title.
  ///
  /// In ja, this message translates to:
  /// **'タイトル'**
  String get ui__view__edit__title;

  /// No description provided for @ui__view__edit__description.
  ///
  /// In ja, this message translates to:
  /// **'概要'**
  String get ui__view__edit__description;

  /// No description provided for @ui__view__edit__hero.
  ///
  /// In ja, this message translates to:
  /// **'ハンド'**
  String get ui__view__edit__hero;

  /// No description provided for @ui__view__edit__frop.
  ///
  /// In ja, this message translates to:
  /// **'フロップ'**
  String get ui__view__edit__frop;

  /// No description provided for @ui__view__edit__turn.
  ///
  /// In ja, this message translates to:
  /// **'ターン'**
  String get ui__view__edit__turn;

  /// No description provided for @ui__view__edit__river.
  ///
  /// In ja, this message translates to:
  /// **'リバー'**
  String get ui__view__edit__river;

  /// No description provided for @ui__view__edit__memo.
  ///
  /// In ja, this message translates to:
  /// **'メモ'**
  String get ui__view__edit__memo;

  /// No description provided for @ui__component__set_card_dialog__title.
  ///
  /// In ja, this message translates to:
  /// **'カードの種類'**
  String get ui__component__set_card_dialog__title;

  /// No description provided for @ui__component__set_card_dialog__clear.
  ///
  /// In ja, this message translates to:
  /// **'クリア'**
  String get ui__component__set_card_dialog__clear;
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return L10nEn();
    case 'ja': return L10nJa();
  }

  throw FlutterError(
    'L10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
