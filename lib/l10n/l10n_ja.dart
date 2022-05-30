


import 'l10n.dart';

/// The translations for Japanese (`ja`).
class L10nJa extends L10n {
  L10nJa([String locale = 'ja']) : super(locale);

  @override
  String get ui__home__title => 'ホーム';

  @override
  String get ui__accounts__button1 => 'ログアウト';

  @override
  String get ui__accounts__popup1__to_logout => 'ログアウトしますか？';

  @override
  String get ui__accounts__popup1__cancel => 'キャンセル';

  @override
  String get ui__accounts__popup1__ok => 'OK';

  @override
  String get ui__signin__title => 'サインイン';

  @override
  String get ui__signin__mail => 'メールアドレス';

  @override
  String get ui__signin__password => 'パスワード（８〜２０文字）';

  @override
  String get ui__signin__button1 => 'サインイン';

  @override
  String get ui__signin__reset_mail => '上記メールアドレスにパスワード再設定メールを送信';

  @override
  String get ui__signin__button2 => 'アカウントを作成する';

  @override
  String get ui__signup__title => 'サインアップ';

  @override
  String get ui__signup__mail => 'メールアドレス';

  @override
  String get ui__signup__password => 'パスワード（８〜２０文字）';

  @override
  String get ui__signup__verify_password => 'パスワード確認用';

  @override
  String get ui__signup__button1 => 'サインアップ';

  @override
  String get ui__signup__button2 => '既にアカウントをお持ちの場合';

  @override
  String get ui__signup__password_is_not_matched => 'パスワードが一致しません。';

  @override
  String get ui__signup__password_is_not__8_or_more_characters => 'パスワードは8文字以上です。';

  @override
  String get ui__home__your_post => 'あなたの投稿';

  @override
  String get ui__home__new => 'new';

  @override
  String get ui__view__edit__app_bar_title => '新規作成';

  @override
  String get ui__view__edit__saved => '保存しました';

  @override
  String get ui__view__edit__title => 'タイトル';

  @override
  String get ui__view__edit__description => '概要';

  @override
  String get ui__view__edit__hero => 'ハンド';

  @override
  String get ui__view__edit__frop => 'フロップ';

  @override
  String get ui__view__edit__turn => 'ターン';

  @override
  String get ui__view__edit__river => 'リバー';

  @override
  String get ui__view__edit__memo => 'メモ';

  @override
  String get ui__component__set_card_dialog__title => 'カードの種類';

  @override
  String get ui__component__set_card_dialog__clear => 'クリア';
}
