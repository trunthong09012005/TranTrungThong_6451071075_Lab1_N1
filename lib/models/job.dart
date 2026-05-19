import 'package:flutter/material.dart';

class Job {
  const Job({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.salary,
    required this.tags,
    required this.postedAgo,
    required this.logoColor,
    required this.logoLetter,
    this.description,
    this.requirements = const [],
    this.address,
    this.position,
    this.qualification,
    this.experience,
    this.jobType,
    this.specialization,
    this.facilities = const [],
    this.aboutCompany,
    this.website,
    this.industry,
    this.employeeSize,
    this.headOffice,
    this.companyType,
    this.since,
    this.companySpecializations = const [],
  });

  final String id;
  final String title;
  final String company;
  final String location;
  final String salary;
  final List<String> tags;
  final String postedAgo;
  final Color logoColor;
  final String logoLetter;

  final String? description;
  final List<String> requirements;
  final String? address;
  final String? position;
  final String? qualification;
  final String? experience;
  final String? jobType;
  final String? specialization;
  final List<String> facilities;

  final String? aboutCompany;
  final String? website;
  final String? industry;
  final String? employeeSize;
  final String? headOffice;
  final String? companyType;
  final String? since;
  final List<String> companySpecializations;
}

class JobCategory {
  const JobCategory({
    required this.title,
    required this.count,
    required this.color,
    required this.iconAsset,
  });

  final String title;
  final String count;
  final Color color;
  final String iconAsset;
}
