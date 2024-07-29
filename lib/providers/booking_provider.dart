import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/booking_model.dart';

class BookingProvider with ChangeNotifier {
  List<Booking> _bookings = [];

  BookingProvider() {
    _loadBookings();
  }

  List<Booking> get bookings => _bookings;

  Future<void> _loadBookings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? bookingsData = prefs.getString('bookings');
    if (bookingsData != null) {
      List<dynamic> jsonList = jsonDecode(bookingsData);
      _bookings = jsonList.map((json) => Booking.fromJson(json)).toList();
      notifyListeners();
    }
  }

  Future<void> _saveBookings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String bookingsData =
        jsonEncode(_bookings.map((booking) => booking.toJson()).toList());
    await prefs.setString('bookings', bookingsData);
  }

  void addBooking(Booking booking) {
    booking.status = 'Pending'; // Ensure the status is set to "Pending"
    _bookings.add(booking);
    _saveBookings();
    notifyListeners();
  }

  void editBooking(int index, Booking updatedBooking) {
    _bookings[index] = updatedBooking;
    _saveBookings();
    notifyListeners();
  }

  void cancelBooking(int index) {
    _bookings[index].status = 'Cancelled';
    _saveBookings();
    notifyListeners();
  }

  void deleteBooking(int index) {
    _bookings.removeAt(index);
    _saveBookings();
    notifyListeners();
  }
}
