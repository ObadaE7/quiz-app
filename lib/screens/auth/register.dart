import 'package:flutter/material.dart';
import 'package:quiz/utils/app_colors.dart';
import 'package:quiz/utils/custom_input_decoration.dart';
import 'package:quiz/widgets/bottom_wave_clipper.dart';
import 'package:quiz/widgets/top_wave_clipper.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final List<bool> _isPasswordVisible = [false, false];
  bool _isAgree = false;

  void _register() {
    if (widget._registerFormKey.currentState!.validate()) {
      print('Full Name: ${_fullNameController.text}');
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
      print('Confirm Password: ${_confirmPasswordController.text}');
    }
  }

  @override
  void dispose() {
    super.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: TopWaveClipper(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120.0,
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
                    height: 130.0,
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'حساب جديد',
                    style: GoogleFonts.tajawal(
                      color: AppColors.charcoal,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '!انضم إلى مجتمعنا وابدأ في التحدي',
                    style: GoogleFonts.tajawal(
                      color: AppColors.mediumGray,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    textDirection: TextDirection.ltr,
                  ),
                  const SizedBox(height: 20.0),
                  Form(
                    key: widget._registerFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _fullNameController,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: inputDecoration(
                            prefixIcon: HugeIcons.strokeRoundedUser,
                            label: 'الاسم الكامل',
                            hintText: 'ادخل اسمك بالكامل',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'حقل الاسم الكامل مطلوب';
                            }
                            return null;
                          },
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
                          obscureText: !_isPasswordVisible[0],
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          decoration: inputDecoration(
                            prefixIcon: HugeIcons.strokeRoundedLockPassword,
                            suffixIcon: GestureDetector(
                              onTap: () => setState(
                                () => _isPasswordVisible[0] =
                                    !_isPasswordVisible[0],
                              ),
                              child: Icon(
                                _isPasswordVisible[0]
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
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: !_isPasswordVisible[1],
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          decoration: inputDecoration(
                            prefixIcon:
                                HugeIcons.strokeRoundedPasswordValidation,
                            suffixIcon: GestureDetector(
                              onTap: () => setState(
                                () => _isPasswordVisible[1] =
                                    !_isPasswordVisible[1],
                              ),
                              child: Icon(
                                _isPasswordVisible[1]
                                    ? HugeIcons.strokeRoundedViewOffSlash
                                    : HugeIcons.strokeRoundedView,
                                color: AppColors.mediumGray,
                              ),
                            ),
                            label: 'تأكيد كلمة المرور',
                            hintText: 'أعد ادخال كلمة المرور',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'حقل تأكيد كلمة المرور مطلوب';
                            }
                            if (value != _passwordController.text) {
                              return 'كلمة المرور غير متطابقة';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          children: [
                            Checkbox(
                              value: _isAgree,
                              onChanged: (value) =>
                                  setState(() => _isAgree = value!),
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
                              'موافقة على الشروط والأحكام',
                              style: GoogleFonts.tajawal(
                                color: AppColors.mediumGray,
                                fontWeight: FontWeight.w500,
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
                            onPressed: () => _register(),
                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Colors.transparent,
                              ),
                              padding: WidgetStatePropertyAll(
                                EdgeInsets.all(18.0),
                              ),
                            ),
                            child: Text(
                              'التسجيل',
                              style: GoogleFonts.tajawal(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'هل لديك حساب؟',
                              style: GoogleFonts.tajawal(
                                color: AppColors.mediumGray,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                'تسجيل الدخول',
                                style: GoogleFonts.tajawal(
                                  color: AppColors.cyan,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.offWhite,
    );
  }
}
