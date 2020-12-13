<TeXmacs|1.99.10>

<style|generic>

<\body>
  <section|Prelimiary>

  <subsection|Markov Chain>

  <subsubsection|Definitions>

  <\definition>
    [Markov chain] Let\ 
  </definition>

  <\equation*>
    p<rprime|'><rsub|j>=<big|sum><rsub|i>q<rsub|j i>
    p<rsub|i>\<Rightarrow\>p<rprime|'>=q\<cdot\>p
  </equation*>

  <subsubsection|Detailed Balance>

  <\theorem>
    Let <math|<around*|(|q,A<rsub|X>|)>> a Markov chain with transition
    probability <math|q> and alphabet <math|A<rsub|X>=<around*|{|x<rsub|1>,\<ldots\>,x<rsub|n>|}>>.
    If <math|\<exists\>p> s.t. for <math|\<forall\>i,j=1,\<ldots\>,n>,

    <\enumerate-numeric>
      <item>the detailed balance equation

      <\equation*>
        q<around*|(|x<rsub|j>\|x<rsub|i>|)>
        p<around*|(|x<rsub|i>|)>=q<around*|(|x<rsub|i>\|x<rsub|j>|)>
        p<around*|(|x<rsub|j>|)>
      </equation*>

      holds, and

      <item><math|q<around*|(|x<rsub|j>\|x<rsub|i>|)>> as a matrix is
      irreducible,
    </enumerate-numeric>

    then the stationary distribution of the Markov chain is <math|p>.
  </theorem>

  <\proof>
    Denote <math|q<rsub|i j>\<assign\>q<around*|(|x<rsub|i>\|x<rsub|j>|)>,p<rsub|i>\<assign\>p<around*|(|x<rsub|i>|)>>.
    Then the detailed balance equation becomes

    <\equation*>
      q<rsub|j i> p<rsub|i>=q<rsub|i j> p<rsub|j>.
    </equation*>

    Summing over <math|j> gives

    <\equation*>
      p<rsub|i>=<big|sum><rsub|j=1><rsup|n>q<rsub|i j> p<rsub|j>,
    </equation*>

    meaning that <math|p> is the eigen-vetor of <math|q> with unit
    eigen-value. Since <math|q<rsub|i j>\<geqslant\>0>, <math|q> is a
    non-negative real square matrix. And <math|p<rsub|i>\<gtr\>0>. Thus by
    <hlink|Perron-Frobenius theorem|https://www.math.miami.edu/~armstrong/685fa12/sternberg_perron_frobenius.pdf>,
    <math|q> has unique eigen-vector whose values are all positive, which is
    <math|p>. Thus, <math|p> is the stationary distribution of the Markov
    chain.
  </proof>

  <subsection|Gibbs Sampling>

  <\definition>
    [Gibbs Sampling] Let <math|X=<around*|(|X<rsub|1>,\<ldots\>,X<rsub|n>|)>>
    a set of random variables, with joint distribution <math|p>. Then Gibbs
    sampling is the iterative process: at <math|t> step, first sample
    <math|i\<sim\>Uniform<around*|(|1,\<ldots\>,n|)>>, then sample the next
    <math|x<rsub|i>\<sim\>p<around*|(|x<rsub|i>\|x\\x<rsub|i>|)>>.
  </definition>

  <\lemma>
    [Detailed Balance] For <math|\<forall\>x\<in\>\<bbb-R\><rsup|n>>,
    <math|x<rprime|'><rsub|i>\<in\>\<bbb-R\>>, let
    <math|x<rprime|'>=<around*|(|x<rsub|1>,\<ldots\>,x<rsub|i-1>,x<rprime|'><rsub|i>,x<rsub|i+1>,\<ldots\>,x<rsub|n>|)>>,
    then

    <\equation*>
      p<around*|(|x<rprime|'><rsub|i>\|x\\x<rsub|i>|)>
      p<around*|(|x|)>=p<around*|(|x<rsub|i>\|x<rprime|'>\\x<rprime|'><rsub|i>|)>
      p<around*|(|x<rprime|'>|)>.
    </equation*>
  </lemma>

  <\proof>
    Since <math|x\\x<rsub|i>=<around*|(|x<rsub|1>,\<ldots\>,x<rsub|i-1>,x<rsub|i+1>,\<ldots\>,x<rsub|n>|)>=x<rprime|'>\\x<rprime|'><rsub|i>>,

    <\align>
      <tformat|<table|<row|<cell|p<around*|(|x<rprime|'><rsub|i>\|x\\x<rsub|i>|)>
      p<around*|(|x|)>>|<cell|=<frac|p<around*|(|x<rprime|'>|)>|p<around*|(|x\\x<rsub|i>|)>>p<around*|(|x|)>>>|<row|<cell|>|<cell|=<frac|p<around*|(|x<rprime|'>|)>|p<around*|(|x<rprime|'>\\x<rsub|i><rprime|'>|)>>p<around*|(|x|)>>>|<row|<cell|>|<cell|=<frac|p<around*|(|x|)>|p<around*|(|x<rprime|'>\\x<rsub|i><rprime|'>|)>>p<around*|(|x<rprime|'>|)>>>|<row|<cell|>|<cell|=p<around*|(|x<rsub|i>\|x<rprime|'>\\x<rprime|'><rsub|i>|)>
      p<around*|(|x<rprime|'>|)>.>>>>
    </align>
  </proof>

  <section|Review>

  <subsection|Energy Based Model>

  <\definition>
    [Energy-based Model] Given a measure space <math|M> and
    <math|E:M\<rightarrow\>\<bbb-R\>>, an energy-based model
    <math|<around*|(|M,E|)>> is probabilistic model s.t. for
    <math|\<forall\>x\<in\>M>, the probability of <math|x> is given by

    <\equation*>
      p<rsub|E><around*|(|x|)>=<frac|\<mathe\><rsup|-
      E<around*|(|x|)>>|<big|int><rsub|M>\<mathd\>x<rprime|'>
      \<mathe\><rsup|- E<around*|(|x<rprime|'>|)>>>.
    </equation*>
  </definition>

  <\lemma>
    Let <math|<around*|(|M,E|)>> an energy-based model, then for any constant
    <math|C\<in\>\<bbb-R\>>, <math|<around*|(|M,E+C|)>\<cong\><around*|(|M,E|)>>.
  </lemma>

  <\remark>
    The denominator is employed for balancing, since maximizing the
    probability of one configuration will decease the others. This provides a
    restriction on maximizing a priori.
  </remark>

  <subsubsection|Activity Rule>

  <\lemma>
    Given energy-based model <math|<around*|(|M,E|)>>, for any decomposition
    <math|M=X\<oplus\>Y>, we have for <math|\<forall\>x\<in\>X>,

    <\equation*>
      x<rprime|'>=argmax<rsub|x>p<rsub|E><around*|(|x\|y|)>
    </equation*>

    ensures <math|E<around*|(|x<rprime|'>|)>\<leqslant\>E<around*|(|x|)>>.
  </lemma>

  <\proof>
    Directly, we have

    <\equation*>
      p<rsub|E><around*|(|x\|y|)>=<frac|\<mathe\><rsup|-E<around*|(|x,y|)>>|<big|int><rsub|X>\<mathd\>x<rprime|'>
      \<mathe\><rsup|-E<around*|(|x<rprime|'>,y|)>>>.
    </equation*>

    Since the demonimator depends only on <math|y> which has been fixed,
    <math|><math|argmax<rsub|x>p<rsub|E><around*|(|x\|y|)>> is thus
    <math|argmin<rsub|x>E<around*|(|x,y|)>> by fixing <math|y>.
  </proof>

  <\lemma>
    Let <math|<around*|(|M,E|)>> an energy-based model. Then the monotonicity
    of <math|E> is consistent with that of <math|ln p<rsub|E>> (thus of
    <math|p<rsub|E>>).
  </lemma>

  <\theorem>
    [Activity Rule] Given energy-based model <math|<around*|(|M,E|)>>, for
    any decomposition <math|M=\<oplus\><rsub|i=1><rsup|n>X<rsub|i>>, we have
    for <math|\<forall\>x\<in\>M> and <math|\<forall\>i\<in\><around*|{|1,\<ldots\>,n|}>>,
    activity rule

    <\equation*>
      x<rsub|i><rprime|'>=argmax<rsub|x<rsub|i>>p<rsub|E><around*|(|x<rsub|i>\|x\\x<rsub|i>|)>
    </equation*>

    ensures <math|ln p<rsub|E><around*|(|x<rprime|'>|)>\<geqslant\>ln
    p<rsub|E><around*|(|x|)>>, where <math|x\\x<rsub|i>\<assign\><around*|(|x<rsub|1>,\<ldots\>,x<rsub|i-1>,x<rsub|i+1>,\<ldots\>,x<rsub|n>|)>>
    and <math|x<rprime|'>\<assign\><around*|(|x<rsub|1>,\<ldots\>,x<rsub|i-1>,x<rprime|'><rsub|i>,x<rsub|i+1>,\<ldots\>,x<rsub|n>|)>>.
  </theorem>

  <subsubsection|Learning Rule>

  <\theorem>
    [Learning Rule] Let <math|<around*|(|M,E|)>> an energy-based model where
    <math|E> in parameterized by <math|\<theta\>>. Given the distribution of
    data <math|p<rsub|D><around*|(|x|)>>, define loss
    <math|L\<assign\>-<big|int><rsub|M>\<mathd\>x p<rsub|D><around*|(|x|)> ln
    p<rsub|E><around*|(|x|)>>. Then we have

    <\equation*>
      <frac|\<partial\>L|\<partial\>\<theta\>>=-<big|int><rsub|M>\<mathd\>x
      p<rsub|D><around*|(|x|)> <frac|\<partial\>E|\<partial\>\<theta\>><around*|(|x|)>+<big|int><rsub|M>\<mathd\>x
      p<rsub|E><around*|(|x|)> <frac|\<partial\>E|\<partial\>\<theta\>><around*|(|x|)>.
    </equation*>
  </theorem>

  <\proof>
    \;

    <\equation*>
      L=-<big|int><rsub|M>\<mathd\>x p<rsub|D><around*|(|x|)>
      E<around*|(|x|)>-ln Z.
    </equation*>

    The derivative on the first term of rhs is straight forward. On the
    second term,

    <\align>
      <tformat|<table|<row|<cell|<frac|\<partial\>|\<partial\>\<theta\>>ln
      Z>|<cell|=<frac|1|Z> <frac|\<partial\>|\<partial\>\<theta\>>Z>>|<row|<cell|>|<cell|=<frac|1|Z><frac|\<partial\>|\<partial\>\<theta\>>
      <big|int><rsub|M>\<mathd\>x \<mathe\><rsup|-
      E<around*|(|x|)>>>>|<row|<cell|>|<cell|=-<frac|1|Z>
      <big|int><rsub|M>\<mathd\>x \<mathe\><rsup|-
      E<around*|(|x|)>><frac|\<partial\>E|\<partial\>\<theta\>><around*|(|x|)>>>|<row|<cell|>|<cell|=-<big|int><rsub|M>\<mathd\>x
      p<rsub|E><around*|(|x|)><frac|\<partial\>E|\<partial\>\<theta\>><around*|(|x|)>.>>>>
    </align>

    Altogether,<math|>

    <\equation*>
      <frac|\<partial\>L|\<partial\>\<theta\>>=-<big|int><rsub|M>\<mathd\>x
      p<rsub|D><around*|(|x|)> <frac|\<partial\>E|\<partial\>\<theta\>><around*|(|x|)>+<big|int><rsub|M>\<mathd\>x
      p<rsub|E><around*|(|x|)> <frac|\<partial\>E|\<partial\>\<theta\>><around*|(|x|)>.
    </equation*>
  </proof>

  <subsubsection|Effective Energy>

  <\theorem>
    [Effective Energy] Given en energy-based model <math|<around*|(|M,E|)>>,
    suppose <math|\<exists\>V,H>, s.t. <math|M=V\<oplus\>H>. Then, the
    effective energy on <math|\<forall\>v\<in\>V> is defined as

    <\equation*>
      <wide|E|~><around*|(|v|)>\<assign\>-ln<big|int><rsub|H>\<mathd\>h
      \<mathe\><rsup|-E<around*|(|v,h|)>>.
    </equation*>

    Then, we have,

    <\equation*>
      <frac|\<partial\><wide|E|~>|\<partial\>\<theta\>><around*|(|v|)>=<big|int><rsub|H>\<mathd\>h
      p<rsub|E><around*|(|h\|v|)> <frac|\<partial\>E|\<partial\>\<theta\>><around*|(|v,h|)>.
    </equation*>
  </theorem>

  <subsection|Boltzmann Machine>

  TODO: Re-write this part.

  <\definition>
    [Binary Boltzmann Machine] A binary Boltzmann machine is a model on
    <math|<around*|{|0,1|}><rsup|n>>, equipped with

    <\enumerate-numeric>
      <item>energy

      <\equation*>
        E<around*|(|x|)>=-<frac|1|2>W<rsub|\<alpha\>\<beta\>>x<rsup|\<alpha\>>x<rsup|\<beta\>>-b<rsub|\<alpha\>>
        x<rsup|\<alpha\>>,
      </equation*>

      where <math|W\<in\>\<bbb-R\><rsup|n\<times\>n>> being symmetric and
      diagnal-vanishing and <math|b\<in\>\<bbb-R\><rsup|n>>, and

      <item>update-rule

      <\equation*>
        f<rsub|\<alpha\>><around*|(|x|)>=\<sigma\><around*|(|W<rsub|\<alpha\>\<beta\>>x<rsup|\<beta\>>+b<rsub|\<alpha\>>|)>,
      </equation*>

      where <math|\<sigma\>:\<bbb-R\><rsup|n>\<rightarrow\><around*|{|0,1|}><rsup|n>>

      <\align>
        <tformat|<table|<row|<cell|\<sigma\><rsup|\<alpha\>><around*|(|x|)>=>|<cell|1
        if x<rsup|\<alpha\>>\<geqslant\>0;>>|<row|<cell|>|<cell|0 if
        x<rsup|\<alpha\>>\<less\>0.>>>>
      </align>
    </enumerate-numeric>
  </definition>

  <\remark>
    The probabilistic model where

    <\equation*>
      p<around*|(|x|)>=<big|prod><rsub|\<alpha\>=1><rsup|n>Bernoulli<around*|(|p<rsub|\<alpha\>><around*|(|x|)>|)>,
    </equation*>

    wherein <math|p<rsub|\<alpha\>><around*|(|x|)>\<assign\>\<sigma\><around*|(|W<rsub|\<alpha\>\<beta\>>x<rsup|\<beta\>>+b<rsub|\<alpha\>>|)>>
    with <math|\<sigma\>> the sigmoid function, which is generally
    encountered in machine learning course, is intrinsically different from
    the energy-based model. A binary Boltzmann machine, for instance, cannot
    be re-written in the above form. Indeed, for <math|n=2>,

    <\equation*>
      \<sigma\><around*|(|a x<rsub|1>+b|)>\<times\>\<sigma\><around*|(|c
      x<rsub|2>+d|)>=<frac|exp<around*|(|a x<rsub|1>+c
      x<rsub|2>+b+d|)>|exp<around*|(|a x<rsub|1>+c
      x<rsub|2>+b+d|)>+exp<around*|(|a x<rsub|1>+b|)>+exp<around*|(|c
      x<rsub|2>+d|)>+1>,
    </equation*>

    wherein only linear term in the exponentials, whereas
    <math|E<around*|(|x|)>> is a quadratic form.
  </remark>

  <subsubsection|Restricted Boltzmann Machine>

  <\definition>
    [Restricted Binary Boltzmann Machine] Given binary Boltzmann machine
    <math|<around*|(|E,f|)>>, let <math|M=V\<oplus\>H> being any
    decomposition. We say the binary Boltzmann machine is restricted iff the
    <math|W> matrix in <math|E> has the form

    <\equation*>
      W=<matrix|<tformat|<table|<row|<cell|0>|<cell|U>>|<row|<cell|U<rsup|T>>|<cell|0>>>>>,
    </equation*>

    where matrix <math|U> has <math|dim<around*|(|V|)>> rows and
    <math|dim<around*|(|H|)>> columns.
  </definition>

  <\equation*>
    <frac|\<partial\>L|\<partial\>\<theta\>>=-<big|int><rsub|V>\<mathd\>v
    p<rsub|D><around*|(|v|)><big|int><rsub|H>\<mathd\>h
    p<rsub|E><around*|(|h\|v|)> <frac|\<partial\>E|\<partial\>\<theta\>><around*|(|v,h|)>+<big|int><rsub|V\<oplus\>H>\<mathd\>v
    \<mathd\>h p<rsub|E><around*|(|v,h|)>
    <frac|\<partial\>E|\<partial\>\<theta\>><around*|(|x|)>.
  </equation*>

  <math|p<rsub|E><around*|(|h\|v|)><rsub|\<alpha\>>=\<sigma\><around*|(|U<rsub|\<alpha\>\<beta\>>
  v<rsup|\<beta\>>+b<rsup|H><rsub|\<alpha\>>|)>>,
  <math|p<rsub|E><around*|(|v\|h|)><rsub|\<alpha\>>=\<sigma\><around*|(|U<rsup|T><rsub|\<alpha\>\<beta\>>
  h<rsup|\<beta\>>+b<rsup|V><rsub|\<alpha\>>|)>>.

  <\lemma>
    Let <math|p>, <math|q> two distributions of <math|x,y>, and
    <math|p<rsub|X>> <math|q<rsub|X>> the marginal distribution on <math|x>.
    Let <math|E<around*|(|p<rsub|X>|)>\<assign\><around*|{|p<around*|(|x,y|)>\|<big|int>\<mathd\>y
    p<around*|(|x,y|)>=p<rsub|X><around*|(|x|)>|}>> Then we have

    <\equation*>
      min<rsub|p\<in\>E<around*|(|p<rsub|X>|)>,q>D<rsub|KL><around*|(|p\|q|)>=min<rsub|q<rsub|X>>D<rsub|KL><around*|(|p<rsub|X>\|q<rsub|X>|)>,
    </equation*>

    where <math|D<rsub|KL>> is the KL-divergence.
  </lemma>

  <\theorem>
    [EM Algorithm] Given marginal distribution of <math|x>, <math|p<rsub|X>>,
    define loss function <math|L<around*|(|q<rsub|X>|)>\<assign\>D<rsub|KL><around*|(|p<rsub|X>\|q<rsub|X>|)>>.
    Then <math|L<around*|(|q<rsub|X>|)>> can be minimized by the following
    iterating process:

    <\enumerate-numeric>
      <item>
    </enumerate-numeric>
  </theorem>
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-10|<tuple|2.1.3|?>>
    <associate|auto-11|<tuple|2.2|?>>
    <associate|auto-12|<tuple|2.2.1|?>>
    <associate|auto-13|<tuple|3.1|?>>
    <associate|auto-14|<tuple|2.2.2|?>>
    <associate|auto-2|<tuple|1.1|?>>
    <associate|auto-3|<tuple|1.1.1|?>>
    <associate|auto-4|<tuple|1.1.2|?>>
    <associate|auto-5|<tuple|1.2|?>>
    <associate|auto-6|<tuple|2|?>>
    <associate|auto-7|<tuple|2.1|?>>
    <associate|auto-8|<tuple|2.1.1|?>>
    <associate|auto-9|<tuple|2.1.2|?>>
    <associate|footnote-1|<tuple|1|?>>
    <associate|footnr-1|<tuple|1|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <with|par-left|<quote|1tab>|1<space|2spc>Definition
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>
    </associate>
  </collection>
</auxiliary>