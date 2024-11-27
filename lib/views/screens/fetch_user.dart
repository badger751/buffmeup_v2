import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FetchUserScreen extends StatefulWidget {
  const FetchUserScreen({super.key});

  @override
  State<FetchUserScreen> createState() => _FetchUserScreenState();
}

class _FetchUserScreenState extends State<FetchUserScreen> {
  List<Map<String, dynamic>> _users = [];
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _fetchUsers() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await Supabase.instance.client.from('reg_user').select('*');
      setState(() {
        _users = response;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
        _errorMessage = error.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registered Users'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _fetchUsers,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(child: Text(_errorMessage!))
              : _users.isEmpty
                  ? const Center(child: Text('No Users Found'))
                  : RefreshIndicator(
                      onRefresh: _fetchUsers,
                      child: ListView.builder(
                        itemCount: _users.length,
                        itemBuilder: (context, index) {
                          final user = _users[index];
                          return UserCard(
                            name: user['name'],
                            email: user['email'],
                            profilePictureUrl: user['profile_picture'],
                          );
                        },
                      ),
                    ),
    );
  }
}

class UserCard extends StatelessWidget {
  final String name;
  final String email;
  final String? profilePictureUrl;

  const UserCard({super.key, 
    required this.name,
    required this.email,
    this.profilePictureUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: profilePictureUrl != null
              ? NetworkImage(profilePictureUrl!)
              : null,
          child: profilePictureUrl == null
              ? const Icon(Icons.person)
              : null,
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(email),
      ),
    );
  }
}