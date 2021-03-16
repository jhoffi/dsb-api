## Usage

A simple usage example:

```dart
import 'package:dsb_api/dsb_api.dart';

main() {
  var dsb = DSBController('username', 'password');

  var timetables = await dsb.getTimeTables();
  var textNews = await dsb.getTextNews();
  var documents = await dsb.getDocuments();
}
```
