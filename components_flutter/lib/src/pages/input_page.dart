import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() {
    return new _InputPageState();
  }
}

class _InputPageState extends State<InputPage> {
  String _name = '';
  String _email = '';
  String _date= '';
  TextEditingController _inputFieldDateController = new TextEditingController();
  List<String> _powers = ['strong', 'fly', 'speed'];
  String _selectedPower = 'strong';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        children: <Widget>[
          this._createInput(),
          Divider(),
          this._createEmail(),
          Divider(),
          this._createPassword(),
          Divider(),
          this._createDate(context),
          Divider(),
          this._createDropdown(),
          Divider(),
          this._createPerson(),
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          counter: Text('Letras ${this._name.length}'),
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          helperText: 'Solo es el nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (value) {
        this.setState(() {
          this._name = value;
        });
      },
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('Nombre es: ${this._name}'),
      subtitle: Text('Email: ${this._email}'),
      trailing: Text(this._selectedPower),
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          hintText: 'Email',
          labelText: 'Nombre',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (value) {
        this.setState(() {
          this._email = value;
        });
      },
    );
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          hintText: 'Password',
          labelText: 'Password',
          suffixIcon: Icon(Icons.lock),
          icon: Icon(Icons.lock)),
      onChanged: (value) {
        this.setState(() {
        });
      },
    );
  }

  Widget _createDate(BuildContext buildContext) {
    return TextField(
      enableInteractiveSelection: false,
      controller: this._inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        this._selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picker = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES')
    );
    if(picker != null) {
      setState(() {
        this._date = picker.toString();
        this._inputFieldDateController.text = this._date;
      });
    }
  }

  Widget _createDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0,),
        DropdownButton(
          value: this._selectedPower,
          items: this._getItems(),
          onChanged: (option) {
            print(option);
            setState(() {
              this._selectedPower=option;
            });
          },
        )
      ],
    );
  }

  List<DropdownMenuItem<String>> _getItems() {
    List<DropdownMenuItem<String>> items = new List();
    this._powers.forEach((power){
      items.add(new DropdownMenuItem(
        child: Text(power),
        value: power,
      ));
    });
    return items;
  }
}
