import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task_1/sections/custom_image_picker.dart';
import 'package:task_1/sections/custom_modal_sheet_page.dart';
import 'package:task_1/sections/custom_widget.dart';
import 'package:task_1/sections/db_helper.dart';
import 'package:task_1/sections/list_of_items.dart';
import 'package:task_1/sections/loading_animation.dart';
import 'package:task_1/sections/widget_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<WidgetProvider>(
      create: (_) => WidgetProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StartingAnimation(),
      ),
    ),
  );
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    File? selectedImage;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ListOfItemsScreen()),
          );
        },
        child: Icon(Icons.menu),
      ),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          "Assignment App",
          style: GoogleFonts.signikaNegative(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Consumer<WidgetProvider>(
                      builder: (ctx, widgetProvider, __) {
                    if (widgetProvider.list.isEmpty) {
                      return Center(
                        child: Text(
                          "No Widget is Added",
                          style: GoogleFonts.signika(fontSize: 25),
                        ),
                      );
                    }

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (widgetProvider.list.contains("Text Widget"))
                            TextField(
                              controller: _controller,
                              decoration: const InputDecoration(
                                hintText: "Enter your text here",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          if (widgetProvider.list.contains("Image Widget"))
                            CustomImagePicker(
                              onImageSelected: (image) {
                                selectedImage = image;
                              },
                            ),
                          if (widgetProvider.list.contains("Button Widget"))
                            CustomWidget.getCustomButton(
                              title: "Save",
                              onPressed: () async {
                                String title = _controller.text.trim();
                                String? imagePath = selectedImage?.path;

                                if (title.isNotEmpty && imagePath != null) {
                                  bool success =
                                      await DBHelper.getInstance.addNote(
                                    mTitle: title,
                                    imagePath: imagePath,
                                  );

                                  if (success) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text("Note saved successfully!")),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(" save note.")),
                                    );
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "Please provide title and image.")),
                                  );
                                }
                              },
                            )
                        ],
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: CustomWidget.getCustomButton(
                  title: "Add Widget",
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        width: double.infinity,
                        child: const CustomModalSheetPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
