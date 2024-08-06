import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_tinder/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:firebase_tinder/screens/profile/views/add_photos_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> newPhotos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          CupertinoIcons.check_mark,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        title: const Text('Profile'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<SignInBloc>().add(const SignOutRequired());
              },
              icon: Icon(Icons.login))
        ],
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Text(
                  "Photos",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 9 / 16),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          if (!(newPhotos.isEmpty &&
                              (index < newPhotos.length))) {
                            var photos =
                                await PersistentNavBarNavigator.pushNewScreen(
                                    context,
                                    screen: AddPhotoScreen());
                            if (photos != null && photos.isNotEmpty) {
                              setState(() {
                                newPhotos.addAll(photos);
                              });
                            }
                          }
                        },
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: newPhotos.isNotEmpty &&
                                      (index < newPhotos.length)
                                  ? Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                              image: FileImage(
                                                  File(newPhotos[index])))),
                                    )
                                  : DottedBorder(
                                      color: Colors.grey.shade700,
                                      borderType: BorderType.RRect,
                                      radius: const Radius.circular(8),
                                      dashPattern: const [6, 6, 6, 6],
                                      padding: EdgeInsets.zero,
                                      strokeWidth: 2,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      ),
                                    ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Material(
                                elevation: 4,
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: newPhotos.isNotEmpty &&
                                            (index < newPhotos.length)
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                newPhotos
                                                    .remove(newPhotos[index]);
                                              });
                                            },
                                            child: Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                  ),
                                                  color: Colors.white),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                child: Image.asset(
                                                  'assets/icons/clear.png',
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Image.asset(
                                                'assets/icons/add.png',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'About Me',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.white,
                child: TextFormField(
                  maxLines: 10,
                  minLines: 1,
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      hintText: "About Me",
                      border: InputBorder.none),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
