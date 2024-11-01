import 'package:dentascan/views/prediction_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static const routeName = '/home';

  // Définir les URLs ici
  final Uri _cancerInfoUrl = Uri.parse(
      'https://www.who.int/news-room/fact-sheets/detail/oral-health'); // Lien vers les informations sur le cancer du sein
  final Uri _githubUrl =
      Uri.parse('https://github.com/Niarea'); // Lien vers votre code source

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Dental Diseases Prediction',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image Section
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/dental_health.png'), // Path to your image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Text Section
              const Text(
                'Get Dental Diseases Predictions',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                'This app uses a Convolutional Neural Network (CNN) model trained on dental diseases data to predict whether calculus, caries, gingivitis, hypodontia or tooth discoloration.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              // Start Prediction Button
              ElevatedButton(
                onPressed: () {
                  // Redirect to prediction screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PredictionScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 30, 44, 233), // Pink button
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Start Prediction',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Links Section
              ListTile(
                title: const Text('Learn more about about dental diseases'),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () async {
                  await _launchUrl(_cancerInfoUrl);
                },
              ),
              ListTile(
                title: const Text('View source code for this app'),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () async {
                  await _launchUrl(_githubUrl);
                },
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),

      // Integrate Bottom Navigation Bar here
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
