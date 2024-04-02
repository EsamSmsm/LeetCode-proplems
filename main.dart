void main() {
  bool isIsomorphic(String s, String t) {
    Map<String, String> map = {};
    for (int i = 0; i < s.length; i++) {
      print(map);
      if ((map[s[i]] != null || map.containsValue(t[i])) && map[s[i]] != t[i]) return false;
      map[s[i]] = t[i];
    }
    print(map);
    return true;
  }

  print(isIsomorphic("paper", "title").toString());
  print(isIsomorphic("egg", "add").toString());
  print(isIsomorphic("bar", "foo").toString());
  print(isIsomorphic("badc", "baba").toString());
}
