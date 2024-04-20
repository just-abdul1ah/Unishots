import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/repositories/core_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/core/widgets/loading_wrapper.dart';
import 'package:instagram_clone/core/widgets/text_input_field.dart';
import 'package:instagram_clone/features/auth/repositories/auth_repositories.dart';
import 'package:instagram_clone/features/auth/presentation/pages/signup_screen.dart';
import 'package:instagram_clone/features/auth/presentation/widgets/instagram_logo.dart';
import 'package:instagram_clone/features/auth/presentation/widgets/login_button.dart';
import 'package:instagram_clone/features/profile/presentation/riverpod/profile_provider.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController(text: '');
    final passwordController = useTextEditingController(text: '');
    final requestPending = useState<Future?>(null);
    final snapshot = useFuture(requestPending.value);

    void loginUser() {
      FocusScope.of(context).unfocus();
      requestPending.value = sl
          .get<AuthRepositories>()
          .loginUser(
            email: emailController.text,
            password: passwordController.text,
          )
          .then((value) => ref.invalidate(currentUserProvider),
              onError: (error) => sl
                  .get<CoreRepositories>()
                  .showSnackBar(context, message: error.toString()));
    }

    return Scaffold(
      body: LoadingWrapper(
        isLoading: snapshot.connectionState == ConnectionState.waiting,
        child: SafeArea(
            child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(flex: 2, child: Container()),
                // svg image
                const InstagramLogo(),
                const SizedBox(height: 64),
                // email input
                TextInputField(
                    textEditingController: emailController,
                    hintText: 'Enter your email',
                    textInputType: TextInputType.emailAddress),
                const SizedBox(height: 24),
                // psw input
                TextInputField(
                    textEditingController: passwordController,
                    hintText: 'Enter your password',
                    textInputType: TextInputType.text,
                    isPass: true),
                const SizedBox(height: 24),
                // button
                LoginButton(text: 'Login', onTap: loginUser),
                const SizedBox(height: 12),
                Flexible(flex: 2, child: Container()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        'Dont have an account?',
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SignupScreen())),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text(
                          ' Signup.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
