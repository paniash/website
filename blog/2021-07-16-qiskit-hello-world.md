@def authors = "Ashish Panigrahi"
@def published = "16 July 2021"
@def rss_pubdate = Date(2021, 7, 16)
@def rss_description = "Hello world program in Qiskit"
@def title = "Hello world in quanta"


# Hello, world in Qiskit

## What is Qiskit?

Qiskit is a python SDK for simulating and running quantum algorithms on real quantum computers. As mentioned on [qiskit.org](https://qiskit.org/):

> Qiskit [kiss-kit] is an open-source SDK for working with quantum computers at the level of pulses, circuits and application modules.

I plan on writing a series of tutorials on getting started with quantum computing using qiskit, as I learn as well. Like any other programming tutorial, we start with a simple "Hello, world" program.

## Measuring a quantum state

With conventional computers, the simplest program that one could perhaps make is printing out "hello, world". However, in contrast to this, in quantum systems, we go ahead and measure a quantum state (this seems to be the most rudimentary but complete program in quantum terms). Let's proceed to do just that!

### Defining a quantum state

```python
from qiskit import QuantumCircuit, QuantumRegister, ClassicalRegister

def initialize(init):


```
