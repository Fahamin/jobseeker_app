import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance/colors.dart';
import '../../constance/sizes.dart';
import '../../device/device_utility.dart';
import '../../helpers/helper_functions.dart';


class HkAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  const HkAppBar(
      {super.key,
        this.title,
        this.showBackArrow = false,
        this.leadingIcon,
        this.actions,
        this.leadingOnPressed});

  @override
  Widget build(BuildContext context) {
    final dark = HkHelperFunctions.isDarkMode(context);

    return Padding(padding: const EdgeInsets.symmetric(horizontal: 18),
      child: AppBar(
          automaticallyImplyLeading: false,
          leading: showBackArrow ? IconButton(
            onPressed: () => Get.back(), icon: const Icon(Icons.arrow_left),color: dark ? HkColors.white : HkColors.dark ,) :
            leadingIcon != null ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon,color: dark ? HkColors.white : HkColors.dark,)) : null,

          title:title ,

        actions: actions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(HkDeviceUtils.getAppBarHeight());
}
