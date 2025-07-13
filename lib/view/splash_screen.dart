import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mainproject_tasky/view/onboarding_screen.dart';
import 'package:mainproject_tasky/utils/color_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _backgroundController;
  late AnimationController _particleController;
  late AnimationController _textController;
  late AnimationController _progressController;
  late AnimationController _fadeController;

  late Animation<double> _logoScale;
  late Animation<double> _logoRotation;
  late Animation<Offset> _logoSlide;
  late Animation<double> _backgroundRotation;
  late Animation<double> _textOpacity;
  late Animation<double> _progressValue;
  late Animation<double> _fadeOut;

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers
    _logoController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _backgroundController = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    );

    _particleController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _textController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _progressController = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    );

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Initialize animations
    _logoScale = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: Curves.elasticOut,
      ),
    );

    _logoRotation = Tween<double>(begin: 0.0, end: 2 * math.pi).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: Curves.easeInOut,
      ),
    );

    _logoSlide = Tween<Offset>(
      begin: const Offset(0, 2),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: Curves.bounceOut,
      ),
    );

    _backgroundRotation = Tween<double>(begin: 0.0, end: 2 * math.pi).animate(
      CurvedAnimation(
        parent: _backgroundController,
        curve: Curves.linear,
      ),
    );

    _textOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: Curves.easeInOut,
      ),
    );

    _progressValue = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _progressController,
        curve: Curves.easeInOut,
      ),
    );

    _fadeOut = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: Curves.easeInOut,
      ),
    );

    // Start animations
    _startAnimations();
  }

  void _startAnimations() async {
    // Start background rotation
    _backgroundController.repeat();
    _particleController.repeat();

    // Sequence of animations
    await Future.delayed(const Duration(milliseconds: 300));
    _logoController.forward();

    await Future.delayed(const Duration(milliseconds: 800));
    _textController.forward();

    await Future.delayed(const Duration(milliseconds: 500));
    _progressController.forward();

    // Wait for progress to complete, then fade out and navigate
    await Future.delayed(const Duration(milliseconds: 4200));
    _fadeController.forward();

    await Future.delayed(const Duration(milliseconds: 800));
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => Onboarding(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 1000),
      ),
    );
  }

  @override
  void dispose() {
    _logoController.dispose();
    _backgroundController.dispose();
    _particleController.dispose();
    _textController.dispose();
    _progressController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: Listenable.merge([
          _logoController,
          _backgroundController,
          _particleController,
          _textController,
          _progressController,
          _fadeController,
        ]),
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeOut,
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 1.5,
                  colors: [
                    ColorConstant.primaryBlue.withOpacity(0.8),
                    ColorConstant.primaryBlue.withOpacity(0.4),
                    Colors.deepPurple.withOpacity(0.6),
                    Colors.black.withOpacity(0.9),
                  ],
                  stops: const [0.0, 0.3, 0.7, 1.0],
                ),
              ),
              child: Stack(
                children: [
                  // Animated background elements
                  _buildAnimatedBackground(),

                  // Particle effects
                  _buildParticleEffects(),

                  // Main content
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 3D Logo with animations
                        _build3DLogo(),

                        const SizedBox(height: 40),

                        // App name with typewriter effect
                        _buildAnimatedText(),

                        const SizedBox(height: 20),

                        // Tagline
                        _buildTagline(),

                        const SizedBox(height: 60),

                        // Loading animation
                        _buildLoadingAnimation(),

                        const SizedBox(height: 40),

                        // Progress bar
                        _buildProgressBar(),
                      ],
                    ),
                  ),

                  // Floating elements
                  _buildFloatingElements(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAnimatedBackground() {
    return Positioned.fill(
      child: Transform.rotate(
        angle: _backgroundRotation.value,
        child: Container(
          decoration: BoxDecoration(
            gradient: SweepGradient(
              colors: [
                Colors.transparent,
                ColorConstant.primaryBlue.withOpacity(0.1),
                Colors.transparent,
                Colors.purple.withOpacity(0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildParticleEffects() {
    return Positioned.fill(
      child: CustomPaint(
        painter: ParticlePainter(_particleController.value),
      ),
    );
  }

  Widget _build3DLogo() {
    return SlideTransition(
      position: _logoSlide,
      child: Transform.scale(
        scale: _logoScale.value,
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(math.sin(_logoRotation.value) * 0.3)
            ..rotateY(_logoRotation.value * 0.1),
          child: Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.9),
                  Colors.white.withOpacity(0.7),
                  ColorConstant.primaryBlue.withOpacity(0.3),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorConstant.primaryBlue.withOpacity(0.5),
                  blurRadius: 30,
                  spreadRadius: 5,
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(-5, -5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Shine effect
                  AnimatedBuilder(
                    animation: _logoController,
                    builder: (context, child) {
                      return Positioned(
                        top: -50,
                        left: -50 + (_logoController.value * 100),
                        child: Transform.rotate(
                          angle: math.pi / 4,
                          child: Container(
                            width: 100,
                            height: 200,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.white.withOpacity(0.6),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  // Logo image
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset(
                      "assets/images/splash.jpg",
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedText() {
    return FadeTransition(
      opacity: _textOpacity,
      child: ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
          colors: [
            Colors.white,
            ColorConstant.primaryBlue,
            Colors.white,
          ],
        ).createShader(bounds),
        child: const Text(
          'TASKY',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 4,
          ),
        ),
      ),
    );
  }

  Widget _buildTagline() {
    return FadeTransition(
      opacity: _textOpacity,
      child: Text(
        'Organize • Prioritize • Achieve',
        style: TextStyle(
          fontSize: 16,
          color: Colors.white.withOpacity(0.8),
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget _buildLoadingAnimation() {
    return SizedBox(
      height: 100,
      child: FadeTransition(
        opacity: _textOpacity,
        child: Lottie.asset(
          "assets/animations/animation1.json",
          height: 100,
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return FadeTransition(
      opacity: _textOpacity,
      child: Column(
        children: [
          Container(
            width: 200,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(3),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: LinearProgressIndicator(
                value: _progressValue.value,
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(
                  ColorConstant.primaryBlue,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '${(_progressValue.value * 100).toInt()}%',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingElements() {
    return Stack(
      children: List.generate(6, (index) {
        return AnimatedBuilder(
          animation: _particleController,
          builder: (context, child) {
            final offset = Offset(
              50 +
                  (index * 60) +
                  math.sin(_particleController.value * 2 * math.pi + index) *
                      30,
              100 +
                  (index * 80) +
                  math.cos(_particleController.value * 2 * math.pi + index) *
                      40,
            );
            return Positioned(
              left: offset.dx,
              top: offset.dy,
              child: Container(
                width: 20 + (index * 2),
                height: 20 + (index * 2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.1),
                  border: Border.all(
                    color: ColorConstant.primaryBlue.withOpacity(0.3),
                    width: 1,
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

class ParticlePainter extends CustomPainter {
  final double animationValue;

  ParticlePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 50; i++) {
      final x = (i * 30 + animationValue * 100) % size.width;
      final y = (i * 40 + math.sin(animationValue * 2 * math.pi + i) * 20) %
          size.height;
      canvas.drawCircle(Offset(x, y), 2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
