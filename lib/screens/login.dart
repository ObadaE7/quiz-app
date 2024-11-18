import 'package:flutter/material.dart';
import 'package:quiz/screens/tabs.dart';
import 'package:quiz/utils/app_colors.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoggedIn = false;
  bool _isPasswordVisible = false;
  bool _isRememberMe = false;

  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  Future<void> _checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (_isLoggedIn) _navigateToHomeScreen();
  }

  void _navigateToHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Tabs(),
      ),
    );
  }

  Future<void> _login() async {
    if (widget._loginFormKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;
      if (email == 'admin@admin.com' && password == 'Admin@1234') {
        if (_isRememberMe) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isLoggedIn', true);
        }
        _navigateToHomeScreen();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'البريد الإلكتروني أو كلمة المرور غير صالحة',
              style: GoogleFonts.tajawal(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            backgroundColor: AppColors.charcoal,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipPath(
                    clipper: TopWaveClipper(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 300.0,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF3EB8D4),
                            Color(0xFF1F8DA6),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ClipPath(
                    clipper: BottomWaveClipper(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 310.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color(0xFF3EB8D4).withOpacity(0.5),
                            const Color(0xFF1F8DA6).withOpacity(0.5),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    child: Column(
                      children: [
                        const Image(
                          image: AssetImage('assets/animations/logo.png'),
                          width: 100.0,
                        ),
                        Text(
                          'Quizzy Champ',
                          style: GoogleFonts.pacifico(
                            color: Colors.white,
                            fontSize: 34.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: widget._loginFormKey,
                  child: Column(
                    children: [
                      Text(
                        'مرحبًا بعودتك!',
                        style: GoogleFonts.tajawal(
                          color: AppColors.charcoal,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            HugeIcons.strokeRoundedMail02,
                            color: AppColors.gray,
                          ),
                          label: Text(
                            'البريد الإلكتروني',
                            style: GoogleFonts.tajawal(
                              color: AppColors.gray,
                            ),
                          ),
                          hintText: 'ادخل بريدك الإلكتروني',
                          hintStyle: GoogleFonts.tajawal(
                            color: AppColors.gray,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16.0),
                            ),
                            borderSide: BorderSide(
                              color: AppColors.gray.withOpacity(0.5),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16.0),
                            ),
                            borderSide: BorderSide(
                              color: AppColors.primary,
                              width: 2.0,
                            ),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16.0),
                            ),
                            borderSide: BorderSide(
                              color: AppColors.danger,
                              width: 2.0,
                            ),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16.0),
                            ),
                            borderSide: BorderSide(
                              color: AppColors.danger,
                              width: 2.0,
                            ),
                          ),
                          errorStyle: GoogleFonts.tajawal(
                            color: AppColors.danger,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'حقل البريد الإلكتروني مطلوب';
                          }
                          const emailRegex =
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                          if (!RegExp(emailRegex).hasMatch(value)) {
                            return 'أدخل عنوان بريد إلكتروني صالح';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            HugeIcons.strokeRoundedLockPassword,
                            color: AppColors.gray,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () => setState(
                              () => _isPasswordVisible = !_isPasswordVisible,
                            ),
                            child: Icon(
                              _isPasswordVisible
                                  ? HugeIcons.strokeRoundedViewOffSlash
                                  : HugeIcons.strokeRoundedView,
                              color: AppColors.gray,
                            ),
                          ),
                          label: Text(
                            'كلمة المرور',
                            style: GoogleFonts.tajawal(
                              color: AppColors.gray,
                            ),
                          ),
                          hintText: 'ادخل كلمة المرور',
                          hintStyle: GoogleFonts.tajawal(
                            color: AppColors.gray,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16.0),
                            ),
                            borderSide: BorderSide(
                              color: AppColors.gray.withOpacity(0.5),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16.0),
                            ),
                            borderSide: BorderSide(
                              color: AppColors.primary,
                              width: 2.0,
                            ),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16.0),
                            ),
                            borderSide: BorderSide(
                              color: AppColors.danger,
                              width: 2.0,
                            ),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16.0),
                            ),
                            borderSide: BorderSide(
                              color: AppColors.danger,
                              width: 2.0,
                            ),
                          ),
                          errorStyle: GoogleFonts.tajawal(
                            color: AppColors.danger,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'حقل كلمة المرور مطلوب';
                          }
                          if (value.length < 8) {
                            return 'يجب أن تكون كلمة المرور 8 أحرف على الأقل';
                          }
                          const passwordRegex =
                              r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$';
                          if (!RegExp(passwordRegex).hasMatch(value)) {
                            return 'يجب أن تحتوي كلمة المرور على أحرف وأرقام';
                          }
                          return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: _isRememberMe,
                                onChanged: (value) {
                                  setState(() => _isRememberMe = value!);
                                },
                                activeColor: AppColors.primary,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                side: const BorderSide(
                                  color: AppColors.primary,
                                  width: 2.0,
                                ),
                              ),
                              Text(
                                'تذكرني',
                                style: GoogleFonts.tajawal(
                                  color: AppColors.gray,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'نسيت كلمة المرور؟',
                              style: GoogleFonts.tajawal(
                                color: AppColors.gray,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF3EB8D4),
                              Color(0xFF1F8DA6),
                            ],
                          ),
                        ),
                        child: FilledButton(
                          onPressed: () => _login(),
                          style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.transparent,
                            ),
                            padding: WidgetStatePropertyAll(
                              EdgeInsets.all(18.0),
                            ),
                          ),
                          child: Text(
                            'تسجيل الدخول',
                            style: GoogleFonts.tajawal(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'مستخدم جديد؟',
                            style: GoogleFonts.tajawal(
                              color: AppColors.charcoal,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'إنشاء حساب',
                              style: GoogleFonts.tajawal(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFFFAFAFA),
    );
  }
}

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height - 100,
      size.width * 0.5,
      size.height - 50,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height,
      size.width * 0.5,
      size.height - 30,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height - 60,
      size.width,
      size.height - 30,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
