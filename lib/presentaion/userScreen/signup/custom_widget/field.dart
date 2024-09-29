import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:invoice/utils/textformfiled/customtextformfiled.dart';
import 'package:invoice/utils/validator/validator.dart';

final TextEditingController emailController = TextEditingController();
String? pickedImage;
final TextEditingController nameController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

// !--------------------------phone-----------------------------------
class Fields {
  static Widget phoneFields() {
    return IntlPhoneField(
      controller: phoneController,
      validator: (value) => Validator().numberValidator(value.toString()),
      decoration: const InputDecoration(
        labelText: 'Phone Number',
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        prefixIcon: Text('+'),
      ),
      initialCountryCode: 'IN',
      onChanged: (phone) {},
    );
  }

// !--------------------------organizationname-----------------------------------
  static Widget nameFields() {
    return CustomTextFormField(
      controller: nameController,
      labelText: '',
      hintText: '',
      keyboardType: TextInputType.name,
      validator: (value) => Validator().nameValidator(value),
    );
  }

// !--------------------------email-----------------------------------
  static Widget emailFields() {
    return CustomTextFormField(
      // Custom text form field
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) => Validator().emailValidator(value),
    );
  }

// !--------------------------phone-----------------------------------
  static Widget phonefields() {
    return CustomTextFormField(
      controller: phoneController,
      keyboardType: TextInputType.phone,
      validator: (value) => Validator().numberValidator(value),
    );
  }

  // !--------------------------phone-----------------------------------
  static Widget passwordfields() {
    return CustomTextFormField(
      controller: passwordController,
      keyboardType: TextInputType.number,
      validator: (value) => Validator().passwordValidator(value),
    );
  }
}
