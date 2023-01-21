import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/101/image_learn.dart';

class NoteDemos extends StatelessWidget {
  NoteDemos({super.key});

  final String _title = 'Create your first note';
  final String _subtitle = 'Add a note' * 5;
  final String _elevatedButtonText = 'Create A Note';
  final String _importNotes = 'Import Notes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: PaddingItems.horizantalPadding,
        child: Column(
          children: [
            PngImage(name: ImageItems().appleBookWithoutPath),
            _TitleWidget(title: _title),
            Padding(
              padding: PaddingItems.verticalPadding,
              child: _SubTitleWidget(
                subtitleText: _subtitle,
              ),
            ),
            const Spacer(),
            _CreateButton(elevatedButtonText: _elevatedButtonText),
            TextButton(
              onPressed: (() {}),
              child: Text(_importNotes),
            ),
            const SizedBox(
              height: ButtonHeights.buttonHeights,
            ),
          ],
        ),
      ),
    );
  }
}

class _CreateButton extends StatelessWidget {
  const _CreateButton({
    Key? key,
    required String elevatedButtonText,
  })  : _elevatedButtonText = elevatedButtonText,
        super(key: key);

  final String _elevatedButtonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (() {}),
      child: SizedBox(
        height: ButtonHeights.buttonHeights,
        child: Center(
          child: Text(_elevatedButtonText,
              style: Theme.of(context).textTheme.headline5),
        ),
      ),
    );
  }
}

class _SubTitleWidget extends StatelessWidget {
  const _SubTitleWidget(
      {Key? key, required this.subtitleText, this.textAlign = TextAlign.center})
      : super(key: key);

  final String subtitleText;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitleText,
      style: Theme.of(context)
          .textTheme
          .headline6
          ?.copyWith(fontWeight: FontWeight.w400),
      textAlign: textAlign,
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline5?.copyWith(
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
      textAlign: TextAlign.center,
    );
  }
}

class PaddingItems {
  static const EdgeInsets horizantalPadding =
      EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 20);
}

class ButtonHeights {
  static const double buttonHeights = 50;
}
