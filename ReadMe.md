Compiler selber bauen mit Bison und Flex
========================================

In diesem Repository findet ihr:

- [Die Präsentation](Slides/Compiler%20selber%20bauen.pptx) als .pptx-Datei
- [Beispielcode für den Scanner](Scanner)
- [Beispielcode für den Parser](Parser) (mit modifiziertem Scanner)
- Weiterführende Links zu Dokus und Beispielen:

## Dokumentation

- [Bison-Benutzerhandbuch](https://www.gnu.org/software/bison/manual/)
- [Flex-Benutzerhandbuch](https://westes.github.io/flex/manual/)

## Tutorials mit Beispielen

- [MIT-Tutorial zu Flex](http://web.mit.edu/gnu/doc/html/flex_1.html)
- [Flex-Handbuch der Princeton University](https://www.cs.princeton.edu/~appel/modern/c/software/flex/flex.html)
- [Tutorial in Präsentations-Form der University of Delaware](https://www.capsl.udel.edu/courses/cpeg421/2012/slides/Tutorial-Flex_Bison.pdf) (PDF)
- [Tutorial für Bison mit C++](http://www.mario-konrad.ch/blog/programming/flexbisonpp.html)

## Praktische Beispiele

- [projectM Expression Evaluation Library](https://github.com/projectM-visualizer/projectm-eval):
  - [Scanner](https://github.com/projectM-visualizer/projectm-eval/blob/4fe4690e07284418d93a139708e8a89bf28720f1/projectm-eval/Scanner.l)
  - [Parser](https://github.com/projectM-visualizer/projectm-eval/blob/4fe4690e07284418d93a139708e8a89bf28720f1/projectm-eval/Compiler.y)
- [Samba Spotlight Service](https://gitlab.com/samba-team/samba/-/tree/v4-18-stable/source3/rpc_server/mdssvc?ref_type=heads)