Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAE0311977
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 18:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779473857; cv=none; b=JfsuQBI5HpV5CfEVf0Nh6fToDURN1eH9+GkREFAkvoOxgGquy9O1OE2dbV6767WM2a1yaLBrftQapQd4sN+eRjzI7BMFD+0p0JgV3aRZScHrPo/Ay+GTvNzQsLcaIdUF7+FNzCs9UsKmazbHHbjVpWIlNnzKj8gWMs7CVTGjOvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779473857; c=relaxed/simple;
	bh=MUQwgUPTpQv8KsthgwE8DmVQ4bi8j7D2oI7IkEWswXI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Bp8iRAGISOaoOXrLLegFxCSy22fF2A8YN84zr7HOnAuUL46WQlnyOpjITu55cilMxI+6xp08GkKlZ6NuZ2Vxi2Cu3iZ806vtptc1i88z8nkNT6gaQ5D71h9FLyL1xPtavw3xdpCNzn6Ojnn6o/bVXuTBk2CWmHH77MBsgdV0msg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lN/XFfv+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lN/XFfv+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC3C1F000E9;
	Fri, 22 May 2026 18:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779473856;
	bh=ZOoYa+0X1MOjxUhh2W500e7o1IJV/x4GYG+ln/8LVz0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lN/XFfv+ZHbQ3YZoHlt86MVX3JK5vHIvzmeRWpp9aOtCt9WdeTuYq4SSLLtGstFpW
	 kKVzEX6o/f5Ntx5WYCtb/WuuHFnI1fUPEo+T2D83bFlxQCkW7edPW2j1ah4kUKX26L
	 zZ0uURkcZ2oM6DZ37CAWT4RUaiT+PBW0prMCs+YQlh8nO7hO5zKMEaUx2/DwLiO3gE
	 E27HxmGFVzcMw1t1s8tvlsoRUFvp+FuEzI9lE3CP4Ui2W8JwuJfLTDn30IPfAq2h53
	 mmpRY8f/A0XrTS7278JalZVhVmAyuUuehs++Wv7x+lO5hsy10BqSPwMZJNoyLjMLVW
	 WU9m1jfIKgfyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: add DTS style checker
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Golle" <daniel@makrotopia.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <457f328d4c5d639482fddf40e79be61b97db5814.1779472837.git.daniel@makrotopia.org>
References: <457f328d4c5d639482fddf40e79be61b97db5814.1779472837.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 18:17:35 +0000
Message-Id: <20260522181735.ACC3C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Medium] Code following a block comment on the same line is completely ig=
nored, breaking parsing state and nesting depth.
- [Medium] Multi-line C preprocessor directives (macros) using `\` continua=
tions are mishandled, corrupting the parsing state and triggering false-pos=
itive style warnings.
- [Medium] The unused-labels checker regex matches inside string literals a=
nd misses labels on nodes starting with digits.
- [Medium] Syntactic checks operating on `dl.raw` incorrectly process the c=
ontents of unclosed block comments on `PROPERTY` lines, causing false posit=
ives.
- [Medium] The regex for node headers rejects nodes with malformed unit add=
resses, allowing them to bypass the unit-address format check.
- [Low] Multiple closing braces on the same line break depth tracking and c=
ause cascading false positive warnings.
--

commit 6b49caf90b5c4741b273da5e02e9f53fa30ea1bc
Author: Daniel Golle <daniel@makrotopia.org>

dt-bindings: add DTS style checker

Add a Python tool that checks DTS coding style on examples in YAML binding
files and on .dts/.dtsi/.dtso source files. Rules are kept in a declarative
registry, tagged as 'relaxed' or 'strict'.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> new file mode 100755
> index 0000000000000..93cb1d7d2985c
> --- /dev/null
> +++ b/scripts/dtc/dt-check-style

[ ... ]

> +re_node_header =3D re.compile(
> +    r'^(?:([a-zA-Z_][a-zA-Z0-9_]*):\s*)?'
> +    r'([a-zA-Z0-9][a-zA-Z0-9,._+-]*|/)'
> +    r'(?:@([0-9a-fA-F,]+))?'
> +    r'\s*\{$')

[Severity: Medium]
Will this regex reject nodes with malformed unit addresses, allowing them to
bypass the unit-address format check?

If the unit address contains characters outside this set, such as the x in
memory@0x1000, the entire regex match fails and dl.node_addr remains None.

Because check_unit_address_format() skips validation if dl.node_addr is Non=
e,
does this allow malformed unit addresses containing 0x to bypass the very
check designed to flag them?

[ ... ]

> +        if in_block_comment:
> +            ltype =3D (LineType.COMMENT_END if '*/' in stripped
> +                     else LineType.COMMENT_BODY)
> +            if ltype =3D=3D LineType.COMMENT_END:
> +                in_block_comment =3D False
> +            dl =3D DtsLine(i, raw, ltype, indent_str, stripped)
> +            dl.depth =3D depth
> +            out.append(dl)
> +            continue
> +
> +        if stripped.startswith('/*'):
> +            if '*/' in stripped:
> +                ltype =3D LineType.COMMENT
> +            else:
> +                in_block_comment =3D True
> +                ltype =3D LineType.COMMENT_START
> +            dl =3D DtsLine(i, raw, ltype, indent_str, stripped)
> +            dl.depth =3D depth
> +            out.append(dl)
> +            continue

[Severity: Medium]
Does this code skip parsing for any valid DTS code following a block comment
on the exact same line?

If a line starts with /* and contains */, or if an open block comment ends =
on
the line, the script sets the line type and immediately executes continue.

Could this lead to desynchronized nesting depth tracking by ignoring
constructs like /* ... */ }; or /* ... */ foo =3D <1>;, incorrectly classif=
ying
subsequent lines and triggering cascading false positive violations?

> +
> +        if stripped.startswith('//'):
> +            dl =3D DtsLine(i, raw, LineType.COMMENT, indent_str, strippe=
d)
> +            dl.depth =3D depth
> +            out.append(dl)
> +            continue
> +
> +        if stripped.startswith('#') and is_preprocessor(stripped):
> +            dl =3D DtsLine(i, raw, LineType.PREPROCESSOR,
> +                         indent_str, stripped)
> +            dl.depth =3D depth
> +            out.append(dl)
> +            prev_complete =3D True
> +            continue

[Severity: Medium]
Does this logic mishandle multi-line C preprocessor directives using
backslash continuations?

If the directive has trailing backslashes to continue macros to subsequent
lines, the continuation lines do not start with #.

Are these improperly parsed as standard DTS properties or continuations,
inappropriately applying DTS constraints to internal C code and triggering
false positives?

[ ... ]

> +        if code =3D=3D '};' or code =3D=3D '}':
> +            depth =3D max(depth - 1, 0)
> +            dl =3D DtsLine(i, raw, LineType.NODE_CLOSE, indent_str, code)
> +            dl.depth =3D depth
> +            out.append(dl)
> +            prev_complete =3D True
> +            continue

[Severity: Low]
Will this fail to decrement nesting depth if a single line contains multiple
closures?

If code contains }; };, this exact-match condition fails.

Does the line then improperly fall through and get classified as
LineType.PROPERTY, corrupting depth tracking for subsequent lines and
incorrectly flagging them for indentation violations?

[ ... ]

> +def collect_labels_and_refs(text):
> +    """Return (defined_labels, referenced_labels) found anywhere outside
> +    /* */ comments. Labels named fake_intc* (injected by
> +    dt-extract-example) are skipped."""
> +    # Strip block comments first so labels inside them don't count
> +    stripped =3D re.sub(r'/\*.*?\*/', '', text, flags=3Dre.DOTALL)
> +    # Strip line comments
> +    stripped =3D re.sub(r'//[^\n]*', '', stripped)
> +    defined =3D set()
> +    referenced =3D set()
> +    for m in re.finditer(r'(?:^|[\s{])([a-zA-Z_][a-zA-Z0-9_]*):\s*[a-zA-=
Z/&]',
> +                         stripped):

[Severity: Medium]
Does this regex match inside string literals and miss labels on nodes
starting with digits?

Since string literals are not stripped before searching for labels, words
followed by colons inside strings like prop =3D "Error: failed"; could be a=
dded
to the defined set and flagged as unused.

Additionally, because the regex requires the character following the colon =
to
be a letter, /, or &, does it fail to capture labels attached to nodes
starting with a digit like label: 1wire@10 {?

[ ... ]

> +def _strip_strings_and_comments(text):
> +    """Remove string literals and /* */ + // comments from a single
> +    line, replacing them with empty strings. Used so syntactic checks
> +    (whitespace, hex case, etc.) don't false-positive on contents of
> +    quoted strings or comments."""
> +    text =3D re.sub(r'"(?:[^"\\]|\\.)*"', '""', text)
> +    text =3D re.sub(r'/\*.*?\*/', '', text)
> +    text =3D re.sub(r'//.*$', '', text)
> +    return text

[Severity: Medium]
Will syntactic checks incorrectly process the contents of unclosed block
comments on PROPERTY lines?

Because the regex only removes block comments that both open and close on t=
he
same line, if a line contains an unclosed block comment like
prop =3D <1>; /* ... 0xABC, the regex fails to match.

Does the comment text remain intact, causing checks like check_hex_case() to
yield false positive errors for uppercase hex values inside the comment?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1779472837.gi=
t.daniel@makrotopia.org?part=3D1
