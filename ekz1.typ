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

== Точные грани
//TODO

#pagebreak()

= Вопросы
#line(length: 100%)


