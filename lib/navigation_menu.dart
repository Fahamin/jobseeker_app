


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseeker/app/modules/home/views/home_view.dart';

import 'core/constance/colors.dart';
import 'core/helpers/helper_functions.dart';


class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = HkHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        ()=> NavigationBar(
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (value) => controller.selectedIndex.value = value,
          backgroundColor: dark ? HkColors.dark : HkColors.light,
          indicatorColor: dark ? HkColors.light.withOpacity(0.1) : HkColors.dark.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Icons.favorite), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile')
          ],
        ),
      ),
      body: Obx(()=>  controller.screens[controller.selectedIndex.value]),
    );
  }
}


class NavigationController extends GetxController{

  final RxInt selectedIndex = 0.obs;

  final screens = [
    const HomeView(),
    const StoreScreen(),
    const FavouriteScreen(),
    const SettingsScreen()
  ];
}