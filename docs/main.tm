<TeXmacs|1.99.10>

<style|generic>

<\body>
  <subsection|Definition>

  <\definition>
    [Energy-based Model] Let <math|M> a <math|n>-dimensional manifild,
    <math|E:M\<rightarrow\>\<bbb-R\>>, <math|\<beta\>\<in\>\<bbb-R\><rsub|+>>,
    then a energy-based model <math|<around*|(|M,E,\<beta\>|)>> is a
    probabilistic model on <math|M>. For <math|\<forall\>x\<in\>M>,
    probability of <math|x> is given by

    <\equation*>
      p<around*|(|x|)>=<frac|\<mathe\><rsup|-\<beta\>
      E<around*|(|x|)>>|Z<around*|(|\<beta\>|)>>,
    </equation*>

    where <math|Z<around*|(|\<beta\>|)>=<big|int><rsub|M>\<mathd\>x
    \<mathe\><rsup|-\<beta\> E<around*|(|x<rprime|'>|)>>> summing over all
    possible configurations.
  </definition>

  <\remark>
    The denominator is employed for balancing, since maximizing the
    probability of one configuration will decease the others. This provides a
    restriction on maximizing a priori.
  </remark>

  <\remark>
    [Field version] A field-version of the energy based model is replacing
    <math|E<around*|(|x|)>\<rightarrow\>E<around*|[|\<phi\>|]>>, and

    <\equation*>
      Z<around*|(|\<beta\>|)>=<big|int>D<around*|[|\<phi\>|]>
      \<mathe\><rsup|-\<beta\>E<around*|[|\<phi\>|]>>.
    </equation*>
  </remark>

  <\lemma>
    Let <math|<around*|(|M,E,\<beta\>|)>> an energy-based model. Then the
    stable point of <math|E> is also the stable point of <math|ln p> (thus
    <math|p>), and vice versa.
  </lemma>

  <\proof>
    Consider the field-version. Then,

    <\equation*>
      <frac|\<delta\>|\<delta\>\<phi\>>ln
      p<around*|[|\<phi\>|]>=<frac|\<delta\>|\<delta\>\<phi\>><around*|{|-\<beta\>E<around*|[|\<phi\>|]>-ln
      Z|}>.
    </equation*>

    \;

    Since the 2nd term on rhs is irrelavent with <math|\<phi\>> (has been
    integrated out), thus <math|\<delta\>Z/\<delta\>\<phi\>=0>. Then

    <\equation*>
      <frac|1|\<beta\>><frac|\<delta\>|\<delta\>\<phi\>>ln
      p<around*|[|\<phi\>|]>=-\<beta\><frac|\<delta\>E|\<delta\>\<phi\>><around*|[|\<phi\>|]>.
    </equation*>

    Going back the lattice-version,

    <\equation*>
      <frac|\<partial\>|\<partial\>x<rsup|\<alpha\>>>ln
      p<around*|(|x|)>=-\<beta\><frac|\<partial\>E|\<partial\>x<rsup|\<alpha\>>><around*|(|x|)>.
    </equation*>

    So, if <math|x<rsub|\<star\>>> is a stable point of <math|ln p>, then
    it's also a stable point of <math|E>, and vice versa.
  </proof>

  <\definition>
    [Boltzmann Machine] A energy-based model is a Boltzmann Machine, if
    <math|M> is restricted to <math|\<bbb-R\><rsup|n>> and <math|E> to

    <\equation*>
      E<around*|(|x|)>=-<frac|1|2>K<rsub|\<alpha\>\<beta\>>x<rsup|\<alpha\>>x<rsup|\<beta\>>-J<around*|(|x|)>,
    </equation*>

    where <math|K\<in\>\<bbb-R\><rsup|n\<times\>n>> being symmetric and
    diagnal-vanishing, and <math|b:\<bbb-R\><rsup|n>\<rightarrow\>\<bbb-R\>>.
  </definition>

  <\definition>
    [Binary Boltzmann Machine] A Boltzmann machine
    <math|<around*|(|M,E,\<beta\>|)>> is binary. if the <math|M> is further
    restricted to <math|<with|math-font|Bbb*|B><rsup|n>> and the <math|J> in
    the <math|E> to <math|J<around*|(|x|)>=b<rsub|\<alpha\>>x<rsup|\<alpha\>>>,
    where <math|<with|math-font|Bbb*|B>\<assign\><around*|{|-1,+1|}>> and
    <math|b\<in\>\<bbb-R\><rsup|n>>.
  </definition>

  <\remark>
    The probabilistic model where

    <\equation*>
      p<around*|(|x|)>=<big|prod><rsub|\<alpha\>=1><rsup|n>Ber<around*|(|p<rsub|\<alpha\>><around*|(|x|)>|)>,
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

  \;
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|?>>
  </collection>
</references>