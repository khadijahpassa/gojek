import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gojek/consts.dart';
import 'package:gojek/models/message.dart';
import 'package:gojek/state-management/theme_provider.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:provider/provider.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [
    Message(text: "Hi", isUser: true),
    Message(text: "Halo, lagi mau kemana nih?", isUser: false),
    Message(text: "Mau jalan jalan dong", isUser: true),
    Message(
        text:
            "Widih, ada yang bisa aku bantu gak buat bikin liburan kamu makin seru!",
        isUser: false),
  ];

  callGeminiModel() async {
    try {
      if (_controller.text.isNotEmpty) {
        _messages.add(Message(text: _controller.text, isUser: true));
      }

      final model = GenerativeModel(
        model: 'gemini-pro',
        apiKey: dotenv.env['GOOGLE_API_KEY']!,
      );

      final prompt = _controller.text.trim();
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);

      if (response.text != null) {
        setState(() {
          _messages.add(Message(
              text: response.text!,
              isUser: false)); // Menambah respons ke daftar pesan
        });
      } else {
        print('No response text received');
      }

      _controller.clear(); // Clear the input field after sending
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final textColor = themeProvider.isDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: themeProvider.isDarkTheme ? black : Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'GoChat',
              style: TextStyle(
                color: textColor,
                fontSize: 24,
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 5),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Powered by", 
                  style: TextStyle(
                    fontSize: 12,
                    color: themeProvider.isDarkTheme ? white : black,
                    height: 0
                  )
                ),
                const SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: SvgPicture.asset(
                    'assets/icons/gemini_logo.svg', 
                    height: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0), // Padding di sekitar body
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Align(
                      alignment: message.isUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        padding:
                            const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                        decoration: BoxDecoration(
                          color:
                              message.isUser ? primaryColor : themeProvider.isDarkTheme ? darkGrey : Colors.grey[300],
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(12),
                            topRight: const Radius.circular(12),
                            bottomLeft: message.isUser
                                ? const Radius.circular(12)
                                : const Radius.circular(0),
                            bottomRight: message.isUser
                                ? const Radius.circular(0)
                                : const Radius.circular(12),
                          ),
                        ),
                        child: Text(
                          message.text,
                          style: TextStyle(
                            color: message.isUser ? Colors.white : themeProvider.isDarkTheme ? Colors.white : Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 15), // Padding di sekitar input
              child: Container(
                decoration: BoxDecoration(
                  color: themeProvider.isDarkTheme ? darkGrey : Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        cursorColor: themeProvider.isDarkTheme ? Colors.white : primaryColor,
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: "Ketik di sini...",
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: defaultPadding),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: callGeminiModel,
                      icon: Icon(Icons.send_rounded, size: 28, color: themeProvider.isDarkTheme ? Colors.white : primaryColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
