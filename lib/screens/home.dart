import 'dart:io';

import 'package:analisador/screens/components/sections/select_file.dart';
import 'package:analisador/theme/theme_colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../services/analyzer_api.dart';
import 'components/sections/error_warning.dart';
import 'components/sections/loading.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = false;
  bool isError = false;
  final api = AnalyzerApi();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.background,
      body: Padding(
        padding: const EdgeInsets.all(44.0),
        child: isLoading
            ? const Loading()
            : isError
                ? ErrorWarning(changeErrorState: changeErrorState)
                : SelectFile(selectFile: selectFile),
      ),
    );
  }

  void changeErrorState() {
    setState(() {
      isError = false;
    });
  }

  Future<void> selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['txt'],
    );
    if (result != null) {
      if (result.files.first.extension == 'txt') {
        File file = File.fromRawPath(result.files.first.bytes!);
        setState(() {
          isLoading = true;
        });
        final tokens = await api.getTokens(file.path);
        setState(() {
          isLoading = false;
        });
        if (mounted) {
          Navigator.of(context).pushReplacementNamed(
            '/result',
            arguments: tokens,
          );
        }
      } else {
        setState(() {
          isError = true;
        });
      }
    }
  }
}
