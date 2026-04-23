#import "/style.typ": theme
#show: theme

#import "@preview/booktabs:0.0.4": *
#show: booktabs-default-table-style

#set page(height: auto) // mimic page-less format

#let Var = math.op("Var")
#let Cov = math.op("Cov")


#title[
  COMP0199
]

= Sequences of Functions

$(f_n)_(n=0)^infinity$ or $(f_n)$ denotes the sequence of functions where $f_n : A mapsto RR$ for all $n in NN$.

/ Sequence of Functions: An assignment of a function $f_n : A mapsto RR$ to each $n in NN$.

Hereafter, assume $A$ as the domain / target interval.

== Backgroud

For numbers, the sequence $u_n$ tends to $l$ iff.
$
  forall epsilon > 0, exists N in NN : n > N => abs(u_n - l) < epsilon
$

A sequence of numbers $u_n$ is Cauchy if
$
  forall epsilon > 0, exists N > NN, forall m, n >= N : abs(u_m - u_n) < epsilon
$

A sequence is Cauchy iff. it is convergent (in _complete_ metric spaces).
Note that the Cauchy Criterion does not refer to the limit itself.


== Pointwise Convergence

If $lim_(n->infinity) (f_n (a))$ exists and is finite for all $a in A$, \
we can define the _limit function_ $f : x mapsto lim_(n->infinity) (f_n (x))$. \
$(f_n (a))_(n in NN)$ is said to *converge _pointwise_* towards $f$.

/ Pointwise Convergence: The sequence $(f_n)_(n in NN)$ converges pointwise to $f : A mapsto RR$ if
  $
    forall x in A, forall epsilon > 0, exists N in NN, forall n > N : abs(f(x) - f_n (x)) < epsilon
  $
  I.e., $forall x in A, f_n (x) -> f(x)$ as $n -> infinity$.


A sequence of functions $(f_n)$ is pointwise Cauchy if $(f_n (x))$ is Cauchy for all $x$. \
A sequence is pointwise Cauchy iff. it converges pointwise.


== Uniform Convergence

/ Uniform Convergence: The sequence $(f_n)_(n in NN)$ *converges _uniformly_* to $f$ on the interval $A$ if
  $
    forall epsilon > 0, exists N in NN, forall x in A, forall n > N : abs(f(x) - f_n (x)) < epsilon
  $
  I.e., $sup_(x in A) abs(f_n (x) - f(x)) -> 0$ as $n -> infinity$.

Uniform convergence implies pointwise convergence, to the same limit. (It is _stronger_.)

*Uniformity* is preserved: \
The limit $f$ continuous if all $f_n$ is continuous and $(f_n)$ converges uniformly.

*Integrals* are preserved: \
If $(f_n)$ converges uniformly to $f$ on $[a, b]$, then
$
  lim_(n->infinity) integral_a^b f_n (x) d x = integral_a^b f(x) d x
$

*Derivatives* are more complicated: \
If $(f_n (x_0))$ converges for some $x_0 in [a, b]$ and $(bold(f'_n))$ converges uniformly on $[a, b]$, then
$
  lim_(n->infinity) f'_n (x) = f'(x) quad quad ("for" x in [a, b])
$
...and the convergence of $(f_n)$ is also uniform.

Note: the uniform convergence on the sequence of derivatives converges the "shape" of the function, while the single-point convergence on the sequence itself asserts that the solution is uniquely well-defined. (Consider $f_n (x) = n + x$.)


= Series of Functions

= Linear Algebra

= Matrix Reduction

= Differential Calculus

= Euclidean Spaces

= Numerical Methods

= Probabilities

PDF:
1. $f : T mapsto RR$
2. $forall x in T : f(x) >= 0$
3. $integral_T f(x) dif x = 1$

$
  Pr(a <= X <= b) = integral_a^b f(x) dif x
$

Evidently, $Pr(X = a) = 0$.

Cumulative DF:
$
  F_X(x) = Pr(X <= x) = integral_(-infinity)^x f(t) dif t
$


also written as $mu$:
$
  E[X] = integral_(-infinity)^infinity x f(x) dif x \
  E[X] = sum_T x Pr(X = x)
$

$
  op("Cov")(X, Y) & = E[(X - E[X])(Y - E[Y])] \
                  & = E[X Y] - E[X]E[Y] \
     op("Var")(X) & = E[(X - E[X])^2] \
                  & = E[X^2] - E[X]^2 \
$
$
  op("Var")(X) = integral_T x^2 f(x) dif x - mu^2 = integral_T (x - mu)^2 f(x) dif x
$

$op("Cov")(X, Y) = 0$ if $X$ and $Y$ are independent.

== classic distros

=== Exponential

$
  X tilde op("Exp")(lambda) \
  f(x) = lambda e^(-lambda x) quad {x >= 0} \
  E[X] = 1/lambda \
  Var(X) = 1/lambda^2
$

=== Uniform

$
  X tilde U(a, b) \
  f(x) = 1/(b - a) quad {a <= x <= b} \
  E[X] = (a + b)/2 \
  Var(X) = ???
$

=== Normal

$
  X tilde N(mu, sigma^2) \
  f(x) = y e a h \
  E[X] = mu \
  Var(X) = sigma^2
$


=== what

and whatever Student's t-distribution and Chi-squared distribution are.


== Multivariate

...joint probability distributions...

_marginal distributions_ are single-variate distributions at some fixed values of all other variables. (E.g. a "slice" of a 2-d distribution.)



*Law of Large Numbers*: \
For a sequence of _independent and identically distributed_ (i.i.d.) random variables, the sum


= Statistics


