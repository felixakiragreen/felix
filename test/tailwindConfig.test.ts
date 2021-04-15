// TODO: what do tests even look like?

import { tailwindConfig } from '../src'

describe('tilwindConfig', () => {
	it('has all the colors properly configured', () => {
		// console.log(tailwindConfig)
		expect(tailwindConfig).toHaveProperty('grey')
		expect(tailwindConfig).toHaveProperty('red')
		expect(tailwindConfig).toHaveProperty('orange')
		expect(tailwindConfig).toHaveProperty('yellow')
		expect(tailwindConfig).toHaveProperty('green')
		expect(tailwindConfig).toHaveProperty('blue')
		expect(tailwindConfig).toHaveProperty('purple')
		expect(tailwindConfig).toHaveProperty('white')
		expect(tailwindConfig).toHaveProperty('black')
		expect(tailwindConfig).toHaveProperty('felix')
		expect(tailwindConfig).toHaveProperty('indigo')
		expect(tailwindConfig).toHaveProperty('teal')
		expect(tailwindConfig).toHaveProperty('vulcan')
		expect(tailwindConfig).toHaveProperty('mirage')
	})
})
