Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40FE30CD82
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 19:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779911190; cv=none; b=Q6vF0Q7ee7Xm1ZvGcLpNXbyvn2MNlNBaAPLrjwW+vSRDT/DoqxZMGQSFuzMDPIkp3tQLa9A6JFWvU3D7GwlhNp5ZGsAR/iZkSkVSHNLdJU4CWuO2U8YmppVeez1+FnQJkN2eNcwyuQqzeyaQV2/WBZaeGlyF8893FGnUIW/z2cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779911190; c=relaxed/simple;
	bh=HdZimIKWXWvncSjt6Zwvpg+4WERJ0n4kv+jMho6uUJo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WB+Rdrm1/NqfQjQ35fbk7DRaOTY/F89arMK0+ABQHL34f+qj6LKg/cC9RPpXFN/nY6By7uVzys+EAjz34n5X6MLQNEZjhhzPsyzufaq8QQhYDODORsLVgzCLbfsG6MQAZxnpwKe+VSBgXtcUoXSNyns6uWSZYttf8UJDzRRrp0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cn5xLRlv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cn5xLRlv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3CB41F000E9;
	Wed, 27 May 2026 19:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779911188;
	bh=a+77pgrAZ/27MigbYpEvE9l61NKznartvvSkwQTgH/k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cn5xLRlvjs5H2Eu9yAK9zb8PeWRqXLeF9FQgMmd2CftHqyBZBGimUI24rq4qA5G5g
	 FIwkgfNgIGYJ6RXdVqw62sKFRiomm9jb795UZmBJEHFt7dr5p5YNeCfTrtnkJSo2xr
	 RZAr9PMYvhg2Izm8eqX3FOLbPcFCFBS8rffbRh924iAQGJdmLX2bDztv1rf79vCWnb
	 4srlbUmuEeCVVEycx0WFcp9fyPldf7s4mfXAKzzFMH0zuVCzlefOunfBlaSTO6lB7S
	 fXRZ55gnYoksvmED6nsHCuxBXXCmefYterRmD1++oI1xWKF5I0h2qpb9GVLf1U6is9
	 I0TxNtZj/GN9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: add DTS style checker
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Golle" <daniel@makrotopia.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <224923f3d1c73ff55cebb3e0796f119e32c1bb43.1779908995.git.daniel@makrotopia.org>
References: <224923f3d1c73ff55cebb3e0796f119e32c1bb43.1779908995.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 19:46:28 +0000
Message-Id: <20260527194628.A3CB41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] `check_mixed_indent_chars` incorrectly flags property continuati=
ons and block comments as mixed indent violations, causing widespread false=
 positives.
- [Medium] Multi-closure lines (`}; };`) break tree traversal in structural=
 checks.
- [Medium] Regex ordering in `collect_labels_and_refs` corrupts label detec=
tion when strings contain comment sequences.
--

commit d397a00edbe5f6dcccc252ff4744ba16b6e2e91d
Author: Daniel Golle <daniel@makrotopia.org>

dt-bindings: add DTS style checker

This patch adds a Python tool that checks DTS coding style on examples in
YAML binding files and on DTS source files. It introduces rules defined in
a declarative registry for relaxed and strict mode checking.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> new file mode 100755
> index 0000000000000..2d5723d41ea39
> --- /dev/null
> +++ b/scripts/dtc/dt-check-style
[ ... ]
> +        if re_only_closures.match(code):
> +            closures =3D code.count('}')
> +            depth =3D max(depth - closures, 0)
> +            dl =3D DtsLine(i, raw, LineType.NODE_CLOSE, indent_str, code)
> +            dl.depth =3D depth
> +            dl.closures =3D closures
> +            out.append(dl)
> +            prev_complete =3D True
> +            continue
[ ... ]
> +def check_property_order(ctx):
> +    """Properties within a node body must appear in canonical order:
[ ... ]
> +    for i, dl in enumerate(lines):
> +        if dl.linetype !=3D LineType.NODE_OPEN:
> +            continue
> +        body_depth =3D dl.depth + 1
> +        props =3D []
> +        for j in range(i + 1, len(lines)):
> +            d =3D lines[j]
> +            if d.linetype =3D=3D LineType.NODE_CLOSE and \
> +                    d.depth =3D=3D body_depth - 1:
> +                break

[Severity: Medium]
When a line contains multiple closures like "}; };", classify_lines()
decrements the depth by the number of closures.

Will this cause the depth to drop by 2 or more, skipping the exact
termination condition of d.depth =3D=3D body_depth - 1?

It looks like tree traversal in structural checks like check_property_order=
()
or _walk_bodies() might miss the end of the node body and improperly mix
properties from different siblings.

[ ... ]
> +def collect_labels_and_refs(text):
> +    """Return (defined_labels, referenced_labels) found anywhere outside
> +    /* */ comments and string literals. Labels named fake_intc* (injected
> +    by dt-extract-example) are skipped."""
> +    # Strip block comments first so labels inside them don't count
> +    stripped =3D re.sub(r'/\*.*?\*/', '', text, flags=3Dre.DOTALL)
> +    # Strip line comments
> +    stripped =3D re.sub(r'//[^\n]*', '', stripped)
> +    # Strip string literals so words inside quotes (e.g. "Error: foo")
> +    # are not picked up as label definitions or &-references.
> +    stripped =3D re.sub(r'"(?:[^"\\]|\\.)*"', '""', stripped)

[Severity: Medium]
Since comments are stripped before string literals, does this break if a
string literal contains sequences like // or /*?

If a string contains a URL like "http://..." or a /* sequence without a
closing */, the comment regex might activate inside the string and consume
valid source code and labels up to the next */ somewhere else in the file,
causing false positives for the unused-labels check.

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

[Severity: Medium]
Does this code flag legitimate property continuations or block comments as
mixed indent violations?

Multi-line property continuations in DTS typically use tabs for base
indentation and spaces for visual alignment under a specific character,
which is an alignment pattern expected by check_continuation_alignment().

If check_mixed_indent_chars() flags these, it might cause widespread false
positives in the default relaxed mode.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1779908995.gi=
t.daniel@makrotopia.org?part=3D1
