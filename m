Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA81A2D1911
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748416; cv=none; b=WggI46HT9BYN4aN6X2AxFAU3EJH7GUugKZsmmrebWBK1eOTRkBP1JYrrg73sfGagXEIRprV52GeH92yR8LF1ShdCfm05abO+BMyQ0W8DRchG5zVV0foealF9UzMUFE/5d5EXQR88H2G0siSD+yHecFORfuilHts6nr1/at+9jiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748416; c=relaxed/simple;
	bh=0SCPre84JaJ+axP0mc7DpLV2A65OeopOwgIpmjzv5c8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EJ2W/FB9fa9ib6rxXfYLlOvBSoL8b93l5tmtK5ydPQlQMu956zlQxxJnZUX0e2mSSHxCjHQ0FYo1R2U6tDQ/S5a+96VPB1ETMb2nLV/pFLSg6c3pUXdHcbT+YMWLcGa5diN+XWNc8KO9cbv452zn1mAvvmvqslCKO/O81k5XNX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JVjOBnvW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JVjOBnvW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D661F000E9;
	Mon,  3 Aug 2026 09:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785748412;
	bh=ePmSwKJ1F2B+l61jjJ6v23upewLMrgEHIVMVO7briwA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JVjOBnvWzNS72LNIq2SkhZm09G/TA3jMBI9yKTl+JvVCkTKQSQufVvrJxGY6xdPLC
	 ++Qz6kFEMPh51Cf7N0I1ZjC3FuIg2AfjABE0UMfdXu9dnBXLbX8EHp6swAOIeDVJCw
	 f4zbisjhW/u4XqYhvH9UCeBeBTPsy4IXjnWU20wqRBfkuO5pDv/53ys6TyFvBUQ6NY
	 k0pFYLtwj25Q0rAIGVP3cuy9FANKTI0xAfpKSctOv0yfI0UgiaemMvLDEvOnj8g9o/
	 I9xguvnrz8MSSexCFEO0yi3ugqjyjLGyUI/aowkelvLRz8p8vY33w27tTw/j+2CFeW
	 2fHvAHYdg+mug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/11] dtc: dt-check-style: Add warning for redundant
 white-spaces
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260803-n-dts-style-checker-continued-v3-10-6c9776928cea@oss.qualcomm.com>
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
 <20260803-n-dts-style-checker-continued-v3-10-6c9776928cea@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 09:13:31 +0000
Message-Id: <20260803091332.53D661F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] False positives in dt-check-style whitespace checks due to unstr=
ipped strings and inline comments.
--

--- Patch [10]: [PATCH v3 10/11] dtc: dt-check-style: Add warning for redun=
dant white-spaces ---
commit f5a3cbd31bda433ce990bca1b2244f3a3da27d87
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Add warning for redundant white-spaces

This commit adds a warning in dt-check-style to catch excessive spaces or
tabs around '=3D', before '{', and before ';'. The checking is split between
relaxed and strict modes to accommodate existing in-tree usage.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index 1430c675bd951..aa2072957a1a0 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style
> @@ -348,6 +348,36 @@ def check_trailing_whitespace(ctx):
>              yield (dl.lineno, 'trailing whitespace')
> =20
> =20
> +def check_redundant_whitespace(ctx):
> +    """No whitespace between brackets or other code elements.
> +    See also check_value_whitespace() for more checks."""
> +    for dl in ctx.lines:
> +        if dl.linetype in (LineType.COMMENT, LineType.COMMENT_BODY,
> +                           LineType.COMMENT_END, LineType.COMMENT_START,
> +                           LineType.PREPROCESSOR):
> +            continue
> +        if re.search(r'(\s\s+|\t){', dl.raw):
> +            yield (dl.lineno, 'extra whitespace before {')
> +        if re.search(r':(\s\s+|\t)', dl.raw):
> +            yield (dl.lineno, 'extra whitespace after :')
> +        if re.search(r'\s+;', dl.raw):

[Severity: Medium]
Does using dl.raw directly here cause false positives for inline comments or
string literals?

For example, if a line has bootargs =3D "console=3DttyS0  rdinit=3D/init"; =
or
reg =3D <1>; /* my comment ; */, since re.search evaluates dl.raw directly,
it looks like it will match the whitespace inside the string or the inline
comment.

Would it be safer to strip comments or strings via
_strip_strings_and_comments(dl.raw) before evaluating the regular expressio=
ns?

> +            yield (dl.lineno, 'extra whitespace before ;')
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
> +        if re.search(r'(\s\s+|\t)=3D', dl.raw):
> +            yield (dl.lineno, 'extra whitespace before =3D')
> +        if re.search(r'=3D(\s\s+|\t)', dl.raw):

[Severity: Medium]
Similarly, will this strict check also trigger false positives on strings
that intentionally contain multiple spaces, such as
compatible =3D "vendor,device  v2";, because dl.raw retains the unstripped
string content?

> +            yield (dl.lineno, 'extra whitespace after =3D')

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-n-dts-styl=
e-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com?part=3D10
