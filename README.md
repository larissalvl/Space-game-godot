# jogoLari

Projeto de aprendizado da Godot Engine — desenvolvido enquanto estudo a engine (nodes, cenas, sinais, física) aplicando minha base de programação em Python/JS/Java ao GDScript.

## Tecnologia

- **Engine:** Godot 4.7
- **Renderer:** GL Compatibility
- **Linguagem:** GDScript

## Controles

| Ação | Teclas |
|---|---|
| Mover para frente | W / seta para cima |
| Mover para trás | S / seta para baixo |
| Mover para esquerda | A / seta para esquerda |
| Mover para direita | D / seta para direita |

## Estrutura atual

- `nave.tscn` / `nave.gd` — cena e script da nave (movimento)
- `fase.tscn` / `fundo.gd` — cena da fase com fundo
- `estrela.png`, `nave_frame_*.png` — assets visuais

## Como rodar

1. Abrir o Godot 4.7
2. Importar o projeto pela pasta `jogo-lari` (arquivo `project.godot`)
3. Rodar a cena principal (F5)

## Log de progresso

Registro do que foi implementado a cada etapa de aprendizado.

- **[27/08/2026]** — Setup inicial do projeto, criação da nave com movimento via input do teclado, cenário com fundo.

<!--
Como atualizar: a cada avanço relevante no jogo, adicione uma linha nova aqui
antes de fazer o commit, no formato:
- **AAAA-MM-DD** — o que foi feito e o porquê (ex: nova mecânica, conceito da engine aplicado).
-->
