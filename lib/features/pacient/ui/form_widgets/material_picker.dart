import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:moberas_dashboard/features/pacient/ui/pacient_profile_viewmodel.dart';
import 'package:stacked/stacked.dart';

// ignore: must_be_immutable
class MoberasMaterialPicker extends ViewModelWidget<PacientProfileViewModel> {
  String label;
  Color pickerColor;
  Function(Color) onChanged;
  MoberasMaterialPicker(this.label, this.pickerColor, this.onChanged);

  @override
  Widget build(BuildContext context, PacientProfileViewModel model) {
    return Builder(
        builder: (context) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('$label', style: Theme.of(context).textTheme.headline5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: BorderSide(color: Colors.white)),
                      elevation: 3.0,
                      color: pickerColor,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                  'Selecione a cor principal para o formulário'),
                              content: SingleChildScrollView(
                                child: MaterialPicker(
                                  pickerColor: pickerColor,
                                  onColorChanged: (value) => onChanged(value),
                                ),
                              ),
                            );
                          },
                        );
                      }),
                ),
              ],
            ));
  }
}
