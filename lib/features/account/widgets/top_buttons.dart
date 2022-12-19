import 'package:flutter/material.dart';
import 'package:llunkei_test_app/features/account/widgets/account_button.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: 'Add a To Do List',
              onTap: () {},
            ),
            AccountButton(
              text: 'Remove a To Do List',
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            AccountButton(
              text: 'Log Out',
              onTap: () {},
            ),
            AccountButton(
              text: 'Update a To Do list',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
