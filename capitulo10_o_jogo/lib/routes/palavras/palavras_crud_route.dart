import 'package:capitulo10ojogo/local_persistence/daos/palavra_dao.dart';
import 'package:capitulo10ojogo/mixins/widgets_mixin.dart';
import 'package:capitulo10ojogo/models/palavra_model.dart';
import 'package:capitulo10ojogo/widgets/container_iluminado_widget.dart';
import 'package:capitulo10ojogo/widgets/raisedbutton_with_snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/crud/palavras_crud_bloc.dart';
import 'mixin/palavras_crud_mixin.dart';

class PalavrasCRUDRoute extends StatefulWidget {
  final PalavraModel palavraModel;

  const PalavrasCRUDRoute({this.palavraModel});

  @override
  _PalavrasCRUDRouteState createState() => _PalavrasCRUDRouteState();
}

class _PalavrasCRUDRouteState extends State<PalavrasCRUDRoute>
    with TextFormFieldMixin, PalavrasCRUDMixim {
  //#region Variáveis
//  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _palavraController = TextEditingController();
  final _ajudaController = TextEditingController();
  final FocusNode _palavraFocus = FocusNode();
  final FocusNode _ajudaFocus = FocusNode();

  PalavrasCrudFormBloc _palavrasCrudFormBloc;
  BuildContext _buildContext;
  //#endregion

  //#region _mainColumn
  Widget _mainColumn() {
    return Column(
      children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: ContainerIluminadoWidget(
              backgroundColor: Colors.white,
              shadowColor: Colors.white70,
              height: 350,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                child: BlocBuilder<PalavrasCrudFormBloc, PalavrasCrudFormState>(
                    builder: (context, formState) {
                  return _form(formState);
                }),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
  //#endregion

  //#region _form
  Widget _form(PalavrasCrudFormState formState) {
    return Form(
//      key: this._formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          textFormField(
              focusNode: this._palavraFocus,
              controller: this._palavraController,
              labelText: 'Palavra',
              onFieldSubmitted: (_) => FocusScope.of(this._buildContext)
                  .requestFocus(this._ajudaFocus),
              textInputAction: TextInputAction.next,
              validator: (_) {
                return formState.isWordValid ? null : 'Informe a palavra';
              }),
          SizedBox(
            height: 20,
          ),
          textFormField(
              maxLines: 5,
              focusNode: this._ajudaFocus,
              controller: this._ajudaController,
              labelText: 'Ajuda',
              validator: (_) {
                return formState.isHelpValid ? null : 'Informe a ajuda';
              }),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              RaisedButton(
                onPressed:
                    formState.isFormValid ? _restoreOriginalDataToTexts : null,
                child: Text('Cancelar'),
              ),
              SizedBox(
                width: 20,
              ),
              RaisedButtonWithSnackbarWidget(
                onPressedVisible: formState.isFormValid,
                buttonText: 'Gravar',
                successTextToSnackBar:
                    'Os dados informados foram registrados com sucesso.',
                failTextToSnackBar: 'Erro na inserção',
                onButtonPressed: _onSubmitPressed,
                onStackBarClosed: _resetForm,
              ),
            ],
          ),
        ],
      ),
    );
  }
  //#endregion

  void _onPalavraChanged() {
    _palavrasCrudFormBloc
        .add(PalavraChanged(word: this._palavraController.text));
  }

  void _onAjudaChanged() {
    _palavrasCrudFormBloc.add(AjudaChanged(help: this._ajudaController.text));
  }

  void _onSubmitPressed() async {
    PalavraDAO palavraDAO = PalavraDAO();
    PalavraModel palavraModel = PalavraModel(
        palavraID: (widget.palavraModel == null)
            ? null
            : widget.palavraModel.palavraID,
        palavra: this._palavraController.text,
        ajuda: this._ajudaController.text);

    try {
      await palavraDAO.update(palavraModel: palavraModel);
      _palavrasCrudFormBloc.add(FormSuccessSubmitted());
    } catch (e) {
      rethrow;
    }
  }

  _restoreOriginalDataToTexts() {
    if (widget.palavraModel == null) {
      _clearTexts();
    } else {
      _palavraController.text = widget.palavraModel.palavra;
      _ajudaController.text = widget.palavraModel.ajuda;
    }
  }

  _clearTexts() {
    _palavraController.clear();
    _ajudaController.clear();
  }

  _resetForm() {
    _clearTexts();
    if (widget.palavraModel != null)
      Navigator.of(context).pop();
    else
      this._palavrasCrudFormBloc.add(FormReset());
  }

  //#region initState
  @override
  void initState() {
    super.initState();
    this._palavrasCrudFormBloc = BlocProvider.of<PalavrasCrudFormBloc>(context);
    this._palavraController.addListener(_onPalavraChanged);
    this._ajudaController.addListener(_onAjudaChanged);

    if (widget.palavraModel != null) {
      _initializeTextControllers();
    }
  }
  //#endregion

  _initializeTextControllers() {
    this._palavraController.text = widget.palavraModel.palavra;
    this._ajudaController.text = widget.palavraModel.ajuda;
  }

  //#region dispose
  @override
  void dispose() {
    this._palavraController.dispose();
    this._ajudaController.dispose();
    super.dispose();
  }
  //#endregion

  //#region build
  @override
  Widget build(BuildContext context) {
    this._buildContext = context;
    return WillPopScope(
      onWillPop: () async => await onWillPop(
          context: context,
          palavraModel: widget.palavraModel,
          palavra: _palavraController.text,
          ajuda: _ajudaController.text),
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          backgroundColor: Colors.grey[600],
          title: Text(
            widget.palavraModel == null
                ? 'Registro de Palavras'
                : 'Alteração de uma palavra',
          ),
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: _mainColumn(),
            ),
          ),
        ),
      ),
    );
  }
  //#endregion
}
