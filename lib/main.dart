import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
FlutterError.onError = (FlutterErrorDetails details) {
  // Log or handle the error details
};
  runApp( MyApp());
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
    _scrollToStart();
    print("function called");

    String input = temp.replaceAll(' ', '');

    print("Input temp: $input");

    List<String> totalOperators = ['+', '-', 'x', '/', '%'];

    List<double> numbers = [];
    List<String> operators = [];

    String number = "";
    for (int i = 0; i < input.length; i++) {
      print("Processing character: ${input[i]} at index $i");

      if (input[i] == '-' &&
          (i == 0 || totalOperators.contains(input[i - 1]))) {
        number += input[i];
        print("Building negative number: $number");
        continue;
      }
      if (totalOperators.contains(input[i])) {
        print(number);
        if (number.isEmpty) {
          // If there's no number before the operator, it's a syntax error
          setState(() {
            temp = "Syntax Error";
          });
          return;
        }
        operators.add(input[i]);
        try {
          numbers.add(double.parse(number));
        } catch (e) {
          print(number);
          setState(() {
            temp = "Syntax Error";
          });
          return;
        }
        number = ""; // Reset number string
      } else {
        number += input[i];
      }
    }

    if (number.isNotEmpty) {
      try {
        numbers.add(double.parse(number));
      } catch (e) {
        setState(() {
          temp = "Syntax Error";
        });
        return;
      }
      number = ""; // Reset number string
    }

    if (numbers.isEmpty ||
        (operators.length + 1 != numbers.length && !operators.contains('%'))) {
      setState(() {
        temp = "Syntax Error";
      });
      return;
    }

    double ans = numbers[0];

    // Special case for a single number with a percentage
    if (operators.length == 1 && operators[0] == '%' && numbers.length == 1) {
      ans = ans / 100;
    } else {
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
            if (secondNum == 0) {
              setState(() {
                temp = "Division by Zero";
              });
              temp = "";
              return;
            }
            ans = firstNum / secondNum;
            break;
          case '%':
            ans = (firstNum * secondNum) / 100;
            break;
        }
      }
    }

    String finalAns;
    if (ans == ans.truncate()) {
      int intAns = ans.toInt();
      if (intAns < 0) {
        finalAns = intAns.toString().substring(0, 1) +
            ' ' +
            intAns.toString().substring(1);
        setState(() {
          temp = finalAns;
        });
      } else {
        setState(() {
          temp = intAns.toString();
        });
      }
    } else {
      if (ans < 0) {
        finalAns =
            ans.toString().substring(0, 1) + ' ' + ans.toString().substring(1);
        setState(() {
          temp = finalAns;
        });
      } else {
        setState(() {
          temp = ans.toString();
        });
      }
    }
  }

  final ScrollController _scrollController = ScrollController();

  void _scrollToEndIfNecessary() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  void _scrollToStart() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(0);
    }
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    //double textSize = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(builder: (context, constraints) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollToEndIfNecessary();
        });

        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              child: Padding(
                padding: EdgeInsets.only(
                    right: 25.0.sp, left: 25.0.sp, bottom: 15.0.sp),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width),
                  child: Container(
                      child: Align(
                    alignment: Alignment.bottomRight,
                    child: Expanded(
                      child: Text(
                        temp,
                        style: TextStyle(fontSize: (screenWidth*0.08).sp, color: Colors.white),
                        maxLines: 1,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.ltr,
                        softWrap: false,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  )),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  bottom: 13.0.sp, left: 15.0.sp, right: 15.0.sp),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 20.w,
                        maxHeight: 10.h,
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
                        child: Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            // Align the text to the left
                            child: Text(
                              "AC",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: ((screenWidth*0.05)).sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 3.0.w),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 20.w,
                        maxHeight: 10.h,
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.white60, // Adjust padding as needed
                        ),
                        child: Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            // Align the text to the left
                            child: Text(
                              "+/-",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: (screenWidth*0.05).sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 3.0.w),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 20.w,
                        maxHeight: 10.h,
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
                              fontSize: (screenWidth*0.05).sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 3.0.w),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 20.w,
                        maxHeight: 10.h,
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
                              fontSize: (screenWidth*0.05).sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            Container(
              padding: EdgeInsets.only(
                  bottom: 13.0.sp, left: 15.0.sp, right: 15.0.sp),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 20.w,
                        maxHeight: 10.h,
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
                              fontSize: (screenWidth*0.07).sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 3.0.w),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 20.w,
                        maxHeight: 10.h,
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
                              fontSize: (screenWidth*0.07).sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 3.0.w),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 20.w,
                        maxHeight: 10.h,
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
                              fontSize: (screenWidth*0.07).sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 3.0.w),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 20.w,
                        maxHeight: 10.h,
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
                              fontSize: (screenWidth*0.06).sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            Container(
              padding: EdgeInsets.only(
                  bottom: 13.0.sp, left: 15.0.sp, right: 15.0.sp),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 20.w,
                        maxHeight: 10.h,
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
                              fontSize: (screenWidth*0.07).sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 3.0.w),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 20.w,
                        maxHeight: 10.h,
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
                              fontSize: (screenWidth*0.07).sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 3.0.w),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 20.w,
                        maxHeight: 10.h,
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
                              fontSize: (screenWidth*0.07).sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 3.0.w),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 20.w,
                        maxHeight: 10.h,
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
                              fontSize: (screenWidth*0.07).sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            Container(
              padding: EdgeInsets.only(
                  bottom: 13.0.sp, left: 15.0.sp, right: 15.0.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 20.w,
                        maxHeight: 10.h,
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
                              fontSize: (screenWidth*0.07).sp,
                            ),
                          ),
                        ),
                      ),
                      ),
                    SizedBox(width: 3.0.w),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 20.w,
                        maxHeight: 10.h,
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
                              fontSize: (screenWidth*0.07).sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 3.0.w),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 20.w,
                        maxHeight: 10.h,
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
                              fontSize: (screenWidth*0.07).sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 3.0.w),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 20.w,
                        maxHeight: 10.h,
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
                              fontSize: (screenWidth*0.06).sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
                            fontSize: (screenWidth*0.07).sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 3.0.w),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 20.w,
                      maxHeight: 10.h,
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
                            fontSize: (screenWidth*0.07).sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 3.0.w),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 20.w,
                      maxHeight: 10.h,
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
                            fontSize: (screenWidth*0.06).sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
