expect = require('chai').expect
Phone = require('../../src/script/Phone')
mexico  = require('../../src/script/countries/MEX')

describe 'Mexico', ->

	describe 'Should get a', ->

		it '8 numbers', ->
			# Arrange
			number = "+52 81 1111 2222"

			# Act
			result = Phone.getPhoneInternational(number)

			# Assert
			expect(result.valid).to.be.true

		it '7 numbers', ->
			# Arrange
			number = "+52 222 111 2222"

			# Act
			result = Phone.getPhoneInternational(number)

			# Assert
			expect(result.valid).to.be.true

	describe 'Should split', ->

		it 'number with 7 digits', ->
			# Arrange
			number = "1112222"

			# Act
			result = Phone.countries['52'].splitNumber(number)

			# Assert
			expect(result).to.deep.equal(['111', '2222'])

		it 'number with 8 digits', ->
			# Arrange
			number = "11112222"

			# Act
			result = Phone.countries['52'].splitNumber(number)

			# Assert
			expect(result).to.deep.equal(['1111', '2222'])

	describe 'Should validate a', ->

		it 'number with 8 digits', ->
			# Arrange
			number = "+52 81 1212 1212"

			# Act
			result = Phone.validate(number)

			# Assert
			expect(result).to.be.true

		it 'number with 7 digits', ->
			# Arrange
			number = "+52 222 566 6565"

			# Act
			result = Phone.validate(number)

			# Assert
			expect(result).to.be.true

		it 'number with national destionation code starting with 42', ->
			# Arrange
			number = "+52 428 106 8349"

			# Act
			result = Phone.validate(number)

			# Assert
			expect(result).to.be.true
