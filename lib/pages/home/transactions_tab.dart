import 'package:flutter/material.dart';

class TransactionsTab extends StatelessWidget {
  const TransactionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    // contoh list sederhana
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, i) => ListTile(
        leading: CircleAvatar(child: Text('${i+1}')),
        title: Text('Transaksi #${i+1}'),
        subtitle: Text('Deskripsi transaksi singkat'),
        trailing: Text('-Rp ${((i+1)*10000)}'),
      ),
    );
  }
}
