// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboardViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashboardViewModel on _DashboardViewModel, Store {
  Computed<Future<List<BillModel>>>? _$billsComputed;

  @override
  Future<List<BillModel>> get bills =>
      (_$billsComputed ??= Computed<Future<List<BillModel>>>(() => super.bills,
              name: '_DashboardViewModel.bills'))
          .value;

  @override
  String toString() {
    return '''
bills: ${bills}
    ''';
  }
}
