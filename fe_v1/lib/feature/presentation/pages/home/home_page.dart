import 'package:flutter/material.dart';
import 'package:fe_v1/core/utils/widgets/text_league_spartan.dart';
import 'package:fe_v1/feature/presentation/widgets/user/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(title: "Doctors"),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Row(
                  children: [
                    TextLeagueSpartan(
                      title: "Sort by",
                      weight: FontWeight.w500,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
