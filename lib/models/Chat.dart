// ignore_for_file: file_names, unnecessary_getters_setters

class Chat{
  String _message;
  String _timeStamp;

  Chat(this._message, this._timeStamp);

  String get message => _message;

  set message(String value) {
    _message = value;
  }

  String get timeStamp => _timeStamp;

  set timeStamp(String value) {
    _timeStamp = value;
  }
}