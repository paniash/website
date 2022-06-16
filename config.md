<!--
Add here global page variables to use throughout your
website.
The website_* must be defined for the RSS to work
-->
@def website_title = "Ashish Panigrahi's blog"
@def website_descr = "Thoughts on physics, society and technology"
@def website_url   = "https://ashishpanigrahi.xyz"

@def author = "Ashish Panigrahi"

@def mintoclevel = 2

<!--
Add here files or directories that should be ignored by Franklin, otherwise
these files might be copied and, if markdown, processed by Franklin which
you might not want. Indicate directories by ending the name with a `/`.
-->
@def ignore = ["node_modules/", "franklin", "franklin.pub"]

<!--
Add here global latex commands to use throughout your
pages. It can be math commands but does not need to be.
For instance:
* \newcommand{\phrase}{This is a long phrase to copy.}
-->
\newcommand{\R}{\mathbb{R}}
\newcommand{\scal}[1]{\langle #1 \rangle}

\newcommand{\pycode}[2]{
```julia:!#1
#hideall
using PyCall
lines = replace("""!#2""", r"(^|\n)([^\n]+)\n?$" => s"\1res = \2")
py"""
$$lines
"""
println(py"res")
```
```python
#2
```
\codeoutput{!#1}
}

\newcommand{\figenv}[3]{
~~~
<figure style="text-align:center;">
<img src="!#2" style="padding:0;#3" alt="#1"/>
<figcaption>#1</figcaption>
</figure>
~~~
}

\newcommand{\strike}[1]{~~~<s>~~~!#1~~~</s>~~~}
