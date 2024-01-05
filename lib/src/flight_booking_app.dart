import 'package:flutter/material.dart';

import 'flight_list_screen.dart';
import 'flight_model.dart';
import 'flight_search_form.dart';

/*class FlightDetailsScreen extends StatelessWidget {
  final Flight flight;

  FlightDetailsScreen(this.flight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flight Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Flight Number: ${flight.flightNumber}'),
            Text('Airline: ${flight.airline}'),
            Text('Departure Time: ${flight.departureTime}'),
            Text('Price: \$${flight.price}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Perform booking logic (not implemented in this example)
                // In a real app, you would call a flight booking API here
                // and handle the booking process.

                // For simplicity, let's display a confirmation dialog.
                _showConfirmationDialog(context);
              },
              child: Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking Confirmation'),
          content: Text('Your flight has been booked successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}*/
class FlightBookingApp extends StatefulWidget {
  @override
  _FlightBookingAppState createState() => _FlightBookingAppState();
}

class _FlightBookingAppState extends State<FlightBookingApp> {
  late List<Flight> flights;
  List<Flight> searchResults = [];

  @override
  void initState() {
    super.initState();
    flights = List.generate(
      10,
          (index) => Flight(
        id: index.toString(),
        origin: 'City $index',
        destination: 'City ${index + 1}',
        date: DateTime.now().add(Duration(days: index)),
        price: (index + 1) * 100.0,
      ),
    );
  }

  List<Flight> searchFlights(String origin, String destination, DateTime date) {
    print("origin - $origin");
    print("destination - $destination");
    print("date - $date");
    return flights.where((flight) {
      if(origin.isEmpty){
        if(destination.isEmpty){
          return flight.date.year == date.year &&
              flight.date.month == date.month &&
              flight.date.day == date.day;
        }
        else{
          return  destination.toLowerCase() == flight.destination.toLowerCase() &&
            flight.date.year == date.year &&
              flight.date.month == date.month &&
              flight.date.day == date.day;
        }


      }else{
        if(destination.isEmpty){
          return origin.toLowerCase() == flight.origin.toLowerCase() &&
              flight.date.year == date.year &&
              flight.date.month == date.month &&
              flight.date.day == date.day;
        }
        else{
          return  origin.toLowerCase() == flight.origin.toLowerCase() &&
              destination.toLowerCase() == flight.destination.toLowerCase() &&
              flight.date.year == date.year &&
              flight.date.month == date.month &&
              flight.date.day == date.day;
        }
      }
    }).toList();
  }

  void bookFlight(Flight flight) {
    // TODO: Implement booking logic
    print('Booking flight: ${flight.id}');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Flight Booking App'),
            actions: [
              IconButton(onPressed: (){  searchResults.clear();
              setState(() {
              });}, icon: Icon(Icons.clear))
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlightSearchForm
                (
                onSearch: (origin, destination, date) {
        setState(() {
        searchResults = searchFlights(origin, destination, date);
        print("ygthujikol" + searchResults.length.toString());
        });
        },),
              FlightList(searchResults:searchResults, flights: flights, onBook: bookFlight,),
            ],
          ),
        ),
      ),
    );
  }
}
