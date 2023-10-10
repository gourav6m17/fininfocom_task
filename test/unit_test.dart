import 'package:fininfocom_task/network/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Fetch Api", () async {
    bool done = false;
    var fetch = (await Services.fetchData())?.message;

    if (fetch != null) {
      done = true;
    }
    expect(done, true);
  });

  test("user data fetch", () async {
    bool done = false;
    var fetch_user_details = (await Services.fetchUserData())?.results;
    if (fetch_user_details != null) {
      done = true;
    }
    expect(done, true);
  });
}
