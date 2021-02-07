import 'package:flutter_hackathon_21/core/models/models.dart';

class AppConstants {
  static const APP_NAME = 'YÖNDER';
  static const APP_SLOGAN = 'Yardımlaşma Platformu';
  static const APP_LOGO = 'assets/logo.png';

  static const BAGIS = 'Bağış';
  static const MENTOR = 'Mentor';
  static const OGRENCI = 'Öğrenci';

  static const BOX_NAME_USER = 'user';
  static const BOX_NAME_BULLETINS = 'bulletins';

  static const MOCK_BULLETINS_PATH = 'assets/mock_bulletins.json';
  static const LOTTIE_SPLASH = 'assets/lottie/splash.json';
}

class Mocks {
  static final _user1 = UserHiveObject(
      name: 'Serap Erçel',
      age: 20,
      mail: 'ercelserap@gmail.com',
      bio: 'Fırat Üniversitesi Yazılım Mühendisliği 3. sınıf öğrencisiyim',
      phone: '0512 345 67 89',
      city: 'Elazığ');

  static final _userIlan1 = BulletinHiveObject(
      additional:
          "Elazığ'da bir öğrenciye 3 aylık bir süre içinde lise düzeyinde matematik dersleri verebilirim",
      content: 'matematik',
      title: 'Matematik Eğitimi',
      type: BulletinType.student,
      user: _user1,
      createdTme: DateTime.now());

  static final _user2 = UserHiveObject(
      name: 'Fatih Demir',
      age: 20,
      mail: 'demirfatih9220@gmail.com',
      bio: 'Türk Hava Kurumu üniversitesi 1. sınıf bilgisayar mühendisiyim',
      phone: '0555 555 55 55',
      city: 'Ankara');

  static final _userIlan2 = BulletinHiveObject(
      additional:
          'Okuduğum 3 kitabı(Suç ve Ceza, Monte Kristo Kontu ve Uğultu Tepeler) bitirdiğiniz zaman başka birine hediye etmeniz karşılığında hediye etmek istiyorum',
      content: 'Kitap-Roman',
      title: 'Kitap Paylaşımı',
      type: BulletinType.book,
      user: _user2,
      createdTme: DateTime.now().subtract(Duration(days: 1)));

  static final _user3 = UserHiveObject(
      name: 'Cihan Cengiz',
      age: 23,
      mail: 'cihancengiz@gmail.com',
      bio: 'Flutter Mobil Uygulama geliştiricisi',
      phone: '0515 249 98 77',
      city: 'İstanbul');

  static final _userIlan3 = BulletinHiveObject(
      additional:
          'İstanbuldada bir öğrenciye Flutter mobil uygulama eğitimi verebilir ve yazılım alanında mentörlük yapabilirim',
      content: 'Yazılım',
      title: 'Yazılım Eğitimi',
      type: BulletinType.mentor,
      user: _user3,
      createdTme: DateTime.now());

  static final _user4 = UserHiveObject(
      name: 'Furkan Berk Aydın',
      age: 20,
      mail: 'furkanberkaydin@hotmail.com',
      bio: 'Bilgisayar mühendisliği 1. sınıf öğrencisiyim',
      phone: '0542 985 77 29',
      city: 'Aydın');

  static final _userIlan4 = BulletinHiveObject(
      additional:
          'Hazırlık senemde okuduğum ingilizce romanları hediye etmek istiyorum',
      content: 'Eğitim',
      title: 'Kitap bağışı',
      type: BulletinType.book,
      user: _user4,
      createdTme: DateTime.now().subtract(Duration(days: 2)));

  static final _user5 = UserHiveObject(
      name: 'Habip Eliş',
      age: 14,
      mail: 'habipelis@gmail.com',
      bio: 'Lise 1. sınıf öğrencisiyim',
      phone: '0555 265 57 69',
      city: 'Van');

  static final _userIlan5 = BulletinHiveObject(
      additional:
          'Lise 1. sınıftayım, anlamadığım konuları bana anlatacak birini arıyorum',
      content: 'Eğitim',
      title: 'Lise Eğitimi',
      type: BulletinType.student,
      user: _user5,
      createdTme: DateTime.now().subtract(Duration(days: 1)));

  static final _user6 = UserHiveObject(
      name: 'Adem Atıcı',
      age: 21,
      mail: 'adematici@gmail.com',
      bio: 'Kotlin Android uygulama geliştiricisi',
      phone: '0559 995 55 69',
      city: 'İzmit');

  static final _userIlan6 = BulletinHiveObject(
      additional:
          'Yuval Noah Harariin Sapiens kitabını okudum ve okumayan birisiyle paylaşmak isterim.',
      content: 'Kitap',
      title: 'Kitap Bağışı',
      type: BulletinType.student,
      user: _user6,
      createdTme: DateTime.now().subtract(Duration(days: 3)));

  static final bulletins = [
    _userIlan1,
    _userIlan2,
    _userIlan3,
    _userIlan4,
    _userIlan5,
    _userIlan6
  ];
}
