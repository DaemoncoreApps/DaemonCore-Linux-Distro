# Working style

- Work like an experienced human maintainer.
- Study the existing architecture, conventions, and recent commit history before editing.
- Write practical, readable code without unnecessary abstractions or speculative complexity.
- Prefer cohesive, production-ready implementations over demos, placeholders, or superficial patches.
- Handle errors, edge cases, security boundaries, recovery, and rollback paths where relevant.
- Preserve unrelated user changes and keep the scope focused on the requested outcome.
- Reuse established project patterns before introducing new dependencies or architectural layers.
- Run relevant formatting, linting, tests, builds, and smoke checks before declaring work complete.
- Review the staged diff before committing.
- Comments should explain why something is necessary, not narrate obvious code.
- User-facing text should sound clear and natural, not robotic or overly formal.

# Commit messages

- Write short, natural commit messages that sound like a person wrote them.
- Describe the purpose, outcome, or reason for the change instead of listing modified files.
- Avoid robotic wording, excessive detail, conventional prefixes, and phrases such as "implement comprehensive".
- Never mention AI, Codex, generated code, assistants, or automation in a commit message.
- Match the repository's existing commit style when it has a clear convention.
- Prefer memorable language without being vague or cute at the expense of meaning.

Examples:

- Remember what changed on this PC
- Put the installer where people can find it
- Give this PC some breathing room
- Stop upgrades from tripping over the running app
