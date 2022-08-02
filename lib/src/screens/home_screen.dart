import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:info_app/src/custom_widgets/message_button.dart';
import 'package:info_app/src/custom_widgets/social_media_button.dart';
import 'package:info_app/src/screens/messaging_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  void _launchUrl(url) async {
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: screenWidth * 0.4,
                height: screenWidth * 0.4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFBDFFD7).withOpacity(0.49),
                    width: 8,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/binar.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Binar Talib Younis',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: screenWidth * 0.75,
                child: const Text(
                  '''Greetings\nI am Binar, from Halabjay Shaheed and I am Software Engineering graduate, I love to develop mobile applications, and I can speak Kurdish, English, and Turkish.
                ''',
                  textAlign: TextAlign.center,
                ),
              ),
              SocialMediaButton(
                onTap: () {
                  Uri url = Uri.parse(
                      'https://www.linkedin.com/in/binar-talib-592b02186/');
                  _launchUrl(url);
                },
                color: const Color(0xFFF3F2FF),
                title: 'LinkedIn Profile',
                icon: FontAwesomeIcons.linkedinIn,
              ),
              SocialMediaButton(
                onTap: () {
                  Uri url =
                      Uri.parse('https://www.facebook.com/Binar.Talib.545/');
                  _launchUrl(url);
                },
                color: const Color(0xFFC7E4FF),
                title: 'Facebook Profile',
                icon: FontAwesomeIcons.facebookF,
              ),
              SocialMediaButton(
                onTap: () {
                  Uri url = Uri.parse('https://www.instagram.com/binar_talib/');
                  _launchUrl(url);
                },
                color: const Color(0xFFFFF2F2),
                title: 'Instagram Profile',
                icon: FontAwesomeIcons.instagram,
              ),
              SocialMediaButton(
                onTap: () {},
                color: const Color(0xFFFFFBF2),
                title: 'My Website',
                icon: FontAwesomeIcons.globe,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MessageButton(
                    image: 'assets/images/whatsapp.png',
                    onTap: () {
                      Uri url =
                          Uri.parse('whatsapp://send?phone=+964-750-102-6647');
                      _launchUrl(url);
                    },
                  ),
                  MessageButton(
                    image: 'assets/images/mail.png',
                    onTap: () {
                      Uri url = Uri.parse('mailto:binartalib2000@gmail.com');
                      _launchUrl(url);
                    },
                  ),
                  MessageButton(
                    image: 'assets/images/sms.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MessagingScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
