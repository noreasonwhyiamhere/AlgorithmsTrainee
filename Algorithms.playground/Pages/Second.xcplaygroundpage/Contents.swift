/*
 Task:
 Given an array of symbols like "[({})]"
 Check for balanced parenthesis in an expression (should return true o false)
 For example:
    "[[[({})]]](()){{}}[()]{[]}" - is true
    "[[[)]]" - is false
*/
func isParsable(string: String) -> Bool {
    let charDictionary: [Character: Character] = ["}": "{", ")": "(", "]": "["]
    let arr = Array(string)
    guard arr.count % 2 == 0 else { return false }
    guard let first = arr.first, !charDictionary.keys.contains(first) else { return false }
    guard let last = arr.last, !charDictionary.values.contains(last) else { return false }
    var stack = [Character]()
    var current = first
    arr.forEach { item in
        if let value = charDictionary[item], let last = stack.last, last == value {
            stack.popLast()
            current = stack.last ?? current
        }
        else {
            current = item
            stack.append(item)
        }
    }
    return stack.isEmpty
}

let brackets1 = "[[[({})]]](()){{}}[()]{[]}"
let brackets2 = "[[[({})]]]"
let brackets3 = "[[[)]]"
let brackets4 = "[[[({})]]["
let brackets5 = "}[[[({})]]]{(}){"
print(isParsable(string: brackets1))
print(isParsable(string: brackets2))
print(isParsable(string: brackets3))
print(isParsable(string: brackets4))
print(isParsable(string: brackets5))
