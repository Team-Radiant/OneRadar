import 'package:flutter/cupertino.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _sendResetLink() async {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      _showAlert("Missing Email", "Please enter your registered email address.");
      return;
    }

    if (!email.contains('@') || !email.contains('.')) {
      _showAlert("Invalid Email", "Please enter a valid email address.");
      return;
    }

    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) {
      return;
    }

    setState(() => _isLoading = false);

    _showAlert(
      "Reset Link Sent",
      "If an account exists for $email, a password reset link has been sent. (Temporary stub)",
      onOk: () {
        Navigator.of(context).pop();
      },
    );
  }

  void _showAlert(String title, String message, {VoidCallback? onOk}) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop();
              onOk?.call();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Color(0xFF0A0A0A),
        middle: Text(
          "Forgot Password",
          style: TextStyle(
            fontFamily: "Outfit",
            color: CupertinoColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                CupertinoIcons.lock_rotation,
                size: 56,
                color: Color.fromARGB(255, 65, 230, 242),
              ),
              const SizedBox(height: 20),
              const Text(
                "Reset your password",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: CupertinoColors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Enter your account email and we will send you a reset link.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Absans",
                  fontSize: 14,
                  height: 1.45,
                  color: CupertinoColors.systemGrey.withValues(alpha: 0.85),
                ),
              ),
              const SizedBox(height: 28),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1C1E),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: const Color.fromARGB(255, 65, 230, 242).withOpacity(0.15),
                    width: 1,
                  ),
                ),
                child: CupertinoTextField(
                  controller: _emailController,
                  placeholder: "Email Address",
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                    fontFamily: "Absans",
                    fontSize: 15,
                    color: CupertinoColors.white,
                  ),
                  placeholderStyle: TextStyle(
                    fontFamily: "Absans",
                    fontSize: 15,
                    color: CupertinoColors.systemGrey.withValues(alpha: 0.6),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: const BoxDecoration(color: CupertinoColors.transparent),
                  prefix: const Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Icon(
                      CupertinoIcons.mail,
                      size: 18,
                      color: Color.fromARGB(255, 65, 230, 242),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  borderRadius: BorderRadius.circular(16),
                  color: const Color.fromARGB(255, 65, 230, 242),
                  onPressed: _isLoading ? null : _sendResetLink,
                  child: _isLoading
                      ? const CupertinoActivityIndicator(
                          color: Color.fromARGB(255, 0, 87, 94),
                        )
                      : const Text(
                          "Send Reset Link",
                          style: TextStyle(
                            fontFamily: "Absans",
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.4,
                            color: Color.fromARGB(255, 0, 87, 94),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}