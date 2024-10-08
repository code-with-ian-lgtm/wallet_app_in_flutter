import 'package:flutter/material.dart';

class ServicesRow extends StatelessWidget {
  const ServicesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // QR Code Icon
                Card(
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(Icons.qr_code),
                  ),
                ),
                // Add Icon
                Card(
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ),

          // First Card: Trips and Training
          Card(
            elevation: 4,
            child: Container(
              height: 100,
              width: 130,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.mode_of_travel_rounded,
                      size: 40,
                      ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0), 
                    child: Text(
                      "Trips and Training",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                  ),
                   SizedBox(height: 5,),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),

          // Second Card: All Services
          Card(
            elevation: 4,
            child: Expanded(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 1),
                  color: Theme.of(context).colorScheme.secondary
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.dashboard,
                        size: 40,
                        ),
                    ),
                     Spacer(),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0), 
                      child: Text(
                        "All Services",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,

                        ),
                        ),
                    ),
                     SizedBox(height: 5,)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
