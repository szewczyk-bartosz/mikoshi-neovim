# Welcome to Mikoshi Vim, a Samurai's Editor

Focus is on simplicity and building muscle memory.

Installation instructions will be ready soonish, will be at the bottom. First up, how to use it.

---

## Organisation of Functionality

The behaviours of Mikoshi Vim are split into three categories:

1. **Default Vim functionality**
2. **Extensions of default functionality**
3. **IDE-like features**

---

### Default Vim Functionality

This is pretty self-explanatory. Mikoshi Vim doesn't hugely modify default Vim behaviours and I won't be going into tons of details about how to use Vim in general—there are a lot of resources online that will teach you the basics.

The only thing we do differently is that Mikoshi Vim ships with **`jk` in insert mode** exiting to normal mode. Your wrists will thank you.

**TODO:** Link to Vim resources

---

### Extensions of Default Functionality

This category is what I class as things you will use often, and therefore there was an emphasis on these being quick to access.

#### Quick Access Bindings

| Binding | Action |
|---------|--------|
| `<C-h>` `<C-j>` `<C-k>` `<C-l>` | Window navigation (left/down/up/right) |
| `<Tab>` / `<S-Tab>` | Next / Previous buffer |
| `]d` / `[d` | Next / Previous diagnostic |
| `]c` / `[c` | Next / Previous git hunk |
| `]x` / `[x` | Next / Previous git conflict |
| `<Esc><Esc>` | Toggle terminal |
| `K` | Hover documentation |
| `gcc` / `gc` | Toggle comment (line / with motion) |
| `gbc` / `gb` | Toggle block comment (line / with motion) |
| `s` / `S` | Flash jump / Flash treesitter |
| `<leader>e` | Toggle Neo-tree file explorer |

---

### IDE-like Features

This is where the muscle memory building comes in. The functionality in this category is organised in such a way that everything is accessed by pressing:
```
<leader> + letter_1 + letter_2
```

Effort was put in to ensure that `letter_1` is the first letter of the **category** and `letter_2` is the first letter of the **functionality** you are trying to invoke.

**For example:** If you want to go to definition, definitions are an LSP feature, so:
- `letter_1 = l` (LSP)
- `letter_2 = d` (definition)

This gives us: `<leader> + l + d`
Which you can remember as: `<leader> + l(sp) + d(iagnositc)`

This will hopefully aid you in developing muscle memory more quickly, as the commands you are typing out feel akin to real sentences.

---

#### LSP Actions (`<leader>l*`)

*Note: Some LSP actions also have traditional Vim bindings (e.g., `grr` for references, `grn` for rename). The `<leader>l*` bindings are provided for consistency and discoverability.*

| Binding | Action | Traditional Binding |
|---------|--------|---------------------|
| `<leader>ld` | Go to **definition** | - |
| `<leader>lr` | Show **references** | `grr` |
| `<leader>li` | Go to **implementation** | `gri` |
| `<leader>lt` | Go to **type** definition | `grt` |
| `<leader>ln` | Re**name** symbol | `grn` |
| `<leader>la` | Code **action** | `gra` |
| `<leader>ls` | Document **symbols** | `gO` |
| `<leader>lh` | **Hover** documentation | `K` |
| `<leader>lf` | **Format** buffer | - |

---

#### Diagnostics (`<leader>d*`)

| Binding | Action | Alternative |
|---------|--------|-------------|
| `<leader>dd` | Show **diagnostic** at cursor | - |
| `<leader>dl` | **List** all diagnostics (Telescope) | - |
| `<leader>dn` | **Next** diagnostic | `]d` |
| `<leader>dp` | **Previous** diagnostic | `[d` |

---

#### Git (`<leader>g*`)

| Binding | Action |
|---------|--------|
| `<leader>gg` | Open Lazy**git** |
| `<leader>gs` | **Stage** hunk |
| `<leader>gr` | **Reset** hunk |
| `<leader>gu` | **Undo** stage hunk |
| `<leader>gp` | **Preview** hunk |
| `<leader>gb` | **Blame** line |
| `<leader>gdd` | **Diff** this |
| `<leader>gdp` | **Diff** project |
| `<leader>gS` | **Stage** buffer (entire file) |
| `<leader>gR` | **Reset** buffer (entire file) |
| `<leader>gtb` | **Toggle** **blame** |
| `<leader>gtd` | **Toggle** **deleted** |

**Git Conflicts:**

| Binding | Action |
|---------|--------|
| `<leader>gco` | Choose **ours** |
| `<leader>gct` | Choose **theirs** |
| `<leader>gcb` | Choose **both** |
| `<leader>gcn` | Choose **none** |

---

#### Buffers (`<leader>b*`)

| Binding | Action | Alternative |
|---------|--------|-------------|
| `<leader>bc` | **Choose** buffer (pick) | - |
| `<leader>bq` | **Quit** buffer (close) | - |
| `<leader>bn` | **Next** buffer | `<Tab>` |
| `<leader>bp` | **Previous** buffer | `<S-Tab>` |
| `<leader>bsd` | **Sort** by **directory** | - |
| `<leader>bse` | **Sort** by **extension** | - |
| `<leader>bsi` | **Sort** by **ID** | - |

*Note: `<Tab>` and `<S-Tab>` are faster alternatives for buffer navigation.*

---

#### Find (Telescope) (`<leader>f*`)

**Core File & Text Search:**

| Binding | Action |
|---------|--------|
| `<leader>ff` | **Find files** |
| `<leader>fg` | Live **grep** (search text) |
| `<leader>fb` | **Buffers** |
| `<leader>fh` | **Help** tags |
| `<leader>ft` | Open **Telescope** |
| `<leader>fr` | **Resume** previous search |
| `<leader>fs` | Treesitter **symbols** |

**LSP via Telescope (`<leader>fl*`):**

| Binding | Action |
|---------|--------|
| `<leader>fld` | Diagnostics |
| `<leader>flD` | LSP Definitions |
| `<leader>fli` | LSP Implementations |
| `<leader>flr` | LSP References |
| `<leader>flt` | LSP Type Definitions |
| `<leader>flsb` | LSP Document Symbols |
| `<leader>flsw` | LSP Workspace Symbols |

**Git via Telescope (`<leader>fv*`):**

| Binding | Action |
|---------|--------|
| `<leader>fvf` | Git files |
| `<leader>fvcw` | Git commits |
| `<leader>fvcb` | Git buffer commits |
| `<leader>fvb` | Git branches |
| `<leader>fvs` | Git status |
| `<leader>fvx` | Git stash |

---
