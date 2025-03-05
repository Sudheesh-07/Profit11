import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'assets/login_bg.png',
          width: width,
          height: height * 0.65,
          fit: BoxFit.fill,
        ),
        Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Image.asset(
                'assets/profit_11.png',
              ),
            )),
        Positioned(
          top: height * 0.5,
          child: Container(
            height: height * 0.5,
            width: width,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 2, color: Color(0xFF109BFF)),),
              gradient: LinearGradient(
                begin: Alignment(0.0, -2.2),
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFF030F32), // Start color
                  const Color(0xFF000000), // End color
                ],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Column(children: [
              SizedBox(height: height * 0.05),
              Text(
                "Login/Register",
                style: GoogleFonts.merriweather(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 2, color: const Color(0xFF109BFF)),
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 5,
                        spreadRadius: 0.5,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "+91 ",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.transparent),
                                ),
                                suffixIcon: Icon(Icons.phone))),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.06),
              _LoginButton(),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset( 'assets/shield.png'),
                  
                  Image.asset(
                  'assets/secure.png',
                ),
                SizedBox(width: width * 0.06),
                Image.asset(
                  'assets/wallet_1.png',
                ),
                Image.asset(
                  'assets/withdrawals.png',
                ),
              ]),
              SizedBox(height: height * 0.1),
              Text(
                "By Signing up, You  agree to our Terms\n& Privacy Policy",
                textAlign: TextAlign.center,
                style: GoogleFonts.merriweatherSans(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              )
            ]),
          ),
        )
      ]),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 212,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 0.5,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(
          width: 0.5, color: Color(0xFFFFFFFF),
        ),
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF007BFF), // Start color
            Color(0xFF020A24), // End color
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            "Login",
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
