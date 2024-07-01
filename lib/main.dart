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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 25.0.sp, left: 25.0.sp),
              child: Align(
                alignment: Alignment.bottomRight,
                  child: Text("", style: TextStyle(fontSize: 32.sp, color: Colors.white),)
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                      onPressed: () {},
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
                      onPressed: () {},
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
                      onPressed: () {},
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
