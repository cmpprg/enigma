#Enigma

### Functionality : 3
I have succesfully completed Enigma class with #encrypt and #decrypt methods fully functioning. Enigma also validates all inputs
and communicates with the encrypt/decrypt runner files to throw errors if invalid. Runner files can read from txt and write
encrypted/decrypted messages to txt files.

### OOP 4 
I have followed conventions of ruby in single responsibility. Starting from the bottom I have created a superclass called Processor
that houses common states and behaviors of the KeyProcessor, DateProcessor, and MessageProcessor classes. The KeyProcessor class
intakes a key and works upon it to output a hash of symbolic keys pointing to key shift values. The Date processor class intakes a date
and works upon it to output a hash of symbolic keys pointing to offset shift values. The MessageProcessor intakes the message, key, and date.
It will send date to DateProcessor, send the key to KeyProcessor and then combine the two return hashes for a total shift value. The MessageProcessor
then encrypts or decrypts the message based on the needed action and outputs just the message. Enigma class covers validation of inputs and calling
to MessageProcessor through the #encrypt and #decrypt methods. I feel really good about the organization of this program and am excited to see what
you think.
