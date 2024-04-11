import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speechtotext/color.dart';

class SpeechToTextScreen extends StatefulWidget {
  const SpeechToTextScreen({super.key});

  @override
  State<SpeechToTextScreen> createState() => _SpeechToTextScreenState();
}

class _SpeechToTextScreenState extends State<SpeechToTextScreen> {
  SpeechToText speechToText = SpeechToText();

  var text = "Hold the Button and Start Speaking";
  var isListening = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AvatarGlow(
          animate: isListening,
          duration: const Duration(milliseconds: 2000),
          glowColor: bgColor,
          repeat: true,
          child: GestureDetector(
            onTapDown: (details) async {
              if (!isListening) {
                var available = await speechToText.initialize();
                if (available) {
                  setState(() {
                    isListening = true;
                    speechToText.listen(
                      onResult: (result) {
                        setState(() {
                          text = result.recognizedWords;
                        });
                      },
                    );
                  });
                }
              }
            },
            onTapUp: (details) {
              setState(() {
                isListening = false;
              });
              speechToText.stop();
            },
            child: CircleAvatar(
              backgroundColor: bgColor,
              radius: 35,
              child: Icon(
                isListening ? Icons.mic : Icons.mic_none,
                color: textColor,
              ),
            ),
          ),
        ),
        appBar: AppBar(
          leading: const Icon(
            Icons.sort_rounded,
            color: textColor,
          ),
          backgroundColor: bgColor,
          elevation: 0.0,
          centerTitle: true,
          title: const Text(
            "Speech to Text",
            style: TextStyle(fontWeight: FontWeight.w800, color: textColor),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          margin: const EdgeInsets.only(bottom: 150),
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.black54),
          ),
        ));
  }
}
