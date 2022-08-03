@def author = "Ashish Panigrahi"
@def published = "26-07-2020"
@def rss_pubdate = Date(2020, 7, 26)
@def rss_description = "A primer to no-cloning theorem explaining why it is forbidden to copy a general unknown quantum state A onto another quantum state B."
@def title = "A primer to no-cloning theorem"

## Prerequisites

### *Unitary transform:*

An operator $U$ is unitary if
$$
U U^\dagger = U^\dagger U = I
$$
where $U^\dagger$ is the complex conjugate (interchange rows & columns and replace
$i$ with $-i$) of $U$.

### *Tensor product:*

Let there be 2 matrices $A$ and $B$ where
$$
A =
\begin{pmatrix}
a_{00} & a_{01} \\
a_{10} & a_{11} \\
\end{pmatrix}
$$

$$
B =
\begin{pmatrix}
b_{00} & b_{01} \\
b_{10} & b_{11} \\
\end{pmatrix}
$$

The tensor product of $A$ and $B$ is represented as $A \otimes B$ and is evaluated as
$$
A \otimes B =
\begin{pmatrix}
a_{00} \cdot
\begin{pmatrix}
b_{00} & b_{01} \\
b_{10} & b_{11} \\
\end{pmatrix}
&
a_{01} \cdot
\begin{pmatrix}
b_{00} & b_{01} \\
b_{10} & b_{11} \\
\end{pmatrix}
\\
a_{10} \cdot
\begin{pmatrix}
b_{00} & b_{01} \\
b_{10} & b_{11} \\
\end{pmatrix}
&
a_{11} \cdot
\begin{pmatrix}
b_{00} & b_{01} \\
b_{10} & b_{11} \\
\end{pmatrix}
\\
\end{pmatrix}
$$

#### Disclaimer
I have used the term unitary transform and unitary operation interchangeably (since they mean the same thing).

## Introduction
Given a quantum state $\left| \psi \right> = \alpha \left| 0 \right> + \beta \left| 1
\right>$ with unknown complex coefficients $\alpha$ and $\beta$, is it possible to
replicate the state onto another qubit? In other words, is it possible to go from
$\left| \psi \right>$ to $\left| \psi \right> \otimes \left| \psi \right>$? Let us
form a hypothesis.

### *Hypothesis:*
Given an unknown quantum state $\left| \psi \right>$, there exists a unitary
transform $U$ such that it replicates the state $\left| \psi \right>$ to $\left| \psi
\right> \otimes \left| \psi \right>$.

From the postulates of quantum mechanics, any transformation of a quantum system must
be unitary. Hence, we are trying to look for a unitary operation $U$ to make the
following transform:
$$
U \left| \psi \right> \otimes \left| 0 \right> = \left| \psi \right> \otimes \left| \psi \right>
$$

Here the inputs are $\left| \psi \right>$ and an ancilla qubit (in our case $\left | 0 \right>$).

The no cloning theorem tells us that such a unitary transform does not exist. Let us
see how this is true, algebraically. We will do this by disproving the hypothesis.
Let us look at the cases when $\left| \psi \right> = \left| 0 \right>$ and when
$\left| \psi \right> = \left| 1 \right>$. On applying the operation $U$, the 2-qubit
state becomes,

$$
\left| 0 \right> \otimes \left| 0 \right> = \left| 00 \right> \xrightarrow[]{U} \left| 00 \right>
$$
$$
\left| 1 \right> \otimes \left| 0 \right> = \left| 10 \right> \xrightarrow[]{U} \left| 11 \right>
$$

Now let us apply $U$ to the original state $\left| \psi \right> (= \alpha \left| 0 \right> + \beta \left| 1 \right>)$ based on the above transformations.

$$
(\alpha \left| 0 \right> + \beta \left| 1 \right>) \otimes \left| 0 \right> = \alpha \left| 00 \right> + \beta \left| 10 \right> \xrightarrow[]{U} \alpha U \left| 00 \right> + \beta U \left| 10 \right> = \alpha \left| 00 \right> + \beta \left| 11 \right>
$$

Based on our original hypothesis, the output is

$$
(\alpha \left| 0 \right> + \beta \left| 1 \right>) \otimes (\alpha \left| 0 \right> + \beta \left| 1 \right>) = \alpha ^2 \left| 00 \right> + \alpha \beta \left| 01 \right> + \beta \alpha \left| 10 \right> + \beta ^2 \left| 11 \right>
$$

In matrix notation this looks like

$$
\begin{pmatrix}
\alpha ^2 \\
\alpha \beta \\
\beta \alpha \\
\beta ^2 \\
\end{pmatrix}
=
U
\begin{pmatrix}
\alpha \\
0 \\
\beta \\
0 \\
\end{pmatrix}
$$

Now comparing the coefficients of the output states, such a case is only possible if
$\alpha = 1$ or $\beta = 1$. This disproves the hypothesis, hence proving the no
cloning theorem.


## References

1. [Quantum Computing lectures by Dr. Umesh Vazirani](https://www.youtube.com/watch?v=1X7CDd1lvR0&list=PLXEJgM3ycgQW5ysL69uaEdPoof4it6seB)
2. Principles of Quantum Mechanics - Shankar
3. Quantum Computation and quantum information - Nielsen & Chuang
