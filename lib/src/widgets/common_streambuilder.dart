import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/textstyles.dart';

class CommonStreamBuilder extends StatelessWidget {
  const CommonStreamBuilder({super.key});

  @override
  Widget build(BuildContext context) {

    User? currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('user')
          .doc(currentUser!.uid.toString())
          .snapshots(),
      builder: (ctx, nameSnapshots) {
        if (nameSnapshots.connectionState ==
            ConnectionState.waiting) {
          return const Text("Loading");
        }
        if (!nameSnapshots.hasData ||
            !nameSnapshots.data!.exists) {
          return const Text("No Name");
        }
        if (nameSnapshots.hasError) {
          return const Text("Something went wrong");
        }
        final userData = nameSnapshots.data!;
        final fullName = userData['full_name'];

        return Text(fullName, style: style5);
      },
    );
  }
}
