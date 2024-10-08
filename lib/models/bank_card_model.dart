import 'package:flutter/material.dart';
import 'package:wallet_app/components/my_bank_card.dart';
import 'package:wallet_app/models/bank_card_data.dart';
import 'dart:math'; 

class BankCardsList extends StatefulWidget {
  @override
  _BankCardsListState createState() => _BankCardsListState();
}

class _BankCardsListState extends State<BankCardsList> {
  final List<VirtualBankCardData> cards = [
    VirtualBankCardData('ABSA BANK', 'lib/assets/ic_visa.png', 'Tech With Ian', Color(0xFF1C1C1C), Color(0xFFE5E5E5)),
  ];

  // Function to generate a random color
  Color _generateRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256), // Random Red
      random.nextInt(256), // Random Green
      random.nextInt(256), // Random Blue
    );
  }

  void _showAddCardDialog() {
    final TextEditingController bankNameController = TextEditingController();
    final TextEditingController cardHolderController = TextEditingController();
    final String imagePath = 'lib/assets/ic_visa.png'; 

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Virtual Bank Card'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: bankNameController,
                decoration: const InputDecoration(labelText: 'Bank Name'),
              ),
              TextField(
                controller: cardHolderController,
                decoration: const InputDecoration(labelText: 'Card Holder'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  // Generate random colors for the new card
                  Color color1 = _generateRandomColor();
                  Color color2 = _generateRandomColor();

                  cards.add(VirtualBankCardData(
                    bankNameController.text,
                    imagePath,
                    cardHolderController.text,
                    color1, 
                    color2, 
                  ));
                });
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, 
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (var card in cards)
            VirtualBankCard(
              bankName: card.bankName,
              imagePath: card.imagePath,
              cardHolder: card.cardHolder,
              color1: card.color1,
              color2: card.color2,
            ),
          // Plus icon to add new card
          IconButton(
            icon: const Icon(Icons.add_circle, size: 60, color: Colors.blue),
            onPressed: _showAddCardDialog,
          ),
        ],
      ),
    );
  }
}
