## Usage

A simple usage example:

```dart
import 'package:dsb_api/dsb_api.dart';

main() {
  var dsb = DSBController('username', 'password');
  var data = await dsb.dsbGetData();
  var timetables = await dsb.dsbGetTimeTables(data);
  var news = dsb.getNews(data);
  var textNews = dsb.getTextNews(data);
}
```
