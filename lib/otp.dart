import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Column(children: [
      _Appbar(width: width, height: height),
      Padding(
        padding: const EdgeInsets.only(top: 81.0, left: 39.0, right: 39.0),
        child: OTPInput(width: width, height: height),
      ),
      SizedBox(height: height * 0.02),
      Text(
        "Verification Code has been send to",
        style: GoogleFonts.inter(
            fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
      ),
      SizedBox(height: height * 0.01),
      Text(
        "+91 9874561230", //number form the backend will come here
        style: GoogleFonts.inter(
            fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
      ),
      SizedBox(height: height * 0.25),
      _VerifyButton(),
      SizedBox(height: height * 0.02),
      Text("Didn't Received the OTP",
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
      )),
      TextButton(
          onPressed: () {},
          child: Text("Resend OTP",
              style: GoogleFonts.inter(
                backgroundColor: Colors.transparent,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              )))
    ]));
  }
}

class _Appbar extends StatelessWidget {
  final double width;
  final double height;
  const _Appbar({required this.height, required this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height * 0.25,
        width: width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
          gradient: LinearGradient(
            begin: Alignment(0.0, -2.2),
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF007BFF), // Start color
              const Color(0xFF020A24), // End color
            ],
          ),
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 40.0, left: 20.0, right: 20.0, bottom: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: BackButton(
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.04),
            child: Text(
              "Verify Phone number",
              style: GoogleFonts.inter(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ]));
  }
}

class OTPInput extends StatefulWidget {
  final double width;
  final double height;
  const OTPInput({required this.height, required this.width, super.key});

  @override
  _OTPInputState createState() => _OTPInputState();
}

class _OTPInputState extends State<OTPInput> {
  // List to store the focus nodes for each input field
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  // List to store the text controllers for each input field
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());

  // Concatenated OTP string
  String _otp = '';

  @override
  void initState() {
    super.initState();
    // Add listeners to each controller to update the OTP string
    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i].addListener(() {
        _updateOTP();
      });
    }
  }

  @override
  void dispose() {
    // Dispose focus nodes and controllers
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  // Update the OTP string whenever a field changes
  void _updateOTP() {
    setState(() {
      _otp = _controllers.map((controller) => controller.text).join();
    });
    print("Current OTP: $_otp"); // Print the OTP for debugging
  }

  // Move focus to the next field
  void _moveToNextField(int index, String value) {
    if (value.isNotEmpty && index < _controllers.length - 1) {
      _focusNodes[index + 1].requestFocus();
    }
  }

  // Move focus to the previous field on backspace
  void _moveToPreviousField(int index, String value) {
    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 13,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            6,
            (index) => Container(
              width: 36,
              height: 37,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFF109BFF),
                  width: 2,
                ),
              ),
              child: Center(
                child: TextField(
                  controller: _controllers[index],
                  focusNode: _focusNodes[index],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  decoration: const InputDecoration(
                    counterText: "",
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    _moveToNextField(index, value); // Move to next field
                    _moveToPreviousField(
                        index, value); // Move to previous field on backspace
                  },
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20), // Spacing
        Text(
          "OTP: $_otp", // Display the concatenated OTP
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _VerifyButton extends StatelessWidget {
  const _VerifyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 212,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF007BFF), // Start color
            Color(0xFF020A24), // End color
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10), 
          ),
        ),
          child: Center(
            child: Text(
              "Verify",
              style: GoogleFonts.robotoSlab(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        
        onPressed: () {},
      ),
    );
  }
}
