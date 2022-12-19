import 'package:flutter/material.dart';
import 'package:llunkei_test_app/constants/global_variables.dart';
import 'package:llunkei_test_app/features/account/widgets/below_app_bar.dart';
import 'package:llunkei_test_app/features/account/widgets/todolists.dart';
import 'package:llunkei_test_app/features/account/widgets/top_buttons.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/images/parrot-188860280.jpg',
                width: 120,
                height: 45,
                //color: Colors.black,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(Icons.add_outlined),
                  ),
                  Icon(Icons.search),
                ],
              ),
            ),
          ]),
        ),
      ),
      body: Column(
        children: const [
          BelowAppBar(),
          SizedBox(height: 10),
          TopButtons(),
          SizedBox(height: 20),
          ToDoLists(),
        ],
      ),
    );
  }
}
