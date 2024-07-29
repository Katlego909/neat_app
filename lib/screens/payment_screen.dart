import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:neat_test_app/models/booking_model.dart';
import 'package:neat_test_app/providers/booking_provider.dart';
import 'package:neat_test_app/screens/my_bookings_screen.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  final Booking booking;

  const PaymentScreen({super.key, required this.booking});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbfc3b4),
      appBar: AppBar(
        title: Text('Payment'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
                onCreditCardWidgetChange: (CreditCardBrand) {},
              ),
              CreditCardForm(
                onCreditCardModelChange: (creditCardModel) {
                  setState(() {
                    cardNumber = creditCardModel.cardNumber;
                    expiryDate = creditCardModel.expiryDate;
                    cardHolderName = creditCardModel.cardHolderName;
                    cvvCode = creditCardModel.cvvCode;
                    isCvvFocused = creditCardModel.isCvvFocused;
                  });
                },
                themeColor: Theme.of(context).primaryColor,
                formKey: GlobalKey<FormState>(),
                cardNumber: '',
                expiryDate: '',
                cardHolderName: '',
                cvvCode: '',
              ),
              SizedBox(
                height: 16,
              ),
              _isProcessing
                  ? CircularProgressIndicator()
                  : GestureDetector(
                      onTap: _confirmPayment,
                      child: Container(
                        padding: EdgeInsets.all(14),
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          color: Color(0xff007ba7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Confirm Payment",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void _confirmPayment() async {
    setState(() {
      _isProcessing = true;
    });

    // Simulate payment processing (you may replace this with actual payment processing logic)
    await Future.delayed(Duration(seconds: 2));

    // Mark booking as completed
    widget.booking.status = 'Completed';
    context.read<BookingProvider>().addBooking(widget.booking);

    // Navigate to the confirmation page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentConfirmationPage(),
      ),
    );

    setState(() {
      _isProcessing = false;
    });
  }
}

class PaymentConfirmationPage extends StatelessWidget {
  const PaymentConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbfc3b4),
      appBar: AppBar(
        title: Text('Payment Confirmation'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 100),
              SizedBox(height: 20),
              Text(
                'Payment Successful!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                child: Container(
                  padding: EdgeInsets.all(14),
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Go Back",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     // Navigate back to the home screen or any other desired screen
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => MyBookingsPage(),
              //       ),
              //     );
              //   },
              //   child: Text('View Bookings'),
              // ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyBookingsPage(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(14),
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: Color(0xff007ba7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "View Bookings",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
