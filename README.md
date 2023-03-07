# flutter_chat_widgets

This library contains necessary widgets for chat application ui. All the components are customizable. 

* Github: https://github.com/evanemran/flutter_chat_widget

## Features

* Chat Dialogs Widget
* Message Bar Widget
* Highly Customizable

<img src="https://raw.githubusercontent.com/evanemran/flutter_chat_widget/master/assets/flutter_chat_widgets.jpg" width="450">

## Getting started

To use this widget there is not any special requirement. IF you have flutter installed you can directly start using this.

## How to Use

**Add This Library:**

Add this line to your dependencies:

```
flutter_chat_widget: ^0.0.3
```

Then you just have to import the package with

```
import 'package:flutter_chat_widget/recieved_message_widget.dart';
import 'package:flutter_chat_widget/sent_message_widget.dart';
import 'package:flutter_chat_widget/message_bar_widget.dart';
```

**Create Chat Bubbles**

```dart
//for sent messages
SentMessage(
  message: item.text,
  background: Colors.blueAccent,
  textColor: Colors.white,
)

//for received messages
ReceivedMessage(
  message: item.text,
  background: Colors.black12,
  textColor: Colors.black,
)
```
**Create Message Bar**

```dart
MessageBar(onCLicked: (text) {
  // send data to server
})
```

## Conclusion

This is an initial release of the package. If you find any issue please let me know I will fix it accordingly.
