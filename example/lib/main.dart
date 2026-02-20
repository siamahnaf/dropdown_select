import 'package:dropdown_select/dropdown_select.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dropdown Select Preview',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6750A4)),
        useMaterial3: true,
      ),
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final _formKey = GlobalKey<FormState>();
  final _singleController = SingleValueDropDownController();
  final _multiController = MultiValueDropDownController();

  static const List<DropDownValueModel> _countries = [
    DropDownValueModel(name: 'Bangladesh', value: 'BD'),
    DropDownValueModel(name: 'United States', value: 'US'),
    DropDownValueModel(name: 'United Kingdom', value: 'UK'),
    DropDownValueModel(name: 'Canada', value: 'CA'),
    DropDownValueModel(name: 'Australia', value: 'AU'),
    DropDownValueModel(name: 'Germany', value: 'DE'),
    DropDownValueModel(name: 'Japan', value: 'JP'),
    DropDownValueModel(name: 'Singapore', value: 'SG'),
  ];

  static const List<DropDownValueModel> _techStack = [
    DropDownValueModel(
      name: 'Flutter',
      value: 'flutter',
      toolTipMsg: 'Google\'s UI toolkit for building natively compiled apps.',
    ),
    DropDownValueModel(
      name: 'Dart',
      value: 'dart',
      toolTipMsg: 'The language used to write Flutter apps.',
    ),
    DropDownValueModel(name: 'Firebase', value: 'firebase'),
    DropDownValueModel(
      name: 'Supabase',
      value: 'supabase',
      toolTipMsg: 'Open-source Firebase alternative with PostgreSQL.',
    ),
    DropDownValueModel(name: 'GraphQL', value: 'graphql'),
    DropDownValueModel(name: 'REST API', value: 'rest'),
  ];

  // Items with long names to test text wrapping & descender clipping (g, y, p)
  static const List<DropDownValueModel> _longItems = [
    DropDownValueModel(
      name: 'Typography & glyph rendering test',
      value: 'typo',
    ),
    DropDownValueModel(
      name: 'A very long option that should gracefully wrap to the next line',
      value: 'long',
    ),
    DropDownValueModel(name: 'Jaggery — descender glyph check', value: 'jag'),
    DropDownValueModel(name: 'Regular item', value: 'reg'),
  ];

  String? _selectedCountry;
  List<DropDownValueModel> _selectedTech = [];

  @override
  void dispose() {
    _singleController.dispose();
    _multiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6750A4),
        foregroundColor: Colors.white,
        title: const Text(
          'dropdown_select preview',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          children: [
            // ── Single select ─────────────────────────────────────────────
            _Card(
              label: 'Single Select',
              description: 'Read-only. Tap to pick a country.',
              child: DropdownSelect(
                controller: _singleController,
                dropDownList: _countries,
                textFieldDecoration: _inputDecoration('Country'),
                selectColor: Colors.black,
                selectBorderRadius: BorderRadius.circular(0),
                dropdownContainerPadding: EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 0,
                ),
                listPadding: ListPadding(left: 10, right: 10),
                selectTextColor: Colors.white,
                onChanged: (val) {
                  setState(
                    () => _selectedCountry = (val as DropDownValueModel).name,
                  );
                },
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Please select a country' : null,
              ),
            ),
            if (_selectedCountry != null)
              _ResultChip('Selected: $_selectedCountry'),
            const SizedBox(height: 20),

            // ── Single select with search ──────────────────────────────────
            _Card(
              label: 'Single Select + Search',
              description: 'Type to filter the list in real-time.',
              child: DropdownSelect(
                enableSearch: true,
                dropDownList: _countries,
                textFieldDecoration: _inputDecoration('Search country…'),
                searchDecoration: const InputDecoration(
                  hintText: 'Type to search…',
                  prefixIcon: Icon(Icons.search, size: 20),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                ),
                onChanged: (_) {},
              ),
            ),
            const SizedBox(height: 20),

            // ── Long text / wrapping test ─────────────────────────────────
            _Card(
              label: 'Long Text & Descender Test',
              description:
                  'Verifies wrapping and that letters like g / y / p are not clipped.',
              child: DropdownSelect(
                dropDownList: _longItems,
                textFieldDecoration: _inputDecoration('Pick an item'),
                onChanged: (_) {},
              ),
            ),
            const SizedBox(height: 20),

            // ── Multi select ──────────────────────────────────────────────
            _Card(
              label: 'Multi Select',
              description: 'Select multiple tech stack items. Tap ℹ️ for tips.',
              child: DropdownSelect.multiSelection(
                controller: _multiController,
                dropDownList: _techStack,
                displayCompleteItem: true,
                textFieldDecoration: _inputDecoration('Tech stack'),
                submitButtonText: 'Done',
                submitButtonColor: const Color(0xFF6750A4),
                submitButtonTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                onChanged: (val) {
                  setState(
                    () => _selectedTech = List<DropDownValueModel>.from(val),
                  );
                },
              ),
            ),
            if (_selectedTech.isNotEmpty)
              _ResultChip(
                'Selected: ${_selectedTech.map((e) => e.name).join(', ')}',
              ),
            const SizedBox(height: 20),

            // ── Custom styled ─────────────────────────────────────────────
            _Card(
              label: 'Custom Styled',
              description:
                  'Custom colors, icon, and item padding demonstration.',
              child: DropdownSelect(
                dropDownList: _countries,
                selectColor: const Color(0xFFE8F5E9),
                dropDownIconProperty: IconProperty(
                  icon: Icons.keyboard_arrow_down_rounded,
                  color: const Color(0xFF6750A4),
                  size: 28,
                ),
                listTextStyle: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF1C1B1F),
                ),
                selectListTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2E7D32),
                ),
                listPadding: ListPadding(
                  top: 10,
                  bottom: 10,
                  left: 12,
                  right: 12,
                ),
                dropdownContainerDecoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                textFieldDecoration: _inputDecoration('Select country'),
                onChanged: (_) {},
              ),
            ),
            const SizedBox(height: 20),

            // ── Disabled ──────────────────────────────────────────────────
            _Card(
              label: 'Disabled State',
              description: 'isEnabled: false — not interactive.',
              child: DropdownSelect(
                isEnabled: false,
                dropDownList: _countries,
                textFieldDecoration: _inputDecoration('Disabled dropdown'),
                onChanged: (_) {},
              ),
            ),
            const SizedBox(height: 32),

            // ── Validate button ───────────────────────────────────────────
            FilledButton.icon(
              onPressed: () {
                final valid = _formKey.currentState!.validate();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      valid ? 'Form is valid ✓' : 'Please fix the errors',
                    ),
                    backgroundColor: valid
                        ? Colors.green.shade700
                        : Colors.red.shade700,
                  ),
                );
              },
              icon: const Icon(Icons.check_circle_outline),
              label: const Text('Validate form'),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: const Color(0xFF6750A4),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Color(0xFF9E9E9E)),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF6750A4), width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }
}

// ── Helpers ────────────────────────────────────────────────────────────────

class _Card extends StatelessWidget {
  const _Card({
    required this.label,
    required this.description,
    required this.child,
  });

  final String label;
  final String description;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 13,
              color: Color(0xFF6750A4),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            description,
            style: const TextStyle(fontSize: 11, color: Color(0xFF9E9E9E)),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _ResultChip extends StatelessWidget {
  const _ResultChip(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFFEDE7F6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF4527A0),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
