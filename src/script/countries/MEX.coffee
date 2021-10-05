
Phone = require('../Phone')
PhoneNumber = require('../PhoneNumber')

# For more info check:
# http://www.sre.gob.mx/austin/Util/LadasMexico.html
class Mexico
	constructor: ->
		@countryName = "Mexico"
		@countryNameAbbr = "MEX"
		@countryCode = '52'
		@regex = /^(?:(?:\+|)52|)(?:(?:33|55|56|81)\d{8}|(?:22[1-9]|23[1-35-8]|24[13-9]|27[1-9]|28[1-578]|29[467]|31[1-9]|32[1-9]|34[1-9]|35[1-9]|37[1-9]|38[1-9]|39[1-5]|41[1-5]|41[7-9]|42[1-9]|43[1-8]|44[1-57-9]|45[1-9]|46[1-9]|47[1-8]|48[1-35-9]|49[2-689]|588|59[1-79]|61[2-68]|62[1-9]|63[1-9]|64[1-9]|65[1-3689]|66[1-57-9]|67[1-7]|68[67]|69[4-8]|71[1-9]|72[1-9]|73[1-9]|74[1-9]|75[13-9]|76[1-9]|77[1-9]|78[1-69]|79[17]|82[13-9]|83[1-6]|84[124-6]|86[1246-9]|87[1-378]|89[12479]|91[346-9]|92[1-4]|93[2-46-8]|95[1348]|96[1-9]|97[12]|98[1-8]|99[1-9])\d{7})$/
		@optionalTrunkPrefix = ''
		@nationalNumberSeparator = ' '
		@nationalDestinationCode =
			[
				"33", "55", "56", "81", "221", "222","223","224","225","226","227","228","229","231","232","233","235","236","237","238","241","243","244","245","246","247","248","249","271","272","273","274","275","276","278","279","281","282","283","284","285","287","288","294","296","297","311","312","313","314","315","316","317","318","319","321","322","323","324","325","326","327","328","329","341","342","343","344","345","346","347","348","349","351","352","353","354","355","356","357","358","359","371","372","373","374","375","376","377","378","379","381","382","383","384","385","386","387","388","389","391","392","393","394","395","411","412","413","414","415","417","418","419","421","422","423","424","425","426","427","428","429","431","432","433","434","435","436","437","438","441","442","443","444","445","447","448","449","451","452","453","454","455","456","457","458","459","461","462","463","464","465","466","467","468","469","471","472","473","474","475","476","477","478","481","482","483","485","486","487","488","489","492","493","494","495","496","498","499","588","591","592","593","594","595","596","597","599","612","613","614","615","616","618","621","622","623","624","625","626","627","628","629","631","632","633","634","635","636","637","638","639","641","642","643","644","645","646","647","648","649","651","652","653","656","658","659","661","662","663","664","665","667","668","669","671","672","673","674","675","676","677","686","687","694","695","696","697","698","711","712","713","714","715","716","717","718","719","721","722","723","724","725","726","727","728","729","731","732","733","734","735","736","737","738","739","741","742","743","744","745","746","747","748","749","751","753","754","755","756","757","758","759","761","762","763","764","765","766","767","768","769","771","772","773","774","775","776","777","778","779","781","782","783","784","785","786","789","791","797","821","823","824","825","826","827","828","829","831","832","833","834","835","836","841","842","844","845","846","861","862","864","866","867","868","869","871","872","873","877","878","891","892","894","897","899","913","914","916","917","918","919","921","922","923","924","932","933","934","936","937","938","951","953","954","958","961","962","963","964","965","966","967","968","969","971","972","981","982","983","984","985","986","987","988","991","992","993","994","995","996","997","998","999"
			]

	specialRules: (withoutCountryCode, withoutNDC, ndc) =>
		if withoutNDC.length is 7 or withoutNDC.length is 8
			return new PhoneNumber(@countryNameAbbr, @countryCode, ndc, withoutNDC)

	splitNumber: (number) =>
		if number.length is 7
			return Phone.compact number.split(/(\d{3})(\d{4})/)
		else if number.length is 8
			return Phone.compact number.split(/(\d{4})(\d{4})/)

		return [number]

# register
mexico = new Mexico()
Phone.countries['52'] = mexico

# exports
module.exports = mexico
