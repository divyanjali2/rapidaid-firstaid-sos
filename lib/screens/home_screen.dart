import 'package:flutter/material.dart';
import '../data/sample_guides.dart';
import '../models/guide.dart';
import 'guide_detail_screen.dart';
import 'medical_id_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool _isSosHolding = false;
  double _sosProgress = 0.0;

  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeOut),
    );
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  void _onSosStart() {
    setState(() {
      _isSosHolding = true;
      _sosProgress = 0.0;
    });
    _animateSosProgress();
  }

  void _animateSosProgress() async {
    // Simulate hold progress over 3 seconds (30 steps × 100ms)
    for (int i = 1; i <= 30; i++) {
      await Future.delayed(const Duration(milliseconds: 100));
      if (!_isSosHolding) return;
      setState(() {
        _sosProgress = i / 30.0;
      });
      if (_sosProgress >= 1.0) {
        _triggerSos();
        return;
      }
    }
  }

  void _onSosEnd() {
    setState(() {
      _isSosHolding = false;
      _sosProgress = 0.0;
    });
  }

  void _triggerSos() {
    setState(() {
      _isSosHolding = false;
      _sosProgress = 0.0;
    });
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(Icons.emergency_rounded, color: Colors.white),
              SizedBox(width: 10),
              Text('SOS Triggered! Calling emergency services...'),
            ],
          ),
          backgroundColor: const Color(0xFF1E3A8A),
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.all(16),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            children: [
              // ── App Bar ──
              _buildAppBar(),

              // ── Content ──
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),

                      // ── Banner Card ──
                      _buildBannerCard(),

                      const SizedBox(height: 28),

                      // ── Section Title ──
                      Text(
                        'EMERGENCY GUIDES',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF0F172A).withOpacity(0.6),
                          letterSpacing: 1.2,
                        ),
                      ),

                      const SizedBox(height: 16),

                      // ── Guide Grid ──
                      _buildGuideGrid(),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),

              // ── SOS Button Section ──
              _buildSosSection(),
            ],
          ),
        ),
      ),
    );
  }

  // ── App Bar ──
  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          // ── Back Button ──
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF0F172A).withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 16,
                color: Color(0xFF1A1A2E),
              ),
            ),
          ),

          const SizedBox(width: 10),

          // ── App Logo ──
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/app_logo.jpg',
              width: 36,
              height: 36,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 10),

          // ── Title ──
          const Text(
            'RapidAid',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1A1A2E),
            ),
          ),

          const Spacer(),

          // ── Action Icons ──
          _buildActionIcon(Icons.language_rounded),
          const SizedBox(width: 10),
          _buildActionIcon(Icons.phone_rounded),
          const SizedBox(width: 10),
          _buildActionIcon(
            Icons.person_outline_rounded,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MedicalIdScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActionIcon(IconData icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0F172A).withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          icon,
          size: 20,
          color: const Color(0xFF4A4A5A),
        ),
      ),
    );
  }

  // ── Banner Card ──
  Widget _buildBannerCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFE8F8F4),
            Color(0xFFD4F1EA),
          ],
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFF0F172A).withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Quick Emergency Guides',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A2E),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Keep calm, read steps, and follow guidelines below to assist someone.',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF0F172A).withOpacity(0.6),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF0F172A).withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.menu_book_rounded,
              color: Color(0xFF0F172A),
              size: 26,
            ),
          ),
        ],
      ),
    );
  }

  // ── Guide Grid ──
  Widget _buildGuideGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 1.35,
      ),
      itemCount: sampleGuides.length,
      itemBuilder: (context, index) {
        return _buildGuideCard(sampleGuides[index], index);
      },
    );
  }

  Widget _buildGuideCard(Guide guide, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GuideDetailScreen(guide: guide),
          ),
        );
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300 + (index * 50)),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0F172A).withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ── Icon ──
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: guide.backgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                guide.icon,
                color: guide.iconColor,
                size: 22,
              ),
            ),
            const SizedBox(height: 12),

            // ── Title ──
            Text(
              guide.title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A2E),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── SOS Section ──
  Widget _buildSosSection() {
    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 20),
      child: Column(
        children: [
          // ── SOS Button ──
          GestureDetector(
            onLongPressStart: (_) => _onSosStart(),
            onLongPressEnd: (_) => _onSosEnd(),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content:
                      const Text('Hold for 3 seconds to trigger SOS'),
                  backgroundColor: const Color(0xFF1E3A8A),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  margin: const EdgeInsets.all(16),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                // ── Progress Ring ──
                if (_isSosHolding)
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: CircularProgressIndicator(
                      value: _sosProgress,
                      strokeWidth: 4,
                      backgroundColor: Colors.red.withValues(alpha: 0.2),
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  ),

                // ── SOS Circle ──
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: _isSosHolding ? 68 : 72,
                  height: _isSosHolding ? 68 : 72,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.red.shade400,
                        Colors.red.shade700,
                      ],
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withValues(alpha: 0.35),
                        blurRadius: _isSosHolding ? 24 : 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'SOS',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // ── SOS Label ──
          Text(
            'Hold for 3 seconds to trigger SOS',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF1E3A8A),
            ),
          ),
        ],
      ),
    );
  }
}
