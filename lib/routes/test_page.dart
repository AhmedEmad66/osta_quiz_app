import 'package:flutter/material.dart';
import 'package:osta_quiz_app/routes/score_page.dart';
import '../components/answered_message.dart';
import '../components/progress_bar.dart';
import '../res/my_colors.dart';
import '../res/my_images.dart';

class TestPage extends StatefulWidget {
  const TestPage({
    super.key,
    required this.testCategoryName,
    required this.categoryColor,
    required this.questions,
  });
  final String testCategoryName;
  final Color categoryColor;
  static String id = "TestPage";
  final List questions;

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int score = 0;
  bool btnPressed = false;
  PageController? _controller;
  bool answered = false;
  String btnText = "Next Question";

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.kPrimaryColor,
        appBar: AppBar(
          backgroundColor: widget.categoryColor,
          title: Text(
            widget.testCategoryName,
            style: const TextStyle(
              fontFamily: "MyFont",
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                AppImages.kAppLogo,
                width: 55,
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            // Background Image
            Image.asset(
              AppImages.kOpeningBG,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              child: Column(
                children: [
                  const CustomProgressBar(),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: PageView.builder(
                      controller: _controller!,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.questions.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Question ${index + 1}/${widget.questions.length}",
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 28.0,
                                ),
                              ),
                            ),
                            const Divider(
                              color: Colors.white,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 150.0,
                              child: Text(
                                "${widget.questions[index].question}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                ),
                              ),
                            ),
                            for (int i = 0;
                                i < widget.questions[index].answers!.length;
                                i++)
                              Container(
                                width: double.infinity,
                                height: 50.0,
                                margin: const EdgeInsets.only(
                                    bottom: 20.0, left: 12.0, right: 12.0),
                                child: RawMaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  fillColor: btnPressed
                                      ? widget.questions[index].answers!.values
                                              .toList()[i]
                                          ? Colors.green
                                          : Colors.red
                                      : widget.categoryColor,
                                  onPressed: !answered
                                      ? () {
                                          if (widget
                                              .questions[index].answers!.values
                                              .toList()[i]) {
                                            score = score + 10;
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                elevation: 0,
                                                backgroundColor:
                                                    Colors.transparent,
                                                duration:
                                                    Duration(milliseconds: 700),
                                                content: AnsweredMessage(
                                                  contentText: "Correct +10pt",
                                                  color: Colors.green,
                                                  withImage: true,
                                                ),
                                              ),
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                elevation: 0,
                                                backgroundColor:
                                                    Colors.transparent,
                                                duration:
                                                    Duration(milliseconds: 700),
                                                content: AnsweredMessage(
                                                  contentText: "So close",
                                                  color: Colors.red,
                                                  withImage: false,
                                                ),
                                              ),
                                            );
                                          }
                                          setState(() {
                                            btnPressed = true;
                                            answered = true;
                                          });
                                        }
                                      : null,
                                  child: Text(
                                      widget.questions[index].answers!.keys
                                          .toList()[i],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                      )),
                                ),
                              ),
                            // Next Question btn
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromARGB(255, 0, 204, 255),
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: RawMaterialButton(
                                onPressed: () {
                                  if (_controller!.page?.toInt() ==
                                      widget.questions.length - 1) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ScorePage(
                                                  result: score,
                                                )));
                                  } else {
                                    _controller!.nextPage(
                                        duration:
                                            const Duration(milliseconds: 250),
                                        curve: Curves.easeInExpo);

                                    setState(() {
                                      btnPressed = false;
                                      answered = false;
                                    });
                                  }
                                },
                                shape: const StadiumBorder(),
                                fillColor: AppColors.kTransparent,
                                padding: const EdgeInsets.all(18.0),
                                elevation: 0.0,
                                child: Text(
                                  btnText,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
