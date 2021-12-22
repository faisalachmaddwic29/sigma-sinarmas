import 'package:flutter/material.dart';
import 'package:sinarmas/presenter/extension/color.dart';
import 'package:sinarmas/presenter/extension/fonts.dart';
import 'package:sinarmas/presenter/ui/main/main_page.dart';
import 'package:sinarmas/presenter/widgets/button.dart';
import '../../extension/margin_helper.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const Image(
              // fit: BoxFit.fitHeight,
              image: AssetImage('assets/images/initial_background.png'),
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Favorite',
                    style: SinarmasFonts().bold(),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Foods',
                        style: SinarmasFonts()
                            .bold()
                            .copyWith(color: SinarmasColors.primary),
                      )
                    ],
                  ),
                ).marginBottom(30),
                Text(
                  'The unique in favorite food, Our services is  to filling your list food with delicious food and your trust.',
                  style: SinarmasFonts().regular(),
                ).marginBottom(30),
                primaryButton(
                  context,
                  width: 158,
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const MainPage()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Get Started',
                          style: SinarmasFonts()
                              .medium()
                              .copyWith(color: SinarmasColors.text),
                        ),
                        const SizedBox(width: 14),
                        const Image(
                          image: AssetImage('assets/images/cart.png'),
                          fit: BoxFit.fill,
                          height: 18,
                          width: 22,
                        )
                      ],
                    ),
                  ),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) => const MainPage()));
                //   },
                //   child: Text(
                //     'Get Started',
                //     style: SinarmasFonts()
                //         .medium()
                //         .copyWith(color: SinarmasColors.text),
                //   ),
                // )
              ],
            ).marginSymetric(horizontal: 25, vertical: 20),
          )
        ],
      ),
    );
  }
}
