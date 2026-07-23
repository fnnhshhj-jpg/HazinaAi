import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController =
      TextEditingController(text: "HazinaAI User");

  final TextEditingController _emailController =
      TextEditingController(text: "user@example.com");

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Profil muvaffaqiyatli saqlandi."),
      ),
    );

    // TODO:
    // Firebase Firestore yoki AuthService orqali profilni saqlash
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              const CircleAvatar(
                radius: 55,
                child: Icon(
                  Icons.person,
                  size: 60,
                ),
              ),

              const SizedBox(height: 15),

              TextButton.icon(
                onPressed: () {
                  // TODO:
                  // Rasm tanlash (image_picker)
                },
                icon: const Icon(Icons.camera_alt),
                label: const Text("Profil rasmini o'zgartirish"),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Ism",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: _saveProfile,
                  icon: const Icon(Icons.save),
                  label: const Text("Saqlash"),
                ),
              ),

              const SizedBox(height: 30),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.workspace_premium),
                  title: const Text("Premium"),
                  subtitle: const Text("Bepul reja"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // TODO:
                    // Premium sahifasi
                  },
                ),
              ),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.history),
                  title: const Text("Faoliyat tarixi"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text("Chiqish"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // TODO:
                    // FirebaseAuth.signOut()
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}