// Flutter imports:
import 'package:flutter/gestures.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blog_app/common.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_gradient_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with ValidationMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void _clearControllers() {
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign In.',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15.0),
              AuthField(
                controller: _emailController,
                hintText: 'Email',
                validator: validateEmail,
              ),
              const SizedBox(height: 15.0),
              AuthField(
                controller: _passwordController,
                hintText: 'Password',
                obscureText: true,
                validator: validatePassword,
              ),
              const SizedBox(height: 20.0),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state.status == AuthStatus.failure) {
                    context.showMaterialSnackBar(state.error ?? '');
                  } else if (state.status == AuthStatus.success) {
                    _clearControllers();
                  }
                },
                builder: (context, state) {
                  if (state.status == AuthStatus.loading) {
                    return const CircularProgressIndicator.adaptive();
                  }
                  return AuthGradientButton(
                    text: 'Sign In',
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            AuthSignIn(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                            ),
                          );
                    },
                  );
                },
              ),
              const SizedBox(height: 20.0),
              RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: Theme.of(context).textTheme.titleMedium,
                  children: [
                    TextSpan(
                      text: 'Sign up',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppPalette.gradient2,
                            fontWeight: FontWeight.bold,
                          ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          const SignUpPageData().go(context);
                        },
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
