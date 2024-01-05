import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'flight_booking_app.dart';
import 'flight_model.dart';

/*class FlightListScreen extends StatelessWidget {
  final List<Flight> flights;

  FlightListScreen(this.flights);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flight List'),
      ),
      body: ListView.builder(
        itemCount: flights.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${flights[index].flightNumber} - ${flights[index].airline}'),
            subtitle: Text('${flights[index].departureTime} - \$${flights[index].price}'),
            onTap: () {
              // Navigate to the flight details screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FlightDetailsScreen(flights[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}*/


class FlightList extends StatelessWidget {
  final List<Flight> searchResults;
  final List<Flight> flights;
  final Function(Flight) onBook;

  FlightList({required this.searchResults ,required this.flights, required this.onBook,});

  @override
  Widget build(BuildContext context) {
    print("searchResults.length");
    print(searchResults.length);
    return Expanded(
      child: searchResults.length<1
          ? flights.isEmpty ?Center(
        child: Text('No flights found'),
      ) : ListView.builder(
        itemCount: flights.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${flights[index].origin} to ${flights[index].destination}'),
            subtitle: Text(
                'Date: ${DateFormat('yyyy-MM-dd').format(flights[index].date)} | Price: \$${flights[index].price}'),
            onTap: () {
              onBook(flights[index]);
            },
          );
        },
      )
          : ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            trailing: ElevatedButton(onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('For book flight i can use same logic of game app which store the game result.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            }, child: Text("Book Flight"),),
            title: Text('${searchResults[index].origin} to ${searchResults[index].destination}'),
            subtitle: Text(
                'Date: ${DateFormat('yyyy-MM-dd').format(searchResults[index].date)} | Price: \$${searchResults[index].price}'),
            onTap: () {
              onBook(searchResults[index]);
            },
          );
        },
      ),
    );
  }
}
