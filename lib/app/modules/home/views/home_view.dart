import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobseeker/core/wigets/appbar/appbar.dart';

import '../../../../core/wigets/appbar/icon_appbar.dart';
import '../../../../core/wigets/custom_shapes/containers/search_container.dart';
import '../../../../core/wigets/texts/section_heading.dart';
import '../controllers/home_controller.dart';
import '../widgets/profile_name.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40,),
            IconAppbar(trailingIcon: Icons.cabin_rounded,leadingIcon: Icons.notification_important_outlined,),
            ProfileName(),
            SizedBox(height: 10,),

            HkSearchContainer(
              text: 'Search in Jobs for you',
            ),
            SizedBox(height: 10,),
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: HkSectionHeading(title: "Popular Jobs Categorys",),
            )

          ],
        ),
      ),
    );
  }
}
