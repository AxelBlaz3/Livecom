import 'package:flutter/material.dart';
import 'package:live_com/models/stream.dart';
import 'package:live_com/screens/system/blocked_list_page.dart';
import 'package:live_com/screens/system/deactivate_account_page.dart';
import 'package:live_com/screens/system/terms_and_conditions.dart';

import 'models/person.dart';
import 'models/store.dart';

final sampleStoreList = <Store>[
  Store(
      title: 'Apple M1 MacBook Pro 16” 2020',
      price: '500',
      time: '00:71:25',
      imagePath: 'assets/sample_image.png'),
  Store(
      title: 'Apple M1 MacBook Pro 16” 2020',
      price: '500',
      time: '00:71:25',
      imagePath: 'assets/sample_image.png'),
  Store(
      title: 'Apple M1 MacBook Pro 16” 2020',
      price: '500',
      time: '00:71:25',
      imagePath: 'assets/sample_image.png'),
  Store(
      title: 'Apple M1 MacBook Pro 16” 2020',
      price: '500',
      time: '00:71:25',
      imagePath: 'assets/sample_image.png'),
  Store(
      title: 'Apple M1 MacBook Pro 16” 2020',
      price: '500',
      time: '00:71:25',
      imagePath: 'assets/sample_image.png'),
  Store(
      title: 'Apple M1 MacBook Pro 16” 2020',
      price: '500',
      time: '00:71:25',
      imagePath: 'assets/sample_image.png'),
  Store(
      title: 'Apple M1 MacBook Pro 16” 2020',
      price: '500',
      time: '00:71:25',
      imagePath: 'assets/sample_image.png'),
];

final LiveStream sampleFeaturedItem = LiveStream(
    title: 'This is the title of the live stream that is live.',
    views: '300',
    runtime: '00:71:25',
    totalAudience: 30,
    imagePath: 'assets/sample_stream.png');

final sampleStreamList = <LiveStream>[
  LiveStream(
      title: 'Make up Masterclass',
      views: '300',
      runtime: '00:71:25',
      totalAudience: 30,
      imagePath: 'assets/sample_stream.png',
      sellerImagePath: 'assets/home/person_1.png',
      sellerName: 'Seller Name',
      rating: '4.5',
      flagImagePath: 'assets/home/flag.svg'),
  LiveStream(
      title: 'Make up Masterclass',
      views: '300',
      runtime: '00:71:25',
      totalAudience: 30,
      imagePath: 'assets/sample_stream.png',
      sellerImagePath: 'assets/home/person_1.png',
      sellerName: 'Seller Name',
      rating: '4.5',
      flagImagePath: 'assets/home/flag.svg'),
  LiveStream(
      title: 'Make up Masterclass',
      views: '300',
      runtime: '00:71:25',
      totalAudience: 30,
      imagePath: 'assets/sample_stream.png',
      sellerImagePath: 'assets/home/person_1.png',
      sellerName: 'Seller Name',
      rating: '4.5',
      flagImagePath: 'assets/home/flag.svg'),
  LiveStream(
      title: 'Make up Masterclass',
      views: '300',
      runtime: '00:71:25',
      totalAudience: 30,
      imagePath: 'assets/sample_stream.png',
      sellerImagePath: 'assets/home/person_1.png',
      sellerName: 'Seller Name',
      rating: '4.5',
      flagImagePath: 'assets/home/flag.svg'),
  LiveStream(
      title: 'Make up Masterclass',
      views: '300',
      runtime: '00:71:25',
      totalAudience: 30,
      imagePath: 'assets/sample_stream.png',
      sellerImagePath: 'assets/home/person_1.png',
      sellerName: 'Seller Name',
      rating: '4.5',
      flagImagePath: 'assets/home/flag.svg'),
  LiveStream(
      title: 'Make up Masterclass',
      views: '300',
      runtime: '00:71:25',
      totalAudience: 30,
      imagePath: 'assets/sample_stream.png',
      sellerImagePath: 'assets/home/person_1.png',
      sellerName: 'Seller Name',
      rating: '4.5',
      flagImagePath: 'assets/home/flag.svg'),
  LiveStream(
      title: 'Make up Masterclass',
      views: '300',
      runtime: '00:71:25',
      totalAudience: 30,
      imagePath: 'assets/sample_stream.png',
      sellerImagePath: 'assets/home/person_1.png',
      sellerName: 'Seller Name',
      rating: '4.5',
      flagImagePath: 'assets/home/flag.svg'),
];

final shareResources = {
  'Copy link': 'assets/seller_profile/share/copy.png',
  'Facebook': 'assets/seller_profile/share/facebook.png',
  'Messenger': 'assets/seller_profile/share/messenger.png',
  'WhatsApp': 'assets/seller_profile/share/whatsapp.png',
  'Instagram': 'assets/seller_profile/share/instagram.png',
  'WeChat': 'assets/seller_profile/share/wechat.png',
  'Telegram': 'assets/seller_profile/share/telegram.png',
  'Twitter': 'assets/seller_profile/share/twitter.png',
};

final List<Person> personList = <Person>[
  Person(name: 'Jason', imagePath: 'assets/home/person_1.png'),
  Person(name: 'Alexa', imagePath: 'assets/home/person_2.png'),
  Person(name: 'Jess', imagePath: 'assets/home/person_3.png'),
  Person(name: 'Lee', imagePath: 'assets/profile_image.png'),
  Person(name: 'Sam', imagePath: 'assets/home/person_5.png'),
  Person(name: 'Jason', imagePath: 'assets/home/person_1.png'),
  Person(name: 'Alexa', imagePath: 'assets/home/person_2.png'),
];

final systemSettingsList = <String, Widget>{
  "Blocked Sellers": BlockListPage(),
  "Language": SizedBox(),
  "Main Menu Settings (Coming Soon)": SizedBox()
};

final supportSettingsList = <String, Widget>{
  "Terms & Conditions": TermsAndConditionsPage(),
  "Privacy Policies": SizedBox(),
  "Game Mode Policies": SizedBox(),
  "PDPA Policies": SizedBox(),
  "Delivery, Return & Refund Policies": SizedBox(),
  "Account Deactivation": DeactivateAccountPage()
};

final blockList = <Person>[
  Person(name: 'Sellerusername', imagePath: 'assets/home/person_2.png'),
  Person(name: 'Sellerusername', imagePath: 'assets/home/person_2.png'),
  Person(name: 'Sellerusername', imagePath: 'assets/home/person_2.png'),
  Person(name: 'Sellerusername', imagePath: 'assets/home/person_2.png'),
  Person(name: 'Sellerusername', imagePath: 'assets/home/person_2.png'),
  Person(name: 'Sellerusername', imagePath: 'assets/home/person_2.png'),
  Person(name: 'Sellerusername', imagePath: 'assets/home/person_2.png'),
];
