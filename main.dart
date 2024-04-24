void main() {
  fibonicci(2);
  fibonicci(3);
}

//#region 509. Fibonacci Number
// 0, 1, 1, 2, 3, 5, 8, 13
int fibonicci(int n) {
  int t0 = 0, t1 = 1;
  int temp = 0;
  while (n > 0) {
    temp = t0;
    t0 = t1;
    t1 = temp + t0;
    n--;
  }
  print(t0);
  return t0;
}
//#endregion

//#region 1137. N-th Tribonacci Number
// 0 + 1 + 1 + 2 + 4 + 7 + 13
int tribonacci(int n) {
  int t0 = 0, t1 = 1, t2 = 1;
  int temp = 0;
  while (n > 0) {
    temp = t0;
    t0 = t1;
    t1 = t2;
    t2 = temp + t0 + t1;
    n--;
  }
  return t0;
}
//#endregion

//#region 443. String Compression
int compress(List<String> chars) {
  int index = 0, indexAns = 0;
  while (index < chars.length) {
    var currentChar = chars[index];
    int count = 0;
    while (index < chars.length && chars[index] == currentChar) {
      index++;
      count++;
    }
    chars[indexAns++] = currentChar;
    if (count != 1)
      for (var c in count.toString().split('')) {
        chars[indexAns++] = c;
      }
  }
  chars.removeRange(indexAns, chars.length); // Remove the remaining elements
  print(chars);
  return indexAns;
} //#endregion

//#region 338. Counting Bits
List<int> countBits(int n) {
  List<int> result = [];
  for (int i = 0; i <= n; i++) {
    result.add(i.toRadixString(2).replaceAll('0', '').length);
  }
  return result;
}
//#endregion

//#region 12. Integer to Roman
String intToRoman(int num) {
  Map<int, String> roman = {
    1: 'I',
    4: 'IV',
    5: 'V',
    9: 'IX',
    10: 'X',
    40: 'XL',
    50: 'L',
    90: 'XC',
    100: 'C',
    400: 'CD',
    500: 'D',
    900: 'CM',
    1000: 'M'
  };
  List<int> keys = roman.keys.toList();
  StringBuffer result = StringBuffer();
  for (int i = keys.length - 1; i >= 0; i--) {
    while (num >= keys[i]) {
      result.write(roman[keys[i]]!);
      num -= keys[i];
    }
  }
  return result.toString();
}
//#endregion

//#region 13. Roman to Integer
int romanToInt(String s) {
  Map<String, int> roman = {'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000};
  int result = 0;
  for (int i = 0; i < s.length; i++) {
    if (i + 1 < s.length && roman[s[i]]! < roman[s[i + 1]]!) {
      result += roman[s[i + 1]]! - roman[s[i]]!;
      i++;
    } else {
      result += roman[s[i]]!;
    }
  }
  return result;
}
//#endregion

//#region 1979. Find Greatest Common Divisor of Array
int findGCD(List<int> nums) {
  int min = nums.first, max = 0;
  for (int i = 0; i < nums.length; i++) {
    if (nums[i] > max) max = nums[i];
    if (nums[i] < min) min = nums[i];
  }
  while (max != 0) {
    int temp = max;
    max = min % max;
    min = temp;
  }
  print(min.abs());
  return min.abs();
}
//#endregion

//region 121. Best Time to Buy and Sell Stock
int maxProfit(List<int> prices) {
  int max = 0;
  for (int i = 0; i < prices.length; i++) {
    for (int j = i + 1; j < prices.length; j++) {
      if (prices[j] - prices[i] > max) {
        max = prices[j] - prices[i];
      }
    }
  }
  print(max);
  return max;
}
//#endregion

//#region 205. Isomorphic Strings
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
//#endregion

//region 26. Remove Duplicates from Sorted array
int removeDuplicates(List<int> nums) {
  int p1 = 1;
  int limit = nums.last;
  for (int i = 0; i < nums.length; i++) {
    if (p1 == nums.length || p1 + 1 == nums.length) break;
    if (nums[p1] == nums[i] && nums[p1] == nums[p1 + 1]) nums[i] = nums[i] * 0 + limit + 1;
    p1++;
  }
  nums.removeWhere((e) => e > limit);
  print(nums);
  return nums.length;
}
//endregion

//region 58. Length of Last Word
int lengthOfLastWord(String s) {
  return s.split(' ').lastWhere((element) => element.length != 0).length;
}
//endregion

//region 1716. Calculate Money in Leetcode Bank
int countByWeek(int week, int n) {
  int k = 0;
  for (int i = 0; i < n; i++) {
    k += i == 0 ? week : i + week;
  }
  return k;
}

int totalMoney(int n) {
  int weeks = n ~/ 7 + 1;
  int money = 0;
  for (int i = 1; i <= weeks; i++) {
    money += countByWeek(i, i == weeks ? n - ((i - 1) * 7) : 7);
  }
  return money;
}
// endregion

//region 169. majorityElement
int majorityElement(List<int> nums) {
  nums.sort();
  return nums[nums.length ~/ 2];
}
//endregion

//region 189.Rotate Array
void reverse(List<int> nums, int start, end) {
  while (start < end) {
    int temp = nums[start];
    nums[start] = nums[end];
    nums[end] = temp;
    start++;
    end--;
  }
}

void rotate(List<int> nums, int k) {
  k = k % nums.length;
  reverse(nums, 0, nums.length - 1);
  reverse(nums, 0, k - 1);
  reverse(nums, k, nums.length - 1);
  print(nums);
}
//endregion
