import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvc/controllers/auth_controller.dart';
import 'package:getx_mvc/views/screens/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

TextEditingController emailController = new TextEditingController();
TextEditingController usernameController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();

  final AuthController controller = Get.put(AuthController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
         
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
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    filled: true
                  ),
                  validator: (String? s){

                    if(s==null || s.length<=0)
                    return "Email is required";

                    if(!GetUtils.isEmail(s))
                    return null;}),
               SizedBox( height: 20,),     
                TextFormField(
                  controller: usernameController,
                       textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Username",
                    
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    filled: true
                  ),
                  validator: (String? s){

                    if(s==null || s.length<=0)
                    return "Username is required";

                    if(!GetUtils.isUsername(s))
                    return "Please enter a valid Username";

                    else return null;
                  },
                ),
                SizedBox( height: 20,),

                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                       textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Password",
                    
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    filled: true
                  ),
                  validator: (String? s){

                    if(s==null || s.length<=0)
                    return "Password is required";

                    if(s.length<6)
                    return "Password length cant be less than 6";

                    else return null;
                  },
                ),
                    SizedBox( height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                    style: TextStyle(color: Colors.grey),),
                    TextButton(
                      onPressed: () {
                     Get.off(()=> LoginScreen());
                        
                      },
                      child: Text("Sign in"),
                    ),
                  ],
                ),

                    MaterialButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                      ),
                  onPressed: () {
                    if(_formKey.currentState!.validate())
                    {
                      controller.register(emailController.text,passwordController.text,usernameController.text);
                    }
                    
                  },
                  child: Text("Sign up",
               
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
    void dispose() {

      emailController.dispose();
      passwordController.dispose();
      usernameController.dispose();

      super.dispose();
    }
}
