import 'package:flutter/material.dart';
import 'package:fruits_dashboard/features/add_product_feature/presentation/widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  static const routeName = 'Add Product';
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product'), centerTitle: true),
      body: const AddProductViewBody(),
    );
  }
}
