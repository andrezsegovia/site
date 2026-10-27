---
title: Vibe Coding Our Way to Disaster
date: 2026-10-27
publishDate: 2026-10-27
draft: false
weight: 1
type: notes
categories:
- AI
---

[..] most critical bugs actually result from misunderstanding the problem rather that implementation errors.

The key insight: AI tools amplify whatever approach you bring to them. If you rush to code without understanding the problem, AI helps you build the wrong solution. If you think deeply first, AI becomes a powerful tool for implementing well-considered solutions.

Hickey makes a distinctions between simple and easy [..]. Simple meaning: a single braid, one responsibility, or one concept that does not touch anything else. Easy, meaning the thing you reach for automatically. The familiar choice. The solution you can implement without a design doc. [..]. The definition of simple really has no overlap with easy, but it is a common idea that simple things are easy, which is not always the case.

Vibe coding is explicitly choosing ease over simplicity, just as Hickey warned. The confortable, conversational interface of AI assistants makes it tempting to skip the hard work of clearly defining what we're building. We let the software evolve organically, which feels productive but inevitable creates exactly what Hickey calls "complected" (unnecessarily intertwined) systems. Our context complexity becomes code complexity, and every clarification and correction in the chat history gets woven into the implementation.

Hickey approach for think deeply:

1. **Preparations**: Understanding the problem domain, exploring existing solutions, and identifying constraints.
2. **Incubation**: Step away after thorough preparation to let the main processes the gathered information and making connections. 
3. **Illumnitation**: When the connections become clear. This moments reveal simpler solutions.
4. **Verification**: Testing whether the insight actually works.


**Upfront Thinking -> Context Engineering**

The preparation phase is context engineering: the discipline of designing what an AI sees before it responds —not just the prompt, but all the supporting information, tools, and structure needed to get reliable results.

AI agent should not be treat as conversational partners, but as powerful tools whose context must be carefully managed.

**A structured approach: the three-phase methodology**

**Phase 1: Research as Problem Understangin**
Treat the AI as a research assistant focused solely on understanding the problem space and to finally produce a research document that maps the terrain. The research must be carefully review before proceeding. Validating the AI's understanding of the problem space early on, we prevent cascading errors that would be far more costly to fix later.

**Phase 2: Planning as design thinking**
After validation, we ask the AI to create a detailed implementation plan, which should be so explicit that any developer could follow it —specifying which files to modify, what functions to create, and how components will interact. It is important to review the plan, because it is the design document.

**Phase 3: Implementation as execution**
With the previous steps completed, the AI now has a clear specification to follow, reducing the chance of drift or confusion. This step becomes straightforward. The AI can focus on translating the plan into code, maintaining the context clean and focused, preventing the accumulation of complexity.

**We must be focused on solving problems rather that just producing code**. Hickey argued that we should think more about the problem space than the solution space.

## Reference
- https://www.arthropod.software/p/vibe-coding-our-way-to-disaster
