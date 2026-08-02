Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068483914E0
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 08:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785660894; cv=none; b=Yuh6Y9QBLlVtZA8DMPwW6VdH96WAIf/s55FXRd0KPkUyEJztoELuHB6/ADU5lrhlOflh1Sk5zbYfbKfHNfdc/IbhQ97E+8qdqwrn6zSt+j2XNQsxlDevcDbOSx6+nS2EhoB9xbHO7QJPBmrGfweXzzKjv++PAyseMm5dLeK3coc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785660894; c=relaxed/simple;
	bh=vEiSfGneDELRwoWiVCNEQFtQpPLrSKxviey6fV+aoxY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WZWiTUn5Q4WaZncNu0QSdg7wT9YUlGb8Lj1z1VzgtVOhtvbJzmD0LJjFHanyO8zm3Ghxc8U2ynNfKZiY7iigR8jEeO0cNVTzKzZy3A3Ux8hT2oQg0qe/wlSy9hOOv8DAspT5U3+13dyYqpFD+KgPqIZGCPF/8mr+wZIOmTEb/VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ORewW6CU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ORewW6CU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9109E1F00AC4;
	Sun,  2 Aug 2026 08:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785660891;
	bh=PnDLA7ygyCOGEmuMKFng/xJbMVf02HOGIG48zMuk+Fs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ORewW6CUFXb+TXfm/cjknk0Es8D68MhN0Aomkn8Kuh6O1u40NQidsEuJejTYtEDN4
	 ggEr9znWyPF56ssxCl92DlfDUBqHHZJ9OeVUatccDG5wPbBfkd3W8AkDTAfRwtYI4y
	 ZnnZu3rF2psYXL/rA3x0L4G3tAWBHIIK85AukEzit+KkGKUGBRnDcG8MyGxL9FtfgW
	 uSarn534pawA9RfFamj4F1A5aHQmCBiVvLdK7ZBzdRf1X6qiivVDy2LcuWr8LeCiCZ
	 tI/QSQBwqFTDs+ak2Ynep/TNFBKLEgWOgvDOOUtEJGn5GYwcIhIhUKr3m2xNHEqCA3
	 M0egnBkmiXSQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/11] dtc: dt-check-style: Add warning for redundant
 white-spaces
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260802-n-dts-style-checker-continued-v2-10-6c5dbd1ccfe4@oss.qualcomm.com>
References: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
 <20260802-n-dts-style-checker-continued-v2-10-6c5dbd1ccfe4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 08:54:51 +0000
Message-Id: <20260802085451.9109E1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Redundant whitespace checks evaluate raw text without stripping =
string literals and comments, causing spurious warnings on valid syntax.
--

--- Patch [10]: [PATCH v2 10/11] dtc: dt-check-style: Add warning for redun=
dant white-spaces ---
commit 9dee972d11110f1e641562b1a539ae177f4a7331
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: dtc: dt-check-style: Add warning for redundant white-spaces

This commit adds warnings to the dt-check-style script for redundant
whitespace around '=3D', before '{' and ';', or when using tabs for these.
It introduces both relaxed and strict modes to handle existing trees.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index 56d8d0c217f20..6512cf5cfddec 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style

[ ... ]

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
Will these regex checks incorrectly flag valid whitespace within string
literals or inline comments?

Since dl.raw isn't stripped of strings or inline comments, a line parsed as
a PROPERTY with a string like:
    bootargs =3D "console=3DttyS0 quiet  ; "
or an inline comment like:
    prop =3D <1>; /* foo  ; */
would trigger a spurious warning here.

Should this use a stripped version of the line instead of dl.raw?

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
Similarly, does checking dl.raw directly here cause false positives for
lines containing strings with extra spaces around '=3D'?

For example, a valid property like:
    args =3D "a  =3D  b"
would match these strict regular expressions.

> +            yield (dl.lineno, 'extra whitespace after =3D')

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-n-dts-styl=
e-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com?part=3D10
