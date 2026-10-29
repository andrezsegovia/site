---
title: Understanding Spec-Driven-Development
date: 2026-10-28
publishDate: 2026-10-28
draft: false
weight: 1
type: notes
categories:
- AI
---

There are three SDD implementations:
1. **Spec-first**: A well thought-out spec is written first, and then used in the AI-assisted development workflow for the task at hand.
2. **Spec-anchored**: The spec is kept event after the task is complete, to continue using it for evolution and maintenance of the respective feature.
3. **Spec-as-source**: The spec is the main source file over time, and only the spec is edited by the human, the human never touches the code.

**What is a spec?** A spec is a structured, behavior-oriented artifact —or a set of related artifacts— written in natural language that expresses software functionality and serves as guidance to AI coding agents.

There is different between specs and the more general context documents for a codebase. The general context are thing like rules files, or high level descriptions of the product and the codebase. It is also called **memory bank**. These files are relevant across all AI coding sessions in the codebase, whereas specs are only relevant to the tasks that actually create or change that particular functionality.

**What problem size and type is SDD meant for?** Probably not for large features that are still very unclear, as surely that would require more specialist product and requirements skills, and lots of other steps like research and stakeholder involvement?

## Reference
-  https://martinfowler.com/articles/exploring-gen-ai/sdd-3-tools.html
