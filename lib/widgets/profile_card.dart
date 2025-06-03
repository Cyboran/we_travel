import 'package:flutter/material.dart';
import 'package:we_travel/services/auth_service.dart';
import 'package:we_travel/services/firestore_service.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  // TODO: Add the ability to get user's profile picture from Supabase
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();

    final displayName = firestoreService.getCurrentUserDisplayName();
    final email = firestoreService.getCurrentUserEmail();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [
          // Full card (excluding logout) clickable
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque, // ensures it catches empty space taps
              onTap: () => Navigator.pushNamed(context, '/profile'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    displayName,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                  ),
                  Text(
                    email,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                ],
              ),
            ),
          ),

          // Logout Button (non-tappable area)
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.redAccent),
            tooltip: 'Logout',
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Confirm Logout'),
                  content: const Text('Are you sure you want to log out?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text(
                        'Logout',
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ),
                  ],
                ),
              );

              if (confirm == true && context.mounted) {
                await AuthService.logout();

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logged out successfully')),
                  );
                  Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
