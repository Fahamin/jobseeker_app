import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseeker/core/constance/environment.dart';
import '../../../../core/wigets/custom_shapes/containers/rounded_container.dart';
import '../../../../core/wigets/images/rounded_image.dart';
import '../../../model/job_details_model.dart';
import '../controllers/jobdetails_controller.dart';

class JobDetailView extends GetView<JobdetailsController> {
  const JobDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get arguments passed from previous screen
    final dynamic arguments = Get.arguments;

    Future.microtask(() => controller.getJobByCategory(arguments));

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Job Details'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final job = controller.job.value;


        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Card
              _buildHeaderCard(job),
              const SizedBox(height: 20),

              // Job Description
              _buildSectionTitle('Job Description'),
              const SizedBox(height: 8),
              _buildDescriptionCard(job),
              const SizedBox(height: 20),

              // Requirements
              _buildSectionTitle('Requirements'),
              const SizedBox(height: 8),
              _buildRequirementsCard(),
              const SizedBox(height: 20),

              // Benefits
              _buildSectionTitle('Benefits'),
              const SizedBox(height: 8),
              _buildBenefitsCard(),
              const SizedBox(height: 30),
            ],
          ),
        );
      }),
      bottomNavigationBar: Obx(() {
        final job = controller.job.value;
        if (job.data?.id == null) return const SizedBox();
        return _buildBottomButtons();
      }),
    );
  }

  Widget _buildHeaderCard(JobDetailsModel job) {
    return HkRoundedContainer(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Company Logo
              HkRoundedImage(
                imageUrl: "${Environment.baseUrl}storage/${job.data?.image ?? ''}",
                isNetworkImage: true,
                height: 60,
                width: 60,
                borderRadius: 12,
              ),
              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job.data?.title ?? 'No Title',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${job.data?.company ?? 'Company not specified'} • ${_getJobType()}',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),

          // Job Details Grid
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDetailItem(
                Icons.location_on,
                job.data?.location ?? 'Location not specified',
              ),
              _buildDetailItem(
                Icons.access_time,
                'Deadline: ${job.data?.dateline ?? 'N/A'}',
              ),
              _buildDetailItem(
                Icons.attach_money,
                job.data?.salary ?? 'Salary not specified',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, size: 20, color: Colors.blue),
        const SizedBox(height: 4),
        SizedBox(
          width: 100,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildDescriptionCard(JobDetailsModel job) {
    return HkRoundedContainer(
      padding: const EdgeInsets.all(16),
      child: Text(
        _getJobDescription(job),
        style: TextStyle(fontSize: 14, height: 1.5, color: Colors.grey[700]),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _buildRequirementsCard() {
    return HkRoundedContainer(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRequirementItem('5+ years of experience in product design'),
          _buildRequirementItem(
            'Strong portfolio showcasing web and mobile applications',
          ),
          _buildRequirementItem('Proficiency in Figma, Sketch, or Adobe XD'),
          _buildRequirementItem(
            'Excellent communication and collaboration skills',
          ),
          _buildRequirementItem(
            'Experience working in agile development environment',
          ),
        ],
      ),
    );
  }

  Widget _buildRequirementItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, size: 18, color: Colors.green[600]),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitsCard() {
    return HkRoundedContainer(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          _buildBenefitChip('Health Insurance', Icons.health_and_safety),
          _buildBenefitChip('401k Plan', Icons.account_balance),
          _buildBenefitChip('Paid Time Off', Icons.beach_access),
          _buildBenefitChip('Remote Work', Icons.work_outline),
          _buildBenefitChip('Flexible Hours', Icons.access_time),
          _buildBenefitChip('Learning Budget', Icons.school),
        ],
      ),
    );
  }

  Widget _buildBenefitChip(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue[100]!),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.blue[700]),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.blue[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Take Quiz Button
          Expanded(
            flex: 2,
            child: OutlinedButton(
              onPressed: () {
                // Handle quiz action
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                side: BorderSide(color: Colors.blue[700]!),
              ),
              child: Text(
                'Take Quiz',
                style: TextStyle(
                  color: Colors.blue[700],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Apply Now Button
          Expanded(
            flex: 3,
            child: ElevatedButton(
              onPressed: () {
                // Handle apply action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text(
                'Apply Now',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper methods for dynamic content
  String _getJobType() {
    return 'Full-Time';
  }

  String _getJobDescription(JobDetailsModel job) {
    return '''
We are looking for a passionate ${job.data?.title.toString() ?? 'professional'} to join our team at ${job.data?.company ?? 'our company'}. You will be responsible for the entire product design lifecycle, from user research and wireframing to creating high-fidelity mockups and interactive prototypes.

You will collaborate closely with product managers, engineers, and other stakeholders to deliver intuitive and engaging user experiences that align with our company's vision and goals.

Key Responsibilities:
• Conduct user research and usability testing
• Create wireframes, prototypes, and high-fidelity designs
• Collaborate with cross-functional teams
• Maintain design systems and guidelines
• Stay updated with design trends and best practices

Location: ${job.data?.location ?? 'Not specified'}
Salary: ${job.data?.salary ?? 'Negotiable'}
Deadline: ${job.data?.dateline ?? 'Not specified'}
''';
  }
}