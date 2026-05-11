Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73879356745
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778538965; cv=none; b=F0k+nkGiTyMkdp0x9r5IR8FmcZ55LS2yLfx9KJtgGNxX69hyf0kRSD+V/bv8ahZKsJNDOnivjCWqcfyjZQ3eYX0Th51npwKBrHjUwJWaSRbttXXejpwVQX+D3esxv5xEq6h2TDoqW6bu6bL+Ygw1+fySHrEqjWuk6METzR9rNak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778538965; c=relaxed/simple;
	bh=gexWv0KJ5pxMDDdSaorBG/70P9UHG+zY8UdK2eGrUUU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ns/jFcuJqeUzGfFMiRHcAllEFp7YUXIbazqooiQmJS+7UHYPofpC6ezw06CpeVhxd9yVeaNPoT0gPlHzXovQM98gDNWoka3i7UPthKBHB9SPdlZwqPqlbEVTYRGiWx8l8SxI2giPprq2ZwbsnNKxa23RTRL8p4pv5UusiUKmqS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yzxuez6V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yzxuez6V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6BB8C2BCB0;
	Mon, 11 May 2026 22:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778538965;
	bh=gexWv0KJ5pxMDDdSaorBG/70P9UHG+zY8UdK2eGrUUU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Yzxuez6V5f7xkDkQwsWd2vErA1tn4+c+ceKU4lh4s+bk2acInLGyGrj0hRihRML1/
	 r/PV5zitZcMUEmIJkv050GCDHU6owR6nON+cdblTZF/ZliqAPpxXYwQLLZo/RSs7bo
	 6RCoNdRmOyc+IoYGOHZMrcHg/UGOl4DfUPsw7PwgHXmSKR2kpxu9scM+N0CTXWkVSS
	 50UBnN21dEs9f/IFUAYhLPv9jGtEkTeyBUofGxnJhBCCneNRrsKQ19JLsbQjr33GfG
	 uW8L3uoX3P8ubZTe6F2RDxJiJ681T9Wt0eRuwWTOHf4uY61kdpiY/inSGPgWXpe83m
	 g90WHzPo92cwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: add DTS style checker
Reply-To: sashiko@lists.linux.dev
To: "Daniel Golle" <daniel@makrotopia.org>
Cc: krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <dba9d5612e7435da84a95fd85ec404f803bbbdfd.1778454442.git.daniel@makrotopia.org>
References: <dba9d5612e7435da84a95fd85ec404f803bbbdfd.1778454442.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 22:36:04 +0000
Message-Id: <20260511223604.C6BB8C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The line classifier fails to handle trailing inline comments and w=
hitespace, corrupting block depth and AST parsing.
- [High] The `mixed-indent-chars` rule directly conflicts with `continuatio=
n-alignment`, causing it to flag properly aligned continuation lines.
- [High] `check_continuation_alignment` incorrectly compares raw string len=
gth instead of visual display columns.
- [Medium] Regex patterns wrongly reject valid Devicetree identifiers start=
ing with digits.
- [Medium] `check_value_whitespace` fails to validate cell array contents t=
hat span multiple lines.
--

commit fa5d5813b5bacc079c40709e0ab8be2c7e12de57
Author: Daniel Golle <daniel@makrotopia.org>

dt-bindings: add DTS style checker

This commit adds a Python tool that checks DTS coding style on examples in =
YAML
binding files and on .dts/.dtsi/.dtso source files. Rules are kept in a sma=
ll
declarative registry and can be run in relaxed or strict modes.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> new file mode 100755
> index 0000000000000..e1dd548fe9486
> --- /dev/null
> +++ b/scripts/dtc/dt-check-style
> @@ -0,0 +1,1063 @@

[ ... ]

> +re_node_header =3D re.compile(
> +    r'^(?:([a-zA-Z_][a-zA-Z0-9_]*):\s*)?'
> +    r'([a-zA-Z][a-zA-Z0-9,._+-]*|/)'
> +    r'(?:@([0-9a-fA-F,]+))?'
> +    r'\s*\{$')

The Devicetree specification allows node names to begin with numeric digits.
Does this regex reject valid hardware nodes like 1wire@... or 3d-engine@...=
 by
mandating that node names start with a letter?

[ ... ]

> +def parse_property_name(dl):
> +    m =3D re.match(r'^([a-zA-Z#][a-zA-Z0-9,._+#-]*)\s*[=3D;]', dl.stripp=
ed)
> +    if m:
> +        dl.prop_name =3D m.group(1)

Similarly, does this regex incorrectly reject property names that begin with
numeric digits by requiring them to start with a letter or #?

[ ... ]

> +def classify_lines(text):
> +    """Return a list of DtsLine. Tracks { } depth and groups
> +    continuation lines onto their leading PROPERTY line."""
> +    out =3D []
> +    in_block_comment =3D False
> +    prev_complete =3D True
> +    depth =3D 0
> +
> +    # Split preserving the indent string verbatim
> +    re_lead =3D re.compile(r'^([ \t]*)(.*)$')
> +
> +    for i, raw in enumerate(text.split('\n'), start=3D1):
> +        m =3D re_lead.match(raw)
> +        indent_str =3D m.group(1)
> +        stripped =3D m.group(2)

It appears the stripped variable retains trailing inline comments and
whitespace. Will lines formatted with trailing comments such as
node { /* comment */ or prop =3D <1>; // comment fail the subsequent suffix
checks like stripped.endswith('{') and stripped.endswith(';')?

If so, it seems node openings would be misclassified as properties, and
properties would erroneously set prev_complete =3D False, turning subsequent
lines into continuation lines.

[ ... ]

> +def check_mixed_indent_chars(ctx):
> +    """Indent must be all-spaces or all-tabs, never mixed on one line."""
> +    for dl in ctx.lines:
> +        if not dl.indent_str:
> +            continue
> +        if dl.linetype =3D=3D LineType.PREPROCESSOR:
> +            continue
> +        if ' ' in dl.indent_str and '\t' in dl.indent_str:
> +            yield (dl.lineno, 'mixed tabs and spaces in indent')

Will this rule flag properly aligned continuation lines?

The standard practice for aligning multi-line properties in DTS is to use
tabs for base indentation and spaces for fine-grained alignment (e.g., to a=
lign
precisely under a < character). Unlike check_indent_consistent(), this rule
doesn't seem to exclude continuation lines.

[ ... ]

> +def check_value_whitespace(ctx):
> +    """Inside a <...> cell list use single spaces between values; no
> +    leading or trailing whitespace inside the brackets. Outside
> +    strings and comments only."""
> +    for dl in ctx.lines:
> +        if dl.linetype not in (LineType.PROPERTY, LineType.CONTINUATION):
> +            continue
> +        text =3D _strip_strings_and_comments(dl.raw)
> +        for m in re.finditer(r'<([^<>]*)>', text):

If a cell array declaration is split across multiple lines, will it bypass =
this
whitespace validation entirely?

Since this rule operates strictly on a line-by-line basis, neither line wou=
ld
contain both < and > characters, which would cause the regex match to fail.

[ ... ]

> +def check_continuation_alignment(ctx):
> +    """A multi-line property's continuation lines must align their
> +    first non-whitespace character to the column of the first '<' or
> +    '"' after the '=3D' in the leading line."""
> +    for dl in ctx.lines:
> +        if dl.linetype !=3D LineType.PROPERTY:
> +            continue
> +        if not dl.continuations:
> +            continue
> +        eq =3D dl.raw.find('=3D')
> +        if eq < 0:
> +            continue
> +        # First '<' or '"' after '=3D'
> +        rest =3D dl.raw[eq + 1:]
> +        m =3D re.search(r'[<"]', rest)
> +        if not m:
> +            continue
> +        target_col =3D eq + 1 + m.start()
> +        for cont in dl.continuations:
> +            if len(cont.indent_str) !=3D target_col:
> +                yield (cont.lineno,
> +                       'continuation should align to column %d '
> +                       '(under "<" or \\")' % (target_col + 1))

Does this logic accurately calculate display columns for lines using tab
indentation?

A properly aligned continuation line in a DTS file utilizing tabs will
naturally have a string length significantly shorter than target_col. This
checks len(cont.indent_str), which counts tab characters as length 1,
instead of calculating visual display width, which might result in false
positives for correctly aligned lines.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1778454442.gi=
t.daniel@makrotopia.org?part=3D1
