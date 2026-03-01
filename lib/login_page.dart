import 'package:flutter/cupertino.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isSignUp = false;
  bool _isLoading = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // TODO: Replace with real authentication logic
  Future<void> _handleAuth() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final name = _nameController.text.trim();

    if (email.isEmpty || password.isEmpty || (_isSignUp && name.isEmpty)) {
      _showAlert("Missing Fields", "Please fill in all required fields.");
      return;
    }

    setState(() => _isLoading = true);

    // Simulate network delay — replace with actual auth call
    await Future.delayed(const Duration(seconds: 2));

    setState(() => _isLoading = false);

    if (_isSignUp) {
      // TODO: Call sign-up API / Firebase / Supabase etc.
      _showAlert("Sign Up Successful", "Welcome, $name! (Temporary stub)");
    } else {
      // TODO: Call sign-in API / Firebase / Supabase etc.
      _showAlert("Sign In Successful", "Welcome back! (Temporary stub)");
    }
  }

  void _showAlert(String title, String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            child: const Text("OK"),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(flex: 1),

              // ── Header ──────────────────────────────────────────────────
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF1C1C1E),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: const Color.fromARGB(255, 102, 255, 242)
                              .withOpacity(0.2),
                          blurRadius: 40,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: const Icon(
                      CupertinoIcons.antenna_radiowaves_left_right,
                      size: 44,
                      color: Color.fromARGB(255, 65, 230, 242),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    _isSignUp ? "Create Account" : "Welcome Back",
                    style: const TextStyle(
                      fontFamily: "Outfit",
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.5,
                      color: CupertinoColors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _isSignUp
                        ? "Sign up to start tracking with OneRadar."
                        : "Sign in to continue to OneRadar.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Absans",
                      fontSize: 14,
                      height: 1.5,
                      fontWeight: FontWeight.w400,
                      color: CupertinoColors.systemGrey.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),

              const Spacer(flex: 1),

              // ── Input Fields ─────────────────────────────────────────────
              Column(
                children: [
                  if (_isSignUp) ...[
                    _buildInputField(
                      controller: _nameController,
                      placeholder: "Full Name",
                      icon: CupertinoIcons.person,
                    ),
                    const SizedBox(height: 14),
                  ],
                  _buildInputField(
                    controller: _emailController,
                    placeholder: "Email Address",
                    icon: CupertinoIcons.mail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 14),
                  _buildInputField(
                    controller: _passwordController,
                    placeholder: "Password",
                    icon: CupertinoIcons.lock,
                    obscureText: true,
                  ),
                  if (!_isSignUp) ...[
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => const ForgotPasswordPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            fontFamily: "Absans",
                            fontSize: 13,
                            color: Color.fromARGB(255, 65, 230, 242),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),

              const Spacer(flex: 2),

              // ── Action Buttons ───────────────────────────────────────────
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      borderRadius: BorderRadius.circular(16),
                      color: const Color.fromARGB(255, 65, 230, 242),
                      onPressed: _isLoading ? null : _handleAuth,
                      child: _isLoading
                          ? const CupertinoActivityIndicator(
                              color: Color.fromARGB(255, 0, 87, 94),
                            )
                          : Text(
                              _isSignUp ? "Create Account" : "Sign In",
                              style: const TextStyle(
                                fontFamily: "Absans",
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.4,
                                color: Color.fromARGB(255, 0, 87, 94),
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CupertinoButton(
                    onPressed: () {
                      setState(() {
                        _isSignUp = !_isSignUp;
                        _nameController.clear();
                        _emailController.clear();
                        _passwordController.clear();
                      });
                    },
                    child: Text(
                      _isSignUp
                          ? "Already have an account? Sign In"
                          : "Don't have an account? Sign Up",
                      style: const TextStyle(
                        fontFamily: "Absans",
                        fontSize: 14,
                        color: CupertinoColors.systemGrey2,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String placeholder,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color.fromARGB(255, 65, 230, 242).withOpacity(0.15),
          width: 1,
        ),
      ),
      child: CupertinoTextField(
        controller: controller,
        placeholder: placeholder,
        placeholderStyle: TextStyle(
          fontFamily: "Absans",
          fontSize: 15,
          color: CupertinoColors.systemGrey.withValues(alpha: 0.6),
        ),
        style: const TextStyle(
          fontFamily: "Absans",
          fontSize: 15,
          color: CupertinoColors.white,
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: const BoxDecoration(color: CupertinoColors.transparent),
        prefix: Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Icon(
            icon,
            size: 18,
            color: const Color.fromARGB(255, 65, 230, 242),
          ),
        ),
      ),
    );
  }
}