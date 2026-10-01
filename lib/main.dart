import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const RiteshPortfolio());
}

Future<void> openLink(String url) async {
  final uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }
}

class RiteshPortfolio extends StatelessWidget {
  const RiteshPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ritesh Guduru | Portfolio',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0E17),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5B8CFF),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: 'Arial',
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatelessWidget {
  const PortfolioHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeroSection(),
            AboutSection(),
            SkillsSection(),
            ProjectsSection(),
            EducationSection(),
            ContactSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// HERO
// ============================================================

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 650),
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 80,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0A0E17),
            Color(0xFF111A31),
            Color(0xFF0A0E17),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 700;

              return Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: isMobile
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                      children: [
                        Text(
                          'HELLO, I\'M',
                          style: TextStyle(
                            color: Colors.blueAccent.shade100,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3,
                          ),
                        ),
                        const SizedBox(height: 15),

                        const Text(
                          'Ritesh Guduru',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 52,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -1,
                          ),
                        ),

                        const SizedBox(height: 15),

                        const Text(
                          'Electrical & Computer Engineering Student',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white70,
                          ),
                        ),

                        const SizedBox(height: 20),

                        const SizedBox(
                          width: 650,
                          child: Text(
                            'Building projects, exploring technology, '
                            'and turning ideas into real-world applications.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              height: 1.7,
                              color: Colors.white60,
                            ),
                          ),
                        ),

                        const SizedBox(height: 35),

                        Wrap(
                          spacing: 15,
                          runSpacing: 15,
                          alignment: WrapAlignment.center,
                          children: [
                            FilledButton.icon(
                              onPressed: () {
                                // Projects are below on the page.
                                // Scroll manually for now.
                              },
                              icon: const Icon(Icons.work_outline),
                              label: const Text('View Projects'),
                            ),

                            OutlinedButton.icon(
                              onPressed: () {
                                // Resume link can be added later.
                              },
                              icon: const Icon(Icons.download_outlined),
                              label: const Text('Resume'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  if (!isMobile) const SizedBox(width: 60),

                  // Professional placeholder.
                  // A photo can be added later if you want.
                  Container(
                    width: 220,
                    height: 220,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF5B8CFF),
                          Color(0xFF8A5CFF),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.25),
                          blurRadius: 60,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.person_outline,
                        size: 100,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

// ============================================================
// ABOUT
// ============================================================

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionContainer(
      title: 'About Me',
      child: Text(
        'I am an Electrical & Computer Engineering student '
        'interested in software, machine learning, application '
        'development and technology. I enjoy learning by building '
        'projects and experimenting with new ideas.',
        style: TextStyle(
          fontSize: 18,
          height: 1.8,
          color: Colors.white70,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

// ============================================================
// SKILLS
// ============================================================

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  final List<String> skills = const [
    'Python',
    'C / C++',
    'SQL',
    'Machine Learning',
    'MATLAB / Simulink',
    'Flutter',
    'Android Development',
    'Git',
  ];

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'Skills',
      child: Wrap(
        spacing: 15,
        runSpacing: 15,
        alignment: WrapAlignment.center,
        children: skills.map((skill) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 14,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF111827),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.white12,
              ),
            ),
            child: Text(
              skill,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ============================================================
// PROJECTS
// ============================================================

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'Projects',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth < 700
              ? constraints.maxWidth
              : (constraints.maxWidth - 30) / 2;

          return Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: [
              SizedBox(
                width: width,
                child: ProjectCard(
                  icon: Icons.account_balance_wallet_outlined,
                  title: 'Expense Tracker',
                  description:
                      'A personal expense tracking application built '
                      'with Flutter, featuring expense categories, '
                      'totals, deletion and local storage.',
                  buttons: [
                    ProjectButton(
                      label: 'GitHub',
                      icon: Icons.code,
                      url: 'https://github.com/Ritesh-503',
                    ),
                  ],
                ),
              ),

              SizedBox(
                width: width,
                child: ProjectCard(
                  icon: Icons.precision_manufacturing_outlined,
                  title: 'ML-Based Motor Load Sharing',
                  description:
                      'A machine-learning-assisted project for load '
                      'sharing between two BL motors in a conveyor-belt '
                      'prototype.',
                  buttons: [
                    ProjectButton(
                      label: 'GitHub',
                      icon: Icons.code,
                      url: 'https://github.com/Ritesh-503',
                    ),
                  ],
                ),
              ),

              SizedBox(
                width: width,
                child: ProjectCard(
                  icon: Icons.ev_station_outlined,
                  title: 'EV Charging Infrastructure Optimization',
                  description:
                      'A research project on congestion-aware '
                      'optimization of EV charging infrastructure '
                      'using real urban road networks.',
                  buttons: const [],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ProjectButton {
  final String label;
  final IconData icon;
  final String url;

  const ProjectButton({
    required this.label,
    required this.icon,
    required this.url,
  });
}

class ProjectCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final List<ProjectButton> buttons;

  const ProjectCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.buttons,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white10,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 45,
            color: Colors.blueAccent,
          ),

          const SizedBox(height: 20),

          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            description,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 16,
              height: 1.6,
            ),
          ),

          if (buttons.isNotEmpty) ...[
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: buttons.map((button) {
                return OutlinedButton.icon(
                  onPressed: () => openLink(button.url),
                  icon: Icon(button.icon, size: 18),
                  label: Text(button.label),
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }
}

// ============================================================
// EDUCATION
// ============================================================

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionContainer(
      title: 'Education',
      child: Column(
        children: [
          Text(
            'Electrical & Computer Engineering',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'Amrita Vishwa Vidyapeetham',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// ============================================================
// CONTACT
// ============================================================

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'Let\'s Connect',
      child: Column(
        children: [
          const Text(
            'Interested in working together or just want to say hello?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              color: Colors.white70,
            ),
          ),

          const SizedBox(height: 25),

          Wrap(
            spacing: 15,
            runSpacing: 15,
            alignment: WrapAlignment.center,
            children: [
              OutlinedButton.icon(
                onPressed: () {
  openLink(
    'https://mail.google.com/mail/?view=cm&fs=1&to=gudururitesh@gmail.com',
  );
                },
                
                icon: const Icon(Icons.email_outlined),
                label: const Text('Email'),
              ),

              OutlinedButton.icon(
                onPressed: () {
                  openLink(
                    'https://in.linkedin.com/in/guduru-ritesh-433308325',
                  );
                },
                icon: const Icon(Icons.business_center_outlined),
                label: const Text('LinkedIn'),
              ),

              OutlinedButton.icon(
                onPressed: () {
                  openLink('https://github.com/Ritesh-503');
                },
                icon: const Icon(Icons.code),
                label: const Text('GitHub'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ============================================================
// FOOTER
// ============================================================

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      color: const Color(0xFF070A10),
      child: const Text(
        '© 2026 Ritesh Guduru • Built with Flutter',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white38,
        ),
      ),
    );
  }
}

// ============================================================
// REUSABLE SECTION
// ============================================================

class SectionContainer extends StatelessWidget {
  final String title;
  final Widget child;

  const SectionContainer({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1100,
          ),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 35),
              child,
            ],
          ),
        ),
      ),
    );
  }
}