import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_dashboard/constants.dart';
import 'package:fruits_dashboard/core/components/custom_btn.dart';
import 'package:fruits_dashboard/core/components/custom_text_form_field.dart';
import 'package:fruits_dashboard/core/helper/build_snack_bar.dart';
import 'package:fruits_dashboard/core/helper/excution_navigator.dart';
import 'package:fruits_dashboard/core/services/service_locator.dart';
import 'package:fruits_dashboard/core/utils/app_colors.dart';
import 'package:fruits_dashboard/features/add_product_feature/presentation/views/add_product_view.dart';
import 'package:fruits_dashboard/features/auth_feature/presentation/manager/cubit/auth_cubit_cubit.dart';
import 'package:fruits_dashboard/features/auth_feature/presentation/manager/cubit/auth_cubit_state.dart';

class LoginViewBody extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          showSnackBar(
            context,
            'Successfully logged in',
            AppColors.primaryColor,
          );
          //    executionPushReplacmentNamedNavigator(context, TestView.routeName, 0);
          executionPushReplacmentNamedNavigator(
            context,
            AddProductView.routeName,
            0,
          );
        } else if (state is AuthFailure) {
          showSnackBar(context, state.message, Colors.red);
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            children: [
              CustomTextFormField(
                controller: emailController,
                hintText: 'userEmail',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This Field is Required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: passwordController,
                obscureText:
                    !BlocProvider.of<AuthCubit>(context).isPasswordVisible,
                suffixIcon:
                    BlocProvider.of<AuthCubit>(context).isPasswordVisible
                        ? Icons.remove_red_eye_rounded
                        : Icons.visibility_off,
                onPressed: () {
                  BlocProvider.of<AuthCubit>(
                    context,
                  ).togglePasswordVisibility();
                },
                hintText: 'userPassword',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This Field is Required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: CustomBtnApp(
                  text: 'SignIn',
                  isLoading: state is AuthLoading,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      serviceLocator<AuthCubit>().login(
                        emailController.text,
                        passwordController.text,
                      );
                    }
                  },
                  textColor: AppColors.whiteColor,
                  borderRadius: kBorderRadius,
                  elevation: 0,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
