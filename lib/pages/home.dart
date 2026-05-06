import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController namaController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String selectedMenu = "";

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    int columnCount = orientation == Orientation.portrait ? 2 : 4;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text("L200230276 Widgets"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                selectedMenu = value;
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: "Profile", child: Text("Profile")),
              const PopupMenuItem(value: "Settings", child: Text("Settings")),
              const PopupMenuItem(value: "Help", child: Text("Help")),
              const PopupMenuItem(value: "Logout", child: Text("Logout")),
            ],
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // CONTAINER + BOXDECORATION
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 8,
                    offset: const Offset(2, 4),
                  )
                ],
              ),
              child: const Text(
                "Container dengan BorderRadius & Shadow",
                style: TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 20),

            // RICHTEXT
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Damar ",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  TextSpan(
                    text: "Abimanyu ",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  TextSpan(
                    text: "Restu Widodo",
                    style: TextStyle(
                        color: Colors.red,
                        fontStyle: FontStyle.italic,
                        fontSize: 18),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // FORM
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: namaController,
                    decoration: const InputDecoration(
                      labelText: "Nama",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Nama tidak boleh kosong";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 10),

                  TextFormField(
                    controller: nimController,
                    decoration: const InputDecoration(
                      labelText: "NIM",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "NIM tidak boleh kosong";
                      }
                      if (value.length < 5) {
                        return "NIM terlalu pendek";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 10),

                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email tidak boleh kosong";
                      }
                      if (!value.contains("@")) {
                        return "Email tidak valid";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 10),

                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Form Valid")),
                        );
                      }
                    },
                    child: const Text("Submit"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // GRID ORIENTATION
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columnCount,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Item ${index + 1}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            Text("Menu terpilih: $selectedMenu"),
          ],
        ),
      ),
    );
  }
}