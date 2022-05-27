


import 'l10n.dart';

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get ui__home__title => 'Home';

  @override
  String get ui__accounts__button1 => 'signout';

  @override
  String get ui__accounts__popup1__to_logout => 'Do you want to sign out?';

  @override
  String get ui__accounts__popup1__cancel => 'cancel';

  @override
  String get ui__accounts__popup1__ok => 'OK';

  @override
  String get ui__signin__title => 'signin';

  @override
  String get ui__signin__mail => 'mail adress';

  @override
  String get ui__signin__password => 'Password (8 to 20 characters)';

  @override
  String get ui__signin__button1 => 'signin';

  @override
  String get ui__signin__reset_mail => 'Send a password reset email to the above email address';

  @override
  String get ui__signin__button2 => 'Create an account';

  @override
  String get ui__signup__title => 'signup';

  @override
  String get ui__signup__mail => 'mail';

  @override
  String get ui__signup__password => 'Password (8 to 20 characters）';

  @override
  String get ui__signup__verify_password => 'password confirmation';

  @override
  String get ui__signup__button1 => 'signup';

  @override
  String get ui__signup__button2 => 'Do you already have an account?';

  @override
  String get ui__signup__password_is_not_matched => 'Password does not match.';

  @override
  String get ui__signup__password_is_not__8_or_more_characters => 'Password must be at least 8 characters.';
}
