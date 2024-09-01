import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/item_provider.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  AddItemPageState createState() => AddItemPageState();
}

class AddItemPageState extends State<AddItemPage> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Provider.of<ItemProvider>(context, listen: false).addItem(
        Item(title: _title, description: _description),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Item',
          style: theme.textTheme.headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildRequiredFieldsIndicator(theme),
                        const SizedBox(height: 10),
                        _buildTitleField(theme),
                        const SizedBox(height: 20),
                        _buildDescriptionField(theme),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRequiredFieldsIndicator(ThemeData theme) {
    return RichText(
      text: TextSpan(children: [
        const TextSpan(text: '*', style: TextStyle(color: Colors.red)),
        TextSpan(
          text: 'Indicates required fields',
          style: theme.textTheme.bodyLarge?.copyWith(
            fontStyle: FontStyle.italic,
          ),
        )
      ]),
    );
  }

  Widget _buildTitleField(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
            text: TextSpan(children: [
          TextSpan(
            text: 'Item Title',
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const TextSpan(text: "*", style: TextStyle(color: Colors.red))
        ])),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Enter a title for the item',
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a title';
            }
            return null;
          },
          onSaved: (value) {
            _title = value!;
          },
        ),
      ],
    );
  }

  Widget _buildDescriptionField(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Add description',
            border: OutlineInputBorder(),
          ),
          maxLines: 6,
          onSaved: (value) {
            _description = value!;
          },
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        const Spacer(),
        FilledButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(
                const Color.fromARGB(255, 2, 36, 64)),
          ),
          onPressed: _saveForm,
          child: const Text('Add Item'),
        ),
      ],
    );
  }
}
