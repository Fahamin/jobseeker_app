import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseeker/core/constance/environment.dart';
import '../../../../core/wigets/custom_shapes/containers/rounded_container.dart';
import '../../../../core/wigets/images/rounded_image.dart';
import '../controllers/home_controller.dart';

class JobPostHorizontal extends StatelessWidget {
  const JobPostHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    // Load jobs list when widget is built
    Future.microtask(() => controller.getJobsList());

    return Obx(() {
      if (controller.joblist.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return ListView.separated(
        itemCount: controller.joblist.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final item = controller.joblist[index];
          return _buildJobItem(item, context);
        },
      );
    });
  }

  Widget _buildJobItem(dynamic item, BuildContext context) {
    return HkRoundedContainer(
      height: 100,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Company Logo
          _buildCompanyLogo(item),
          const SizedBox(width: 12),

          // Job Details
          Expanded(
            child: _buildJobDetails(item),
          ),
          const SizedBox(width: 12),

          // Salary
          _buildSalary(item),
        ],
      ),
    );
  }

  Widget _buildCompanyLogo(dynamic item) {
    return HkRoundedImage(
      imageUrl: "${Environment.baseUrl}storage/${item.image}",
      isNetworkImage: true,
      height: 70,
      width: 70,
      borderRadius: 8,
    );
  }

  Widget _buildJobDetails(dynamic item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Job Title
        Text(
          item.title?.toString() ?? 'No Title',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 1,
        ),
        const SizedBox(height: 4),

        // Location
        Text(
          item.location?.toString() ?? 'Location not specified',
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 14,
            color: Colors.grey[600],
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),

        // Deadline
        Text(
          "Deadline: ${item.dateline ?? 'Not specified'}",
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 12,
            color: Colors.red[600],
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildSalary(dynamic item) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        item.salary?.toString() ?? 'N/A',
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: Colors.blue,
        ),
        maxLines: 1,
      ),
    );
  }
}