import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class ChipWidget extends StatelessWidget {
  const ChipWidget({
    super.key, required this.chipLabel, required this.chipavatar,
  });
final String chipLabel;
final Widget  chipavatar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Chip(
        side: const BorderSide(width: 2,style: BorderStyle.solid),
          avatar: chipavatar,
          label: Text(
            chipLabel,
            style: GoogleFonts.bioRhyme(
                color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold),
          )),
    );
  }
}
