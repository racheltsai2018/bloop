import 'package:flutter/material.dart';

Widget customListTile({String title, String cover, onTap}){
  return InkWell(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Container(
                height: 80.0,
                width: 80.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        image: NetworkImage(cover)
                    )
                ),
              ),
              SizedBox(width: 10.0),
              Column(
                children: [
                  Text(
                      title,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      )
                  ),
                  SizedBox(height: 5.0),
                ],
              )
            ],
          )
      )
  );
}