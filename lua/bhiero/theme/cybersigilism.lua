local lush = require("lush")
local hsl = lush.hsl

-- ── PALETTE ───────────────────────────────────────────────────────────────────
local p = {
	-- backgrounds (transparent-friendly)
	bg = hsl("#0a0000"),
	bg1 = hsl("#110000"), -- subtle raised surface
	bg2 = hsl("#1a0000"), -- selection, cursorline
	bg3 = hsl("#220000"), -- visual select

	-- neon red core
	red = hsl("#ff2200"), -- keywords, operators
	red_bright = hsl("#ff0000"), -- errors, critical
	red_dim = hsl("#cc2200"), -- functions
	red_dark = hsl("#660000"), -- borders, indent guides

	-- warm accent (prevents full-red monotony)
	coral = hsl("#ff6644"), -- functions
	amber = hsl("#cc7700"), -- strings
	orange = hsl("#ff4400"), -- numbers, constants
	magenta = hsl("#cc3366"), -- types, classes
	salmon = hsl("#ffaa88"), -- parameters, variables

	-- text
	fg = hsl("#e8d5c4"), -- base text (warm CRT off-white)
	fg_dim = hsl("#997766"), -- secondary text
	fg_muted = hsl("#553322"), -- comments (dead phosphor)

	-- git / diagnostics
	warn = hsl("#ff6600"),
	info = hsl("#cc5533"),
	hint = hsl("#884422"),

	-- special
	none = "NONE",
}

---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym

	return {
		-- ── BASE ──────────────────────────────────────────────────────────
		Normal({ fg = p.fg, bg = p.none }), -- transparent bg
		NormalFloat({ fg = p.fg, bg = p.bg1 }),
		NormalNC({ fg = p.fg_dim, bg = p.none }),
		FloatBorder({ fg = p.red_dark, bg = p.bg1 }),
		FloatTitle({ fg = p.red, bg = p.bg1, gui = "bold" }),

		-- ── CURSOR & SELECTION ────────────────────────────────────────────
		Cursor({ fg = p.bg, bg = p.red }),
		CursorIM({ Cursor }),
		CursorLine({ bg = p.bg2 }),
		CursorColumn({ bg = p.bg2 }),
		CursorLineNr({ fg = p.red, bg = p.none, gui = "bold" }),
		Visual({ bg = p.bg3 }),
		VisualNOS({ Visual }),

		-- ── LINE NUMBERS & GUTTER ─────────────────────────────────────────
		LineNr({ fg = p.red_dark }),
		SignColumn({ fg = p.red_dark, bg = p.none }),
		FoldColumn({ fg = p.red_dark, bg = p.none }),
		Folded({ fg = p.fg_muted, bg = p.bg1 }),

		-- ── STATUS & TAB ──────────────────────────────────────────────────
		StatusLine({ fg = p.fg, bg = p.bg1 }),
		StatusLineNC({ fg = p.fg_muted, bg = p.bg }),
		TabLine({ fg = p.fg_muted, bg = p.bg1 }),
		TabLineFill({ bg = p.bg }),
		TabLineSel({ fg = p.bg, bg = p.red, gui = "bold" }),

		-- ── SEARCH & MATCH ────────────────────────────────────────────────
		Search({ fg = p.bg, bg = p.amber }),
		IncSearch({ fg = p.bg, bg = p.red }),
		CurSearch({ IncSearch }),
		Substitute({ fg = p.bg, bg = p.coral }),

		-- ── UI ELEMENTS ───────────────────────────────────────────────────
		WinSeparator({ fg = p.red_dark }),
		VertSplit({ WinSeparator }),
		EndOfBuffer({ fg = p.bg }),
		Whitespace({ fg = p.bg2 }),
		SpecialKey({ fg = p.red_dark }),
		NonText({ fg = p.bg2 }),
		MatchParen({ fg = p.red, bg = p.bg2, gui = "bold,underline" }),
		Pmenu({ fg = p.fg, bg = p.bg1 }),
		PmenuSel({ fg = p.bg, bg = p.red }),
		PmenuSbar({ bg = p.bg2 }),
		PmenuThumb({ bg = p.red_dark }),
		WildMenu({ PmenuSel }),
		Question({ fg = p.coral }),
		MoreMsg({ fg = p.coral }),
		ModeMsg({ fg = p.fg, gui = "bold" }),
		ErrorMsg({ fg = p.red_bright, gui = "bold" }),
		WarningMsg({ fg = p.warn }),
		Directory({ fg = p.coral, gui = "bold" }),
		Title({ fg = p.red, gui = "bold" }),
		Conceal({ fg = p.fg_muted }),
		QuickFixLine({ bg = p.bg2 }),
		SpellBad({ sp = p.red_bright, gui = "undercurl" }),
		SpellCap({ sp = p.warn, gui = "undercurl" }),
		SpellRare({ sp = p.magenta, gui = "undercurl" }),

		-- ── SYNTAX ────────────────────────────────────────────────────────
		Comment({ fg = p.fg_muted, gui = "italic" }),
		Constant({ fg = p.orange }),
		String({ fg = p.amber }),
		Character({ fg = p.amber }),
		Number({ fg = p.orange }),
		Boolean({ fg = p.red, gui = "bold" }),
		Float({ fg = p.orange }),
		Identifier({ fg = p.salmon }),
		Function({ fg = p.coral, gui = "bold" }),
		Statement({ fg = p.red }),
		Conditional({ fg = p.red, gui = "bold" }),
		Repeat({ fg = p.red, gui = "bold" }),
		Label({ fg = p.red }),
		Operator({ fg = p.red_dim }),
		Keyword({ fg = p.red, gui = "bold" }),
		Exception({ fg = p.red_bright, gui = "bold" }),
		PreProc({ fg = p.magenta }),
		Include({ fg = p.magenta }),
		Define({ fg = p.magenta }),
		Macro({ fg = p.magenta }),
		PreCondit({ fg = p.magenta }),
		Type({ fg = p.magenta, gui = "bold" }),
		StorageClass({ fg = p.red }),
		Structure({ fg = p.magenta }),
		Typedef({ fg = p.magenta }),
		Special({ fg = p.coral }),
		SpecialChar({ fg = p.amber }),
		Tag({ fg = p.coral }),
		Delimiter({ fg = p.fg_dim }),
		SpecialComment({ fg = p.fg_muted, gui = "italic,bold" }),
		Debug({ fg = p.red_bright }),
		Underlined({ gui = "underline" }),
		Ignore({ fg = p.fg_muted }),
		Error({ fg = p.red_bright, gui = "bold" }),
		Todo({ fg = p.bg, bg = p.red, gui = "bold" }),

		-- ── TREESITTER ────────────────────────────────────────────────────
		sym("@variable")({ fg = p.salmon }),
		sym("@variable.builtin")({ fg = p.red, gui = "italic" }),
		sym("@variable.parameter")({ fg = p.salmon, gui = "italic" }),
		sym("@variable.member")({ fg = p.salmon }),
		sym("@constant")({ fg = p.orange }),
		sym("@constant.builtin")({ fg = p.orange, gui = "bold" }),
		sym("@string")({ fg = p.amber }),
		sym("@string.escape")({ fg = p.coral }),
		sym("@string.special")({ fg = p.coral }),
		sym("@number")({ fg = p.orange }),
		sym("@boolean")({ fg = p.red, gui = "bold" }),
		sym("@function")({ fg = p.coral, gui = "bold" }),
		sym("@function.builtin")({ fg = p.coral, gui = "italic" }),
		sym("@function.call")({ fg = p.coral }),
		sym("@function.method")({ fg = p.coral }),
		sym("@constructor")({ fg = p.magenta }),
		sym("@keyword")({ fg = p.red, gui = "bold" }),
		sym("@keyword.return")({ fg = p.red_bright, gui = "bold" }),
		sym("@keyword.operator")({ fg = p.red }),
		sym("@keyword.import")({ fg = p.magenta }),
		sym("@operator")({ fg = p.red_dim }),
		sym("@punctuation")({ fg = p.fg_dim }),
		sym("@punctuation.bracket")({ fg = p.fg_dim }),
		sym("@punctuation.special")({ fg = p.red_dim }),
		sym("@type")({ fg = p.magenta, gui = "bold" }),
		sym("@type.builtin")({ fg = p.magenta }),
		sym("@attribute")({ fg = p.coral }),
		sym("@property")({ fg = p.salmon }),
		sym("@comment")({ fg = p.fg_muted, gui = "italic" }),
		sym("@comment.todo")({ fg = p.bg, bg = p.red, gui = "bold" }),
		sym("@tag")({ fg = p.red }),
		sym("@tag.attribute")({ fg = p.salmon }),
		sym("@tag.delimiter")({ fg = p.red_dark }),
		sym("@markup.heading")({ fg = p.red, gui = "bold" }),
		sym("@markup.link")({ fg = p.coral, gui = "underline" }),
		sym("@markup.raw")({ fg = p.amber }),

		-- ── DIAGNOSTICS ───────────────────────────────────────────────────
		DiagnosticError({ fg = p.red_bright }),
		DiagnosticWarn({ fg = p.warn }),
		DiagnosticInfo({ fg = p.info }),
		DiagnosticHint({ fg = p.hint }),
		DiagnosticUnnecessary({ fg = p.fg_muted, gui = "italic" }),
		DiagnosticUnderlineError({ sp = p.red_bright, gui = "undercurl" }),
		DiagnosticUnderlineWarn({ sp = p.warn, gui = "undercurl" }),
		DiagnosticUnderlineInfo({ sp = p.info, gui = "undercurl" }),
		DiagnosticUnderlineHint({ sp = p.hint, gui = "undercurl" }),
		DiagnosticVirtualTextError({ fg = p.red_bright, gui = "italic" }),
		DiagnosticVirtualTextWarn({ fg = p.warn, gui = "italic" }),
		DiagnosticVirtualTextInfo({ fg = p.info, gui = "italic" }),
		DiagnosticVirtualTextHint({ fg = p.hint, gui = "italic" }),

		-- ── GIT (gitsigns) ────────────────────────────────────────────────
		GitSignsAdd({ fg = p.amber }),
		GitSignsChange({ fg = p.orange }),
		GitSignsDelete({ fg = p.red_bright }),
		GitSignsAddNr({ GitSignsAdd }),
		GitSignsChangeNr({ GitSignsChange }),
		GitSignsDeleteNr({ GitSignsDelete }),

		-- ── LSP ───────────────────────────────────────────────────────────
		LspReferenceText({ bg = p.bg2 }),
		LspReferenceRead({ bg = p.bg2 }),
		LspReferenceWrite({ bg = p.bg3 }),
		LspInlayHint({ fg = p.fg_muted, gui = "italic" }),
		LspCodeLens({ fg = p.fg_muted, gui = "italic" }),

		-- ── TELESCOPE ─────────────────────────────────────────────────────
		TelescopeNormal({ fg = p.fg, bg = p.bg1 }),
		TelescopeBorder({ fg = p.red_dark, bg = p.bg1 }),
		TelescopePromptNormal({ fg = p.fg, bg = p.bg2 }),
		TelescopePromptBorder({ fg = p.red, bg = p.bg2 }),
		TelescopePromptTitle({ fg = p.bg, bg = p.red, gui = "bold" }),
		TelescopePreviewTitle({ fg = p.bg, bg = p.red_dim }),
		TelescopeResultsTitle({ fg = p.red_dark, bg = p.bg1 }),
		TelescopeSelection({ bg = p.bg2 }),
		TelescopeMatching({ fg = p.red, gui = "bold" }),

		-- ── CMP (completion) ──────────────────────────────────────────────
		CmpItemAbbr({ fg = p.fg }),
		CmpItemAbbrMatch({ fg = p.red, gui = "bold" }),
		CmpItemAbbrMatchFuzzy({ fg = p.coral }),
		CmpItemAbbrDeprecated({ fg = p.fg_muted, gui = "strikethrough" }),
		CmpItemKind({ fg = p.magenta }),
		CmpItemMenu({ fg = p.fg_muted }),

		-- ── WHICH-KEY ─────────────────────────────────────────────────────
		WhichKey({ fg = p.red }),
		WhichKeyGroup({ fg = p.coral }),
		WhichKeyDesc({ fg = p.fg }),
		WhichKeySeparator({ fg = p.fg_muted }),
		WhichKeyFloat({ bg = p.bg1 }),
		WhichKeyBorder({ fg = p.red_dark }),

		-- ── INDENT BLANKLINE ──────────────────────────────────────────────
		IblIndent({ fg = p.bg2 }),
		IblScope({ fg = p.red_dark }),
		IndentBlanklineChar({ fg = p.bg2 }),
		IndentBlanklineContextChar({ fg = p.red_dark }),
	}
end)

return theme
