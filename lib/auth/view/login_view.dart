
import 'package:flutter/material.dart';
import 'package:pokemon_app/app_core/app_constants/app_colors.dart';
import 'package:pokemon_app/app_core/app_constants/app_spacing.dart';
import 'package:pokemon_app/app_core/app_constants/app_strings.dart';
import 'package:pokemon_app/app_core/app_constants/asset_path.dart';
import 'package:pokemon_app/auth/bloc/login_bloc.dart';
import 'package:pokemon_app/home/view/home_view.dart';
import 'package:pokemon_app/widgets/app_spacers.dart';
import 'package:pokemon_app/widgets/dimensions.dart';
import 'package:pokemon_app/widgets/text_field.dart';
import 'package:pokemon_app/widgets/text_widget.dart';
import 'package:provider/src/provider.dart';
import 'package:sizer/sizer.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (context) => const SignInScreen());
  }

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool checkedValue = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final  loginBloc = context.read<LoginBloc>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [bodyWidget(context,loginBloc)],
            ),
          ),
        ),
      ),
    );
  }

  bodyWidget(BuildContext context, LoginBloc loginBloc) {
    return Column(
      children: [
        PASpacer(height: 5.h,),
        Image.asset(
          bgSplash,
          width: 80.w,
          height: 20.h,
        ),
        inputFieldWidget(context,loginBloc),
        StreamBuilder<bool>(
          stream: loginBloc.loginValidate,
          builder: (context, snapshot) {
            return TextButton(

              onPressed:  snapshot.hasData ?  () {
                Navigator.pushReplacement(context, HomeScreen.route());
              }:null,
              child: Center(
                child: Container(
                    height: 7.h,
                    width: 60.w,
                    margin: EdgeInsets.only(
                      left: PASpace.horizontal,
                      right: PASpace.horizontal,
                      top: 2,
                      bottom: 2,
                    ),
                    decoration: BoxDecoration(
                        color:snapshot.hasData ? APPColors.appRed:APPColors.appGrey,
                        border:
                        Border.all(width: 1.0, color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(child: PAText.text(text: "Log-In",color: APPColors.appWhite,fontSize: 20.sp,))),
              ),
            );
          }
        ),
      ],
    );
  }

  inputFieldWidget(BuildContext context, LoginBloc loginBloc) {
    return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(
              top: Dimensions.heightSize * 2,
              left: Dimensions.marginSize,
              right: Dimensions.marginSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PAText.text(
                text: Strings.email,
                style: const TextStyle(color: Colors.black),
              ),
              PASpacer(
                height: Dimensions.heightSize * 0.5,
              ),
              StreamBuilder<Object>(
                stream: loginBloc.emailAddressDetail,
                builder: (context, snapshot) {
                  return PATextField(
                    hintText: 'Email Address',
                    errorText: snapshot.error.toString(),
                    icon: Icons.email,
                    borderRadius: 10,
                    validator: loginBloc.changeEmailAddressDetail,
                  );
                }
              ),
              PASpacer(
                height: Dimensions.heightSize,
              ),
              PAText.text(
                text: Strings.password,
                style: const TextStyle(color: Colors.black),
              ),
              PASpacer(
                height: Dimensions.heightSize * 0.5,
              ),
              StreamBuilder<Object>(
                stream: loginBloc.passwordDetail,
                builder: (context, snapshot) {
                  return PATextField(
                    hintText: 'Password',
                    errorText: snapshot.error.toString(),
                    icon: Icons.remove_red_eye_outlined,
                    borderRadius: 10,
                    validator: loginBloc.changePasswordDateDetail,
                  );
                }
              ),
              PASpacer(height: Dimensions.heightSize),
            ],
          ),
        ));
  }
}
