import Foundation

public class Image {
	class var sharedInstance: Image {
		struct Static {
			static let instance: Image = Image()
		}
		return Static.instance
	}
	public static func output<T>(array: [[T]], f: (T) -> [UInt8], dir: String) {
		// print(array, dir)
		let width = array[0].count
		let height = array.count
		var filename: String
		var text: String
		text = "P3\n"
		text += String(width)
		text += " "
		text += String(height)
		text += "\n"
		text += "255\n"
		for var i in 0 ..< array.count {
			for var j in 0 ..< array[i].count {
				for var k in 0 ..< 3 {
					text += String(f(array[i][j])[k])
					if(k < 2) {
						text += " "
					}
				}
				text += "\n"
			}
		}
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd_HH-mm-ss"
		filename = dir + "/" + formatter.string(from: Date()) + ".ppm"
		do {
			try text.write(toFile: filename, atomically: true, encoding: String.Encoding.utf8)
		} catch let error {
			print("failed to write: \(error)")
		}
	}
}
