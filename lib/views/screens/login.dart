import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvc/controllers/auth_controller.dart';
import 'package:getx_mvc/views/screens/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = new TextEditingController();

  TextEditingController passwordController = new TextEditingController();

  final AuthController controller = Get.put(AuthController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                ()=> SizedBox(
                  height: 35,
                  width: 35,
                    child: controller.isLoading.value
                        ? CircularProgressIndicator()
                        : Container()),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: "Email",
                    alignLabelWithHint: true,
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                    filled: true),
                validator: (String? s) {
                  if (s == null || s.length <= 0) return "Email is required";

                  if (!GetUtils.isEmail(s))
                    return "Please enter a valid email";
                  else
                    return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: "Passowrd",
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                    filled: true),
                validator: (String? s) {
                  if (s == null || s.length <= 0) return "Password is required";

                  if (s.length < 6)
                    return "Password length cant be less than 6";
                  else
                    return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont have an account?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => RegisterScreen());
                    },
                    child: Text("Sign up"),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                color: Colors.blue,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    controller.login(
                        emailController.text, passwordController.text);
                  }
                },
                child: Text(
                  "Sign in",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
