Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B211C84AB
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740401; cv=none; b=TNW2vV5BX0GtbHjP6hhspByxglR3wtAVH5EppMmCk7wvSuv7yzlPSabC9K+ad62cEbMv+jJ8RTdl9IZCDLtOT9MKW/JQZpIv+CWrpeIe4xiwckLkpiyn+VKz1JmSGic5199Hpi5L0d4oic35FddIocX5I9Pq8hnkMobSpgHvAs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740401; c=relaxed/simple;
	bh=tt5ihTzjHa3YyD2t8QmrQJ6R0UD9GhCRqDY3MGkq9uc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HpBX7fE8Wc2YeeJRcgXW2Nayq2OtyAv4Q9HTNEtM3fh3eLd1nzqAKnckCtqA6yM5mGRYik009gmoGn1mJlP56n1ZxFnyKfQkHxpDfOpiE2Mr6F4COTjZjAJzvjQptqKhKrAIgt5YMCPilSSw9r+CaSFDXCzm0Wv/P7aLyJrl3Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LfPgRp6s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LfPgRp6s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC26A1F000E9;
	Wed, 26 Aug 2026 10:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787740400;
	bh=1GIT0MM05tn7A46c5zo7aYkLDxOswDixv64gHF6r894=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LfPgRp6slBakV5ImFMNfbOqGeqe7ZqIuEztTZ9+/8OReptnsfhZYvJkTnAJxkVVHK
	 KNSSuF9/lv/6chTsXm3uplu1hLHutE3zeDptlfgR1Xk8coUC93GbJA2S/tx8T8rMqL
	 LF2ozhs9mNDwyEJ6er/9KWq+GVmDKze/GosSMewJmAT2Bs4FIK4zv6SKgZ5Rw8gXyA
	 44OlsguZ9pzyn4607NLm/KpfWr+OYaD+pCn+jDw7sYa7gViGbpPxXTBHlYj/fBYRIm
	 FwDiX/sNaeUHPadiEMu6oVOQJ8Iy8DwOIrX30cwBIkJH2W3Z7XIfMuu9x7nUhENEI8
	 QrmLPDdvIdSKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 09/10] dtc: dt-check-style: Add warning for redundant
 white-spaces
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260826-n-dts-style-checker-continued-v5-9-fdd16ca6e771@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
 <20260826-n-dts-style-checker-continued-v5-9-fdd16ca6e771@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 10:33:19 +0000
Message-Id: <20260826103319.BC26A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The patch adds an undocumented check for redundant whitespace af=
ter ':', creating a meaningful commit message and code mismatch.
- [Low] The newly added `check_redundant_whitespace_strict` function fails =
to inspect continuation lines.
--

commit 57a0fd97078063900e6ed8376ac59fb6edea822d
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Add warning for redundant white-spaces

Show warnings of too many spaces around '=3D', before '{' and ';'
characters, or using tabs for these.  Both in-tree DTS and DT bindings
have many warnings for the first case (too mant spaces around '=3D'), thus
keep this one only for 'strict' mode.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index da7edd5ea079d..a60891d76137f 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style
> @@ -349,6 +349,42 @@ def check_trailing_whitespace(ctx):
>              yield (dl.lineno, 'trailing whitespace')
> =20
> =20
> +def _check_redundant_whitespace(dl):
> +    if dl.linetype in (LineType.COMMENT, LineType.COMMENT_BODY,
> +                        LineType.COMMENT_END, LineType.COMMENT_START,
> +                        LineType.PREPROCESSOR):
> +        return
> +    if re.search(r'(\s\s+|\t)\{', dl.code):
> +        yield (dl.lineno, 'extra whitespace before {')
> +    if re.search(r':(\s\s+|\t)', dl.code):
> +        yield (dl.lineno, 'extra whitespace after :')

[Severity: Medium]
The commit message states: "Show warnings of too many spaces around '=3D',
before '{' and ';' characters, or using tabs for these."

Does this undocumented check for redundant whitespace after ':' in
_check_redundant_whitespace() create a meaningful mismatch between the
commit message and the code?

> +    if re.search(r'\s+;', dl.code):
> +        yield (dl.lineno, 'extra whitespace before ;')
> +
> +
> +def check_redundant_whitespace(ctx):
> +    """No whitespace between brackets or other code elements.
> +    See also check_value_whitespace() for more checks."""
> +    for dl in ctx.lines:
> +        yield from _check_redundant_whitespace(dl)
> +        for cont in dl.continuations:
> +            yield from _check_redundant_whitespace(cont)
> +
> +
> +def check_redundant_whitespace_strict(ctx):
> +    """No whitespace between brackets or other code elements.
> +    See also check_value_whitespace() for more checks."""
> +    for dl in ctx.lines:
> +        if dl.linetype in (LineType.COMMENT, LineType.COMMENT_BODY,
> +                           LineType.COMMENT_END, LineType.COMMENT_START,
> +                           LineType.PREPROCESSOR):
> +            continue
> +        if re.search(r'(\s\s+|\t)=3D', dl.code):
> +            yield (dl.lineno, 'extra whitespace before =3D')
> +        if re.search(r'=3D(\s\s+|\t)', dl.code):
> +            yield (dl.lineno, 'extra whitespace after =3D')

[Severity: Low]
This function fails to inspect continuation lines in
check_redundant_whitespace_strict().

Does the omission of a nested for cont in dl.continuations: block cause
the script to silently miss checking for redundant whitespace around '=3D' =
if
the '=3D' character happens to be placed on a multi-line continuation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-n-dts-styl=
e-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com?part=3D9
