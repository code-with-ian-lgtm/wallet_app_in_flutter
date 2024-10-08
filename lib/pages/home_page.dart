import 'package:flutter/material.dart';
import 'package:wallet_app/components/my_custom_appbar.dart';
import 'package:wallet_app/models/bank_card_model.dart';
import 'package:wallet_app/pages/ad_sliders_row.dart';
import 'package:wallet_app/pages/expenses_page.dart';
import 'package:wallet_app/pages/main_wallet.dart';
import 'package:wallet_app/pages/quick_actions_row.dart';
import 'package:wallet_app/pages/services_row.dart'; 

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; 
  final PageController _pageController = PageController(); 

  // List of pages to navigate to
  final List<Widget> _pages = [
    HomeContent(), 
    ExpensesPage(),
    MainWallet() ,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; 
    });
    _pageController.jumpToPage(index); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const CustomAppBar(),
      ),
      body: PageView(
        controller: _pageController, 
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index; 
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Expenses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Wallet',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped, 
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Bank Cards
          SizedBox(
            height: 250,
            child: BankCardsList(),
          ),
          // Quick Actions row
          const QuickActions(),
          const SizedBox(height: 10),
          const ServicesRow(),
          const SizedBox(height: 10),
          const AdSliderRow(),
        ],
      ),
    );
  }
}

