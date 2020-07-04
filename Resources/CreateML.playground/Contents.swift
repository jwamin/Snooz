import CreateML
import Foundation

//let csvFile = P.url(forResource: "MarsHabitats", withExtension: "csv")!
//let dataTable = try MLDataTable(contentsOf: csvFile)

let urlForCSV = URL(fileURLWithPath: "/Users/jwamin/sandbox.nosync/beta-projects-2019-20/Snooz/Resources/training-data.json", isDirectory: false)
 
 do {
    print(urlForCSV)
    let csvFile = try? MLDataTable(contentsOf: urlForCSV)
    print(csvFile)
 } catch {
    print(error)
}
