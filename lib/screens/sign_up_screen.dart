import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _psswdController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _psswdController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 1),
                //svg
                SvgPicture.asset(
                  'assets/images/ic_instagram.svg',
                  color: primaryColor,
                  height: 64,
                ),
                const SizedBox(height: 64),
                // profile pic
                Stack(
                  children: [
                    //circleavatar
                    const CircleAvatar(
                      radius: 64,
                      backgroundImage:
                          NetworkImage('https://i.pravatar.cc/300'),
                    ),
                    Positioned(
                      bottom: -10,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(Icons.add_a_photo),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                TextFieldInput(
                  hintText: 'User Name',
                  textEditingController: _usernameController,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 10),

                //text field email
                TextFieldInput(
                  hintText: 'Enter Your Email',
                  textEditingController: _emailController,
                  textInputType: TextInputType.emailAddress,
                ),
                // text field pssd
                const SizedBox(height: 10),

                TextFieldInput(
                  hintText: 'Enter Your Password',
                  textEditingController: _psswdController,
                  isPass: true,
                  textInputType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 10),

                TextFieldInput(
                  hintText: 'bio text',
                  textEditingController: _bioController,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 15),
                //login btn
                const SizedBox(height: 32),
                GestureDetector(
                  onTap: () {
                    print('sign up');
                  },
                  child: Container(
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      color: blueColor,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          color: blueColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 1),
              ],
            )),
      ),
    );
  }
}
