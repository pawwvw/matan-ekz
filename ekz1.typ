#import "@preview/great-theorems:0.1.2": *
#import "@preview/rich-counters:0.2.1": *

#set page(
  margin: (x: 1.5cm, y: 2cm),
  numbering: "1",
)

#set text(
  font: "New Computer Modern",
  size: 14pt,
  lang: "ru",
)


#set par(
  justify: true,
  leading: 0.65em,
  first-line-indent: 1.5em,
)

#show: great-theorems-init
#show link: text.with(fill: rgb("#0074d9"))


#let theorem = mathblock(
  blocktitle: "Теорема",
  inset: 8pt,
  fill: rgb("#f0f7ff"),
  stroke: rgb("#0074d9") + 0.5pt,
  radius: 3pt,
  titlix: title => text(weight: "bold")[ (#title)],
)
#let lemma = mathblock(
  blocktitle: "Лемма",
  inset: 8pt,
  fill: rgb("#f5fff0"),
  stroke: rgb("#2ecc40") + 0.5pt,
  radius: 3pt,
  titlix: title => text(weight: "bold")[ (#title)],
)


#let definition = mathblock(
  blocktitle: "Определение",
  inset: 8pt,
  fill: rgb("#fff9f0"),
  stroke: rgb("#ff851b") + 0.5pt,
  radius: 3pt,
  titlix: title => text(weight: "bold")[ (#title)],
)

#let proof = proofblock(
  blocktitle: "Доказательство",
  prefix: [_Доказательство._],
  prefix_with_of: ref => [_Доказательство #ref._],
  suffix: [#h(1fr) $square$],
)


= Содержание

#outline(
  title: none,
  indent: auto,
)

#pagebreak()


= Теоремы. Определения. Доказательства
#line(length: 100%)

== Множества. Операции. (#link("https://edu.hse.ru/mod/lesson/view.php?id=1730016&pageid=8400", "Лекция"))

#definition[
  Набор неких элементов.
]

== Натуральные числа. (#link("https://edu.hse.ru/mod/lesson/view.php?id=1730016&pageid=8400", "Лекция"))

#definition[
  Числа, используемые для счета.
]

=== Теоремы о натуральных числах (#link("https://edu.hse.ru/mod/lesson/view.php?id=1730016&pageid=8401", "Лекция"))

#theorem(title: "Основная теорема арифметики")[
  У любого натурального числа (кроме единицы) найдется два набора различных простых чисел и их натуральных степеней, которые составляют его, при том единственным образом.
] <thm:arif>

#theorem(title: "Теорема Евклида")[
  Простых чисел бесконечно много.
] <thm:evklid>

#proof(of: <thm:evklid>)[
  - Пусть простых чисел конечное число, $N$ штук.
  - Рассмотрим число $A = 1 + display(product_(1<=i<=N))p_i$
  - Тогда число A не делится ни на одно $p_i$ (в результате для любого рассматриваемого простого будет 1)
  - Значит A имеет простой делитель, который не входит в изначальное множество.
  - Таким образом найдено N + 1 простое число
]

== Комбинаторика (#link("https://edu.hse.ru/mod/lesson/view.php?id=1730139&pageid=8404", "Лекция"))

== Бином Ньютона (#link("https://edu.hse.ru/mod/lesson/view.php?id=1730139&pageid=8405", "Лекция"))
#definition[
  $ (a+b)^n = display(sum_(k=0)^n C_n^k dot a^k dot b^(n-k)) $
] <def:binom>

#proof(of: <def:binom>)[
  - База: если $n = 1$, то слева $(a+b)^1 = a + b$, а справа $display(sum_(k=0)^1 C_1^k dot a^k dot b^(1-k)) = 1 dot a^0 dot b + 1 dot a dot b^0 = a + b$ - формула верна.
  ...
]

== Целые и рациональные числа (#link("https://edu.hse.ru/mod/lesson/view.php?id=1730139&pageid=8406", "Лекция"))

=== Целые
#definition[
  $ZZ = {0, plus.minus 1, plus.minus 2, ...}$ -- натуральные, симметричные им отрицательные и 0.
]

=== Рациональные
#definition[
  $QQ = {m/n: m in ZZ, n in NN}$
]

#theorem[
  Множество рациональных чисел полно, т.е. $forall a, b in QQ, a < b space c in QQ: a < c < b$
] <thm:rac>

#proof(of: <thm:rac>)[
  - Обозначим $a = p/q, b = m/n$, что допустимо, раз $a, b in QQ$
  - Из $a < b$ следует, что $p/q < m/n$ или $p n < m q$
  - Рассмотрим $c = (a+b)/2 = (p n + m q)/(2 q n):a = p/q = (p 2 n)/(q 2 n) = (p n + p n)/(2 q n) < (p n + m q)/(2 q n) = c = (p n + m q)/(2 q n) < (m q + m q)/(2 q n) = m/n = b$
]

== Иррациональные и действительные числа (#link("https://edu.hse.ru/mod/lesson/view.php?id=1730139", "Лекция"))

=== Иррациональные

#definition[
  $II$
]

#proof[
  \
  Докажем иррациональность $sqrt(2)$ от противного
  - Допустим $sqrt(2) in QQ$, тогда $exists m in ZZ, n in NN: sqrt(2) = m/n$ -- несократимая дробь
  - Раз $2n^2 = m^2$, то m - четное: $m = 2k$ (это следует из основной теоремы арифметики @thm:arif)
  - В таком случае $2n^2 = 4k^2, n^2 = 2m^2$ и n - четное число. Противоречие (несократимость)
]

=== Действительные (вещественные)

#definition[
  Совокупность всех рациональных и иррациональных чисел: $R = QQ union II$
]

== Отображения (#link("https://edu.hse.ru/mod/lesson/view.php?id=1730784&pageid=8408&startlastseen=no", "Лекция"))

#definition[
  Соответствие (правило) между двумя множествами, при котором каждому элементу первого множества (прообраз) соотвествует не более одного элемента второго (образ).
]

== Аксиоматика $RR$ (#link("https://edu.hse.ru/mod/lesson/view.php?id=1730784&pageid=8409", "Лекция"))

=== Расширенное множество действительных чисел
#definition[
  $overline(RR) = R union {+oo} union {-oo}$
]

== Модуль (#link("https://edu.hse.ru/mod/lesson/view.php?id=1730784&pageid=8410", "Лекция"))

=== Модуль
#definition[
  Неотрицательное число, которое отражает расстояние от числа до начала координат числовой прямой.

  $
    |x| = cases(
      x comma x >= 0,
      -x comma x < 0.
    )
  $
]
=== Функция знака

#definition[
  $
    op("sign")(x) = cases(
      1 comma x > 0,
      0 comma x = 0,
      -1 comma x < 0
    )
  $
]

== Промежутки числовой прямой (#link("https://edu.hse.ru/mod/lesson/view.php?id=1730784&pageid=8411", "Лекция"))
=== Отрезок
#definition[
  $[a; b] = {x in RR: a <= x <= b}$
]
=== Интервал
#definition[
  $(a; b) = {x in RR: a < x < b}$
]
=== Полуинтервал
#definition[
  $(a; b] = {x in RR: a < x <= b}$ и $[a, b) = {x in RR: a <= x < b}$
]
=== Положительная и отрицательная полуоси
#definition[
  - $RR^+ = {x in RR: x > 0}$
  - $RR^- = {x in RR: x < 0}$
]

=== Окрестность
#definition[
  Любой интервал $(b; c)$, содержащий точку $a: b <= a <= c$ Обозначают $display(O(a))$
]

=== $epsilon$-окрестность
#definition[
  Интервал с размером $2 epsilon$ с центром в точке $a$. Обозначают $display(O_epsilon(a)) = (a - epsilon; a + epsilon = {x in RR: |x - a| < epsilon})$
]
=== Проколотая $epsilon$-окрестность
#definition[
  Окрестность точки $a$ без самой точки $a$. Обозначают $display(dot(O)_epsilon(a) = (a - epsilon; a) union (a; a + epsilon) = {x in RR: 0 < |x - a| < epsilon})$
]

=== Правая и левая $epsilon$-полуокрестности
#definition[
  - $display(O_epsilon^+(a) = [a; a + epsilon) = {x in RR: 0 <= x - a < epsilon})$
  - $display(O_epsilon^-(a) = (a - epsilon; a] = {x in RR: 0 <= a - x < epsilon})$
]

=== Правая и левая проколотые $epsilon$-полуокрестности
#definition[
  - $display(dot(O)_epsilon^+(a) = (a; a + epsilon) = {x in RR: 0 < x - a < epsilon})$
  - $display(dot(O)_epsilon^-(a) = (a - epsilon; a) = {x in RR: 0 < a - x < epsilon})$
]

=== $epsilon$-окрестности бесконечностей

#definition[
  - $display(O_epsilon (+oo) = [1/epsilon; +oo) = {x in RR: x >= 1/epsilon})$
  - $display(O_epsilon (-oo) = (-oo; -1/epsilon] = {x in RR: x <= -1/epsilon})$
]

== Ограниченность (#link("https://edu.hse.ru/mod/lesson/view.php?id=1730784&pageid=8412", "Лекция"))
=== Ограниченное снизу

#definition[$exists m in RR: forall x in X space x >= m$. Такое число m называют *нижней гранью* или *минорантой*.]

=== Ограниченное сверху
#definition[
  $exists M in RR: forall x in XX space x <= M$. Такое число M называют *верхней гранью* или *мажорантой*.
]

=== Критерий ограниченности

#theorem[
  $
    {X - "ограничено"} <=> exists c in R^+: forall x in X space |x| < c
  $
] <thm:ogr>


#proof(of: <thm:ogr>)[
  - _Необходимость_: рассмотрим ограниченное множество X, тогда оно ограничено снизу и сверху, т.е. из определений: $exists m, M in RR: forall x in XX space m <= x <= M$. Тогда положим $c = max{|m|; |M|}: forall x in XX - c = -max{|m|; |M|} <= x <= M <= max{|m|; |M|} = c$.
  - _Достаточность_: достаточно положить, что $m = -c, M = c$
]

== Точные грани (#link("https://edu.hse.ru/mod/lesson/view.php?id=1749242&pageid=8507&startlastseen=no", "Лекция"))

=== Инфимум (наибольшая из минорант)
#definition[
  - $forall x in X space m <= x$
  - $forall epsilon > 0 space exists x` in X space m + epsilon > x`$
]

=== Супремум (наименьшая из мажорант)
#definition[
  - $forall x in X space x <= M$
  - $forall epsilon > 0 space x` in X space x` > M - epsilon$
]

=== Теорема о единственности точных граней

#theorem(title: "Теорема о единственности точных граней")[
  Числовое множетсво не может иметь более одной точной верхней (нижней) грани.
] <thm:edin>

#proof(of: <thm:edin>)[
  \
  *Для супремума:*
  - Рассмотрим $X subset.eq RR, x != emptyset$
  - Допустим $exists b < b`: sup X = b, sup X = b`$. Тогда $forall x in X space x <= b, x <= b`$, но $forall epsilon > 0 space exists x, x` in X: x > b - epsilon, x` > b` - epsilon$
  - Рассмотрим $epsilon = b` - b$. Раз $exists x in X: x > b - epsilon = b`$, противоречие

  \
  *Для инфимума:*
  - TODO

]

=== Теорема о существовании точных граней
#theorem(title: "Теорема о существовании точных граней")[
  Всякое непустое ограниченно сверху (снизу) числовое множество имеет точнуюю верхнюю (нижнюю) грань.
] <thm:existstg>

#proof(of: <thm:existstg>)[
  \
  *Для супремума:*
  - Рассмотрим $X subset.eq RR, X != emptyset$
  - Рассмотрим множество его верхних граней $V: forall v in V, forall x in X space x <= v$
  - В силу аксиомы непрерывности, $exists c in RR: forall x in X, forall v in V space x <= c <= v$. Осталось доказать, что $sup X = c$
  - По определению супремума требуется 2 условия, первое уже выполнено ($forall x in X space x <= c$). Теперь убедимся, что $forall epsilon > 0 space exists x` in X: x` > c - epsilon = c`$. Утвердим, что $c`$ - не верхняя грань, т.е. $c` in.not V$, т.к $c` = c - epsilon < c$, но ранее утвердили, что $forall v in V c <= v$

  \
  *Для инфимума:*
  - TODO
]

== Теорема Кантора (#link("https://edu.hse.ru/mod/lesson/view.php?id=1749242&pageid=8508", "Лекция"))

=== Система вложенных отрезков
#definition()[
  Набор отрезков, каждый из которых содержится внутри предыдущего.
  $
    {[a_n;b_n]}_(n=1)^+oo = {[a_1; b_1], [a_2, b_2], ...: forall n in NN [a_(n+1); b_(n+1)] subset.eq [a_n; b_n]}
  $
]

==== Теорема Кантора о системе вложенных отрезков
#theorem(title: "Теорема Кантора о системе вложенных отрезков")[
  В любой системе вложенных отрезков найдется точка, принадлежащая всем отрезкам системы.
] <thm:kantor>

#proof(of: <thm:kantor>)[
  - Рассмотрим множества левых и правых концов системы: Пусть $A = {a_1, a_2, ...}, B = {b_1, b_2, ...}$
  - $A, B != emptyset$ и $forall n, m in NN space a_n <= a_(n+m) < b_(n+m) <= b_m$. Тогда, в силу аксиомы непрерывности, $exists epsilon in RR: a_n <= epsilon <= b_m$
  - В силу произвольного выбора n и m, положим n = m, тогда $epsilon in [a_n; b_n] space forall n in NN$
]

=== Стягивающаяся система вложенных отрезков
#definition[
  Если $forall epsilon > 0 space exists N in NN: b_N - a_N < epsilon$
]

==== Теорема Кантора о системе стягивающихся отрезков
#theorem(title: "Теорема Кантора о системе стягивающихся отрезков")[
  Стягивающаяся система вложенных отрезков имеет ровно одну точку $epsilon$, принадлежащую всем отрезкам, причем $xi = display(sup_(forall n in NN){a_n} = inf_(forall n in NN){b_n})$
] <thm:kantor2>

#proof(of: <thm:kantor2>)[
  \ *Доказательство единственности:*
  - Существование точки доказано ранее, покажем единственность
  - Допустим обратное: пусть $exists xi_1 != xi_2: xi_1, xi_2 in [a_n; b_n] forall n in NN$. Тогда $0 < |xi_1 - xi_2| <= b_n - a_n$
  - Из определения $forall epsilon > 0 space exists N in NN: forall n >= N space b_n - a_n < epsilon$, то $|xi_1 - xi_2| <= b_n - a_n < epsilon$
  - В силу произвольного выбора $epsilon$, рассмотрим $epsilon = (|xi_1 - xi_2|)/2$, тогда $|xi_1 - xi_2| < (|xi_1 - xi_2|) / 2$

  \ *Доказательство $xi = display(sup_(forall n in NN){a_n} = inf_(forall n in NN){b_n})$:*
  - Из определения вложенных отрезков $forall n in NN space a_n <= b_n$
  - По теореме Кантора всегда найдется точка $xi: forall n in NN a_n <= xi <= b_n$
  - Значит, $xi$ мажорирует множество ${a_n}$ и минорирует множество ${b_n}: forall n in NN space a_n <= display(sup_(forall n in NN){a_n}) <= xi <= display(inf_(forall n in NN){b_n} <= b_n)$
  - Допустим, $exists eta = display(sup_(forall n in NN){a_n} != mu = inf_(forall n in NN){b_n})$
  - Тогда $forall n in NN space a_n <= eta <= b_n$ и $a_n <= mu <= b_n$ - нашлось две точки, принадлежащих всем отрезкам системы
]

== Числовая последовательность (#link("https://edu.hse.ru/mod/lesson/view.php?id=1749242&pageid=8509", "Лекция"))

#definition[
  Функция $a_n = a(n): NN -> RR$, обозначают ${a_n}_(n=1)^+oo$ или просто ${a_n}$.
]

== Монотонность (#link("https://edu.hse.ru/mod/lesson/view.php?id=1749242&pageid=8510", "Лекция"))

== Сходимость (#link("https://edu.hse.ru/mod/lesson/view.php?id=1757818&pageid=8513&startlastseen=no", "Лекция"))

#definition[
  Число $A in RR$ назовем *конечным пределом* последовательности ${a_n}$, если $forall epsilon > 0 space exists N = N_epsilon in NN: forall n >= N space |a_n - A| < epsilon$. Обозначают $display(lim_(n->+oo)(a_n) = A)$ или $display(a_n ->_(n->+oo) A)$

  \
  Говорят, что такая последовательность сходится к A или просто называют ее *сходящейся*. A - обязательно число.

  \
  На языке окрестностей: $exists A in RR: forall epsilon > 0 space exists N = N_epsilon in NN: forall n >= N space a_n in O_epsilon (A)$
]

== Необходимое условие сходимости (#link("https://edu.hse.ru/mod/lesson/view.php?id=1757818&pageid=8514", "Лекция"))

#theorem(title: "Необходимое условие сходимости")[
  Сходящаяся последовательность ограничена: ${exists A in RR: display(lim_(n->+oo)(a_n) = A)} => {exists C in RR^+: forall n in NN space |a_n| <= C}$

  \
  Обратное неверно
] <thm:schod>

#proof(of: <thm:schod>)[
  - Из определения $forall epsilon > 0 space exists N in NN: forall n >= N space |a_n - A| < epsilon$
  - Значит для $epsilon = 1 space exists N_1 in NN: forall n >= N_1 space |a_n - A| < 1$
  - Рассмотрим $|a_n| = |a_n - A + A| <= |a_n - A| + |A| < 1 + |A| -> N_1 |a_n| < 1 + |A|$
  - Пусть $C = max{|a_1|, |a_2|, ..., |a_(N_1 - 1)|, 1 + |A|}$, тогда $forall n in NN space |a_n| <= C$
]

#lemma(title: "О необходимом условии сходимости")[
  $
    {exists A in RR: display(lim_(n->+oo)(a_n)) = A} => {display(lim_(n->+oo)(a_n - a_(n+1))) = 0}
  $
] <lem:schod>

#proof(of: <lem:schod>)[
  - Из определения $forall epsilon > 0 space exists N in NN: forall n >= N space |a_n - A| < epsilon$
  - Рассмотрим $|a_n - a_(n+1)| = |a_n - A + A - a_(n+1)| display(<=^("н-во" triangle)) |a_n - A| + |a_(n+1) - A| < 2 epsilon$
  - Тогда $forall epsilon` > 0 space exists N` = N(epsilon`/2) in NN: forall n >= N` |a_n - a_(n+1) - 0| < epsilon`$
]

== Единственность предела (#link("https://edu.hse.ru/mod/lesson/view.php?id=1757818&pageid=8515", "Лекция"))

#theorem(title: "Теорема о единственности предела")[
  Последовательность не может иметь более одного предела.
] <thm:edpred>

#proof(of: <thm:edpred>)[
  - Пусть $exists A_1 < A_2 in RR: A_1 = display(lim_(n->+oo)a_n), A_2 = display(lim_(n->+oo)a_n)$
  - Выберем $epsilon$ так, чтобы окрестности не пересекались, например, $epsilon = (A_2 - A_1)/3$, то $O_epsilon A_1 inter O_epsilon A_2 = emptyset$
  - Из определения $exists N_1 in NN: forall n >= N_1 space |a_n - A_1| < epsilon$ и $exists N_2 in NN: forall n >= N_2 space |a_n - A_2| < epsilon$
  - Рассмотрим $N_m = max{N_1, N_2}$, тогда одновременно $forall n >= N_m$ одновременно $a_n in O_epsilon A_1$ и $a_n in O_epsilon A_2$, но по построению они не пересекаются.
]

== Теоремы об арифметике в пределах (#link("https://edu.hse.ru/mod/lesson/view.php?id=1757818&pageid=8516", "Лекция"))

#theorem(title: "Теорема о линейных комбинациях в пределах")[
  \ Пусть ${a_n}, {b_n}: display(lim_(n->+oo) a_n = A),display(lim_(n->+oo) b_n = B); A, B in RR$, тогда
  1. $exists display(lim_(n->+oo) (c dot a_n)), forall c in RR$ и он равен $c dot A$
  2. $exists display(lim_(n->+oo) (a_n + b_n))$ и он равен $A + B$
  3. $exists display(lim_(n->+oo) (a_n dot b_n))$ и он равен $A dot B$
  4. если $forall n in NN space b_n != 0$ и $B != 0$, то $exists display(lim_(n->+oo) (a_n/b_n))$ и он равен $A/B$
] <thm:linpred>

#proof(of: <thm:linpred>)[
  \
  1. $exists display(lim_(n->+oo) (c dot a_n)) = c dot A, forall c in RR$
    - Требуется $forall epsilon > 0$ назвать $N in NN: forall n >= N space |(c dot a_n) - c dot A| < epsilon$
    - $forall c != 0 display(lim_(n->+oo) a_n) = A => forall epsilon_1 = epsilon/abs(c) > 0 space exists N_1 in NN: forall n >= N_1 space |a_n - A| < epsilon_1$
    - $forall epsilon > 0 space exists N = N_1 in NN: forall n >= N space abs((c dot a_n) - c dot A) = abs(c dot (a_n - A)) = abs(c) dot abs(a_n - A) < abs(c) dot epsilon_1$, чтд
]







#pagebreak()

= Вопросы
#line(length: 100%)


