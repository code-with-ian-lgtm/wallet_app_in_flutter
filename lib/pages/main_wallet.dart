import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainWallet extends StatefulWidget {
  const MainWallet({Key? key}) : super(key: key);

  @override
  _MainWalletState createState() => _MainWalletState();
}

class _MainWalletState extends State<MainWallet> {
  final List<Map<String, String>> transactions = [
    {
      'bank': 'Absa',
      'title': 'Deposit from Absa Account',
      'amount': '+ KES 1,000.00',
      'date': '2024-10-08',
    },
    {
      'bank': 'Santander',
      'title': 'Withdraw to Santander Bank',
      'amount': '- KES 500.00',
      'date': '2024-10-07',
    },
    {
      'bank': 'Equity',
      'title': 'Payment to Equity Bank',
      'amount': '- KES 1,200.00',
      'date': '2024-10-06',
    },
    {
      'bank': 'KCB',
      'title': 'Transfer from M-Pesa Account',
      'amount': '+ KES 3,000.00',
      'date': '2024-10-05',
    },
    {
      'bank': 'Cooperative Bank',
      'title': 'Payment from KCB Bank',
      'amount': '- KES 800.00',
      'date': '2024-10-04',
    },
  ];

  double walletBalance = 50992.00;

  @override
  Widget build(BuildContext context) {
     final formattedBalance = NumberFormat("#,##0.00", "en_US").format(walletBalance);
    return Scaffold(
      
      backgroundColor: Theme.of(context).colorScheme.background,

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Large Card for Wallet Info
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // User Image
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://yt3.googleusercontent.com/uucuH7R67rx2LXSY5W_e_c_Bx2yrHzdBjMFDidsB0nSzS2ew0MCCRIz5srstvo0ukjCCIheX=s160-c-k-c0x00ffffff-no-rj',
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Wallet Balance with Animation
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      style:  TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      child: Text('KES ${formattedBalance}'),
                    ),
                    const SizedBox(height: 24),
                    // Action Icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildActionIcon(Icons.send, 'Send', () {
                          _showQuickTransferModal(context);
                        }),
                        _buildActionIcon(Icons.remove, 'Withdraw', () {
                          _showWithdrawModal(context);
                        }),
                        _buildActionIcon(Icons.qr_code_scanner, 'Scan', () {
                          _showScanModal(context);
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Recent Transactions Header
            const Text(
              'Recent Transactions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Recent Transactions List
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length, 
                itemBuilder: (context, index) {
                  final transaction = transactions[index]; 
                  return ListTile(
                    leading: _getBankIcon(transaction['bank']),
                    title: Text(transaction['title']!),
                    subtitle: Text(transaction['amount']!),
                    trailing: Text(transaction['date']!),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add functionality for quick actions
        },
        child:  const Icon(Icons.add),
        tooltip: 'Add Money',
      ),
    );
  }

  Widget _getBankIcon(String? bank) {
    switch (bank) {
      case 'Absa':
        return ClipRRect(borderRadius:BorderRadius.circular(10),child:  Image.asset('lib/assets/absa.jpeg', width: 40, height: 40));
      case 'Santander':
        return ClipRRect(borderRadius:BorderRadius.circular(10),child: Image.asset('lib/assets/santander.jpeg', width: 40, height: 40));
      case 'Equity':
        return ClipRRect(borderRadius:BorderRadius.circular(10),child: Image.asset('lib/assets/equity.jpeg', width: 40, height: 40));
      case 'KCB':
        return ClipRRect(borderRadius:BorderRadius.circular(10),child: Image.asset('lib/assets/safaricom.jpg', width: 40, height: 40));
      case 'Cooperative Bank':
        return ClipRRect(borderRadius:BorderRadius.circular(10),child: Image.asset('lib/assets/kcb.jpeg', width: 40, height: 40));
      default:
        return Image.asset('lib/assets/kcb.jpeg', width: 40, height: 40); 
    }
  }

  // Helper method to build action icons
  Widget _buildActionIcon(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 30, color: Theme.of(context).colorScheme.inversePrimary),
          const SizedBox(height: 4),
          Text(
            label,
            style:  TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          ),
        ],
      ),
    );
  }

  // Show Quick Transfer Modal
  void _showQuickTransferModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Quick Transfer', style: TextStyle(fontSize: 20)),
              const TextField(
                decoration: InputDecoration(labelText: 'Enter Amount'),
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'Recipient\'s Phone'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Logic to handle transfer
                  Navigator.pop(context); // Close the modal
                },
                child: const Text('Transfer'),
              ),
            ],
          ),
        );
      },
    );
  }

  // Show Withdraw Modal
  void _showWithdrawModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Withdraw Funds',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle withdrawal logic here
                  Navigator.pop(context);
                },
                child: const Text('Confirm Withdrawal'),
              ),
            ],
          ),
        );
      },
    );
  }

  // Show Scan Modal
  void _showScanModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Scan QR Code',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Point your camera at the QR code to scan.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle scan logic here
                  Navigator.pop(context);
                },
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }
}
