import 'package:flutter/material.dart';
import '../widgets/left_drawer.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:football_shop/screens/menu.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  double _price = 0.0;
  String _description = "";
  String _thumbnail = "";
  String _category = "Footwear"; // default
  bool _isFeatured = false;

  final List<String> _categories = [
    'Kits & Jerseys',
    'Footwear',
    'Equipment',
    'Goalkeeper',
    'Clothing & Apparel',
    'Fan Shop',
    'Kids & Youth',
    'Accessories',
  ];

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Product Name',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _name = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Product name cannot be empty';
                    }
                    if (value.length < 3) {
                      return 'Product name must be at least 3 characters';
                    }
                    return null;
                  },
                ),
              ),

              // Price
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _price = double.tryParse(value) ?? 0.0;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Price cannot be empty';
                    }
                    final price = double.tryParse(value);
                    if (price == null) {
                      return 'Price must be a valid number';
                    }
                    if (price <= 0) {
                      return 'Price must be greater than 0';
                    }
                    return null;
                  },
                ),
              ),

              // Description
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextFormField(
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _description = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Description cannot be empty';
                    }
                    if (value.length < 10) {
                      return 'Description must be at least 10 characters';
                    }
                    return null;
                  },
                ),
              ),

              // Thumbnail URL
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Thumbnail URL',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _thumbnail = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Thumbnail URL cannot be empty';
                    }
                    final uri = Uri.tryParse(value);
                    if (uri == null || !uri.hasScheme || !uri.hasAuthority) {
                      return 'Please enter a valid URL';
                    }
                    return null;
                  },
                ),
              ),

              // Category
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Category',
                    border: OutlineInputBorder(),
                  ),
                  initialValue: _category,
                  items: _categories.map((cat) {
                    return DropdownMenuItem(
                      value: cat,
                      child: Text(cat[0].toUpperCase() + cat.substring(1)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _category = value!;
                    });
                  },
                ),
              ),

              // Is Featured
              SwitchListTile(
                title: const Text('Mark as Featured Product'),
                value: _isFeatured,
                onChanged: (value) {
                  setState(() {
                    _isFeatured = value;
                  });
                },
              ),

              // Save Button
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // TODO: Replace the URL with your app's URL
                      // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
                      // If you using chrome,  use URL http://localhost:8000

                      final response = await request.postJson(
                        "http://localhost:8000/create-flutter/",
                        jsonEncode({
                          "name": _name,
                          "description": _description,
                          "thumbnail": _thumbnail,
                          "category": _category,
                          "is_featured": _isFeatured,
                        }),
                      );
                      if (context.mounted) {
                        if (response['status'] == 'success') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Product successfully saved!"),
                            ),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyHomePage(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Something went wrong, please try again.",
                              ),
                            ),
                          );
                        }
                      }
                    }
                  },
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
