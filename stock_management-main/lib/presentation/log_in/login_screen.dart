import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_management/presentation/dashboard/screen/dashboard_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: DrawClip(),
                    child: Container(
                      height: size.height / 2.4,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF006064), Color(0xFF006064)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: size.height / 2.4,
                    width: double.infinity,
                    child: Image.network(
                      'https://i.postimg.cc/Gt0VM7MY/tinder.png',
                    ),
                  ),
                  Positioned(
                    top: 1,
                    bottom: 1,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.1, vertical: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                    fillColor: Colors.grey[200],
                    hintText: 'Email Address',
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.1, vertical: 10),
                child: TextFormField(
                  obscureText: true, // Password field should obscure text
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                    fillColor: Colors.grey[200],
                    hintText: 'Password',
                    suffixIcon: Icon(Icons.remove_red_eye),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    filled: true,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle Forgot Password
                  print("Forgot Password tapped");
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 210),
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.mukta(
                      color: Colors.grey[500],
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.1, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle sign in logic
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DashBoardScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    primary: Color(0xFF006064),
                  ),
                  child: Container(
                    height: 50,
                    child: Center(
                      child: Text(
                        "SIGN IN",
                        style: GoogleFonts.mukta(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "OR",
                  style: GoogleFonts.mukta(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    social('https://i.postimg.cc/HxFdTLVG/google-plus.png'),
                    social('https://i.postimg.cc/0y4tWK3q/facebook-2.png'),
                    social('https://i.postimg.cc/GpsXZhwT/twitter-3.png'),
                    social('https://i.postimg.cc/7YYmqNrk/linkedin.png'),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Don't have an account?",
                      style: GoogleFonts.mukta(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle sign up navigation
                        print("Sign Up tapped");
                      },
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.mukta(
                          fontSize: 18,
                          color: Color(0xffff5f6d),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget social(String url) {
  return Material(
    borderRadius: BorderRadius.circular(8),
    elevation: 10,
    child: Padding(
      padding: EdgeInsets.all(8),
      child: Image.network(
        url,
        height: 28,
        width: 28,
      ),
    ),
  );
}

class DrawClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.1, size.height - 50);
    path.lineTo(size.width * 0.9, size.height - 50);
    path.lineTo(size.width, size.height - 100);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
