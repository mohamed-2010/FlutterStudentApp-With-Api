import 'package:flutter/material.dart';
import 'package:mrstudentapp/shered/styles/colors.dart';

class SCardWidget extends StatelessWidget {
  SCardWidget(
      {Key? key,
      required this.Cwidth,
      required this.Cheight,
      required this.Ccolor,
      this.Cimage,
      this.Ctext,
      this.CImgheight,
      this.CImgWidth})
      : super(key: key);
  double Cheight;
  double Cwidth;
  Color Ccolor;
  String? Cimage;
  String? Ctext;
  double? CImgWidth;
  double? CImgheight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Cwidth,
      height: Cheight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Appcolors.black,
            offset: Offset(
              1.0,
              1.0,
            ),
            blurRadius: 10,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ],
        color: Ccolor
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Cimage != null ? Image.network(
            Cimage.toString(),
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            width: CImgWidth,
            height: CImgheight,
          ) : Text(Ctext.toString())
        ],
      ),
    );
  }
}
