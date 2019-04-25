*fresh start everytime running do file
cls
clear

/*

	Question:
		What is the relationship between dual eligible proportion and reimbursement penalties?
	
*/


*load data
use "Socal 8 economic links.dta"

*look at all variables in dataset
describe

*keep select variables for making wide to long
keep ///

	*variables already in long format
	providerid hospitalname city state countyname hospitaltype hospitalownership ///
	emergencyservices meetscriteriaformeaningfuluseofe hospitaloverallrating ///
	hospitaloverallratingfootnote mortalitynationalcomparison mortalitynationalcomparisonfootn ///
	safetyofcarenationalcomparison safetyofcarenationalcomparisonfo readmissionnationalcomparison ///
	readmissionnationalcomparisonfoo patientexperiencenationalcompari var20 ///
	effectivenessofcarenationalcompa var22 timelinessofcarenationalcomparis ///
	var24 efficientuseofmedicalimagingnati var26 hospitalccn	///
	
	*variables in wide format by year
	numberofamicasesinfy2014 numberofamicasesinfy2015 numberofamicasesinfy2016 numberofamicasesinfy2017 ///
	numberofcopdcasesinfy2014 numberofcopdcasesinfy2015 numberofcopdcasesinfy2016 numberofcopdcasesinfy2017
	
*look at subset dataset
describe

*go from wide to long
*Wide to Long:	https://stats.idre.ucla.edu/stata/modules/reshaping-data-wide-to-long/
reshape long numberofamicasesinfy numberofcopdcasesinfy, i(providerid) j(year)

*label long variable
label variable numberofamicasesinfy "Number of AMI Cases in FY"
label variable numberofcopdcasesinfy "Number of COPD Cases in FY"

*look at long dataset
describe
