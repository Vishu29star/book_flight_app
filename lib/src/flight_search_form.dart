import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'flight_list_screen.dart';
import 'flight_model.dart';

/*class FlightSearchScreen extends StatefulWidget {
  @override
  _FlightSearchScreenState createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<FlightSearchScreen> {
  String origin = '';
  String destination = '';
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flight Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  origin = value;
                });
              },
              decoration: InputDecoration(labelText: 'Origin'),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  destination = value;
                });
              },
              decoration: InputDecoration(labelText: 'Destination'),
            ),
            Row(
              children: [
                Text('Select Date:'),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    _selectDate(context);
                  },
                  child: Text(DateFormat('yyyy-MM-dd').format(selectedDate)),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _searchFlights(context);
              },
              child: Text('Search Flights'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _searchFlights(BuildContext context) {
    // Perform flight search logic (not implemented in this example)
    // In a real app, you would call a flight booking API here
    // and update the state with the search results.

    // For simplicity, let's assume there are some flights found.
    List<Flight> flights = [
      Flight('ABC123', 'Airline A', '10:00 AM', 150.0),
      Flight('XYZ456', 'Airline B', '02:30 PM', 200.0),
    ];

    // Navigate to the flight list screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FlightListScreen(flights),
      ),
    );
  }
}*/
class FlightSearchForm extends StatefulWidget {
  final Function(String, String, DateTime) onSearch;
  FlightSearchForm({required this.onSearch});

  @override
  State<FlightSearchForm> createState() => _FlightSearchFormState();
}

class _FlightSearchFormState extends State<FlightSearchForm> {
  final TextEditingController originController = TextEditingController();

  final TextEditingController destinationController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: originController,
            decoration: InputDecoration(
                labelText: 'Origin'),
          ),
          TextFormField(
            controller: destinationController,
            decoration: InputDecoration(labelText: 'Destination'),
          ),
          Row(
            children: [
              Text('Select Date:'),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  _selectDate(context);
                },
                child: Text(DateFormat('yyyy-MM-dd').format(selectedDate)),
              ),
            ],
          ),

          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              String origin = originController.text.trim();
              String destination = destinationController.text.trim();
              widget.onSearch(origin, destination, selectedDate);

              // TODO: Implement logic to display search results
            },
            child: Text('Search Flights'),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}