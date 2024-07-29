// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:neat_test_app/models/booking_model.dart';
import 'package:neat_test_app/models/service_provider_model.dart';

import 'package:neat_test_app/screens/review_screen.dart';

class BookingForm extends StatefulWidget {
  final ServiceProvider serviceProvider;

  const BookingForm({super.key, required this.serviceProvider});

  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isSubmitting = false;
  String? _selectedMainService;
  final List<String> _selectedAdditionalServices = [];
  double _totalPrice = 0.0;

  final List<String> _availableDates = [
    '2024-07-30',
    '2024-07-31',
    '2024-08-01',
  ];

  final Map<String, List<String>> _availableTimeSlots = {
    '2024-07-30': ['10:00', '12:00', '14:00'],
    '2024-07-31': ['11:00', '13:00', '15:00'],
    '2024-08-01': ['09:00', '11:00', '13:00'],
  };

  String? _selectedDate;
  String? _selectedTimeSlot;

  @override
  void initState() {
    super.initState();
  }

  void _updateTotalPrice() {
    double totalPrice =
        widget.serviceProvider.servicesWithPrices[_selectedMainService] ?? 0.0;
    if (_selectedAdditionalServices.isNotEmpty) {
      for (var service in _selectedAdditionalServices) {
        totalPrice += widget.serviceProvider.additionalServices[service]!;
      }
    }
    setState(() {
      _totalPrice = totalPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book ${widget.serviceProvider.name}'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Main Service',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: widget.serviceProvider.servicesWithPrices.keys
                      .map((serviceName) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: ChoiceChip(
                              label: Text(
                                '$serviceName (R${widget.serviceProvider.servicesWithPrices[serviceName]!.toStringAsFixed(2)})',
                                style: TextStyle(
                                  color: _selectedMainService == serviceName
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              selected: _selectedMainService == serviceName,
                              selectedColor: Colors.blue,
                              onSelected: (selected) {
                                setState(() {
                                  _selectedMainService =
                                      selected ? serviceName : null;
                                });
                                _updateTotalPrice();
                              },
                            ),
                          ))
                      .toList(),
                ),
                SizedBox(height: 16),
                Text(
                  'Select Additional Services',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: widget.serviceProvider.additionalServices.keys
                      .map((serviceName) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: FilterChip(
                              label: Text(
                                '$serviceName (R${widget.serviceProvider.additionalServices[serviceName]!.toStringAsFixed(2)})',
                                style: TextStyle(
                                  color: _selectedAdditionalServices
                                          .contains(serviceName)
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              selected: _selectedAdditionalServices
                                  .contains(serviceName),
                              selectedColor: Colors.blue,
                              onSelected: (selected) {
                                setState(() {
                                  if (selected) {
                                    _selectedAdditionalServices
                                        .add(serviceName);
                                  } else {
                                    _selectedAdditionalServices
                                        .remove(serviceName);
                                  }
                                });
                                _updateTotalPrice();
                              },
                            ),
                          ))
                      .toList(),
                ),
                SizedBox(height: 16),
                FormBuilderTextField(
                  name: 'address',
                  decoration: InputDecoration(
                      labelText: 'Address',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white),
                ),
                SizedBox(height: 16),
                Text(
                  'Select Date and Time',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                      child: FormBuilderDropdown(
                        name: 'date',
                        decoration: InputDecoration(
                            labelText: 'Date',
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white),
                        items: _availableDates
                            .map((date) => DropdownMenuItem(
                                  value: date,
                                  child: Text(date),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedDate = value;
                            _selectedTimeSlot = null;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: FormBuilderDropdown(
                        name: 'time',
                        decoration: InputDecoration(
                            labelText: 'Time',
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white),
                        items: (_selectedDate != null
                                ? _availableTimeSlots[_selectedDate]!
                                : [])
                            .map((time) => DropdownMenuItem(
                                  value: time,
                                  child: Text(time),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedTimeSlot = value as String?;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                FormBuilderTextField(
                  name: 'notes',
                  decoration: InputDecoration(
                      labelText: 'Notes',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white),
                ),
                SizedBox(height: 16),
                Text(
                  'Total Price: R${_totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: _isSubmitting ? null : _onSubmit,
                  child: Container(
                    padding: EdgeInsets.all(14),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xff007ba7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Continue",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSubmit() {
    if (_formKey.currentState!.saveAndValidate()) {
      setState(() {
        _isSubmitting = true;
      });

      final formValues = _formKey.currentState!.value;

      final date = _selectedDate!;
      final time = _selectedTimeSlot!;

      // Calculate total price
      double totalPrice =
          widget.serviceProvider.servicesWithPrices[_selectedMainService] ??
              0.0;
      if (_selectedAdditionalServices.isNotEmpty) {
        for (var service in _selectedAdditionalServices) {
          totalPrice += widget.serviceProvider.additionalServices[service]!;
        }
      }

      final newBooking = Booking(
        providerId: widget.serviceProvider.name,
        service: _selectedMainService!,
        price: totalPrice,
        date: date,
        time: time,
        userNotes: formValues['notes'] ?? '',
        address: formValues['address'], // Include address
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Review(
              booking: newBooking, serviceProvider: widget.serviceProvider),
        ),
      ).then((_) {
        setState(() {
          _isSubmitting = false;
        });
      });
    }
  }
}
