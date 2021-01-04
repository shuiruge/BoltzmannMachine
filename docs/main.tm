<TeXmacs|1.99.10>

<style|generic>

<\body>
  <section|Notations>

  <\itemize>
    <item>Let <math|x=<around*|{|x<rsub|1>,\<ldots\>,x<rsub|n>|}>>, then
    <math|x\\x<rsub|i>\<assign\><around*|{|x<rsub|j>\|j=1,\<ldots\>,i-1,i+1,\<ldots\>,n|}>>.

    <item><math|p,q> for probabilities.

    <item><math|X,Y,Z,\<ldots\>> for random variables.

    <item><math|x,y,z,\<ldots\>> for ordinary variables.
  </itemize>

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

  <\theorem>
    [Entropy] Given energy-based model <math|<around*|(|M,E|)>>, entropy

    <\equation*>
      H=<big|int><rsub|M>\<mathd\>x p<rsub|E><around*|(|x|)>
      E<around*|(|x|)>-ln<around*|[|<big|int><rsub|M>\<mathd\>x<rprime|'>
      \<mathe\><rsup|- E<around*|(|x<rprime|'>|)>>|]>.
    </equation*>
  </theorem>

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

  <subsubsection|Relation to Maximizing Entropy
  Principle<reference|Information Theory and Statitical Mechanics>>

  <\theorem>
    [Maximizing Entropy Principle] Given a measure space <math|M> and a set
    of observable <math|<around*|{|f<rsub|i>:M\<rightarrow\>\<bbb-R\>\|i=1,\<ldots\>,n|}>>.
    For <math|D\<assign\><around*|{|x<rsub|1>,\<ldots\>,x<rsub|N>|}>> a
    dataset. For any probability density function <math|p> on <math|M>, let
    <math|H<around*|(|p|)>> its entropy. We have, if

    <\equation*>
      p<rsub|\<star\>>\<assign\>argmax<rsub|p>H<around*|(|p|)>
    </equation*>

    with constrains <math|\<bbb-E\><rsub|x\<sim\>p<rsub|\<star\>><around*|(|x|)>><around*|[|f<rsub|i><around*|(|x|)>|]>=\<bbb-E\><rsub|x\<sim\>D><around*|[|f<rsub|i><around*|(|x|)>|]>>
    for all <math|i=1,\<ldots\>,n>, then <math|p<rsub|\<star\>><around*|(|x|)>>
    must have the form

    <\equation*>
      p<rsub|\<star\>><around*|(|x|)>=<frac|\<mathe\><rsup|-E<around*|(|x|)>>|<big|int><rsub|M>\<mathd\>x<rprime|'>
      \<mathe\><rsup|-E<around*|(|x<rprime|'>|)>>>,
    </equation*>

    where <math|E<around*|(|x|)>\<assign\>-<big|sum><rsub|i>\<lambda\><rsub|i>
    f<rsub|i><around*|(|x|)>>.
  </theorem>

  <\proof>
    Denote <math|<wide|f|\<bar\>><rsub|i>\<assign\>\<bbb-E\><rsub|x\<sim\>D><around*|[|f<rsub|i><around*|(|x|)>|]>>,
    then the Lagrangian becomes

    <\equation*>
      L<around*|[|p|]>=-<big|int><rsub|M>\<mathd\>x p<around*|(|x|)> ln
      p<around*|(|x|)>+<big|sum><rsub|i>\<lambda\><rsub|i><around*|(|<big|int><rsub|M>\<mathd\>x
      p<around*|(|x|)> f<rsub|i><around*|(|x|)>-<wide|f|\<bar\>><rsub|i>|)>+\<mu\><around*|(|1-<big|int><rsub|M>\<mathd\>x
      p<around*|(|x|)>|)>,
    </equation*>

    where <math|<around*|{|\<lambda\><rsub|i>|}>> and <math|\<mu\>> are
    Lagrangian multipliers. We have, at stable point <math|p<rsub|\<star\>>>,
    for <math|\<forall\>x\<in\>M>,

    <\equation*>
      0=<frac|\<delta\>L|\<delta\>p><around*|[|p<rsub|\<star\>>|]><around*|(|x|)>=-ln
      p<rsub|\<star\>><around*|(|x|)>+<big|sum><rsub|i>\<lambda\><rsub|i>
      f<rsub|i><around*|(|x|)>-<around*|(|\<mu\>+1|)>,
    </equation*>

    implying

    <\equation*>
      p<rsub|\<star\>><around*|(|x|)>=<frac|\<mathe\><rsup|-E<around*|(|x|)>>|<big|int><rsub|M>\<mathd\>x<rprime|'>
      \<mathe\><rsup|-E<around*|(|x<rprime|'>|)>>>,
    </equation*>

    where <math|E<around*|(|x|)>\<assign\>-<big|sum><rsub|i>\<lambda\><rsub|i>
    f<rsub|i><around*|(|x|)>>.
  </proof>

  <subsection|Boltzmann Machine>

  <\definition>
    [Binary Boltzmann Machine] An <math|n>-dimensional binary Boltzmann
    machine <math|<around*|(|W,b|)>> is an energy-based model with
    <math|M=<around*|{|0,1|}><rsup|n>> and
    <math|E<around*|(|x|)>=-<frac|1|2>W<rsub|\<alpha\>\<beta\>>x<rsup|\<alpha\>>x<rsup|\<beta\>>-b<rsub|\<alpha\>>
    x<rsup|\<alpha\>>>, where <math|W\<in\>\<bbb-R\><rsup|n\<times\>n>> being
    symmetric and diagnal-vanishing and <math|b\<in\>\<bbb-R\><rsup|n>>.
  </definition>

  <\theorem>
    [Activity Rule of Binary Boltzmann Machine] Let <math|<around*|(|W,b|)>>
    an <math|n>-dimensional binary Boltzmann machine, then given
    <math|\<forall\>\<alpha\>\<in\><around*|{|1,\<ldots\>,n|}>>

    <\equation*>
      p<around*|(|x<rsup|\<alpha\>>\|x\\x<rsup|\<alpha\>>|)>=\<sigma\><around*|(|W<rsup|\<alpha\>\<beta\>>x<rsub|\<beta\>>+b<rsup|\<alpha\>>|)>,
    </equation*>

    where <math|\<sigma\><around*|(|x|)>\<assign\>1/<around*|(|1+\<mathe\><rsup|-x>|)>>.
  </theorem>

  <\proof>
    Directly,

    <\align>
      <tformat|<table|<row|<cell|<frac|p<around*|(|x<rsup|\<alpha\>>=1\|x\\x<rsup|\<alpha\>>|)>|p<around*|(|x<rsup|\<alpha\>>=0\|x\\x<rsup|\<alpha\>>|)>>>|<cell|=<frac|p<around*|(|x<rsup|\<alpha\>>=1,x\\x<rsup|\<alpha\>>|)>|p<around*|(|x<rsup|\<alpha\>>=0,x\\x<rsup|\<alpha\>>|)>>>>|<row|<cell|>|<cell|=<frac|p<around*|(|x<rsup|\<alpha\>>=1,x\\x<rsup|\<alpha\>>|)>|p<around*|(|x<rsup|\<alpha\>>=0,x\\x<rsup|\<alpha\>>|)>>>>|<row|<cell|>|<cell|=exp<around*|(|-E<around*|(|x<rsup|\<alpha\>>=1,x\\x<rsup|\<alpha\>>|)>+E<around*|{|x<rsup|\<alpha\>>=0,x\\x<rsup|\<alpha\>>|}>|)>>>|<row|<cell|>|<cell|=exp<around*|(|W<rsup|\<alpha\>\<beta\>>x<rsub|\<beta\>>+b<rsup|\<alpha\>>|)>.>>>>
    </align>

    Thus

    <\align>
      <tformat|<table|<row|<cell|p<around*|(|x<rsup|\<alpha\>>=1\|x\\x<rsup|\<alpha\>>|)>>|<cell|=<frac|p<around*|(|x<rsup|\<alpha\>>=1\|x\\x<rsup|\<alpha\>>|)>|p<around*|(|x<rsup|\<alpha\>>=1\|x\\x<rsup|\<alpha\>>|)>+p<around*|(|x<rsup|\<alpha\>>=0\|x\\x<rsup|\<alpha\>>|)>>>>|<row|<cell|>|<cell|=<frac|1|1+<frac|p<around*|(|x<rsup|\<alpha\>>=0\|x\\x<rsup|\<alpha\>>|)>|p<around*|(|x<rsup|\<alpha\>>=1\|x\\x<rsup|\<alpha\>>|)>>>>>|<row|<cell|>|<cell|=<frac|1|1+exp<around*|(|W<rsup|\<alpha\>\<beta\>>x<rsub|\<beta\>>+b<rsup|\<alpha\>>|)>>.>>>>
    </align>
  </proof>

  <\definition>
    [Gaussian Boltzmann Machine] An <math|n>-dimensional Gaussian Boltzmann
    machine <math|<around*|(|W,b|)>> is an energy-based model with
    <math|M=\<bbb-R\><rsup|n>> and

    <\equation*>
      E<around*|(|x|)>=-<frac|1|2> W<rsub|\<alpha\>\<beta\>>x<rsup|\<alpha\>>x<rsup|\<beta\>>+<frac|1|2>
      <around*|(|x<rsup|\<alpha\>>-b<rsup|\<alpha\>>|)>
      <around*|(|x<rsub|\<alpha\>>-b<rsub|\<alpha\>>|)>,
    </equation*>

    where <math|W\<in\>\<bbb-R\><rsup|n\<times\>n>> being symmetric and
    diagnal-vanishing and <math|b\<in\>\<bbb-R\><rsup|n>>.
  </definition>

  <\align>
    <tformat|<table|<row|<cell|<big|int><rsub|\<bbb-R\>>\<mathd\>x<rsup|<wide|\<alpha\>|^>>\<mathe\><rsup|-E<around*|(|x|)>>>|<cell|=exp<around*|(|-<frac|1|2><big|sum><rsub|\<alpha\>,\<beta\>\<neq\><wide|\<alpha\>|^>>W<rsub|\<alpha\>\<beta\>>x<rsup|\<alpha\>>x<rsup|\<beta\>>+<frac|1|2><big|sum><rsub|\<alpha\>\<neq\><wide|\<alpha\>|^>>
    <around*|(|x<rsup|\<alpha\>>-b<rsup|\<alpha\>>|)>
    <around*|(|x<rsub|\<alpha\>>-b<rsub|\<alpha\>>|)>|)>>>|<row|<cell|>|<cell|\<times\><big|int><rsub|\<bbb-R\>>\<mathd\>x<rsup|<wide|\<alpha\>|^>>exp<around*|(|-<big|sum><rsub|\<beta\>\<neq\><wide|\<alpha\>|^>>W<rsub|<wide|\<alpha\>|^>\<beta\>>x<rsup|<wide|\<alpha\>|^>>x<rsup|\<beta\>>+<frac|1|2>
    <around*|(|x<rsup|<wide|\<alpha\>|^>>-b<rsup|<wide|\<alpha\>|^>>|)><rsup|2>|)>,>>>>
  </align>

  where we explicitly write down the summation for clearness. The 2nd term on
  rhs is a Gaussian integral

  <\equation*>
    <big|int><rsub|\<bbb-R\>>\<mathd\>x<rsup|<wide|\<alpha\>|^>>exp<around*|(|-<big|sum><rsub|\<beta\>\<neq\><wide|\<alpha\>|^>>W<rsub|<wide|\<alpha\>|^>\<beta\>>x<rsup|<wide|\<alpha\>|^>>x<rsup|\<beta\>>+<frac|1|2>
    <around*|(|x<rsup|<wide|\<alpha\>|^>>-b<rsup|<wide|\<alpha\>|^>>|)><rsup|2>|)>=<sqrt|2
    \<pi\>> \<mathe\><rsup|-b<rsub|<wide|\<alpha\>|^>><rsup|2>/2>
    exp<around*|(|<frac|1|2><around*|(|<big|sum><rsub|\<beta\>\<neq\><wide|\<alpha\>|^>>W<rsub|<wide|\<alpha\>|^>\<beta\>>x<rsup|\<beta\>><rsub|>+b<rsub|<wide|\<alpha\>|^>>|)><rsup|2>|)>.
  </equation*>

  <\remark>
    [TODO: Re-write this] The probabilistic model where

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

  <section|References>

  <\enumerate-numeric>
    <item>Information Theory and Statitical Mechanics, Jaynes.
  </enumerate-numeric>
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-10|<tuple|3.1.2|?>>
    <associate|auto-11|<tuple|3.1.3|?>>
    <associate|auto-12|<tuple|3.1.4|?>>
    <associate|auto-13|<tuple|3.2|?>>
    <associate|auto-14|<tuple|3.2.1|?>>
    <associate|auto-15|<tuple|4|?>>
    <associate|auto-2|<tuple|2|?>>
    <associate|auto-3|<tuple|2.1|?>>
    <associate|auto-4|<tuple|2.1.1|?>>
    <associate|auto-5|<tuple|2.1.2|?>>
    <associate|auto-6|<tuple|2.2|?>>
    <associate|auto-7|<tuple|3|?>>
    <associate|auto-8|<tuple|3.1|?>>
    <associate|auto-9|<tuple|3.1.1|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Notations>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Prelimiary>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Markov Chain
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|2.1.1<space|2spc>Definitions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|2tab>|2.1.2<space|2spc>Detailed Balance
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Gibbs Sampling
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Review>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Energy Based Model
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|2tab>|3.1.1<space|2spc>Activity Rule
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|2tab>|3.1.2<space|2spc>Learning Rule
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|2tab>|3.1.3<space|2spc>Effective Energy
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|2tab>|3.1.4<space|2spc>Relation to Maximizing
      Entropy Principle <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Boltzmann Machine
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <with|par-left|<quote|2tab>|3.2.1<space|2spc>Restricted Boltzmann
      Machine <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>
    </associate>
  </collection>
</auxiliary>