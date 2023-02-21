import 'dart:html';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

//BUTTON LINKS
final Uri _urlConversation = Uri.parse(
    'https://app.squarespacescheduling.com/schedule.php?owner=26497893&appointmentType=34709216');
final Uri _urlEssay = Uri.parse(
    'https://app.squarespacescheduling.com/schedule.php?owner=26497893&appointmentType=40218550');
final Uri _urlTOEFLCourse = Uri.parse(
    'https://app.squarespacescheduling.com/schedule.php?owner=26497893&appointmentType=40218612');

// SOCIAL MEDIA LINKS
final Uri _urlTwitter = Uri.parse('https://twitter.com/_rcllc');
final Uri _urlInstagram = Uri.parse(
    'https://www.instagram.com/invites/contact/?i=tjphb4vtwcml&utm_content=ox2qwss');

// TRIAL BOOKING LINK
final Uri _urlTrialBooking = Uri.parse(
    'https://app.squarespacescheduling.com/schedule.php?owner=26497893&appointmentType=34338059');

const double borderValue = 50;
const double buttonFontSize = 44;
const double buttonHeight = 150;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Random Concepts, LLC. Links",
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
          ),
        ),
      ),
      home: const MyHomePage(
        title: 'Random Concepts, LLC. Links',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://va.media.tumblr.com/tumblr_rqdxk0lxhk1zl69cu_720.mp4');

    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const SizedBox(
        width: 400,
        height: 100,
        child: FittedBox(
          child: FloatingActionButton.extended(
            label: Text(
              'Book a 60 min. Trial Class! (40% off)',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            icon: Icon(Icons.book),
            backgroundColor: Colors.pinkAccent,
            onPressed: _launchUrTrialBooking,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 1920,
            maxHeight: 1850,
          ),
          padding: const EdgeInsets.all(32.0),
          color: Colors.white,
          child: Center(
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 1000,
                maxHeight: 1742,
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    children: [

                      /// RANDOM CONCEPTS BANNER //
                      // Container(
                      //   alignment: Alignment.center,
                      //   width: 800,
                      //   height: 100,
                      //   decoration: const BoxDecoration(
                      //     color: Colors.blueAccent,
                      //     borderRadius: BorderRadius.all(
                      //       Radius.circular(borderValue),
                      //     ),
                      //   ),
                      //   child: const Text(
                      //     'RANDOM CONCEPTS LLC',
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 40,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),

                      // SOCIAL MEDIA LINKS //
                      const SizedBox(
                        height: 40,),
                      // SOCIAL MEDIA ICONS CONTAINER

                      //TODO Uncomment this to show logo
                      // Image.asset(
                      //     'assets/images/rc_logo_for_link_cluster_blue.png'),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),

                  //TODO Uncomment this bellow to show video and play button!

                  Container(
                    constraints: const BoxConstraints(
                      maxWidth: 1000,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      width: 800,
                      height: 400,

                      child: FutureBuilder(
                        future: _initializeVideoPlayerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            return AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FloatingActionButton.extended(
                    label: Text(
                      _controller.value.isPlaying ? "Pause" : "Play",
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    backgroundColor: Colors.blueAccent,
                    onPressed: () {
                      setState(() {
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          _controller.play();
                        }
                      });
                    },
                    icon: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                  ),

                  // SOCIAl MEDIA LINKS //

                  // const SizedBox(
                  //   height: 60,
                  // ),
                  // Container(
                  //   alignment: Alignment.center,
                  //   width: 400,
                  //   height: 100,
                  //
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     mainAxisSize: MainAxisSize.max,
                  //     children: [
                  //       GestureDetector(
                  //         onTap: _launchUrlInstagram,
                  //         child: SizedBox(
                  //           width: 100,
                  //           height: 100,
                  //           child: Image.asset(
                  //               'assets/images/instagram_logo_blue.png'),
                  //         ),
                  //       ),
                  //       GestureDetector(
                  //         onTap: _launchUrlTwitter,
                  //         child: SizedBox(
                  //           width: 100,
                  //           height: 100,
                  //           child: Image.asset(
                  //               'assets/images/twitter_logo.png'),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),


                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    ' -  BOOK ONE OF OUR LIVE COURSES (Limited availability) - ',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 25),
                  ),

                  // CONVERSATIONAL CLASSES BUTTON
                  GestureDetector(
                    onTap: _launchUrlConversation,
                    child: Container(
                      width: 1000,
                      height: buttonHeight,
                      decoration: BoxDecoration(
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            color: Colors.blueAccent,
                            blurRadius: 0.0,
                            offset: Offset(0.0, 10),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(borderValue),
                        border: Border.all(color: Colors.blue, width: 5),
                        color: Colors.greenAccent,
                      ),
                      child: const Center(
                        child: Text(
                          'English Conversational Classes',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                            fontSize: buttonFontSize,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  // TOEFL ESSAY WRITING IMPROVEMENT BUTTON
                  GestureDetector(
                    onTap: _launchUrlEssay,
                    child: Container(
                      width: 1000,
                      height: buttonHeight,
                      decoration: BoxDecoration(
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            color: Colors.blueAccent,
                            blurRadius: 0.0,
                            offset: Offset(0.0, 10),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(borderValue),
                        border: Border.all(color: Colors.blue, width: 5),
                        color: Colors.purpleAccent,
                      ),
                      child: const Center(
                        child: Text(
                          'TOEFL Essay Writing Course',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                            fontSize: buttonFontSize,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  // COMPLETE TOEFL COURSE BUTTON
                  GestureDetector(
                    onTap: _launchUrlTOEFLCourse,
                    child: Container(
                      width: 1000,
                      height: buttonHeight,
                      decoration: BoxDecoration(
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            color: Colors.blueAccent,
                            blurRadius: 0.0,
                            offset: Offset(0.0, 10),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(borderValue),
                        border: Border.all(color: Colors.blue, width: 5),
                        color: Colors.deepOrangeAccent,
                      ),
                      child: const Center(
                        child: Text(
                          'TOEFL Course w/ A.S.I. Method',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                            fontSize: buttonFontSize,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // RANDOM CONCEPTS FILLER UP LOGO
                  // SizedBox(
                  //   width: 100,
                  //   height: 100,
                  //   child: FittedBox(
                  //     child: Image.asset('assets/images/logo_transparent.png'),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _launchUrlConversation() async {
  if (!await launchUrl(_urlConversation)) {
    throw 'Could not launch $_urlConversation';
  }
}

Future<void> _launchUrlEssay() async {
  if (!await launchUrl(_urlEssay)) {
    throw 'Could not launch $_urlEssay';
  }
}

Future<void> _launchUrlTOEFLCourse() async {
  if (!await launchUrl(_urlTOEFLCourse)) {
    throw 'Could not launch $_urlTOEFLCourse';
  }
}

Future<void> _launchUrlTwitter() async {
  if (!await launchUrl(_urlTwitter)) {
    throw 'Could not launch $_urlTwitter';
  }
}

Future<void> _launchUrlInstagram() async {
  if (!await launchUrl(_urlInstagram)) {
    throw 'Could not launch $_urlInstagram';
  }
}

Future<void> _launchUrTrialBooking() async {
  if (!await launchUrl(_urlTrialBooking)) {
    throw 'Could not launch $_urlTrialBooking';
  }
}
