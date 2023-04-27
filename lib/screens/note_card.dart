import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc)
{
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc["notes_title"],
          ),
          Text(
            doc["creation_date"],
          ),
          Text(
            doc["notes_content"],
          )
        ],
      ),
    ),
  );
}