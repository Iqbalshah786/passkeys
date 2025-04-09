import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    // Implement login logic here
    final username = _usernameController.text;
    final password = _passwordController.text;

    Navigator.pushNamed(context, '/main_screen');

    // Add your authentication process
    // if (username == 'admin' && password == 'admin1234') {
    //   Navigator.pushNamed(context, '/main_screen');
    //   print('Attempting login with username: $username');
    //   return;
    // }
    print('Error authenticating');
  }

  @override
  Widget build(BuildContext context) {


    // Apply the status bar style when entering this screen
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark, // Black icons
      statusBarColor: Colors.white, // White background
    ));

    return Scaffold(

      backgroundColor: const Color(0xFFF4F6FF),
      appBar: AppBar(
        leadingWidth: 100.w,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Image.asset(
                'assets/images/Vector.png',
                width: 14.w,
                height: 14.h,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            SizedBox(width: 5.w),
            Text(
              "Back",
              style: TextStyle(
                fontSize: 16.sp,
                color: Color(0XFF333333),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Center(
                  child: Image.asset(
                    'assets/images/logo_black.png',
                    width: 200.w,
                    height: 50.h,
                  ),
                ),
                SizedBox(height: 50.h),
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 33.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF4361EE),
                  ),
                ),

                Text(
                  'Sign in to your account',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0XFF333333),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 30.h),
                // Username TextField
                Text(
                  "Username",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: 'Enter Username',
                    hintStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0x1A121212),
                    ),
                    suffixIcon:
                        _usernameController.text.isNotEmpty
                            ? IconButton(
                              icon: Icon(Icons.clear, color: Color(0xFF333333)),
                              onPressed: () => _usernameController.clear(),
                            )
                            : null,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFEBEBEB)),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0XFF4361EE),
                        width: 2.w,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  onChanged: (value) => setState(() {}),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                // Password TextField
                TextField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: 'Enter strong password',
                    hintStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0x1A121212),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Color(0xFF4F4F4F),
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFEBEBEB)),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0XFF4361EE),
                        width: 2.w,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      // Implement forget password logic
                      print('Forget password tapped');
                    },
                    child: Text(
                      'Forget password?',

                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xFF4F4F4F),
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                ),
               SizedBox(height: 129.h,),
                // Login Button
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4361EE),
                    minimumSize: Size(double.infinity, 50.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffE3E8FF),
                    ),
                  ),
                ),
                SizedBox(height: 11.h),
                // Register Option
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        color: Color(0xFFAFAFAF),
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Implement register navigation
                        print('Register Now tapped');
                      },
                      child: Text(
                        'Register Now',
                        style: TextStyle(
                          color: Color(0xFF4361EE),
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
