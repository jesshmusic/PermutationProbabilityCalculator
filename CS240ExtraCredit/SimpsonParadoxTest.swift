import Cocoa

struct SimpsonParadoxTest {
    
    static func getCaffeineTestResults(totalCaffeineAddicts n: Int) -> Bool {
        
        var extraPeople = n - 4
        println("\nNew Test with n = \(n)\nextraPeople:\(extraPeople)")
        var testGroups = [1, 1, 1, 1]
        var curedGroups = [0, 0, 0, 0]
        
        return false
    }
    private static func checkSimpson(testGroups: [Int], curedGroups: [Int]) -> Bool {
        var curedA = (curedGroups[0] + curedGroups[2]) / (testGroups[0] + testGroups[2])
        var curedB = (curedGroups[1] + curedGroups[3]) / (testGroups[1] + testGroups[3])
        if ((curedGroups[0]) / (testGroups[0]) > (curedGroups[1]) / (testGroups[1])) {
            if ((curedGroups[2]) / (testGroups[2]) > (curedGroups[3]) / (testGroups[3])) {
                if ( curedA < curedB)
                {
                    return true
                }
            }
        }
        return false
    }
}

