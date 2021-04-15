import { palette, singles } from './palette'

interface ColorSingles {
	[key: string]: string
}

const wrapColorsForTailwind = (colors: ColorSingles) => {
	return Object.entries(colors).reduce((acc, [colorName, colorHex]) => {
		return {
			...acc,
			[colorName]: {
				DEFAULT: colorHex,
			},
		}
	}, {})
}

const colors = {
	...palette,
	gray: {
		...palette.grey,
	},
	...wrapColorsForTailwind(singles),
}

export default colors
