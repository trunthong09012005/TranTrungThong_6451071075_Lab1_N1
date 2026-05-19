import 'package:flutter/material.dart';
import 'package:lab1_mobile_n2/models/job.dart';

class CompanyLogo extends StatelessWidget {
  const CompanyLogo({
    super.key,
    required this.job,
    this.size = 48,
  });

  final Job job;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: job.logoColor,
        borderRadius: BorderRadius.circular(size * 0.22),
      ),
      alignment: Alignment.center,
      child: job.logoLetter.isEmpty
          ? Icon(Icons.apple, color: Colors.white, size: size * 0.55)
          : Text(
              job.logoLetter,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: size * 0.45,
              ),
            ),
    );
  }
}
