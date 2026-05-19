import 'package:flutter/material.dart';
import 'package:lab1_mobile_n2/core/assets/app_icons.dart';
import 'package:lab1_mobile_n2/core/routes/app_routes.dart';
import 'package:lab1_mobile_n2/core/theme/app_colors.dart';
import 'package:lab1_mobile_n2/widgets/app_svg_icon.dart';
import 'package:lab1_mobile_n2/data/mock_jobs.dart';
import 'package:lab1_mobile_n2/models/job.dart';
import 'package:lab1_mobile_n2/widgets/job_list_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _openJob(BuildContext context, Job job) {
    Navigator.pushNamed(context, AppRoutes.jobDetail, arguments: job);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: AppColors.heading,
                            height: 1.3,
                          ),
                          children: [
                            TextSpan(
                              text: 'Hello\n',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                color: AppColors.textMuted,
                              ),
                            ),
                            TextSpan(text: MockJobs.userName),
                          ],
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 26,
                      backgroundColor: AppColors.catRemote,
                      child: const AppSvgIcon(
                        AppIcons.person,
                        size: 30,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(child: _PromoBanner()),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
                child: Text(
                  'Find Your Job',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: MockJobs.categories
                      .map(
                        (c) => Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: c == MockJobs.categories.last ? 0 : 10,
                            ),
                            child: _CategoryCard(category: c),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 12),
                child: Text(
                  'Recent Job List',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 100),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final job = MockJobs.recentJobs[index];
                    return JobListCard(
                      job: job,
                      onTap: () => _openJob(context, job),
                      onApply: () => _openJob(context, job),
                    );
                  },
                  childCount: MockJobs.recentJobs.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PromoBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 20, 24, 0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '50% off\ntake any courses',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 12),
                Material(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(10),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Text(
                        'Join Now',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 90,
            height: 100,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: AppColors.accent.withValues(alpha: 0.4),
                    shape: BoxShape.circle,
                  ),
                ),
                const Icon(
                  Icons.person_pin_rounded,
                  size: 72,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({required this.category});

  final JobCategory category;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSvgIcon(category.iconAsset, color: AppColors.primary, size: 22),
          const Spacer(),
          Text(
            category.title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppColors.heading,
            ),
          ),
          Text(
            category.count,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}
