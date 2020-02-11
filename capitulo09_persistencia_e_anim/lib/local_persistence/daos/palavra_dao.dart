import 'package:capitulo09_persistencia_e_anim/models/palavra_model.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:uuid/uuid.dart';

import '../database.dart';
import '../lp_constants.dart';

class PalavraDAO {
  Future<String> insert({@required PalavraModel palavraModel}) async {
    String result;
    try {
      Database lpDatabase = await SQFLiteDataBase.instance.database;

      palavraModel.palavraID = Uuid().v1();
      result = palavraModel.palavraID;

      var recordsAffected =
          await lpDatabase.insert(kPalavrasTableName, palavraModel.toJson());
      if (recordsAffected == 0) result = null;
    } catch (exception, stackTrace) {
      rethrow;
    }
    return result;
  }

//  Future<String> update({@required ClienteModel clienteModel}) async {
//    String result;
//    try {
//      if (clienteModel.clienteID == null) {
//        result = await insert(clienteModel: clienteModel);
//        return result;
//      }
//
//      var database = await SQFLiteDataBase.getDataBase();
//
//      clienteModel.versaoGravada++;
//      var recordsAffected = await database.update(
//          kClienteTableName, _mapModelToJSon(clienteModel),
//          where: "clienteID = ?", whereArgs: [clienteModel.clienteID]);
//      if (recordsAffected == 0)
//        result = null;
//      else
//        result = clienteModel.clienteID;
//    } catch (exception, stackTrace) {
//      await ErrorsApp.showError(
//          'CLIENTE_DAL->update()', exception.toString(), stackTrace.toString());
//      return null;
//    }
//    return result;
//  }
//
//  Future<List> getAll({String filter, bool includeDeleted = false}) async {
//    List<Map<String, dynamic>> dataList = List();
//    try {
//      String where;
//      List<String> whereArgs = [];
//
//      if (!includeDeleted) {
//        where = ' removido = ? ';
//        whereArgs.add('N');
//      }
//
//      if (filter != null) {
//        where = (where == null) ? ' nome like ? ' : where + ' AND nome like ?';
//        whereArgs.add('%${filter.toLowerCase()}%');
//      }
//
//      var database = await SQFLiteDataBase.getDataBase();
//      var result = await database.query(kClienteTableName,
//          columns: [
//            kClienteID,
//            kClienteTipoPessoa,
//            kClienteNomeFantasia,
//            kClienteRazaoSocial,
//            kClienteCnpj,
//            kClienteNome,
//            kClienteCpf,
//            kClienteEmail,
//            kClienteTelefone,
//            kClienteUrlFoto,
//            kClienteFileNameFoto,
//            kClienteRemovido,
//            kClienteVersaoGravada,
//            kClienteNomeParaClassificacao,
//            kEnderecoRua,
//            kEnderecoNumero,
//            kEnderecoCep,
//            kEnderecoBairro,
//            kEnderecoCidade,
//            kEnderecoUf
//          ],
//          where: where == null ? null : where,
//          whereArgs: whereArgs.length == 0 ? null : whereArgs);
//
//      dataList = result.toList();
//      dataList.sort((a, b) {
//        return StringFunctions.removerAcentos(
//                a[kClienteNomeParaClassificacao].toLowerCase())
//            .compareTo(StringFunctions.removerAcentos(
//                b[kClienteNomeParaClassificacao].toLowerCase()));
//      });
//
//      return dataList;
//    } catch (exception, stackTrace) {
//      await ErrorsApp.showError(
//          'CLIENTE_DAL->getAll()', exception.toString(), stackTrace.toString());
//      return dataList;
//    }
//  }
//
//  Future<ClienteModel> getByID(
//      {@required String clienteID, bool includeDeleted = false}) async {
//    try {
//      String where;
//      List<String> whereArgs = [];
//
//      if (!includeDeleted) {
//        where = ' removido = ? ';
//        whereArgs.add('N');
//      }
//
//      where =
//          (where == null) ? ' clienteID = ? ' : where + ' AND clienteID = ?';
//      whereArgs.add(clienteID);
//
//      var database = await SQFLiteDataBase.getDataBase();
//      var result = await database.query(kClienteTableName,
//          columns: [
//            kClienteID,
//            kClienteTipoPessoa,
//            kClienteNomeFantasia,
//            kClienteRazaoSocial,
//            kClienteCnpj,
//            kClienteNome,
//            kClienteCpf,
//            kClienteEmail,
//            kClienteTelefone,
//            kClienteUrlFoto,
//            kClienteFileNameFoto,
//            kClienteRemovido,
//            kClienteVersaoGravada,
//            kClienteNomeParaClassificacao,
//            kEnderecoRua,
//            kEnderecoNumero,
//            kEnderecoCep,
//            kEnderecoBairro,
//            kEnderecoCidade,
//            kEnderecoUf
//          ],
//          where: where == null ? null : where,
//          whereArgs: whereArgs.length == 0 ? null : whereArgs);
//
//      var clienteRecuperado = ClienteModel.fromJson(result[0]);
//      if (result[0][kEnderecoRua] != null) {
//        clienteRecuperado.endereco = EnderecoModel(
//          rua: result[0][kEnderecoRua],
//          numero: result[0][kEnderecoNumero],
//          cep: result[0][kEnderecoCep],
//          bairro: result[0][kEnderecoBairro],
//          cidade: result[0][kEnderecoCidade],
//          uf: result[0][kEnderecoUf],
//        );
//      }
//
//      PlantaDAL plantaDAL = PlantaDAL();
//      var plantasCliente = await plantaDAL.getAll(clienteID: clienteID);
//      clienteRecuperado.plantas = List<PlantaModel>();
//      plantasCliente.forEach((pc) {
//        clienteRecuperado.plantas.add(PlantaModel.fromJson(pc));
//      });
//
//      return clienteRecuperado;
//    } catch (exception, stackTrace) {
//      await ErrorsApp.showError('CLIENTE_DAL->getByID()', exception.toString(),
//          stackTrace.toString());
//      return null;
//    }
//  }
//
//  Future<String> deleteByID(String clienteID, {bool remove = false}) async {
//    ClienteModel clienteModel = await getByID(clienteID: clienteID);
//    if (remove) {
//      if (clienteModel.urlFoto != null)
//        FilesOnDevice.remove(clienteModel.urlFoto);
//
//      var database = await SQFLiteDataBase.getDataBase();
//
//      var result = await database.delete(kClienteTableName,
//          where: '$kClienteID = ?', whereArgs: [clienteID]);
//
//      if (result == 0)
//        return null;
//      else
//        return clienteID;
//    }
//    clienteModel.removido = 'S';
//    return update(clienteModel: clienteModel);
//  }
}
