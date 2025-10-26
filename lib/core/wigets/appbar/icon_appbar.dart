import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance/colors.dart';
import '../../constance/sizes.dart';
import '../../device/device_utility.dart';
import '../../helpers/helper_functions.dart';

class IconAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final VoidCallback? leadingOnPressed;

  const IconAppbar({
    super.key,
    this.title,
    this.leadingIcon,
    this.trailingIcon,
    this.leadingOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HkHelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: HkSizes.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              trailingIcon,
              color: dark ? HkColors.light : HkColors.dark,
            ),
          ),
          title ?? const SizedBox(),
          IconButton(
            onPressed: leadingOnPressed,
            icon: Icon(
              leadingIcon,
              color: dark ? HkColors.light : HkColors.dark,
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(HkDeviceUtils.getAppBarHeight());
}
