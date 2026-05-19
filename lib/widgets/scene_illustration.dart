import 'package:flutter/material.dart';
import 'package:lab1_mobile_n2/core/assets/app_icons.dart';
import 'package:lab1_mobile_n2/core/theme/app_colors.dart';
import 'package:lab1_mobile_n2/widgets/app_svg_icon.dart';

enum IllustrationType { onboarding, key, envelope, envelopeCheck }

class SceneIllustration extends StatelessWidget {
  const SceneIllustration({
    super.key,
    required this.type,
    this.height = 240,
  });

  final IllustrationType type;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: switch (type) {
        IllustrationType.onboarding => const _OnboardingScene(),
        IllustrationType.key => const _KeyScene(),
        IllustrationType.envelope => const _EnvelopeScene(check: false),
        IllustrationType.envelopeCheck => const _EnvelopeScene(check: true),
      },
    );
  }
}

class _OnboardingScene extends StatelessWidget {
  const _OnboardingScene();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          right: 48,
          top: 36,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.accent.withValues(alpha: 0.45),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const _Person(shirt: AppColors.primary),
            const SizedBox(width: 8),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 108,
                  height: 178,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.25),
                        blurRadius: 24,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.fromLTRB(14, 18, 14, 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 48,
                        height: 8,
                        decoration: BoxDecoration(
                          color: AppColors.accent,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(height: 14),
                      ...List.generate(
                        4,
                        (i) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            height: 10,
                            width: i.isEven ? 72 : 56,
                            decoration: BoxDecoration(
                              color: AppColors.white.withValues(
                                alpha: 0.25 + i * 0.12,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 28,
                        decoration: BoxDecoration(
                          color: AppColors.accent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _KeyScene extends StatelessWidget {
  const _KeyScene();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const _Person(shirt: AppColors.accent),
        const SizedBox(width: 16),
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: 112,
              height: 112,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const AppSvgIcon(
                AppIcons.lock,
                color: AppColors.white,
                size: 40,
              ),
            ),
            Positioned(
              right: -12,
              bottom: 8,
              child: Transform.rotate(
                angle: -0.35,
                child: const AppSvgIcon(
                  AppIcons.key,
                  color: AppColors.accent,
                  size: 56,
                ),
              ),
            ),
            Positioned(
              top: 4,
              right: 8,
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.accent, width: 2),
                ),
                child: const Center(
                  child: Text(
                    '?',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _EnvelopeScene extends StatelessWidget {
  const _EnvelopeScene({required this.check});

  final bool check;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const _Person(shirt: AppColors.primary),
        const SizedBox(width: 12),
        Stack(
          clipBehavior: Clip.none,
          children: [
            CustomPaint(
              size: const Size(120, 96),
              painter: _EnvelopePainter(),
            ),
            if (!check)
              Positioned(
                top: -18,
                left: 36,
                child: Container(
                  width: 36,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppColors.primary, width: 1.5),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 6),
                      ...List.generate(
                        3,
                        (_) => Container(
                          margin: const EdgeInsets.only(bottom: 4),
                          width: 22,
                          height: 3,
                          color: AppColors.textMuted.withValues(alpha: 0.4),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (check)
              Positioned(
                right: -6,
                top: -6,
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primary, width: 2),
                  ),
                  child: const AppSvgIcon(
                    AppIcons.shieldCheck,
                    color: AppColors.accent,
                    size: 26,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _EnvelopePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final body = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 16, size.width, size.height - 16),
      const Radius.circular(10),
    );
    final paint = Paint()..color = AppColors.accent;
    canvas.drawRRect(body, paint);

    final flap = Path()
      ..moveTo(0, 28)
      ..lineTo(size.width / 2, 56)
      ..lineTo(size.width, 28)
      ..close();
    paint.color = AppColors.accent.withValues(alpha: 0.85);
    canvas.drawPath(flap, paint);

    paint.color = AppColors.white.withValues(alpha: 0.35);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    canvas.drawRRect(body, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _Person extends StatelessWidget {
  const _Person({required this.shirt});

  final Color shirt;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: const Color(0xFFFFE8D1),
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.heading, width: 1.5),
            ),
          ),
          Container(
            width: 40,
            height: 52,
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              color: shirt,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 10, height: 32, color: AppColors.heading),
              const SizedBox(width: 6),
              Container(width: 10, height: 32, color: AppColors.heading),
            ],
          ),
        ],
      ),
    );
  }
}
