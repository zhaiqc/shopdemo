import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/utils/AppConfig.dart';
import 'package:shop/utils/Dimens.dart';
import 'package:shop/utils/text_field.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FocusNode _phoneFN = FocusNode();
  final FocusNode _codeFN = FocusNode();

  TextEditingController _phoneController = TextEditingController();
  TextEditingController _codeController = TextEditingController();
  TimerController timerController =new TimerController(time: 0,second: 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Column(
      children: [
        logo(),
        user_name(),
        code(),
        button()
      ],
    ) ,);
  }


  Widget logo(){
    return Container(height: AppConfig.logic_height(400),child: Image.network("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAATYAAACjCAMAAAA3vsLfAAABjFBMVEX4+Pj///8tLS0jIyIAAAD/hxv8Zzz+gx/9czD9cjH8bjX/iBv8bDf9cDP8ZT7+giD+eyj+fyT9eSoNDQ39di0aGhrX19f8aTr/fwAPDw/k5OTr6+spKSn19fWMjIwgKy3/gwAYKC14eHj+dgCAgID+cAC3t7ceHh4iHBv0XST70rzT09PFxcWfn583NzeSQirzVSv/9/H9mVL8vpr7yaz72Mb9cR39u5D7uJv9Zgy6YigIJS5hYWFvb2+mpqZNTU38YBr3nYf/+vT/6dr/s4D/qnL+tIT/jSv+kkT+m17+hTH/mEP+r4b/yrH74ND9mWf9jlb+oXv7rYv+n1v8hkf1fyHidiPTbiXXayrocirmi0apjXybUhWIUSh6SylrRCpbPitMOCzYelHerIq9ZRGZWiWERy+pUzC5SRLo19FQUFA7OztkOCuOQCt4OyxiNyyKc3OpgXveWSPcUCyliouzUiXZWyH0y831jnP2Shn0p5/ESTCuRTCHQTL6lnoAFyH7eFNEJQ77hV75c0RHBJldAAAKa0lEQVR4nO2di3PayB3HJSQSiGPHtiwbAQoYbDAYP3AAQ892wPiRJgEnaZI27TWJ+0jD5X13bey0ybnOP97f6oUkhKRQ+TSz2s/MHVmQd+b7mV3tQ0hQFIFAIBAIBAKBQCAQCAQCgUAgEAgEAoFAIBAIBNygPcDvDL8yXigLmjovnQXGnPfSAiDuYqThLu7irOHs7SKt4evtYq3h6u2ireHp7eKt4ejt17CGoTeibRS+Jftuu1jZ3Nvf39872KxU2wH25jp2u7J/GDOQjd06KJaD6c2lswNQlg6Hw5d1XLt2LZbNblRcmvM7qae4yLtbOZSUDVqTyGZ/Ww2aNue05YN0LBweam0Kkb3dCZY3p6i7B2pDs7GGxE05i/M7q4c4JK2k02NjLqwBi7ecRla/s3qHfc7ynVjYrbWpqcnFu0HxZt/UYtDUzNa06ceAtcnJxdv2Dc7vtJ5hF3I/NmawFgZXlzf2blSKxWLlxt4GDKHXDNaQONsznN9pPWN4xPKdtN4aOAvvV9qUFh5eYQI8lc3qrU3ad1R/s3rI0ITtMYO1WGyvSw3Gpqnu3amsztr09OJRgLW102GdtVi4IjtDrbBdhU5a7ZYVizTVuZ3tW5uert0LrLa2dFpTrKVjFSkxTVU3N2A1lUX/wf83NquKzE62plmz8+ZzWO+wjldO66zF9pEcmq7uoyHBsDbIZversov7i5q16ZnasH7qc1jvsEy3e9jvoem0LAaWpTGr+Vr2dkWqpzpZU63NzNTuB1HbRn80iG2UUVMrXo4NneVmJzvIR/leTbU2M9Ownof4ndYzrMJt9udrsT0krbwRs1kbwKTjXhnVdXdRtQbeukHT1tVZ20TWKjG7FZU6y4UD64uqNSBo2sZM1vacrYG3+xQlgjdVWsTy9OZ3Ws8YjLaXNvRQasONNTTrQN4e1BRrkUjDYuvS77SeMZBMmrHJY+jvUMxb7qyBt4cieDuqKdYikWiQtN3RdorG0MeurSFvqELNWqRZD462Ykyb5Xbh03331qRZrki1G4q1aLQRHG2HmjUYDugb32INZrl18FavKdaig83N77SeYcpVjamr90PI2M6q1rSrVFbidLPcLiVSD2dka9HxZlC0bWgbRWgcPJTPc6Dt0aPHjx//HvEbPX9APHnyZEZrcVBhtyFbg+ZmXiv4ndYzjLGUjY+x8KM/zpZyf/r+z0+fPT9eDc3Pf6cwb0Z9PxVaPX7+7MXah51c6S9PolG5wX0Nhra//u37vz99dhwCG4LA5+dTqVQy5JokHM7keQFpDB2/frH2j5e9QGj7BdpPKuVelB3gcP67rSBoKwneGOvDiQHQdp3xWhufC4C2Vw4nsiTDJIcXrWAy+GsTOVNTEQR9r2X4rYWFLV5tkXmpKDD9j2EUMWtMrmKtLbGc27m+beyjfCkej/NaUViQzlPigqySk4uJjFxMctul5eXclsk8NLeVndxyAk9tJZZlOcF0ZuNm4RNNg7CiNpkVJErY0U6IyGwyNDtkVOEFDipfxlLbDscApsAGbUndVGIraSj+AD1TUNsTvWxqb0lUM5vDUpvIOmkTSlCIZzJxuUUJy/1ijg/lpaYoV5ZhBrVxeHZSept30Mah5iTwvIDOZ5w0H6NYns8rRfTpdVZqVOZuChULC5hqW2adtMGRCTYUYkEQxYWQvTgqitIALMlERfQ2N6CNjWOqjU7mXWjjjNqgKMQTiVkhxENxFn1KyTaN2vI3aVy1rXCjaGPyMEqCJlUbOmqwtbE5bLWhQeGbtTHbKwjGSRuNrTa6P/13r01ecULRVps2IOCorcSOqk100MbOYqyNHqGT5ncSztryr2icta2Yl0UuhgRemYDYaWN3sNaWYB21KRM10Iam/bp5m2ECYtYmYq2N3rJaykurLiYprwNuctxN2Zfk4pXA/SC3Opvpbl6/4+Z3Ws/QZcrxFtq2M4htRj7753LKgVKRkos7eanrosUV6o+mxRVXwlybee+C64+AcU6/3xhKhpK683wypC7lpdpMS3ltYYWrtpKdtlBe2yrayqO+t20o6jaOTKdI3fQDT20rVp1U0wYTCam7lVblw3i1iKxB+4tbuw9xuoEUS22v8sbATOa6ygLqeElWWF0VWPVygVTk1GKSzZRmZ3Nb5uE4xG/hrS0+sEzI8yqq0KTxEouhKK3qB64YJhnMJyA7nOPluxFI6vY/sNR2k78IbQyj76V+p/UMLVHCYn/3/wddSWApjLXlWGZpyfPmJl22KmGsbYsHbUt2ClJDsPubJdDGZ/DVRkEfNWpLoQ6Gvvg3L33n7/jd69dv3774/ObNmzUJ+Mfnz2/fvn737vgYjpa+JJiCP9FrTC5JzQ1fbdBH80vIWyqFTKVCx6+33//84eXLf/34Y0Gh2SwYWdfzE/Dh5/fv3747liSidggVIm3L2GqTLpQyef75i7V/gipQ1Pz08ePHE7Mpa2UypyfwF59OZYf//s/a5+O81Nr6u+J+p/UMNZC8QcTkn17WvgJeK1Midb/Wv/tMvd9A+hY4cEXhqsRc4Qsliom5uUsajFIpj6u2kqKN+eWxdr9B7Sv6/H7tW6xRZ6q1iYmJtXmlUq2X+p3WM5Q811npi0HAf7Pa3Qa1cxrdfbboylqzhaydFPrWfpIr5DhB2xf3O61nqJPdzMJKrjQbh/Xjg6x2j0bjCHnrLLqxVjdbO21DtfHlUm5lISNiqk3P7f6dLY0jCs5v3Zmag7XCXNdsbb1lUbXfaT3DIlt7sX8fVfOeCN7EB/L9Z8OsNVvSUec6axNnFjVjrQ3du61Ym440o1I7ah81hlprnvfQIb0J3WgwsW75jCi/03qGVTj6qP+MhUi0UUcdleoeNWoW1grNE+RVpD6d6q2dfrSs2O+0nmGZjn5Y056xEBlvfu3R4IUq1x82mlHN2tUrsG44q5clab0zg7X1T9b1+p3WM6zj7fafTAHeCo0vZYqSzBUfnEebMuPnraL0tkglWqfrBmtfrKvFXRtdntQtDsYLzUarR0uGKHgp93q9Mro6L7/TA2mXDNZOhtSKvTa6PN1/xkIEOmazedZBz59BpkTlBb0mOmcgzaU1/LXR5Yc13Sx3XNoA+doq9voPcRN7H1tnpwUkzWCtNbTOAGijpWdTaLPc8Svq3tHZSav1qdU6OZs7VZzNqdqkMXTIaBAYbbQyyVXna1euFgqwYu9vHSFTcyZr67bPe/Y7rWfYhaSrtZppbQCrTwv6K6pz+8eL+53WM2xT0ruwODCvDeSl+1WdQNXaJdsOipU2p6c8V6ONIXseRmlg7fTE6Un2fmf1EIekNN2JNMdtrKna1s+cn2Lvd1YPccwKS/vxpr016J7nbh7973dWL3ERly6ew2JqqLXCesvVz5v4ndRT3ASG2W8HzBUGzmtz64VLX1z9xkQwtSFz1fr5VeO10ksndctnUAZA27f9XlO5W+zU661Wvd6ptt3/eg5+1sjvXI0I0TYaxNpoEGujQayNBrE2GsTaaBBrI0KkjQiRNirE2cgQZQQCgUAgEAgEAoFAIBAIBAKBQCAQCAQCgUAgECz4H1m2y7+5yKLZAAAAAElFTkSuQmCC"),);
  }

  Widget user_name(){
    return Container(height: AppConfig.logic_height(100),width:AppConfig.logic_width(700),
    child: MyTextField(
      controller: _phoneController,
      focusNode: _phoneFN,
      maxLength: 20,
      keyboardType: TextInputType.phone,
      style: AppConfig.normalTextStyle(
         Colors.black, AppConfig.logic_fontSize(30)),
      hintText: "请输入手机号",
      hintStyle: AppConfig.normalTextStyle(
          Colors.black54, AppConfig.logic_fontSize(25)),

      isBorder: true,

    ),
    );

  }
  Widget code(){
    return Container(height: AppConfig.logic_height(100),width:AppConfig.logic_width(700),
      child: MyTextField(
        controller: _codeController,
        focusNode: _codeFN,
        maxLength: 6,
        style: AppConfig.normalTextStyle(
            Colors.black, AppConfig.logic_fontSize(30)),
        hintText: "请输入验证码",
        keyboardType: TextInputType.emailAddress,
        hintStyle: AppConfig.normalTextStyle(
            Colors.black54, AppConfig.logic_fontSize(25)),
        isBorder: true,
        timerController: timerController,

        getVCode: (){
//          LogUtils.show(filter: "phonenum",msg: phoneCode+_phoneController.text);
//          _viewModel.sendSms(phoneNum: phoneCode+_phoneController.text );
////                    timerController.startTimer();
//          showDialog(context:context,builder: (context){
//            con =context;
//            return new LoadingDialog("请稍后...");
//          });
        },
      ),
    );
  }
  Widget button(){
    return Container(
      margin: EdgeInsets.only(top: AppConfig.logic_width(50)),
      height: AppConfig.logic_height(80),width:AppConfig.logic_width(700),
    child:FlatButton(
      onPressed: (){},
      textColor: Colors.white,
      color: Colors.red,
      disabledColor: Colors.red.withOpacity(0.6),
      disabledTextColor: Colors.red.withOpacity(0.8),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(

//            height: 48.0,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              "立即登陆",
              style: TextStyle(fontSize: AppConfig.logic_fontSize(30)),
            ),
          ),
        ],
      ),

    ) ,
    );
  }
}
