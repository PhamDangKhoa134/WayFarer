import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fe_v1/core/constants/color_base.dart';
import 'package:fe_v1/feature/presentation/pages/chat/chat_page.dart';
import 'package:fe_v1/feature/presentation/pages/home/home_page.dart';
import 'package:fe_v1/feature/presentation/pages/profile/profile_page.dart';
import 'package:fe_v1/feature/presentation/pages/explore/explore_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomBarPage extends StatefulWidget {
  final int? index;
  const BottomBarPage({super.key, this.index});

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  late final PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: widget.index ?? 0);
  }

  List<Widget> _buildScreens() => [
        const HomePage(),
        const ChatPage(),
        const ExplorePage(),
        const ProfilePage(),
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
          icon: const FaIcon(FontAwesomeIcons.houseChimneyMedical),
          title: "Home",
          activeColorPrimary: ColorBase.yellow,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: const FaIcon(FontAwesomeIcons.robot),
          title: "ChatBot",
          activeColorPrimary: ColorBase.yellow,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: const FaIcon(FontAwesomeIcons.compass),
          title: "Explore",
          activeColorPrimary: ColorBase.yellow,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: const FaIcon(FontAwesomeIcons.user),
          title: "Profile",
          activeColorPrimary: ColorBase.yellow,
          inactiveColorPrimary: Colors.white,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style1,
      backgroundColor: const Color.fromARGB(255, 210, 210, 210),
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.zero,
        colorBehindNavBar: Colors.transparent,
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
