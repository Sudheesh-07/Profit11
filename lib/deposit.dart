import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Deposit extends StatefulWidget {
  const Deposit({super.key});

  @override
  State<Deposit> createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset('assets/bg.png').image,
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            _Appbar(width: width, height: height),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Add this
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                  child: Text(
                    "Current Balance",
                    style: GoogleFonts.merriweatherSans(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 20.0, top: 10.0), // Adjusted padding
                  child: Text(
                    "₹1,00,000",
                    style: GoogleFonts.merriweatherSans(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.075,
            ),
            Text(
              "₹1,000",
              style: GoogleFonts.merriweatherSans(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Text(
              "Add Cash",
              style: GoogleFonts.merriweatherSans(
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Add this
              children: [
                _AddCashButton(amount: "100+"),
                _AddCashButton(amount: "500+"),
                _AddCashButton(amount: "1000+"),
              ],
            ),
            SizedBox(height: height * 0.35),
            Divider(
              color: Colors.white,
              thickness: 0.5,
            ),
            _WithdrawButton()
          ],
        ),
      ),
    );
  }
}

class _Appbar extends StatelessWidget {
  final double width;
  final double height;
  const _Appbar({required this.height, required this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.2,
      width: width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Color(0xFFFFFFFF)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start, // Add this
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButton(
              color: Colors.white,
            ),
            SizedBox(width: width * 0.2), // Add spacing
            Center(
              child: Text(
                "Add Cash",
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddCashButton extends StatelessWidget {
  final String amount;
  const _AddCashButton({required this.amount, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          const Size(95, 35), // Set the same size as the Container
        ),
        backgroundColor: MaterialStateProperty.all(
          const Color.fromARGB(0, 0, 0, 0), // Transparent background
        ),
        shadowColor: MaterialStateProperty.all(
          const Color.fromARGB(0, 255, 255, 255), // No shadow color
        ),
        elevation: MaterialStateProperty.all(0), // Remove elevation
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Rounded corners
            side: BorderSide(
              width: 0.5,
              color: Color(0xFFFFFFFF), // White border
            ),
          ),
        ),
      ),
      onPressed: () {
        // Add your onPressed logic here
      },
      child: Text(
        amount,
        style: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _WithdrawButton extends StatelessWidget {
  const _WithdrawButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          const Size(324, 54), // Set the same size as the Container
        ),
        backgroundColor: MaterialStateProperty.all(
          const Color(0xFF020A24), // Transparent background
        ),
        elevation: MaterialStateProperty.all(0), // Remove elevation
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Rounded corners
            side: BorderSide(
              width: 0.5,
              color: Color(0xFFFFFFFF), // White border
            ),
          ),
        ),
      ),
      onPressed: () {
        // Add your onPressed logic here
      },
      child: Text(
        "Rs 1,000",
        style: GoogleFonts.merriweatherSans(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
    ;
  }
}
