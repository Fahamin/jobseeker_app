import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobseeker/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
   LoginView({super.key});
   final TextEditingController emailController = TextEditingController(text: "fahamin383@gmail.com");
   final TextEditingController passwordController = TextEditingController(text: "12345678");

   final _formKey = GlobalKey<FormState>();

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('Login'),
         centerTitle: true,
       ),
       body: SingleChildScrollView(
         padding: EdgeInsets.all(20),
         child: Form(
           key: _formKey,
           child: Column(
             children: [
               SizedBox(height: 50),
               Text(
                 'Welcome Back',
                 style: TextStyle(
                   fontSize: 28,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               SizedBox(height: 10),
               Text(
                 'Login to your account',
                 style: TextStyle(
                   fontSize: 16,
                   color: Colors.grey,
                 ),
               ),
               SizedBox(height: 40),
               TextFormField(
                 controller: emailController,
                 decoration: InputDecoration(
                   labelText: 'Email',
                   border: OutlineInputBorder(),
                   prefixIcon: Icon(Icons.email),
                 ),
                 keyboardType: TextInputType.emailAddress,
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return 'Please enter your email';
                   }
                   if (!GetUtils.isEmail(value)) {
                     return 'Please enter a valid email';
                   }
                   return null;
                 },
               ),
               SizedBox(height: 20),
               TextFormField(
                 controller: passwordController,
                 decoration: InputDecoration(
                   labelText: 'Password',
                   border: OutlineInputBorder(),
                   prefixIcon: Icon(Icons.lock),
                 ),
                 obscureText: true,
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return 'Please enter your password';
                   }
                   if (value.length < 6) {
                     return 'Password must be at least 6 characters';
                   }
                   return null;
                 },
               ),
               SizedBox(height: 10),
               Align(
                 alignment: Alignment.centerRight,
                 child: TextButton(
                   onPressed: () => Get.toNamed('/forgot-password'),
                   child: Text('Forgot Password?'),
                 ),
               ),
               SizedBox(height: 30),
               Obx(() => controller.isLoading.value
                   ? CircularProgressIndicator()
                   : SizedBox(
                 width: double.infinity,
                 height: 50,
                 child: ElevatedButton(
                   onPressed: () {
                     if (_formKey.currentState!.validate()) {
                       controller.login(
                         email: emailController.text.trim(),
                         password: passwordController.text,
                       );
                     }
                   },
                   child: Text(
                     'Login',
                     style: TextStyle(fontSize: 16),
                   ),
                 ),
               )),
               SizedBox(height: 20),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text("Don't have an account?"),
                   TextButton(
                     onPressed: () => Get.toNamed(Routes.REGISTRATION),
                     child: Text('Register'),
                   ),
                 ],
               ),
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
   }
}