import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customListTile({String title, String cover, String artist, onTap, context}){
  return InkWell(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(8),
          child: Card(
            color: Colors.grey[600],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            child: Row(
              children: [
                Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15)
                      ),
                      image: DecorationImage(
                          image: NetworkImage(cover),
                        fit: BoxFit.fill,
                      )
                  ),
                ),
                SizedBox(width: 10.0),
                Column(
                  children: [
                    AutoSizeText(
                        title,
                        style: GoogleFonts.raleway(
                           color: Colors.black,
                           fontSize: 15.0,
                           fontWeight: FontWeight.w600,
                         ),

                    ),
                    SizedBox(height: 5.0),
                    Text(
                      artist,
                        style: GoogleFonts.raleway(
                          color: Colors.grey,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                    ),
                  ],
                )
              ],
            )
          )
      )
  );
}