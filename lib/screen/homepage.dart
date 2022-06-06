import 'package:firefit_app/constant.dart';
import 'package:firefit_app/screen/userFitness.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: mainColor,
          leading: const Icon(
            Iconsax.arrow_left_2,
            color: Colors.white,
          ),
          actions: const <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(
                Iconsax.menu_1,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(gradient: gradientMain),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/FireFit-nobg.png"),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserFitness()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      gradient: gradientOrange,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 50),
                    child: Text(
                      "Sign Up",
                      style: gFontStyle(14, Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserFitness()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 55),
                    child: Text(
                      "Login",
                      style: gFontStyle(14, orange),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Forgot your password?",
                style: gFontStyle(12, Colors.white),
              )
            ],
          ),
        ));
  }
}
