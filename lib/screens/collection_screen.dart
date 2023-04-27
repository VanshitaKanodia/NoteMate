import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_mate/screens/note_card.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({Key? key}) : super(key: key);

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('Notes').snapshots();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.lightBlueAccent,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.lightBlueAccent,
            child: const Icon(
                Icons.note_alt_rounded
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 60.0, left: 30.0, right: 30.0, bottom: 30.0
                ),
                child: const Text('All Notes',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      )
                  ),
                  child:  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                        stream: _usersStream,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if(snapshot.hasData)
                          {
                            return GridView(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2
                              ),
                              children: snapshot.data!.docs.map((note) => noteCard(() => (){}, note)).toList(),
                            );
                          }
                          return const Text("Add Some Notes",);
                        }),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
