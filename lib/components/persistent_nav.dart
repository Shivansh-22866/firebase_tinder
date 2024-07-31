import 'package:firebase_tinder/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:firebase_tinder/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:firebase_tinder/screens/home/home_screen.dart';
import 'package:firebase_tinder/screens/profile/views/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class PersistentTabScreen extends StatefulWidget {
  const PersistentTabScreen({super.key});

  @override
  State<PersistentTabScreen> createState() => _PersistentTabScreenState();
}

class _PersistentTabScreenState extends State<PersistentTabScreen> {
  final PersistentTabController _controller = PersistentTabController();
  late Color dynamicColor;

  List<Widget> _buildScreen() {
    return [
      const HomeScreen(),
      BlocProvider(
        create: (context) => SignInBloc(
          userRepository: context.read<AuthenticationBloc>().userRepository,
        ),
        child: const ProfileScreen(),
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset(
          "assets/tinder_logo.png",
          scale: 16,
          color: dynamicColor,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person_fill, size: 30),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  void initState() {
    dynamicColor = const Color(0xFFFe3c72);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreen(),
      controller: _controller,
      items: _navBarItems(),
      onItemSelected: (value) {
        if (value == 0) {
          setState(() {
            dynamicColor = Theme.of(context).colorScheme.primary;
          });
        } else {
          setState(() {
            dynamicColor = Colors.grey;
          });
        }
      },
      confineToSafeArea: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      decoration: NavBarDecoration(
        border: Border(
            top: BorderSide(
              color: Colors.grey.shade300,
              width: 2.0,
            )
        ),
        colorBehindNavBar: Colors.white
      ),
      navBarStyle: NavBarStyle.style8,
      animationSettings: const NavBarAnimationSettings(
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarItemAnimation: ItemAnimationSettings(
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 200),
        ),
      ),
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
    );
  }
}
