import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../application/auth/auth_bloc.dart';
import '../../infrastructure/auth/auth_repository.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _username, _password;
  bool _isPasswordVisible = false;

  void _validateForm() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final padding = screenSize.width * 0.05;

    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthBloc(AuthRepository(http.Client())),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            state.authFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  // Show error dialog
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      // title: const Text('Login Gagal'),
                      content: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            FeatherIcons.xCircle,
                            color: Colors.red,
                            size: 48,
                          ),
                          SizedBox(height: 16),
                          Text('Login Gagal'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                (user) {
                  // Show success dialog
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                        // title: const Text('Login Berhasil'),
                        content: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              FeatherIcons.checkCircle,
                              color: Colors.green,
                              size: 48,
                            ),
                            SizedBox(height: 16),
                            Text('Login Berhasil'),
                          ],
                        ),
                        actions: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context)
                                      .pushReplacementNamed('/dashboard');
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ]),
                  );
                },
              ),
            );
          },
          builder: (context, state) {
            return Stack(
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    'assets/svg/login.svg',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(padding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: screenSize.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/svg/icon.svg',
                              width: screenSize.width * 0.08),
                          SizedBox(width: screenSize.width * 0.02),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'BKC ',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w800,
                                    fontStyle: FontStyle.italic,
                                    fontSize: screenSize.width * 0.05,
                                    color: const Color(0xFF171047),
                                  ),
                                ),
                                TextSpan(
                                  text: 'SUPER BRANCH',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w800,
                                    fontStyle: FontStyle.italic,
                                    fontSize: screenSize.width * 0.05,
                                    color: const Color(0xFF225CAB),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenSize.height * 0.03),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Silahkan Login untuk Melanjutkan',
                          style: TextStyle(
                            fontSize: screenSize.width * 0.03,
                            fontFamily: 'Futura',
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.02),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Username",
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      EdgeInsets.all(screenSize.width * 0.03),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Silakan masukkan username';
                                  }
                                  return null;
                                },
                                onSaved: (value) => _username = value ?? '',
                              ),
                            ),
                            SizedBox(height: screenSize.height * 0.02),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      EdgeInsets.all(screenSize.width * 0.03),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordVisible =
                                            !_isPasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Silakan masukkan password';
                                  }
                                  return null;
                                },
                                obscureText: !_isPasswordVisible,
                                onSaved: (value) => _password = value ?? '',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.04),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {
                                _validateForm();
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  context.read<AuthBloc>().add(
                                        AuthEvent(
                                            _username, _password, context),
                                      );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff225CAB),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: screenSize.height * 0.015),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: screenSize.width * 0.04,
                                  color: Colors.white,
                                  fontFamily: 'Futura',
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenSize.height * 0.03),
                      TextButton(
                        onPressed: () {},
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Don\'t have an account yet? ',
                                style: TextStyle(
                                  fontSize: screenSize.width * 0.03,
                                  fontFamily: 'Futura',
                                  fontWeight: FontWeight.w200,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                  fontSize: screenSize.width * 0.03,
                                  fontFamily: 'Futura',
                                  fontWeight: FontWeight.w200,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
