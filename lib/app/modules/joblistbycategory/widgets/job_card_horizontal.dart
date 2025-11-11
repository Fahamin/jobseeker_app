import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jobseeker/core/constance/colors.dart';
import 'package:jobseeker/core/wigets/custom_shapes/containers/rounded_container.dart';
import 'package:jobseeker/core/wigets/texts/brand_title.dart';
import 'package:jobseeker/core/wigets/texts/section_heading.dart';
import '../../../../core/wigets/texts/product_title.dart';
import '../../../model/jobModel.dart';
import '../../../routes/app_pages.dart';

class JobCardHorizontal extends StatelessWidget {
  const JobCardHorizontal({super.key, required this.model});

  final Jobcatlist model;

  @override
  Widget build(BuildContext context) {
    return HkRoundedContainer(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Company Row with Logo and Name
          Row(
            children: [
              // Company Logo Placeholder
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: HkColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.business_center,
                  color: HkColors.primary,
                  size: 20,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.company ?? "Company Name",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "Posted 2 days ago",
                      style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
              // Favorite Icon
              Icon(Icons.favorite_border, color: Colors.grey[400], size: 20),
            ],
          ),

          SizedBox(height: 16),

          // Job Position
          Text(
            model.title ?? "Job Title",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.grey[900],
            ),
          ),

          SizedBox(height: 8),

          // Location and Type Row
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 16,
                color: Colors.grey[600],
              ),
              SizedBox(width: 4),
              Text(
                model.location ?? "Location not specified",
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              SizedBox(width: 16),
              Icon(
                Icons.access_time_outlined,
                size: 16,
                color: Colors.grey[600],
              ),
              SizedBox(width: 4),
              Text(
                "Full Time",
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),

          SizedBox(height: 12),

          // Salary and Skills
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: HkColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  model.salary ?? "Salary not specified",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: HkColors.primary,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "Urgent",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 16),

          // Divider and Action Button
          Divider(height: 1, color: Colors.grey[300]),

          SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Apply before: 15 Dec 2024",
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.JOBDETAILS, arguments: model.id.toString());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: HkColors.primary,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  "View Details",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
