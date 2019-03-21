import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FormRoute extends StatefulWidget {
  @override
  _FormRouteState createState() => _FormRouteState();
}

class _FormRouteState extends State<FormRoute> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();
  bool _isObscure = true;
  SvgPicture pwdeyes = SvgPicture.asset(
    "images/pwdeyesee.svg",
    width: 30.0,
    height: 30.0,
    // color: Colors.grey,
  );
  SvgPicture pwdeyen = SvgPicture.asset(
    "images/pwdeye.svg",
    width: 30.0,
    height: 30.0,
    // color: Colors.grey,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xff666666),
      body: Form(
        key: _formKey,
        // autovalidate: true,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 0.0, horizontal: ScreenUtil().setWidth(20)),
          child: ListView(
            children: <Widget>[
              loginIcon(),
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0.0),
                height: ScreenUtil().setHeight(170),
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      "登录框",
                      style: new TextStyle(
                          fontSize: 20.0, color: Color(0xff666666)),
                    ),
                    unManage(),
                    pwdmanage(),
                  ],
                ),
              ),
              loginbtn(),
              acountabout(),
              anotherlogin()
            ],
          ),
        ),
      ),
    );
  }

  Widget loginIcon() {
    return new SvgPicture.asset(
      "images/login.svg",
      width: ScreenUtil().setWidth(155),
      height: ScreenUtil().setHeight(180),
    );
  }

  Widget unManage() {
    return TextFormField(
      autofocus: true,
      controller: _unameController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "用户名",
        hintText: "用户名或邮箱",
        icon: Icon(Icons.person),
      ),
      validator: (v) {
        if (v.trim().length > 0) {
          return null;
        } else {
          Fluttertoast.showToast(
              msg: "用户名不能为空",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos: 1,
              backgroundColor: Color(0x99000000),
              textColor: Color(0xffffffff));
        }
      },
    );
  }

  Widget pwdmanage() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: _pwdController,
      decoration: InputDecoration(
          labelText: "密码",
          hintText: "您的登录密码",
          icon: Icon(Icons.lock),
          suffixIcon: new IconButton(
            icon: _isObscure ? pwdeyen : pwdeyes,
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
          )),
      obscureText: _isObscure,
      validator: (v) {
        if (v.trim().length > 5) {
          return null;
        } else {
          Fluttertoast.showToast(
              msg: "密码不能少于6位",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos: 1,
              backgroundColor: Color(0x99000000),
              textColor: Color(0xffffffff));
        }
      },
    );
  }

  Widget loginbtn() {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              padding: EdgeInsets.all(10.0),
              child: Text("登录",
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Color(0xff666666),
                  )),
              color: Colors.white,
              onPressed: () {
                if ((_formKey.currentState as FormState).validate()) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        String alertText = "unm" +
                            _unameController.text +
                            "pwd:" +
                            _pwdController.text;
                        return AlertDialog(
                          content: Text(alertText),
                        );
                      });

                  // print(_pwdController.text);
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget acountabout() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 15.0, horizontal: ScreenUtil().setWidth(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            child: Text(
              "忘记密码",
              style: new TextStyle(fontSize: 12, color: Color(0xffffffff)),
            ),
          ),
          GestureDetector(
            child: Text(
              "注册账号",
              style: new TextStyle(fontSize: 12, color: Color(0xffffffff)),
            ),
          )
        ],
      ),
    );
  }

  Widget anotherlogin() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(24), 40.0, ScreenUtil().setWidth(24), 0),
      // vertical: 15.0, horizontal: 24.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(100),
                decoration: new UnderlineTabIndicator(
                    borderSide:
                        BorderSide(width: 1.0, color: Color(0xffdcdcdc))),
              ),
              Text(
                "快捷登录",
                style: new TextStyle(
                    color: Color(0xffffffff), fontSize: ScreenUtil().setSp(14)),
              ),
              Container(
                width: ScreenUtil().setWidth(100),
                decoration: new UnderlineTabIndicator(
                    borderSide:
                        BorderSide(width: 1.0, color: Color(0xffdcdcdc))),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(16)),
            child: new SvgPicture.asset(
              "images/wx.svg",
              width: ScreenUtil().setWidth(52),
              height: ScreenUtil().setHeight(52),
            ),
          )
        ],
      ),
    );
  }
}
