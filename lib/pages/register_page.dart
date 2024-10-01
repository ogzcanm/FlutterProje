import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proje/components/my_button.dart';
import 'package:flutter_proje/components/my_textfield.dart';
import 'package:flutter_proje/components/square_tile.dart';
import 'package:flutter_proje/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, this.onTap});
  final Function()? onTap;
  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  //textediting controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //signUserUp
  void signUserUp() async {
    //yükleme ekranı
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //error masajı
    void showErrorMessage(String message) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              backgroundColor: Colors.deepPurple,
              title: Center(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
              ));
        },
      );
    }

    try {
      //parolalar eşitmi
      if (passwordController.text == confirmPasswordController.text &&
          passwordController.text.length > 6) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        //hata mesajı
        showErrorMessage('Şifreler Eşleşmedi!');
        Navigator.pop(context);
      }
      //yükleme ekranı sonlandırma
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //yükleme ekranı sonlandırma
      Navigator.pop(context);
      //error mesejı
      showErrorMessage(e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                //logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(height: 50),
                //hoşgeldiniz text
                Text(
                  'Hoşgeldiniz! Üye Olun',
                  style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                ),
                const SizedBox(height: 25),
                //Kullanıcı Adı TextField
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                //Şifre TextField
                MyTextField(
                  controller: passwordController,
                  hintText: 'Şifre',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                //Şifre Tekrar TextField
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Şifre Tekrar',
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                //Giriş Butonu
                MyButton(
                  text: 'Üye Ol',
                  onTap: signUserUp,
                ),
                const SizedBox(height: 25),
                //Text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Ya da',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                //Google,Apple ile Giriş
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Google Icon
                    SquareTile(
                      onTap: () => AuthService().signInWithGoogle(),
                      ImagePath: 'assets/google.png',
                    ),
                    const SizedBox(width: 25),
                    //Apple Icon
                    SquareTile(
                      onTap: () {},
                      ImagePath: 'assets/apple.png',
                    )
                  ],
                ),
                const SizedBox(height: 25),
                //not a member?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hesabınız Var mı ?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Giriş Yapın',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
