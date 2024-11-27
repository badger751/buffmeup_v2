import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  String? _verificationId;

  Future<void> _verifyPhoneNumber() async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: _phoneController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          _showSuccessPopup();
        },
        verificationFailed: (FirebaseAuthException e) {
          _showMessage(context, "Verification failed: ${e.message}");
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            _verificationId = verificationId;
          });
          _showMessage(context, "Verification code sent!");
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            _verificationId = verificationId;
          });
          // Handle potential automatic code retrieval timeout here (optional)
        },
      );
    } catch (e) {
      _showMessage(context, "An error occurred: $e");
    }
  }

  Future<void> _verifyOtp() async {
    final otp = _otpController.text;
    if (otp.length != 6) {
      _showMessage(context, "Please enter a valid 6-digit code.");
      return;
    }

    try {
      final phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otp,
      );

      await _auth.signInWithCredential(phoneAuthCredential);
      // User signed in successfully!
      _showSuccessPopup();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-verification-code':
          _showMessage(context, "Invalid verification code.");
          break;
        case 'invalid-verification-id':
          _showMessage(context, "Invalid verification ID.");
          break;
        case 'network-request-failed':
          _showMessage(context, "Network request failed.");
          break;
        default:
          _showMessage(context, "An error occurred: ${e.message}");
      }
    } catch (e) {
      _showMessage(context, "An unexpected error occurred: $e");
    }
  }

  void _showSuccessPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Verification Successful'),
          content: const Text('You have been successfully verified.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // You might want to navigate to the home screen or other desired screen here.
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                prefixText: '+', // Assuming international phone numbers
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _otpController,
              decoration: const InputDecoration(
                labelText: 'Verification Code',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _verifyPhoneNumber,
                  child: const Text('Send Code'),
                ),
                ElevatedButton(
                  onPressed: _verificationId != null ? _verifyOtp : null,
                  child: const Text('Verify'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}