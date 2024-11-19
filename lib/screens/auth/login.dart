import 'package:flutter/material.dart';
import 'package:quiz/screens/main/tabs.dart';
import 'package:quiz/screens/auth/register.dart';
import 'package:quiz/screens/auth/forgot_password.dart';
import 'package:quiz/widgets/bottom_wave_clipper.dart';
import 'package:quiz/widgets/top_wave_clipper.dart';
import 'package:quiz/utils/app_colors.dart';
import 'package:quiz/utils/custom_input_decoration.dart';
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

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
                color: AppColors.white,
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
                            AppColors.cyan,
                            AppColors.darkCyan,
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
                            AppColors.cyan.withOpacity(0.5),
                            AppColors.darkCyan.withOpacity(0.5),
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
                            color: AppColors.white,
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
                        decoration: inputDecoration(
                          prefixIcon: HugeIcons.strokeRoundedMail02,
                          label: 'البريد الإلكتروني',
                          hintText: 'ادخل بريدك الإلكتروني',
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
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        decoration: inputDecoration(
                          prefixIcon: HugeIcons.strokeRoundedLockPassword,
                          suffixIcon: GestureDetector(
                            onTap: () => setState(
                              () => _isPasswordVisible = !_isPasswordVisible,
                            ),
                            child: Icon(
                              _isPasswordVisible
                                  ? HugeIcons.strokeRoundedViewOffSlash
                                  : HugeIcons.strokeRoundedView,
                              color: AppColors.mediumGray,
                            ),
                          ),
                          label: 'كلمة المرور',
                          hintText: 'ادخل كلمة المرور',
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
                                activeColor: AppColors.cyan,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                side: const BorderSide(
                                  color: AppColors.cyan,
                                  width: 2.0,
                                ),
                              ),
                              Text(
                                'تذكرني',
                                style: GoogleFonts.tajawal(
                                  color: AppColors.mediumGray,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ForgotPassword(),
                                ),
                              );
                            },
                            child: Text(
                              'نسيت كلمة المرور؟',
                              style: GoogleFonts.tajawal(
                                color: AppColors.mediumGray,
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
                              AppColors.cyan,
                              AppColors.darkCyan,
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
                              color: AppColors.white,
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Register(),
                                ),
                              );
                            },
                            child: Text(
                              'إنشاء حساب',
                              style: GoogleFonts.tajawal(
                                color: AppColors.cyan,
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
      backgroundColor: AppColors.offWhite,
    );
  }
}
