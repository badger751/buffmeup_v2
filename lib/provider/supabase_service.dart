import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static const String _url = 'https://dmaabmqoohfeihtfwfeq.supabase.co';
  static const String _anonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRtYWFibXFvb2hmZWlodGZ3ZmVxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE3MjUzOTYsImV4cCI6MjA0NzMwMTM5Nn0.xRJHr6hBPMBugqr851j_1riPxMf6zntkfIHt3iwu4hc';

  // Singleton pattern to ensure only one instance is created
  static final SupabaseService _instance = SupabaseService._internal();

  factory SupabaseService() {
    return _instance;
  }

  SupabaseService._internal();

  // Ensure Supabase is initialized only once
  Future<void> initialize() async {
    await Supabase.initialize(
      url: _url,
      anonKey: _anonKey,
    );
  }

  // Access the Supabase client anywhere in the app
  SupabaseClient get client => Supabase.instance.client;
}
