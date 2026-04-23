#import "/style.typ": theme
#show: theme

#let Var = math.op("Var")
#let Cov = math.op("Cov")


#title[
  COMP0199
]

= Sequences of Functions

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

$(f_n)$ denotes the sequence of functions where $f_n : A mapsto RR$ for all $n in NN$.

== Pointwise Convergence

The sequence $(f_n)_(n in NN)$ *converges _pointwise_* to $f$ on the interval $A$ if
$
  forall x in A, forall epsilon > 0, exists N in NN, forall n > N : abs(f(x) - f_n (x)) < epsilon
$

If $lim_(n->infinity) (f_n (a))$ exists and is finite for all $a in A$, \
then we can define the _limit function_ $f : x mapsto lim_(n->infinity) (f_n (x))$. \
$(f_n (a))_(n in NN)$ is said to *converge _pointwise_* towards $f$.

A sequence of functions $(f_n)$ is pointwise Cauchy if $(f_n (x))$ is Cauchy for all $x$.

A sequence is pointwise Cauchy iff. it converges pointwise.


== Uniform Convergence

The sequence $(f_n)_(n in NN)$ *converges _uniformly_* to $f$ on the interval $A$ if
$
  forall epsilon > 0, exists N in NN, forall x in A, forall n > N : abs(f(x) - f_n (x)) < epsilon
$

Uniform convergence implies pointwise convergence, to the same limit. (It is _stronger_.)

Uniform convergence preserves *uniformity*; \
The limit is continuous if the sequence is of continuous functions and converges uniformly.

*Integration*: \
If the sequence $(f_n (a))_(n in NN)$ converges uniformly to $f$ on $[a, b]$, then
$
  lim_(n->infinity) integral_a^b f_n (x) d x = integral_a^b f(x) d x
$

*Differentiation*: \
If $(f_n (a))_(n in NN)$ converges to $f(a)$ and *$(f'_n)$* converges uniformly on $[a, b]$, then
$
  lim_(n->infinity) f'_n (x) = f'(x)
$
...and the convergence of $(f_n)$ is also uniform.


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


