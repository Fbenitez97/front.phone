Phone = require('../Phone')
PhoneNumber = require('../PhoneNumber')

# For more info check:
# https://en.wikipedia.org/wiki/Telephone_numbers_in_Italy
class Italy
	constructor: ->
		@countryName = "Italy"
		@countryNameAbbr = "ITA"
		@countryCode = '39'
		@regex = /^(?:(?:\+|)39|)(?:0|)(?:(?:[3456789]\d{8}))$/
		@optionalTrunkPrefix = '0'
		@nationalNumberSeparator = ' '
		@nationalDestinationCode =
			[
				'3','4','5', '6', '7', '8', '9'
			]

	specialRules: (withoutCountryCode, withoutNDC, ndc) =>
		phone = new PhoneNumber(@countryNameAbbr, @countryCode, '', withoutNDC)
	
		if withoutNDC.length is 8 or 9
			phone.number = withoutCountryCode
			phone.isMobile = ndc is '3'
			return phone

	splitNumber: (number) =>
		if number.length is 10
			return Phone.compact number.split(/(\d{3})(\d{3})(\d{4})/)
        else if number.length is 9
			return Phone.compact number.split(/(\d{3})(\d{3})(\d{3})/)

		return [number]

# register
italy = new Italy()
Phone.countries['39'] = italy

# exports
module.exports = italy
