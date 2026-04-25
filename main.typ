#import "/style.typ": note, note-ref, theme
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

$(f_n)_(n=0)^infinity$ or $(f_n)$ denotes the sequence of functions where $f_n : A -> RR$ for all $n in NN$.

/ Sequence of Functions: An assignment of a function $f_n : A -> RR$ to each $n in NN$.

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

/ Pointwise Convergence: The sequence $(f_n)_(n in NN)$ converges pointwise to $f : A -> RR$ if
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


#pagebreak()
= Series of Functions

$sum f_n$ denotes the series of functions, i.e., the sum of the sequence $(f_n)$.

== easy stuff

$f = sum f_n$ is more specifically $f : x mapsto sum_(n=infinity)^infinity f_n (x)$. \
Clearly, this (infinite) sum may be undefined.

The partial sums of a series is a sequence itself: $(sum_(k=0)^n f_k (x))_n$

$sum f_n$ *converges _pointwise_* on $A$ if the sequence of _partial sums_ converges pointwise on $A$.

/ Weierstrass M-Test: A test for determining whether a series of functions converges _normally_: \
  $sum f_n$ *converges _normally_* on $A$ \
  if $forall n in NN, forall x in A : abs(f_n (x)) <= M_n$ \
  for $M_n >= 0$, $sum M_n$ converges.

Note that _normal convergence_ implies *_uniform_* and *_absolute_ convergence*. \
The Weierstrass M-test may be seen as the Cauchy Criterion for uniform convergence. \
Furthermore, the $x$-dependence is eliminated by effectively taking the suprema:
$
  sup_x abs(sum_(n=N)^infinity f_n (x)) <= sum_(n=N)^infinity sup_x abs(f_n (x)) = sum_(n=N)^infinity M_n -> 0
$
- Does not help find the actual limit.
- Main tool used to test for uniform convergence.


== Power Series

/ Power Series: Series of functions of the form $ sum_(n>=0) a_n (x - b)^n $

- "centered" around $b$
- effectively an infinite polynomial

A power series always converges for certain $x$:
- trivially true for $x=b$,
- then there exists a convergent neighborhood around $b$.

/ Radius of Convergence: Some $r >= 0$ where a power series converges uniformly on any closed interval $A subset (b-r, b+r)$. \
  Divergence when $x in.not [b-r, b+r]$; unknown when $x = b plus.minus r$. \
  Can be infinite for series convergent everywhere.

/ D'Alembert's Ratio Test: A test to find the radius of convergence $r$ of a power series. \
  For some $sum_(n >= 0) a_n (x - b)^n$,
  consider the limit of the sequence of $a$-ratios $L = lim_(n -> infinity) abs(a_(n+1) / a_n)$:
  $
    r = cases(
      1 / L & "if" L != 0,
      infinity & "if" L = 0,
      0 & "if" L = infinity
    )
  $

I.e., convergence when $abs(x - b) < 1 / L$.


== Taylor Series

Taylor Series are a special case of power series. \
They converge (within the radius) to arbitrary functions.

For a function $f$ infinitely differentiable at $b in RR$, its Taylor Series centered at $b$ is
$
  sum_(n>=0) (f^((n))(b)) / n! (x - b)^n
$

- converges to $f$ in $(b - r, b + r)$
- Maclaurin Series are a special case where $b=0$

=== Well-known Functions

$
  e^x & = sum_(n>=0) x^n / n! && = 1 + x + x^2/2! + x^3/3! + ... &&\
  cos(x) & = sum_(n>=0) (-1)^n / (2n!) x^(2n) && = 1 - x^2/2! + x^4/4! - x^6/6! + ... &&\
  sin(x) & = sum_(n>=0) (-1)^n / (2n+1)! x^(2n+1) && = x - x^3/3! + x^5/5! - x^7/7! + ... &&\
  ln(1+x) & = sum_(n>=1) (-1)^(n+1)/n x^n && = x - x^2/2 + x^3/3 - x^4/4 + ... &quad quad& "for" abs(x) < 1, x = 1 \
  1 / (1 - x) & = sum_(n>=0) x^n && = 1 + x + x^2 + x^3 + ... &quad quad &"for" abs(x) < 1 \
  arctan(x) & = sum_(n>=0) (-1)^n / (2n+1) x^(2n+1) && = x - x^3/3 + x^5/5 - x^7/7 + ... &quad quad &"for" abs(x) < 1 \
$

=== Approximations

The degree-$n$ Taylor polynomial of $f$ centered at $b$ is just the series truncated after $n+1$  terms:
$ T_n (x) = sum_(k=0)^n (f^((k))(b)) / k! (x - b)^k $

$f(x) approx T_n (x)$ for $x approx a$.

$R_n (x) = f(x) - T_n (x)$ is the tail of the terms in the series. \
There are numerous ways to express this sub-series beyond a simple summation.

/ Lagrange Form of the Taylor Remainder:
  $ R_n (x) = (f^((n+1)) (xi))/(n+1)! (x-b)^(n+1) $
  where $xi$ is a function of $x$ and is strictly between $b$ and $x$ (open interval).

The derivation of such a term that "captures" an entire series comes from the Mean Value Theorem; the heavy lifting is done by $xi$, which is a function itself and is _not_ computable, but is bounded and thus provides an upper bound for $R_n (x)$. Let $M = max_(xi in (b, x)) abs(f^((n+1)) (xi))$:
$ abs(R_n (x)) <= M / (n+1)! abs(x - b)^(n+1) $

Since $M$ is constant, we have, for $x -> b$:
- $R_n (x) approx abs(x - b)^(n+1)$, or more specifically,
- $R_n (x) = O((x - b)^(n + 1))$
- $R_n (x) = o((x - b)^n)$


#pagebreak()
= Linear Algebra

Assume $U$, $V$, and $W$ to be vector spaces. \
Assume vector spaces to be over the field of $RR$. \
Assume $+$ over functions be _pointwise addition_ -- $(f + g)(x) = f(x) + g(x)$. \

== easy stuff

/ Linear Independence: A subset $S = {v_1, ..., v_k} subset.eq V$ is linearly independent if \
  $sum_(i=0)^k a_i v_i = bold(0) quad ==> quad "all" a_i = 0$ \

Alternatively, the map $(a_1, ..., a_k) mapsto a_1 v_1 + ... + a_k v_k$ is injective.

/ Linear: A map $f: V -> W$ is linear iff. \
  *additivity* $f(u + v) = f(u) + f(v)$ and \
  *homogeneity* $f(lambda v) = lambda f(v)$ \
  are preserved (for arbitrary $u, v in V$ and $lambda in FF$). \

Additivity and homogeneity are commonly combined into $f(lambda u + v) = lambda f(u) + f(v)$.

/ Linear Map: A _homomorphism_ (see below) of a _vector space_.

/ Basis: (...of a vector space $V$) is a subset $B subset.eq V$ that is linearly independent and _spans_ $V$.

/ Direct Sum: A structure-_propagating_ Cartesian product#note-ref(<directsum>) with operations defined element-wise.
  Notated with "oplus" $plus.o$. \

  The above is more specifically an _external_ direct sum; an _internal_ direct sum _conditionally_ exists for #emph("sub")structures of (a common abelian-group-like structure) iff. their intersection is _trivial_; \
  $A plus.o B$ is well-defined#note-ref(<directsuminternal>) ("$A$ and $B$ are in direct sum") iff. $A inter B = {bold(0)}$. \

  There furthermore are _decomposition statements_ using direct sums.
  For a structure $S$ with substructures $A$ and $B$: \
  $ S = A plus.o B quad <==> quad #quote([$A plus.o B$]) #text([*and*]) S = A + B $
  $S = A plus.o B$ is the decomposition statement.

#note(<directsuminternal>)[
  Note: with internal direct sums, the $A plus.o B$ notation has overloaded meanings: it denotes the same sum set as $A + B$ while simultaneously _asserting_ that $A inter B = {bold(0)}$.
]

Alternative definitions of internal direct sum: \
Substructures $A$ and $B$ of a common $S$ are in direct sum iff. every element of $T = A + B$ can be written in exactly one way as the sum of some $a in A$ and $b in B$. I.e.,
$ A plus.o B thick <==> thick forall t in T thick exists! (a, b) in A times B : t = a + b $
Again, $S = A plus.o B$ if also $T = S$.
A more general version, assuming $V = sum_i V_i$:
$
  V = plus.o.big_i V_i quad & <==> quad forall v in V, exists! (v_i)_i in plus.o.big_i V_i : v = sum_i v_i
$
Note that the second $plus.o$ denotes the external direct sum.\
The generalized intersection criteria: $plus.o.big_i V_i quad <==> quad forall i : V_i inter sum_(j!=i) V_j = {bold(0)}$.

#note(<directsum>)[
  Note: the _direct product_ is a structure-propagating Cartesian product; \
  the external direct sum is a direct product with the restriction that the resulting tuples can only have finitely many non-zero elements (which matters if there are infinite operands).
]

If $(u_1, ..., u_n)$ is a basis of $U$ and $(v_1, ..., v_m)$ is a basis of $V$, then $U plus.o V$ iff. $(u_1, ..., u_n, v_1, ..., v_m)$ are linearly independent. ($U$ and $V$ are in the same ambient space.) \
The internal direct sum is associative; the external direct sum is associative up to isomorphism.


/ Composition: For functions $f : B -> C$ and $g : A -> B$, \
  composition is a binary operator where $f compose g : A -> C, thick x mapsto f(g(x))$.

Composition verifies (for arbitrary functions $f, g, h$):
- associativity $f compose (g compose h) = (f compose g) compose h$,
- identity $f compose id = id compose f = f$, and
- distributivity (over $+$) \
  right $(f + g) compose h = (f compose h) + (g compose h)$ and \
  left $f compose (g + h) = (f compose g) + (f compose h)$ *only if* $f$ is _linear_.

#let End = math.op("End")

$(End(V), +)$ is an abelian group; \
$(End(V), +, compose)$ is a ring. \
$End(V) := {f : V -> V | f "is linear"}$; see below section on Endomorphisms.

Note that, for linear $f$ (so symmetric distributivity), we obtain the properties as matrix multiplication.

/ Dimension: The dimension of a vector space $V$, notated $dim V$, is the cardinality of (any) basis of $V$. \
  Note that the Steinitz exchange lemma guarantees any two bases of $V$ have the same cardinality. \
  $dim thin {0} = 0$.


For a function $f : A -> B$:
/ Injectivity: $forall x, y in A : f(x) = f(y) => x = y$ #h(4pt)i.e., $forall y in im f, exists! x in A : f(x) = y$
/ Surjectivity: $forall y in B, exists x in A : f(x) = y$ #h(29pt)i.e., $im f = B$
/ Bijectivity: Injectivity _and_ Surjectivity.


== Linear Maps

Assume $f, g, h$ to be linear maps, and by default $f : V -> W$.

/ Image: $im f := {f(v) | v in V} quad = f(V) subset.eq W$
/ Kernel: $ker f := {v in V | f(v) = bold(0)}$
/ Rank: $op("rank") f = dim im f$
/ Rank-Nullity Theorem: $op("rank") f + dim ker f = dim V$

Note that Rank is only defined for images of finite dimension, and \
Rank-Nullity Theorem assumes $V$ to have finite dimension too.

/ Kernel criterion for Injectivity: $f$ is injective iff. $ker f = {bold(0)}$.

Clearly, injectivity implies $dim W >= dim V$. (Can be proved using the Rank-Nullity Theorem.)

/ Matrix Column Rank criterion for Injectivity: $f$ is injective iff. for a matrix $M$ representing $f$, its columns are linearly independent. \

Clearly, surjectivity implies $dim V >= dim W$. (Can be proved using the Rank-Nullity Theorem.)

Note that any linear map can be made surjective trivially by setting its codomain ($W$) to its image.

/ Isomorphism: Both-way-_structure-preserving_ bijections.

Examples of structure properties to preserve: linearity, group operation. \
The _structure_ of vector spaces is linearity, and linear maps are, well, linear bidirectionally, so all *bijective linear maps are isomorphisms*.

Note#super("2"): The concept of _structure-preserving maps_ come from category theory, where categories explicitly define its such maps, called _morphisms_; vector spaces' morphisms are linear maps by definition, so bijective linear maps are isomorphisms :shrug:. \

Clearly, bijectivity implies $dim V = dim W$. \
Intuitive way to express bijectivity: $forall w in W, exists! v in V : f(v) = w$.

Two structures are _isomorphic_ iff. there exists an isomorphism between them. \
For $V$ and $W$ over the same field, $dim V = dim W$ iff. they are isomorphic.

Matrix representations of a bijection must be square. \
A matrix is invertible iff. it represents a bijection.

== Endomorphisms

/ Endomorphism: A map $f: V -> V$; same domain and codomain.
/ Automorphism: An endomorphism that is also an isomorphism.

For endomorphisms, *injectivity, surjectivity, and bijectivity are equivalent* (in finite dimension).

$f$ is bijective iff. it maps a basis to a basis.

=== Change of Basis

Consider an endomorphism $f$ of $V$ represented by matrix $M$ in the basis $B_1$.

$N = P^(-1) M P$ is the matrix representing $f$ in $B_2$ where
$P$ is a matrix whose columns are the coordinate vectors of $B_2$ in $B_1$. \

/ Transition Matrix: (aka. change-of-basis matrix) what $P$ is above.

Observe that if $P^(-1) M P = N$, then $P N P^(-1) = M$.



#pagebreak()
= Matrix Reduction

#pagebreak()
= Differential Calculus

#pagebreak()
= Euclidean Spaces

#pagebreak()
= Numerical Methods

#pagebreak()
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


#pagebreak()
= Statistics


