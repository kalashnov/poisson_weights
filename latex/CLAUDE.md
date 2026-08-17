## LaTeX

Compile with exactly this command, run from `latex/`:

```bash
latexmk -cd -synctex=1 -interaction=nonstopmode -file-line-error -pdf \
        -outdir=.output -bibtexfudge <file>.tex
```

Output (PDF, aux, log) goes to `latex/.output/`. Do not vary the flags.

To clean build artifacts: `latexmk -C -outdir=.output <file>.tex`

This matches the user-level VS Code build config.

## Citations

- By default the relevant papers are in a Zotero collection with the same name as the project. It can be overwritten by `zotero_collection` in `@config.yaml` 
- If the user references some paper often, it is likely in the Zotero library.
- If a paper is cited, it must be in the Zotero library.
- Propose adding a paper to the library when it is not there. A paper should have
  a PDF attached, if one is available.

# Editing rules for this draft

## Edit vs pre existing text

- Do not edit any preexisting text unless explicitly asked to do so, even if it doesn't comply with current rules. If in doubt -- ask
- All the rules apply on any of your fresh edits.

## Style

- Math, not prose. Definitions, propositions, derivations.
- A single short sentence may introduce an equation; no more.
- Do not write motivating paragraphs, "intuition" remarks, "more generally..." framing, transition sentences, or paragraphs that restate in words what the math just said.
- Do not add corollaries, remarks, or labelled paragraphs ("Necessary conditions", "Sufficient conditions", "Caveats", "Sketch", "Remarks", "Limits") unless the user explicitly asks for them. State your reservations in the chat
- Do not add adjacent results ("while we're here, also..."). Do exactly what was asked, nothing more.
- Make sure not to use any terminology that was not properly defined or references in the draft.
- Use minially simple language to remain rigorous. Do not use any additional terminology or qualifiers that doesn't help clarifying the claim.
- `\tag` doesn't render in chat, do not use it in chat
- do not use "vanishes", instead, say more specifically, e.g. "equals to 0."
- When defining notation, do not use "write", write instead "let"
- Do not use the word "display" refering to a formula. If you want to reference formula, either call it by it's name, or use `\eqref`

## What to include

- When asked for a condition: write the condition, derived.
- When asked for a sup / inf / value: derive it.

## Math discipline

- Every derivation must be checkable line by line from what is on the page.
- No "WLOG", "by symmetry", "standard argument" unless the symmetry / standard step is made explicit at the point of use.
- Number equations only when they will be referenced.
- Cite existing labelled equations by `\eqref` rather than restating them. If the equation doesn't have a label, add it.
- Do not use any unneccessary substitutions, notation. Claude shouldn't tend to introduce too much notation
- If you use some additional notation you must check if this notation is defined before it is used

## "Without writing to draft"

- Compute in chat. Do not edit `.tex` files.
- The chat response may be more discursive; the rules above bind only to `.tex` edits.
