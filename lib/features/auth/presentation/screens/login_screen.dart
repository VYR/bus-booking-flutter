import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Welcome ${state.user.email}"))
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
                TextField(controller: passController, decoration: InputDecoration(labelText: "Password"), obscureText: true),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(
                      LoginEvent(emailController.text, passController.text)
                    );
                  },
                  child: const Text("Login"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
