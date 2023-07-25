import 'package:flutter/material.dart';
import 'package:police_app/src/screens/register_individual_screen.dart';

import '../components/custom_app_bar_widget.dart';
import 'home_screen.dart';

class PageviewScreen extends StatefulWidget {
  const PageviewScreen({super.key});

  @override
  State<PageviewScreen> createState() => _PageviewScreenState();
}

class _PageviewScreenState extends State<PageviewScreen> {
  PageController _pageviewController = PageController();

  int _pageviewIndex = 0;

  @override
  void dispose() {
    _pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const CustomAppBarWidget(),
              const SizedBox(height: 25),
              Expanded(
                child: PageView(
                  onPageChanged: (page) {
                    if (mounted) {
                      setState(() => _pageviewIndex = page);
                    }
                  },
                  controller: _pageviewController,
                  children: const [
                    HomeScreen(),
                    RegisterIndividualScreen(),
                    SizedBox(),
                    SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (itemIndex) => _pageviewController.animateToPage(
          itemIndex,
          duration: const Duration(milliseconds: 140),
          curve: Curves.ease,
        ),
        currentIndex: _pageviewIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.white.withOpacity(.8),
        unselectedFontSize: 14,
        selectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(label: "Casa", icon: Icon(Icons.home_filled)),
          BottomNavigationBarItem(label: "Indivíduos", icon: Icon(Icons.person)),
          BottomNavigationBarItem(label: "Seguro", icon: Icon(Icons.shield_rounded)),
          BottomNavigationBarItem(label: "Antecedentes", icon: Icon(Icons.access_time_filled_rounded)),
        ],
      ),
    );
  }
}
