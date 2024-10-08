import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ExpensesPage extends StatelessWidget {
  const ExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Chart at the top
              const Text(
                'Total Expenses',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
             Container(
      height: MediaQuery.of(context).size.height * 0.4, 
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: PieChart(
              PieChartData(
                sections: showingSections(),
                borderData: FlBorderData(show: false),
                centerSpaceRadius: 40,
                sectionsSpace: 2,
              ),
            ),
          ),
          const SizedBox(height: 10),
          _buildLegend(), 
        ],
      ),
    ),

    

              const SizedBox(height: 16),
          
              // Tab Bar for time frames
              DefaultTabController(
                length: 4, // Number of tabs
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: TabBar(
                        isScrollable: true,
                        labelColor: Colors.blueAccent,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: Colors.blueAccent,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blueAccent.withOpacity(0.2),
                        ),
                        tabs: const [
                          Tab(text: 'Day'),
                          Tab(text: 'Week'),
                          Tab(text: 'Month'),
                          Tab(text: 'Year'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.4,
                      child: TabBarView(
                        children: [
                          TransactionListView(transactions: _getDailyTransactions()),
                          TransactionListView(transactions: _getWeeklyTransactions()),
                          TransactionListView(transactions: _getMonthlyTransactions()),
                          TransactionListView(transactions: _getYearlyTransactions()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  

  // Mock transaction data for different time frames
List<Map<String, dynamic>> _getDailyTransactions() {
  return [
    {
      'name': 'Netflix Subscription',
      'amount': -1500,
      'icon': Icons.movie,
      'subtitle': 'Monthly subscription fee.'
    },
    {
      'name': 'Starbucks',
      'amount': -800,
      'icon': Icons.local_cafe,
      'subtitle': 'Coffee and snacks.'
    },
    {
      'name': 'Grocery Store',
      'amount': -1200,
      'icon': Icons.shopping_cart,
      'subtitle': 'Weekly groceries.'
    },
    {
      'name': 'Spotify Subscription',
      'amount': -500,
      'icon': Icons.music_note,
      'subtitle': 'Music streaming service.'
    },
    {
      'name': 'Domino’s Pizza',
      'amount': -2000,
      'icon': Icons.fastfood,
      'subtitle': 'Dinner order.'
    },
  ];
}

List<Map<String, dynamic>> _getWeeklyTransactions() {
  return [
    {
      'name': 'Rent',
      'amount': -15000,
      'icon': Icons.house,
      'subtitle': 'Monthly rent payment.'
    },
    {
      'name': 'Salary',
      'amount': 50000,
      'icon': Icons.attach_money,
      'subtitle': 'Monthly salary credit.'
    },
    {
      'name': 'Utilities',
      'amount': -3000,
      'icon': Icons.flash_on,
      'subtitle': 'Electricity and water bill.'
    },
    {
      'name': 'Adidas Shoes',
      'amount': -7000,
      'icon': Icons.sports_soccer,
      'subtitle': 'New sports shoes purchase.'
    },
    {
      'name': 'Amazon Purchase',
      'amount': -4000,
      'icon': Icons.shopping_bag,
      'subtitle': 'Online shopping order.'
    },
  ];
}

List<Map<String, dynamic>> _getMonthlyTransactions() {
  return [
    {
      'name': 'Car Insurance',
      'amount': -1200,
      'icon': Icons.directions_car,
      'subtitle': 'Monthly insurance premium.'
    },
    {
      'name': 'Gym Membership',
      'amount': -1500,
      'icon': Icons.fitness_center,
      'subtitle': 'Monthly gym fee.'
    },
    {
      'name': 'Freelance Income',
      'amount': 4000,
      'icon': Icons.work,
      'subtitle': 'Income from freelance work.'
    },
    {
      'name': 'Spotify Premium',
      'amount': -2000,
      'icon': Icons.music_note,
      'subtitle': 'Premium music subscription.'
    },
    {
      'name': 'Netflix Annual Plan',
      'amount': -18000,
      'icon': Icons.movie,
      'subtitle': 'Annual streaming plan.'
    },
  ];
}

List<Map<String, dynamic>> _getYearlyTransactions() {
  return [
    {
      'name': 'Vacation',
      'amount': -50000,
      'icon': Icons.airplanemode_active,
      'subtitle': 'Trip to the beach.'
    },
    {
      'name': 'Investment Income',
      'amount': 20000,
      'icon': Icons.assessment,
      'subtitle': 'Returns from investments.'
    },
    {
      'name': 'Tax Refund',
      'amount': 10000,
      'icon': Icons.receipt,
      'subtitle': 'Refund from taxes paid.'
    },
    {
      'name': 'New Laptop',
      'amount': -120000,
      'icon': Icons.laptop,
      'subtitle': 'Upgraded work laptop.'
    },
    {
      'name': 'Home Renovation',
      'amount': -250000,
      'icon': Icons.home_repair_service,
      'subtitle': 'Remodeling the kitchen.'
    },
  ];
}

 Widget _buildLegend() {
    final sections = showingSections();
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: sections.map((section) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: section.color,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _getSectionTitle(section.color), 
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  String _getSectionTitle(Color color) {
    switch (color) {
      case Colors.blue:
        return 'Food';
      case Colors.red:
        return 'Rent';
      case Colors.green:
        return 'Utilities';
      case Colors.orange:
        return 'Ent';
      case Colors.purple:
        return 'Others';
      default:
        return '';
    }
  }
}

  List<PieChartSectionData> showingSections() {
  return [
    PieChartSectionData(
      color: Colors.blue,
      value: 30, // 30% for Food
      title: '',
      radius: 40,
    ),
    PieChartSectionData(
      color: Colors.red,
      value: 40, // 40% for Rent
      title: '',
      radius: 40,
    ),
    PieChartSectionData(
      color: Colors.green,
      value: 15, // 15% for Utilities
      title: '',
      radius: 40,
    ),
    PieChartSectionData(
      color: Colors.orange,
      value: 10, // 10% for Entertainment
      title: '',
      radius: 40,
    ),
    PieChartSectionData(
      color: Colors.purple,
      value: 5, // 5% for Miscellaneous
      title: '',
      radius: 40,
    ),
  ];
}



class TransactionListView extends StatelessWidget {
  final List<Map<String, dynamic>> transactions;

  const TransactionListView({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4, 
          child: ListTile(
            contentPadding: const EdgeInsets.all(6), 
            leading: Icon(
              transaction['icon'], 
              color: transaction['amount'] < 0 ? Colors.green : Colors.green,
              size: 26, 
            ),
            title: Text(
              transaction['name'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16, 
              ),
            ),
            subtitle: Text(
              transaction['subtitle'], 
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14, 
              ),
            ),
            trailing: Text(
              '${transaction['amount']}',
              style: TextStyle(
                color: transaction['amount'] < 0 ? Colors.red : Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 16, 
              ),
            ),
          ),
        );
      },
    );
  }
}
