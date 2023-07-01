import 'package:flutter/material.dart';
import 'package:instagram_clone/controllers/AuthController.dart';
import 'package:instagram_clone/model/instagrem_user.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key, this.uid});
  final uid;

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nickNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Widget _avatar() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(
              'assets/images/default_image.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {},
          child: const Text("이미지 변경"),
        )
      ],
    );
  }

  Widget _nickName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        controller: nickNameController,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(10), hintText: "닉네임"),
      ),
    );
  }

  Widget _description() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        controller: descriptionController,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(10), hintText: "설명"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Signup",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            _avatar(),
            const SizedBox(height: 30),
            _nickName(),
            const SizedBox(height: 30),
            _description(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        child: ElevatedButton(
          onPressed: () {
            var signupUser = IUser(
                uid: widget.uid,
                nickname: nickNameController.text,
                description: descriptionController.text);
            AuthController.to.signup(signupUser);
          },
          child: const Text("회원가입"),
        ),
      ),
    );
  }
}
