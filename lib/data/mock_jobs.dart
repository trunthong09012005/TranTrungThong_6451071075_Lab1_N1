import 'package:flutter/material.dart';
import 'package:lab1_mobile_n2/core/assets/app_icons.dart';
import 'package:lab1_mobile_n2/core/theme/app_colors.dart';
import 'package:lab1_mobile_n2/models/job.dart';

abstract final class MockJobs {
  static const userName = 'Orlando Diggs.';

  static const categories = [
    JobCategory(
      title: 'Remote Job',
      count: '44.5k',
      color: AppColors.catRemote,
      iconAsset: AppIcons.briefcase,
    ),
    JobCategory(
      title: 'Full Time',
      count: '66.8k',
      color: AppColors.catFullTime,
      iconAsset: AppIcons.schedule,
    ),
    JobCategory(
      title: 'Part Time',
      count: '38.9k',
      color: AppColors.catPartTime,
      iconAsset: AppIcons.clock,
    ),
  ];

  static const featured = Job(
    id: 'google-ux',
    title: 'UI/UX Designer',
    company: 'Google',
    location: 'California, USA',
    salary: '\$15K/Mo',
    tags: ['Senior designer', 'Fulltime'],
    postedAgo: '1 day ago',
    logoColor: Color(0xFF4285F4),
    logoLetter: 'G',
    description:
        'As a UI/UX Designer at Google, you will work on user-centered design '
        'for products used by millions. You will collaborate with engineers and '
        'product managers to deliver intuitive experiences.',
    requirements: const [
      'Strong portfolio demonstrating UI/UX skills',
      '3+ years of experience in product design',
      'Proficiency in Figma, Sketch, or similar tools',
      'Understanding of design systems and accessibility',
    ],
    address: '1600 Amphitheatre Parkway, Mountain View, CA',
    position: 'UI/UX Designer',
    qualification: "Bachelor's degree in Design or related field",
    experience: '3 Years',
    jobType: 'Full-Time',
    specialization: 'Design, User Research, Prototyping',
    facilities: const [
      'Medical insurance',
      'Dental insurance',
      'Free lunch & snacks',
      'Flexible working hours',
    ],
    aboutCompany:
        'Google\'s mission is to organize the world\'s information and make it '
        'universally accessible and useful. We build products that help create '
        'opportunities for everyone.',
    website: 'https://www.google.com',
    industry: 'Internet product',
    employeeSize: '10,001+ employees',
    headOffice: '1600 Amphitheatre Parkway, Mountain View, California',
    companyType: 'Multinational company',
    since: '1998',
    companySpecializations: const [
      'Search technology',
      'Web computing',
      'Software',
      'Online advertising',
    ],
  );

  static const recentJobs = [
    Job(
      id: 'apple-pd',
      title: 'Product Designer',
      company: 'Apple',
      location: 'California, USA',
      salary: '\$15K/Mo',
      tags: ['Senior designer', 'Fulltime'],
      postedAgo: '2 days ago',
      logoColor: Color(0xFF000000),
      logoLetter: '',
      description:
          'Join Apple to design products that enrich people\'s lives. You will '
          'shape the future of hardware and software experiences.',
      requirements: const [
        '5+ years product design experience',
        'Expertise in visual and interaction design',
      ],
      address: 'One Apple Park Way, Cupertino, CA',
      position: 'Product Designer',
      qualification: "Bachelor's degree",
      experience: '5 Years',
      jobType: 'Full-Time',
      specialization: 'Product Design',
      facilities: const ['Health benefits', 'Stock options'],
      aboutCompany: 'Apple designs the best products on earth.',
      website: 'https://www.apple.com',
      industry: 'Consumer electronics',
      employeeSize: '10,001+ employees',
      headOffice: 'Cupertino, California',
      companyType: 'Multinational company',
      since: '1976',
      companySpecializations: const ['Hardware', 'Software', 'Services'],
    ),
    Job(
      id: 'airbnb-ux',
      title: 'UI Designer',
      company: 'Airbnb',
      location: 'California, USA',
      salary: '\$12K/Mo',
      tags: ['Mid level', 'Remote'],
      postedAgo: '3 days ago',
      logoColor: Color(0xFFFF5A5F),
      logoLetter: 'A',
      description: 'Design delightful experiences for hosts and guests worldwide.',
      requirements: const ['3+ years UI design', 'Strong visual skills'],
      address: '888 Brannan St, San Francisco, CA',
      position: 'UI Designer',
      qualification: "Bachelor's degree",
      experience: '3 Years',
      jobType: 'Remote',
      specialization: 'UI Design',
      facilities: const ['Travel credit', 'Remote work'],
      aboutCompany: 'Airbnb connects millions of people to unique travel experiences.',
      website: 'https://www.airbnb.com',
      industry: 'Travel',
      employeeSize: '5,001+ employees',
      headOffice: 'San Francisco, California',
      companyType: 'Public company',
      since: '2008',
      companySpecializations: const ['Marketplace', 'Hospitality'],
    ),
    Job(
      id: 'facebook-pd',
      title: 'Product Designer',
      company: 'Facebook',
      location: 'California, USA',
      salary: '\$14K/Mo',
      tags: ['Senior', 'Fulltime'],
      postedAgo: '4 days ago',
      logoColor: Color(0xFF1877F2),
      logoLetter: 'f',
      description: 'Build social experiences for billions of users.',
      requirements: const ['Portfolio required', '4+ years experience'],
      address: '1 Hacker Way, Menlo Park, CA',
      position: 'Product Designer',
      qualification: "Bachelor's degree",
      experience: '4 Years',
      jobType: 'Full-Time',
      specialization: 'Social products',
      facilities: const ['Gym', 'Free meals'],
      aboutCompany: 'Meta builds technologies that help people connect.',
      website: 'https://www.meta.com',
      industry: 'Social media',
      employeeSize: '10,001+ employees',
      headOffice: 'Menlo Park, California',
      companyType: 'Multinational company',
      since: '2004',
      companySpecializations: const ['Social', 'VR', 'Advertising'],
    ),
  ];

  static Job? findById(String id) {
    if (featured.id == id) return featured;
    for (final j in recentJobs) {
      if (j.id == id) return j;
    }
    return null;
  }
}
