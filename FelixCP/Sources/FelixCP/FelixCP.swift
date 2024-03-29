import SwiftUI

public struct FelixCP {
	var test = "Hello, World!"
}

public struct ColorPreset: Equatable {
	public var hue: ColorHue
	public var lum: ColorLuminance
	public var sys: Bool = true /// true → color adapts to darkMode (100 → 900)

	/// Initialization from components
	public init(hue: ColorHue, lum: ColorLuminance) {
		self.hue = hue
		self.lum = lum
	}

	public init(hue: ColorHue, lum: ColorLuminance, sys: Bool) {
		self.hue = hue
		self.lum = lum
		self.sys = sys
	}
	
	public init(lum: ColorLuminance, sys: Bool = true) {
		self.hue = .grey
		self.lum = lum
		self.sys = sys
	}

	/// Empty initialization
	public init() {
		self.hue = .red
		self.lum = .normal
		self.sys = false
	}
}

/// Extension for getting Color values
extension ColorPreset {
	
	/// returns "grey.100" or "grey.sys.100"
	public func getString() -> String {
		return ColorPreset.toString((hue, lum), sys: sys)
	}

	public func getColor() -> Color {
		return Color(getString())
	}

	public static func toString(_ components: (ColorHue, ColorLuminance), sys: Bool = true) -> String {
		let (hue, lum) = components
		if sys {
			return "\(hue).sys.\(lum.rawValue)"
		} else {
			return "\(hue).\(lum.rawValue)"
		}
	}
}

/// Extension to get color with same hue, but offset luminance
extension ColorPreset {
	public func getSecondaryColor() -> Color {
		return ColorPreset(hue: hue, lum: lum.secondary, sys: sys).getColor()
	}

	public func getTertiaryColor() -> Color {
		let string = ColorPreset.toString((hue, lum.tertiary), sys: sys)
		return Color(string)
	}

	public func getQuarternaryColor() -> Color {
		let string = ColorPreset.toString((hue, lum.quarternary), sys: sys)
		return Color(string)
	}
}

/// Extension to get an "accessible font color" (a black or white color for text)
extension ColorPreset {
	public func getAccessibleColor(_ grey: Bool = true) -> Color {
		return ColorPreset(hue: grey ? .grey : hue, lum: lum.accessible, sys: sys).getColor()
	}
}

// MARK: - ColorHue

public enum ColorHue: String, CaseIterable {
	case grey, red, orange, yellow, green, blue, purple
}

extension ColorHue: Identifiable {
	public var id: String { rawValue }
}

extension ColorHue {
	public static var primaries: [ColorHue] = [.red, .yellow, .blue]
	public static var secondaries: [ColorHue] = [.green, .orange, .purple]
	public static var wheel: [ColorHue] = [.red, .orange, .yellow, .green, .blue, .purple]
}

// MARK: - ColorLuminance

public enum ColorLuminance: Int, CaseIterable {
	case nearWhite = 100
	case extraLight = 200
	case light = 300
	case normal = 400
	case medium = 500
	case semiDark = 600
	case dark = 700
	case extraDark = 800
	case nearBlack = 900
}

extension ColorLuminance: Identifiable {
	public var id: Int { rawValue }
}

/// Secondary (3 away), Tertiary (2 away), Quarternary (1 away)
extension ColorLuminance {
	public var secondary: ColorLuminance {
		switch self {
		case .nearWhite: return .normal
		case .extraLight: return .medium
		case .light: return .semiDark
		case .normal: return .dark
		case .medium: return .extraDark
		case .semiDark: return .light
		case .dark: return .normal
		case .extraDark: return .medium
		case .nearBlack: return .semiDark
		}
	}

	public var tertiary: ColorLuminance {
		switch self {
		case .nearWhite: return .light
		case .extraLight: return .normal
		case .light: return .medium
		case .normal: return .semiDark
		case .medium: return .dark
		case .semiDark: return .normal
		case .dark: return .medium
		case .extraDark: return .semiDark
		case .nearBlack: return .dark
		}
	}

	public var quarternary: ColorLuminance {
		switch self {
		case .nearWhite: return .extraLight
		case .extraLight: return .light
		case .light: return .normal
		case .normal: return .medium
		case .medium: return .semiDark
		case .semiDark: return .medium
		case .dark: return .semiDark
		case .extraDark: return .dark
		case .nearBlack: return .extraDark
		}
	}
}

/// Accessible (farthest away)
extension ColorLuminance {
	public var accessible: ColorLuminance {
		switch self {
		case .nearWhite: return .nearBlack
		case .extraLight: return .nearBlack
		case .light: return .nearBlack
		case .normal: return .nearBlack
		case .medium: return .nearWhite
		case .semiDark: return .nearWhite
		case .dark: return .nearWhite
		case .extraDark: return .nearWhite
		case .nearBlack: return .nearWhite
		}
	}
}
