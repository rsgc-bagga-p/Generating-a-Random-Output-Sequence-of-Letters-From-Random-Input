import Cocoa

/*:

Your prior goal was to:

* generate a string, 20 characters long, with letters randomly selected
    * based on probability of each letter occuring in all (or at least most) English writing

However, this is not quite how a Markov Chain works.

A Markov chain makes selections based on an analysis of *only* the input text provided.

So, let's move to the next step.

Consider the text below. Re-execute the playground a few times.

*/

let input = getRandomSequence()

input

/*:

What do you notice about the input text each time you run the playground?

Your next step is to take what you have learned from prior playgrounds, and, write an algorithm in plain English that you think would accomplish this goal:

* determine the probability with which a given letter occurs in the input text
* build an output string that is 30 characters long
    * letters occur in the output string based on the proabability with which they occurred in the input string

*/

/*

Write your algorithm ideas here:

Summary
-------
Find 20 random letters based on the input sequence depending on the size and percentages of ocurrence in each sequence

Ideas
-----
Use integers, arrays, and strings for the inputs, outputs and frequencies

Use conditional statements to check the probabilities and display the values

Algorithm (point-form, in English)
----------------------------------

1. Firstly, display the sequence
2. Then check the lenght of the string
3. Use loops
3. Then compare the letters to another string array that holds all 26 letters to find how many times they occur
4. Then calculate the probablilities by dividing the total lenght of the string by each value
5. Then use the letter checking program discussed earlier to find the letters.

Assumptions
-----------
Its gonna work.
*/



//create empty list of probablilities (dictionary)

var letterCounts = [Character: Int]()


//loop over input string
for letter in input.characters{
    
    //inspect each character
    letter
    // build the dictionary list of letter counts
    if letterCounts[letter] == nil{
        letterCounts[letter] = 1                // first time for this letter
    }
    else {
        // we know this letter is in the dictionary. WE KNOW IT
        // ... just add 1 to the current count
        letterCounts[letter]! = letterCounts[letter]! + 1
    }
}
letterCounts

//Get the lenght of the input string
input.characters.count

//Create an empty dictionary to store probabilities
var letterProbabilities = [Character: Float]()

//loop over the list of letter counts
for (letter,count) in letterCounts {
    
    //add an entry to the probabilities dictionary
    letterProbabilities[letter] = Float(count) / Float(input.characters.count) * 100
    
}

letterProbabilities

//check: do the probabilities add to 100?
var total: Float = 0.0
for (letter,probability) in letterProbabilities{
    
    total = total + probability
    total
    
}

//last part, creating a 30 character string
//building the empty output string
var outputString: String = ""

for i in 1...30{
    
    
    //Generate a random value 
    let newRandomValue = arc4random_uniform(100000)
    //Generate float random value
    let newRandomValueFloat = Float(newRandomValue) / 1000
    
    //upper value float
    var upperValue: Float = 0.0
    
    //1. looping through the probabilities dictionary 
    //2. Add the probabilities to determine an "upper value" for the current letter in the dictionary
    //3. check for when the random value generated is LESS THAN the upper value of the probability range for current letter: when this happens, add the letter to the output sequence
    
    
    for(letter, probability) in letterProbabilities{
        
        // determine the new upper value 
        
        upperValue += probability
        
        // When the random value is less than the running total, or upper value, use this letter
        
        if (newRandomValueFloat < upperValue){
            
            //add the letter to the output sequence
            outputString += String(letter)
            
            //stop scanning, we found one that matches 
            //execution of code will continue with next iteration of outer "for" loop from 1 to 30
            break
            
        }
        
    }
    
    
}

// Show the resulting string
outputString

// Verify that the string has the correct number of characters
outputString.characters.count


