import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtherProfileDetailsScreen extends StatefulWidget {
  final int index;
  const OtherProfileDetailsScreen(this.index, {super.key});

  @override
  State<OtherProfileDetailsScreen> createState() =>
      _OtherProfileDetailsScreenState();
}

class _OtherProfileDetailsScreenState extends State<OtherProfileDetailsScreen> {
  int numberPhotos = 4;
  int currentPhoto = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Column(
                  children: [
                    
                  ],
                ),
              ),
          )
        ],
      )),
    );
  }
}
