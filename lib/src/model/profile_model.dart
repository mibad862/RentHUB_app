import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileModel {
  ProfileModel({
    required this.itemIconData,
    required this.itemName,
  });

  final IconData itemIconData;
  final String itemName;

  static List<ProfileModel> profileItemList = [
    ProfileModel(itemIconData: Icons.person, itemName: "Your profile"),
    ProfileModel(itemIconData: Icons.payment, itemName: "Payment Methods"),
    ProfileModel(itemIconData: Icons.calendar_month, itemName: "My Bookings"),
    ProfileModel(itemIconData: Icons.wallet, itemName: "My Wallet"),
    ProfileModel(itemIconData: Icons.settings, itemName: "Settings"),
  ];

}
