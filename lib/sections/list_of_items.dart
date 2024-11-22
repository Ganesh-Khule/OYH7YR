
import 'package:flutter/material.dart';

class ListOfItemsScreen extends StatelessWidget {
  const ListOfItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Saved Notes"),
        centerTitle: true,
      ),
      // body: FutureBuilder(
      //   // future: DBHelper.getInstance.getAllData(),
      //   builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(child: CircularProgressIndicator());
      //     } else if (snapshot.hasError) {
      //       return const Center(child: Text("An error occurred!"));
      //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      //       return const Center(child: Text("No notes found."));
      //     }

      //     return ListView.builder(
      //       itemCount: snapshot.data!.length,
      //       itemBuilder: (context, index) {
      //         var note = snapshot.data![index];

      //         return Card(
      //           margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      //           elevation: 5,
      //           child: ListTile(
      //             title: Text(note[DBHelper.COLUMN_NOTE_TITLE]),
      //             subtitle: note[DBHelper.COLUMN_NOTE_IMAGE] != null &&
      //                     note[DBHelper.COLUMN_NOTE_IMAGE].isNotEmpty
      //                 ? Image.file(File(note[DBHelper.COLUMN_NOTE_IMAGE]))
      //                 : null,
      //           ),
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }
}