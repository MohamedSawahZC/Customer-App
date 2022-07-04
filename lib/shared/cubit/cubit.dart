import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp/shared/cubit/states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());
  static AppCubit get(context)=> BlocProvider.of(context);
  late Database database;
  List<Map> Customers=[];
  List<Map> Transfer=[];

// Method create database
  void createDatabase()  {
    openDatabase(
      'customers.db', //Name of file for dataBase
      version: 1,
      onCreate: (database, version) {
        database
            .execute(
            'CREATE TABLE customers (id INTEGER PRIMARY KEY,name TEXT,bank_id TEXT,money TEXT)')
            .then((value) => {
          print("Table created"),
        })
            .catchError((error) {
          print("error${error.toString()}");
        });
        database.execute('CREATE TABLE transfer (id INTEGER PRIMARY KEY,bank_id TEXT,money TEXT)').then((value) => print("Successfully created"));
      },
      onOpen: (database) {
        getDataFromDatabase(database);
      },
    ).then((value) => {
      database = value,
      emit(AppCreateDatabaseState()),
    });
  }


  //Method to insert data to Data Base

  insertToDatabase({
    required String name,
    required String bank_id,
    required String money,
  }) async {
    await database.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO customers(name,bank_id,money) VALUES("$name", "$bank_id","$money")')
          .then((value) => {
        emit(AppInsertDatabaseState()),
      getDataFromDatabase(database)
      }).catchError((error) {
        print('Error : ${error.toString()}');
      });
      return null;
    });
  }

  //Method to record transfers

  insertToTransfers({
    required String bank_id,
    required String money,
  }) async {
    await database.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO transfer(bank_id,money) VALUES("$bank_id","$money")')
          .then((value) => {
        emit(AppInsertToTransferDatabaseState()),
        getDataFromDatabase(database)
      }).catchError((error) {
        print('Error : ${error.toString()}');
      });
      return null;
    });
  }

  //Method to Get data to Data Base


  void getDataFromDatabase(database)  {


    emit(AppGetDatabaseLoadingState());
     database.rawQuery('SELECT * FROM customers').then((value) => {
       Customers=[],
      value.forEach((element){
        Customers.add(element);
      }),
       emit(AppGetDatabaseState()),
     });
  }
  void getDataTransferFromDatabase(database)  {
    emit(AppGetDatabaseLoadingState());
    database.rawQuery('SELECT * FROM transfer').then((value) => {
      Transfer=[],
      value.forEach((element){
        Transfer.add(element);
      }),
      emit(AppGetDatabaseState()),
    });
  }

  void updateData({
    required String money,
    required int id,
  }) async
  {
    database.rawUpdate(
      'UPDATE customers SET money = ? WHERE id = ?',
      ['$money', id],
    ).then((value)
    {
      getDataFromDatabase(database);
      getDataTransferFromDatabase(database);
      emit(AppUpdateDatabaseState());
    });
  }





}