import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounterNum = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Counter Functions"),
            centerTitle: true,
            actions: [
              IconButton(
                  //Icon Refresh
                  onPressed: () {
                    setState(() {
                      clickCounterNum = 1;
                    });
                  },
                  icon: const Icon(Icons.refresh_rounded)),
              IconButton(
                  //Icon DarkMode
                  onPressed: () {},
                  icon: const Icon(Icons.dark_mode))
            ]),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$clickCounterNum",
                style:
                    const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
              ),
              Text(
                "Clic${clickCounterNum == 1 ? 'k' : 'ks'}",
                style: const TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.refresh_outlined,
              onPressed: () {
                setState(() {
                  clickCounterNum = 0;
                });
              },
            ),
            const SizedBox(height: 10),
            CustomButton(
              icon: Icons.plus_one_rounded,
              onPressed: () {
                setState(() {
                  clickCounterNum++;
                });
              },
            ),
            const SizedBox(height: 10),
            CustomButton(
              icon: Icons.exposure_minus_1_outlined,
              onPressed: () {
                setState(() {
                  if (clickCounterNum == 0) return;
                  clickCounterNum--;
                });
              },
            ),
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      backgroundColor: const Color.fromARGB(255, 61, 133, 241),
      onPressed: onPressed,
      child: Icon(icon, color: Colors.white),
    );
  }
}
