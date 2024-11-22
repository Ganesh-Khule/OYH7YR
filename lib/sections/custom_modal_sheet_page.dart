import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task_1/sections/custom_widget.dart';
import 'package:task_1/sections/widget_provider.dart';


class CustomModalSheetPage extends StatelessWidget {
  const CustomModalSheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WidgetProvider>(
      builder: (ctx, widgetProvider, __) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomWidgetButton(
              isClicked: widgetProvider.getIsTextField(),
              title: "Text Widget",
              callback: () {
                widgetProvider.changeTextField(); 
              },
            ),
            CustomWidgetButton(
              isClicked: widgetProvider.getImageClicked(),
              title: "Image Widget",
              callback: () {
                widgetProvider.changeImageClicked(); 
              },
            ),
            CustomWidgetButton(
              isClicked: widgetProvider.getButtonClicked(),
              title: "Button Widget",
              callback: () {
                widgetProvider.changeButtonClicked();
              },
            ),
            CustomWidget.getCustomButton(
              title: "Import Widget",
              onPressed: () {
                
                if (widgetProvider.getIsTextField()) {
                  widgetProvider.addWidgets("Text Widget");
                }
                if (widgetProvider.getImageClicked()) {
                  widgetProvider.addWidgets("Image Widget");
                }
                if (widgetProvider.getButtonClicked()) {
                  widgetProvider.addWidgets("Button Widget");
                }
                print("${widgetProvider.list}");
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}


class CustomWidgetButton extends StatelessWidget {
  final String title;
  final bool isClicked;
  final VoidCallback callback;

  const CustomWidgetButton(
      {super.key,
      required this.title,
      required this.callback,
      required this.isClicked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback, 
      child: Container(
        color: Colors.grey.shade300,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: Colors.white,
              child: Icon(
                Icons.circle,
                size: 30,
                color: isClicked ? Colors.amber : Colors.grey.shade300,
              ),
            ),
            SizedBox(
              width: 25,
            ),
            Text(
              title,
              style: GoogleFonts.signika(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}