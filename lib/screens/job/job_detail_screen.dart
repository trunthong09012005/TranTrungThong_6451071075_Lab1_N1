import 'package:flutter/material.dart';
import 'package:lab1_mobile_n2/core/assets/app_icons.dart';
import 'package:lab1_mobile_n2/core/routes/app_routes.dart';
import 'package:lab1_mobile_n2/core/theme/app_colors.dart';
import 'package:lab1_mobile_n2/widgets/app_svg_icon.dart';
import 'package:lab1_mobile_n2/models/job.dart';
import 'package:lab1_mobile_n2/widgets/job_detail_app_bar.dart';
import 'package:lab1_mobile_n2/widgets/job_header_card.dart';
import 'package:lab1_mobile_n2/widgets/job_segment_tabs.dart';
import 'package:lab1_mobile_n2/widgets/primary_button.dart';

class JobDetailScreen extends StatefulWidget {
  const JobDetailScreen({super.key, required this.job});

  final Job job;

  @override
  State<JobDetailScreen> createState() => _JobDetailScreenState();
}

class _JobDetailScreenState extends State<JobDetailScreen> {
  int _tabIndex = 0;
  bool _descriptionExpanded = false;

  void _apply() {
    Navigator.pushNamed(
      context,
      AppRoutes.uploadCv,
      arguments: widget.job,
    );
  }

  @override
  Widget build(BuildContext context) {
    final job = widget.job;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const JobDetailAppBar(),
      body: Column(
        children: [
          JobHeaderCard(job: job),
          const SizedBox(height: 16),
          JobSegmentTabs(
            index: _tabIndex,
            onChanged: (i) => setState(() => _tabIndex = i),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 100),
              child: _tabIndex == 0
                  ? _DescriptionTab(
                      job: job,
                      expanded: _descriptionExpanded,
                      onReadMore: () => setState(
                        () => _descriptionExpanded = !_descriptionExpanded,
                      ),
                    )
                  : _CompanyTab(job: job),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _ApplyBar(onApply: _apply),
    );
  }
}

class _DescriptionTab extends StatelessWidget {
  const _DescriptionTab({
    required this.job,
    required this.expanded,
    required this.onReadMore,
  });

  final Job job;
  final bool expanded;
  final VoidCallback onReadMore;

  @override
  Widget build(BuildContext context) {
    final desc = job.description ?? '';
    final preview = desc.length > 120 && !expanded
        ? '${desc.substring(0, 120)}...'
        : desc;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle('Job Description'),
        Text(
          preview,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textMuted,
            height: 1.55,
          ),
        ),
        if (desc.length > 120)
          GestureDetector(
            onTap: onReadMore,
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                expanded ? 'Read less' : 'Read more',
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        const SizedBox(height: 20),
        _SectionTitle('Requirements'),
        ...job.requirements.map(
          (r) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('•  ', style: TextStyle(color: AppColors.primary)),
                Expanded(
                  child: Text(
                    r,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textMuted,
                      height: 1.45,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        _SectionTitle('Location'),
        Text(
          job.address ?? job.location,
          style: const TextStyle(fontSize: 14, color: AppColors.textMuted),
        ),
        const SizedBox(height: 12),
        _MapPlaceholder(),
        const SizedBox(height: 20),
        _SectionTitle('Information'),
        _InfoRow('Position', job.position ?? job.title),
        _InfoRow('Qualification', job.qualification ?? '—'),
        _InfoRow('Experience', job.experience ?? '—'),
        _InfoRow('Job type', job.jobType ?? '—'),
        _InfoRow('Specialization', job.specialization ?? '—'),
        const SizedBox(height: 20),
        _SectionTitle('Facilities and Others'),
        ...job.facilities.map(
          (f) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('•  ', style: TextStyle(color: AppColors.primary)),
                Expanded(
                  child: Text(
                    f,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textMuted,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CompanyTab extends StatelessWidget {
  const _CompanyTab({required this.job});

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle('About Company'),
        Text(
          job.aboutCompany ?? '',
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textMuted,
            height: 1.55,
          ),
        ),
        const SizedBox(height: 20),
        _InfoRow('Website', job.website ?? '—', isLink: true),
        _InfoRow('Industry', job.industry ?? '—'),
        _InfoRow('Employee size', job.employeeSize ?? '—'),
        _InfoRow('Head office', job.headOffice ?? '—'),
        _InfoRow('Type', job.companyType ?? '—'),
        _InfoRow('Since', job.since ?? '—'),
        const SizedBox(height: 12),
        _SectionTitle('Specialization'),
        Text(
          job.companySpecializations.join(', '),
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textMuted,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 20),
        _SectionTitle('Company Gallery'),
        Row(
          children: [
            Expanded(child: _GalleryImage()),
            const SizedBox(width: 12),
            Expanded(child: _GalleryImage()),
          ],
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColors.heading,
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow(this.label, this.value, {this.isLink = false});

  final String label;
  final String value;
  final bool isLink;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.heading,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: isLink ? AppColors.primary : AppColors.textMuted,
              decoration: isLink ? TextDecoration.underline : null,
            ),
          ),
        ],
      ),
    );
  }
}

class _MapPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.mapBg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Stack(
        alignment: Alignment.center,
        children: [
          const AppSvgIcon(AppIcons.map, size: 48, color: AppColors.textMuted),
          const Positioned(
            child: AppSvgIcon(AppIcons.location, size: 36, color: Colors.red),
          ),
        ],
      ),
    );
  }
}

class _GalleryImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.catRemote,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const AppSvgIcon(AppIcons.building, color: AppColors.primary, size: 36),
    );
  }
}

class _ApplyBar extends StatelessWidget {
  const _ApplyBar({required this.onApply});

  final VoidCallback onApply;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: PrimaryButton(label: 'APPLY NOW', onPressed: onApply),
      ),
    );
  }
}
