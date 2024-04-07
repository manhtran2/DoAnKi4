import 'package:doanki4/Homescreen/home.dart';
import 'package:flutter/material.dart';
import 'package:doanki4/pages/Register.dart';
import 'dart:ui';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Xử lý khi bấm nút back trên thiết bị
        return true; // Trả về true để không chặn sự kiện pop
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Image.asset(
                    "images/logo.png",
                    width: 100,
                    height: 100,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Đăng Nhập',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Email của bạn',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      SizedBox(height: 40),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Mật khẩu của bạn',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          // Xử lý khi nhấn vào "Quên mật khẩu"
                        },
                        child: Text(
                          'Quên mật khẩu?',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Đăng Nhập'),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Divider(
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                'Hoặc',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Sử dụng Navigator để chuyển sang trang đăng ký khi bấm nút "Đăng Ký"
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                        child: Text('Đăng Ký'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 40,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  // Chuyển về trang chính (home)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text(
                  'Bỏ qua',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
