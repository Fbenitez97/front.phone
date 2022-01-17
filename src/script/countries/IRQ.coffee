
Phone = require('../Phone')
PhoneNumber = require('../PhoneNumber')

class Iraq
	constructor: ->
		@countryName = "Iraq"
		@countryNameAbbr = "IRQ"
		@countryCode = '964'
		@regex = /^(?:\+|00)964(7?\d{1,2})\d{7}$/
		@optionalTrunkPrefix = '0'
		@nationalNumberSeparator = ' '
		@nationalDestinationCode =
			['1', '21', '23', '24', '25', '30', '32', '33', '36', '37', '40', '42', '43', '50', '53', '60', '62', '66']

# register
iraq = new Iraq()
Phone.countries['964'] = iraq

# exports
module.exports = iraq
