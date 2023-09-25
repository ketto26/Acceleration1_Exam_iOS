/*
 გვაქვს 1,5,10,20 და 50 თეთრიანი მონეტები. დაწერეთ ფუნქცია, რომელსაც გადაეცემა თანხა (თეთრებში) და აბრუნებს მონეტების მინიმალურ რაოდენობას, რომლითაც შეგვიძლია ეს თანხა დავახურდაოთ.
 */

func minSplit(amount: Int) -> Int {
let coinValues = [50, 20, 10, 5, 1]
var remainingAmount = amount
var numberOfCoins = 0

for coinValue in coinValues {
    let numberOfCoinsOfThisDenomination = remainingAmount / coinValue
    numberOfCoins += numberOfCoinsOfThisDenomination
    remainingAmount -= numberOfCoinsOfThisDenomination * coinValue
    
    if remainingAmount == 0 {
        break
    }
}

return numberOfCoins
}









/*
 დაწერეთ ფუნქცია რომელიც დააჯამებს ციფრებს ორ რიცსხვს შორის.
    მაგალითად გადმოგვეცემა 19 და 22. მათ შორის ციფრების ჯამი იქნება :
    19, 20, 21, 22
    (1 + 9) + (2 + 0) + (2 + 1) + (2 + 2) = 19
 */

func sumOfDigits(start: Int, end: Int) -> Int {
    var totalSum = 0
    
    for number in start...end {
        var currentNumber = number
        var digitSum = 0
        
        while currentNumber > 0 {
            digitSum += currentNumber % 10
            currentNumber /= 10
        }
        
        totalSum += digitSum
    }
    
    return totalSum
}









/*
 მოცემულია String რომელიც შედგება „(" და „)" ელემენტებისგან. დაწერეთ ფუნქცია რომელიც აბრუნებს ფრჩხილები არის თუ არა მათემატიკურად სწორად დასმული.
 */
func isProperly(sequence: String) -> Bool {
    var stack = [Character]()
    
    for char in sequence {
        if char == "(" {
            stack.append(char)
        } else if char == ")" {
            if stack.isEmpty {
                return false
            } else {
                stack.removeLast()
            }
        }
    }
    
    return stack.isEmpty
}









/*
გვაქვს N ფიცრისგან შემდგარი ხიდი. სიძველის გამო ზოგიერთი ფიცარი ჩატეხილია. ზურიკოს შეუძლია გადავიდეს შემდეგ ფიცარზე ან გადაახტეს ერთ ფიცარს. (რათქმაუნდა ჩატეხილ   ფიცარზე ვერ გადავა) ჩვენი ამოცანაა დავითვალოთ რამდენი განსხვავებული კომბინაციით შეუძლია ზურიკოს ხიდის გადალახვა. გადმოგვეცემა ხიდის სიგრძე და ინფორმაცია ჩატეხილ ფიცრებზე. 0 აღნიშნავს ჩატეხილ ფიცარს 1_ანი კი მთელს. დასაწყისისთვის ზურიკო დგას ხიდის ერთ მხარეს (არა პირველ ფიცარზე) და გადალახვად ჩათვლება ხიდის მეორე მხარე (ბოლო ფიცრის შემდეგი ნაბიჯი)
 */
func countWays(n: Int, steps: [Int]) -> Int {
    var dp = [Int](repeating: 0, count: n+2)
    dp[0] = 1
 
    for i in 1...n+1 {
        if i-1 < n && steps[i-1] == 0 {
            continue
        }
        dp[i] += dp[i-1]
        if i-2 >= 0 {
            dp[i] += dp[i-2]
        }
    }
 
    return dp[n+1]
}









/*
 გადმოგეცემათ მთელი რიცხვი N. დაწერეთ ფუნქცია რომელიც დაითვლის რამდენი 0ით ბოლოვდება N! (ფაქტორიალი)
 შენიშვნა 1000! შედგება 2568 სიმბოლოსაგან.
 */
func zeros(N: Int) -> Int {
    var count = 0
    var num = N
    
    while num >= 5 {
        num /= 5
        count += num
    }
    
    return count
}
