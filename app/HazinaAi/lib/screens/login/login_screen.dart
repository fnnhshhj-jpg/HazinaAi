import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [

              const SizedBox(height: 40),

              Image.asset(
                "assets/logo/logo.png",
                width: 100,
              ),

              const SizedBox(height: 20),

              const Text(
                "Welcome to HazinaAI",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Your personal AI assistant",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 40),


              CustomTextField(
                controller: emailController,
                hintText: "Email",
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 16),


              CustomTextField(
                controller: passwordController,
                hintText: "Password",
                prefixIcon: Icons.lock_outline,
                obscureText: hidePassword,
                suffixIcon: hidePassword
                    ? Icons.visibility_off
                    : Icons.visibility,
                onSuffixTap: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
              ),


              const SizedBox(height: 25),


              CustomButton(
                text: "Login",
                onPressed: () {

                  Navigator.pushReplacementNamed(
                    context,
                    "/home",
                  );

                },
              ),


              const SizedBox(height: 20),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Text(
                    "Don't have an account?",
                  ),

                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Register",
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
}