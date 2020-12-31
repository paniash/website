@def authors = "Ashish Panigrahi"
@def published = "20 July 2020"
@def rss_pubdate = Date(2020, 7, 20)
@def rss_description = "This blog post is about cryptography"
@def title = "Crypto intro"


## What is cryptography?
We have all heard fancy jargon like "encryption", "cryptography" and what not, but what do these terms actually mean? In this article, I attempt to give you a brief introduction to the world of cryptography and how in particular, public-key cryptography, a popular means of encryption works.

In layman terms, [*cryptography*](https://en.wikipedia.org/wiki/Cryptography) is the study of securing messages between two parties without a third party knowing what the message is. [*Encryption*](https://en.wikipedia.org/wiki/Encryption) is the process of securing these messages.

Think of encryption as a process which is easy to do in one direction but rather difficult to do in reverse. One such example is **colour mixing**. One can mix various colours and make a mixture out of it. However, if you ask another person, it would be *almost* impossible to tell the constituent colours from the mixture.

## The barebones method - symmetric encryption
The most basic and easy to understand method is the [symmetric encryption](https://en.wikipedia.org/wiki/Symmetric-key_algorithm) method. It basically involves the following: Alice, who wants to send a message; Bob, who receives the message; and a secret key used to encrypt the message (essentially turning the message into gibberish).

Alice has a message, encrypts the message using the secret key, sends the message. Bob now decrypts the message using the same secret key and reads the message. This way during the process when the message is sent, even if a third party gets a hold of the message; they cannot read the message since they do not have the secret key.

### Caveats
The above method has a major flaw, which is that both the parties must have a common key. That means that the key to be used for encryption must be decided upon by the two parties beforehand. So the two parties have to meet at a place or send the key to the other through some means which isn't secure, unless one encrypts this key information which requires another key.

## A better method - asymmetric encryption
Asymmetric encryption AKA [*public-key cryptography*](https://en.wikipedia.org/wiki/Public-key_cryptography) involves the same scenario as that of symmetric encryption, the only difference being that instead of one secret key, two keys are used (called a *key pair*). Let them be *key A* and *key B*.

Let us use the same scenario as before: Alice wishes to send a message; she encrypts it with *key A* and sends it to Bob; he receives it and decrypts it using *key B*. Note that there was no exchange regarding the information of the keys themselves. *Key A* cannot be guessed from *key B* and vice-versa however they are linked in such a way that a message encrypted with *key A* can only be decrypted with *key B* and a message encrypted with *key B* can only be decrypted with *key A*.

### Real-world implications
When using asymmetric encryption, a key-pair is generated i.e. a *public* key and a *private* key.

The public key is made public (who knew!) and is published everywhere, on websites, posters and so on. The private key is kept to yourself. Any messages intended for you could be then encrypted using your public-key that only you can decrypt since you have the private-key.

What about the other way round? You could encrypt a message that you wish to send, using your private-key. But then you might ask, why should I encrypt a message that can be decrypted using my public-key since anyone can decrypt the message? (since you've made your public-key, public)

### Signature algorithms
By encrypting the message using your private-key, one can know that the message is authentic since it can be decrypted using your public-key meaning, it must have been encrypted using your private-key which only you have access to.

### A proper communication
So the best way to communicate using this protocol would be as follows: Alice has a key-pair and Bob has a key-pair. Alice wishes to send a message; she encrypts it using her private-key *ensuring that the message is authentic* and then encrypts it again using Bob's public key *ensuring that only Bob can read the message*. Bob upon receiving the gibberish decrypts it using his private-key and then once again using Alice's public-key establishing a secure channel for communication.

Note that in this method no keys were exchanged, in fact, Alice and Bob might not have even met before and this method still works. Isn't that amazing?

## Disclaimer
I understand that I have over-simplified things. This post is only meant to get a brief overview of encryption. For a better understanding refer the **Crypto 101** textbook linked below.

___

This post was inspired by the book, [Crypto 101](https://www.crypto101.io) by Laurens Van Houtven and this [video](https://www.youtube.com/watch?v=GSIDS_lvRv4) from the YouTube channel [Computerphile](https://www.youtube.com/user/Computerphile) where Dr. Robert Miles explains about public-key encryption.

Lastly, I would like to end this post with a quote from Bruce Schneier:

> There are two kinds of cryptography in this world: cryptography that will stop your kid sister from reading your files, and cryptography that will stop major governments from reading your files.
