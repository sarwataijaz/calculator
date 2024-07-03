import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Responsive Sizer Example',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var temp = "";

  void _calculate() {
    List<String> totalOperators = ['+', '-', 'x', '/', '%'];

    List<double> numbers = [];
    List<String> operators = [];

    String number = "";
    for (int i = 0; i < temp.length; i++) {
      if (totalOperators.contains(temp[i])) {
        operators.add(temp[i]);
        if (number.isNotEmpty) {
          numbers.add(double.parse(number));
          number = ""; // Reset number string
        }
      } else {
        number += temp[i];
      }
    }

    if (number.isNotEmpty) {
      numbers.add(double.parse(number));
      number = ""; // Reset number string
    }

    print(numbers.length);
    print(operators.length);

    if (operators.length + 1 != numbers.length) {
      setState(() {
        temp = "Syntax Error";
        print(temp);
      });
      temp = "";
      return;
    }

    double ans = numbers[0];

    // 78 + 10 / 2 - 89 x 5698 % 34
    // 78 10 2 89 5698 34
    // + / - x %

    for (int i = 0; i < operators.length; i++) {
      double firstNum = ans;
      double secondNum = numbers[i + 1];

      switch (operators[i]) {
        case '+':
          ans = firstNum + secondNum;
          break;
        case '-':
          ans = firstNum - secondNum;
          break;
        case 'x':
          ans = firstNum * secondNum;
          break;
        case '/':
          ans = firstNum / secondNum;
          break;
        case '%':
          ans = (firstNum / secondNum) * 100;
          break;
      }
    }

    int intAns;

    if (ans == ans.truncate()) {
      int intAns = ans.toInt(); // Convert ans to int
      setState(() {
        temp = intAns.toString();
      });
    } else {
      setState(() {
        temp = ans.toString();
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(
                    right: 25.0.sp, left: 25.0.sp, bottom: 15.0.sp),
                child: Container(
                    child: Text(
                  temp,
                  style: TextStyle(fontSize: 32.sp, color: Colors.white),
                  maxLines: 1,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.ltr,
                  softWrap: false,
                  overflow: TextOverflow.clip,
                )),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  bottom: 13.0.sp, left: 15.0.sp, right: 15.0.sp),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 37.sp,
                        // Set maximum width to double.infinity for full width
                        maxHeight:
                            37.sp, // Set maximum height to 50.0 logical pixels
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            temp = "";
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.white60, // Adjust padding as needed
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          // Align the text to the left
                          child: Text(
                            "AC",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 19.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0.sp),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 37.sp,
                        // Set maximum width to double.infinity for full width
                        maxHeight:
                            37.sp, // Set maximum height to 50.0 logical pixels
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.white60, // Adjust padding as needed
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          // Align the text to the left
                          child: Text(
                            "+/-",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 19.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0.sp),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 37.sp,
                        // Set maximum width to double.infinity for full width
                        maxHeight:
                            37.sp, // Set maximum height to 50.0 logical pixels
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            temp += " % ";
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.white60, // Adjust padding as needed
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          // Align the text to the left
                          child: Text(
                            "%",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 19.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0.sp),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 37.sp,
                        // Set maximum width to double.infinity for full width
                        maxHeight:
                            37.sp, // Set maximum height to 50.0 logical pixels
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            temp += " / ";
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFFA500)
                            // Adjust padding as needed
                            ),
                        child: Align(
                          alignment: Alignment.center,
                          // Align the text to the left
                          child: Text(
                            "/",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  bottom: 13.0.sp, left: 15.0.sp, right: 15.0.sp),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 37.sp,
                        // Set maximum width to double.infinity for full width
                        maxHeight:
                            37.sp, // Set maximum height to 50.0 logical pixels
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            temp += "7";
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Color(0xFF4D4D4D), // Adjust padding as needed
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          // Align the text to the left
                          child: Text(
                            "7",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0.sp),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 37.sp,
                        // Set maximum width to double.infinity for full width
                        maxHeight:
                            37.sp, // Set maximum height to 50.0 logical pixels
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            temp += "8";
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Color(0xFF4D4D4D), // Adjust padding as needed
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          // Align the text to the left
                          child: Text(
                            "8",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0.sp),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 37.sp,
                        // Set maximum width to double.infinity for full width
                        maxHeight:
                            37.sp, // Set maximum height to 50.0 logical pixels
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            temp += "9";
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Color(0xFF4D4D4D), // Adjust padding as needed
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          // Align the text to the left
                          child: Text(
                            "9",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0.sp),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 37.sp,
                        // Set maximum width to double.infinity for full width
                        maxHeight:
                            37.sp, // Set maximum height to 50.0 logical pixels
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            temp += " x ";
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFFA500)
                            // Adjust padding as needed
                            ),
                        child: Align(
                          alignment: Alignment.center,
                          // Align the text to the left
                          child: Text(
                            "x",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  bottom: 13.0.sp, left: 15.0.sp, right: 15.0.sp),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 37.sp,
                        // Set maximum width to double.infinity for full width
                        maxHeight:
                            37.sp, // Set maximum height to 50.0 logical pixels
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            temp += "4";
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Color(0xFF4D4D4D), // Adjust padding as needed
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          // Align the text to the left
                          child: Text(
                            "4",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0.sp),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 37.sp,
                        // Set maximum width to double.infinity for full width
                        maxHeight:
                            37.sp, // Set maximum height to 50.0 logical pixels
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            temp += "5";
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Color(0xFF4D4D4D), // Adjust padding as needed
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          // Align the text to the left
                          child: Text(
                            "5",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0.sp),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 37.sp,
                        // Set maximum width to double.infinity for full width
                        maxHeight:
                            37.sp, // Set maximum height to 50.0 logical pixels
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            temp += "6";
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Color(0xFF4D4D4D), // Adjust padding as needed
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          // Align the text to the left
                          child: Text(
                            "6",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0.sp),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 37.sp,
                        // Set maximum width to double.infinity for full width
                        maxHeight:
                            37.sp, // Set maximum height to 50.0 logical pixels
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            temp += " - ";
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFFA500)
                            // Adjust padding as needed
                            ),
                        child: Align(
                          alignment: Alignment.center,
                          // Align the text to the left
                          child: Text(
                            "-",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  bottom: 13.0.sp, left: 15.0.sp, right: 15.0.sp),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 37.sp,
                        // Set maximum width to double.infinity for full width
                        maxHeight:
                            37.sp, // Set maximum height to 50.0 logical pixels
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            temp += "1";
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Color(0xFF4D4D4D), // Adjust padding as needed
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          // Align the text to the left
                          child: Text(
                            "1",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0.sp),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 37.sp,
                        // Set maximum width to double.infinity for full width
                        maxHeight:
                            37.sp, // Set maximum height to 50.0 logical pixels
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            temp += "2";
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Color(0xFF4D4D4D), // Adjust padding as needed
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          // Align the text to the left
                          child: Text(
                            "2",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0.sp),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 37.sp,
                        // Set maximum width to double.infinity for full width
                        maxHeight:
                            37.sp, // Set maximum height to 50.0 logical pixels
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            temp += "3";
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Color(0xFF4D4D4D), // Adjust padding as needed
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          // Align the text to the left
                          child: Text(
                            "3",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0.sp),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 37.sp,
                        // Set maximum width to double.infinity for full width
                        maxHeight:
                            37.sp, // Set maximum height to 50.0 logical pixels
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            temp += " + ";
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFFA500)
                            // Adjust padding as needed
                            ),
                        child: Align(
                          alignment: Alignment.center,
                          // Align the text to the left
                          child: Text(
                            "+",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  bottom: 30.0.sp, left: 20.0.sp, right: 20.0.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          temp += "0";
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0.sp, vertical: 10.0.sp),
                        backgroundColor:
                            Color(0xFF4D4D4D), // Adjust padding as needed
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        // Align the text to the left
                        child: Text(
                          "0",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 37.sp,
                      // Set maximum width to double.infinity for full width
                      maxHeight:
                          37.sp, // Set maximum height to 50.0 logical pixels
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          temp += ".";
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color(0xFF4D4D4D), // Adjust padding as needed
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        // Align the text to the left
                        child: Text(
                          ".",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0.sp),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 37.sp,
                      // Set maximum width to double.infinity for full width
                      maxHeight:
                          37.sp, // Set maximum height to 50.0 logical pixels
                    ),
                    child: ElevatedButton(
                      onPressed: _calculate,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFFA500)
                          // Adjust padding as needed
                          ),
                      child: Align(
                        alignment: Alignment.center,
                        // Align the text to the left
                        child: Text(
                          "=",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
