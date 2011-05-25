About
-----

PWChecker is a Rails application that I made to test the strength of passwords. The password it tested against multiple dictionaries, and the time it would take to brute-force it is calculated. You can see two representations of the strength of your password:

- The time it would take to test all combinations of characters used in your password
	* This overstates the strength because the password would be cracked in, on average, half the total number of possibilities
- The probability that the password would be broken within a given time period
	* This gives a better sense of strength because you can decide on a time period you're concerned about and see if the chance of being compromised is acceptable
	
The calculations also take into account the effect of predictability caused by user-generated passwords. You can read more about this in [this report][1]

Usage
-----

You can see this application in action [here][2]. You can run the app locally using Webrick, which comes in a standard installation of Rails. You can either skip the dictionary test or import an enhanced english dictionary from [here][3].

[1]: http://csrc.nist.gov/publications/nistpubs/800-63/SP800-63V1_0_2.pdf
[2]: http://pwchecker.mattwean.com
[3]: http://mattwean.squarespace.com/storage/files/en_dicts.csv