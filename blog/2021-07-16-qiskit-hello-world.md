@def authors = "Ashish Panigrahi"
@def published = "16 July 2021"
@def rss_pubdate = Date(2021, 7, 16)
@def rss_description = "Hello world program in Qiskit"
@def title = "Hello, world in Qiskit"


# Hello, world in Qiskit

## What is Qiskit?

Qiskit is a python SDK for simulating and running quantum algorithms on real quantum computers. As mentioned on [qiskit.org](https://qiskit.org/):

> Qiskit [kiss-kit] is an open-source SDK for working with quantum computers at the level of pulses, circuits and application modules.

I plan on writing a series of tutorials on getting started with quantum computing using qiskit, as I learn as well. Like any other programming tutorial, we start with a simple "Hello, world" program.

## Measuring a quantum state

With conventional computers, the simplest program that one could perhaps make is printing out "hello, world". However, in contrast to this, in quantum systems, we go ahead and measure a quantum state (this seems to be the most rudimentary but complete program in quantum terms). Let's proceed to do just that!

### Defining a quantum state

We import the necessary modules from Qiskit for this operation. To define a quantum circuit, we require the classes `QuantumCircuit`, `QuantumRegister`, `ClassicalRegister` and define a state variable `psi` as

$$
| \psi \rangle =
\frac{1}{\sqrt{2}}
\begin{pmatrix}
1\\
1
\end{pmatrix}
$$

Notice that the state $| \psi \rangle$ is normalized. This is important, otherwise we'll end up with an error.

```python
from qiskit import QuantumCircuit, QuantumRegister, ClassicalRegister
from math import sqrt

# define an initial state
psi = [1/sqrt(2), 1/sqrt(2)]
```

We then define a function `prepare()` which takes two parameters: a `QuantumCircuit` object named `qc` and the initial state `psi`. Remember that the quantum circuit that we define, only uses 1 qubit (notice the vector representation of $| \psi \rangle$).

```python
def prepare(qc, psi):
    qc.initialize(psi, [0])     # [0] indicates the zeroth index (or) the first qubit
```

Python by default, calls by reference, so we don't have to worry about returning anything from `prepare()`.

### Building a quantum circuit

Let's proceed with making an actual quantum circuit. For this, we define a `QuantumRegister` object `qr`, which stores the qubits and a `ClassicalRegister` object `cr` which stores the measured values of those qubits.

```python
qr = QuantumRegister(1)
cr = ClassicalRegister(1)
```

Combining the two registers, we now make a quantum circuit:

```python
qc = QuantumCircuit(qr, cr)
```

### Initializing and measuring the qubit

We then call our function `prepare()` to initialize the first qubit (the only qubit) of our quantum circuit `qc`.

```python
prepare(qc, psi)
```

How do we go about measuring our state? That's where the `ClassicalRegister` object `cr` comes in. We use the `measure` method under the `qc` object to actually measure the qubit.

```python
qc.measure(qr[0], cr[0])
```

The above syntax generally means that we're measuring the state of `qr[0]` (the first qubit) onto the classical register `cr[0]` where we store the measured value.

## Visualizing the circuit

Ok so all of this is nice, but one can only describe so much. Let's see how our circuit actually looks like after applying the above operations. For this, we use the `draw()` method.

```python
>>> qc.draw(output='text')   # specifying the 'text' backend
```

```plaintext
      ┌─────────────────────────────┐┌─┐
q0_0: ┤ Initialize(0.70711,0.70711) ├┤M├
      └─────────────────────────────┘└╥┘
c0: 1/════════════════════════════════╩═
                                      0
```

For a nice looking figure, we use the `matplotlib` backend.

```python
>>> qc.draw(output='mpl')
```

\figenv{}{/assets/images/qc.png}{width:20em;}
