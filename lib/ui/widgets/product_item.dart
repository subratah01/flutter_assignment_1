import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_assignment_1/models/product.dart';
import 'package:flutter_assignment_1/ui/screens/update_product_screen.dart';
import 'package:http/http.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: Image.network(
      //   product.image ?? '',
      //   width: 40,
      // ),
      title: Text(product.productName ?? 'Unknown'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Code: ${product.productCode ?? 'Unknown'}'),
          Text('Quantity: ${product.quantity ?? 'Unknown'}'),
          Text('Price: ${product.unitPrice ?? 'Unknown'}'),
          Text('Total Price: ${product.totalPrice ?? 'Unknown'}'),
        ],
      ),
      trailing: Wrap(
        children: [
          IconButton(
              onPressed: () {
                _deleteProduct(context, product.id);
              },
              icon: const Icon(Icons.delete)),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                UpdateProductScreen.name,
                arguments: product,
              );
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
    );
  }

  // void _confirmDelete(BuildContext context, String? productId) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Confirm Deletion'),
  //         content: const Text('Are you sure you want to delete this product?'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop(); // Close the dialog
  //             },
  //             child: const Text('Cancel'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop(); // Close the dialog
  //               _deleteProduct(context, productId); // Proceed with deletion
  //             },
  //             child: const Text('Delete'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  Future<void> _deleteProduct(BuildContext context, String? productId) async {
    //print(productId);
    Uri uri = Uri.parse(
        'https://crud.teamrabbil.com/api/v1/DeleteProduct/${productId}');
    Response response = await get(uri);
    //print(response.statusCode);
    //print(response.body);
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      //print(decodedData['status']);
      //print(decodedData);
      Map<String, dynamic> p = decodedData['data'];
      if (p['acknowledged'] == true && p['deletedCount'] > 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Selected product deleted!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Selected product deletion failed! Try again.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred while deleting.'),
        ),
      );
    }
  }
}
