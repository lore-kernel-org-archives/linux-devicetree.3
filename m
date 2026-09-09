Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866F53AFCF0
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 08:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788943617; cv=none; b=Nb1MHHM3Aw6SEJq00b2/RFa8aKKsTcgfYuppCUQMusTFy3K51Nqy3yvDBBz5br/j1MbprVV/eX5w4NuoHmnYaF6FcC3NBGTx1zZAZgp+mX1NYAj0IeboaEs+nDPBFSqPXrANOxB2J2hhzsND1CFBxneUcuiDzLbAhRq/nlPFVXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788943617; c=relaxed/simple;
	bh=VLtcvW+Jg6P+9+acsDRexGa+pz2Kbsi3MQRM2GmwZtw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZrpWeYcCZwBA7iEwbV+YQjkohm/SrvTUSpeTLbFY5k7RoZ2PJKJN8zAILfzmSAOEKaYcv3IrKVtxpVlxjexLyvcMwvicEkf8ADSLijkAxQe3PFZ+RaEys5pvJErK8A9tGy3ewIzep6IYJOOXNOHfIpaW+dQfVt8RqN7tWOW2eKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/feNCxO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/feNCxO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B69C81F00A3A;
	Wed,  9 Sep 2026 08:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788943615;
	bh=l5+zXiMcvP6eJPMT51PBBEr7txciTZZIlDvpI9mOI/o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M/feNCxO04SYQA1+wd8vjTzcvcWl6jBSGCPoGb99Iy/gh8gCPBz/9szTdIzBo2xnu
	 7qUOiDntkteEmwfKYaD2iieW/clcZqCgscH0cdceF0iqZwq3AsrJhS7H/QMvdMghBs
	 bmeoVc922zxEAtjDA4WzrC0AiOboleEzaCuZeajka5WrhbTYXNr+extapxaa7YazGC
	 qvVad8qb+HCmYOz7UzNfKftRkz48FUoEJ5/5BqO3Ctn9pdjs3JtcMXYmNpssA1WTJs
	 joo30vTiEVmChkUYjy0ZYFXWinX3bBoUDopWZPo9pfUF8kPx71DWrLRfgLrfqpmXGT
	 cZta6v3E78cWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/6] dtc: dt-check-style: Unduplicate checks in
 check_mixed_indent_chars()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260909-b4-dts-style-checker-continued-lines-v2-4-c5cb4c9d9b66@oss.qualcomm.com>
References: <20260909-b4-dts-style-checker-continued-lines-v2-0-c5cb4c9d9b66@oss.qualcomm.com>
 <20260909-b4-dts-style-checker-continued-lines-v2-4-c5cb4c9d9b66@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 08:46:53 +0000
Message-Id: <20260909084654.B69C81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Undocumented behavioral change in loop refactoring expands inden=
tation checks to continuation lines of unindented properties.
--

commit 89ba14f0783d8be45f1d6722eb8a627b6c4b34e4
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Unduplicate checks in check_mixed_indent_chars()

This commit splits the indentation checking logic into a separate
_check_mixed_indent_chars() helper function. The goal is to avoid
duplicating code when checking both primary lines and continuation lines.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index 4ac10cb450684..41c97d996882f 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style

[ ... ]

>  def check_mixed_indent_chars(ctx):
>      """Indent must be all-tabs, except for aligning indentation (comments
>      or continued lines)."""
>      for dl in ctx.lines:
> -        if not dl.indent_str:
> -            continue
> -        if dl.linetype =3D=3D LineType.PREPROCESSOR:
> -            continue
> -        if re.search(r' \t', dl.indent_str):
> -            yield (dl.lineno, 'mixed tabs and spaces in indent')
> -        if dl.indent_str.count(' ') > 7:
> -            yield (dl.lineno, 'too many space characters in indent (more=
 than 7)')
> +        yield from _check_mixed_indent_chars(dl)
>          for cont in dl.continuations:

[Severity: Medium]
Does this unintentionally alter the script's behavior for unindented
properties with multi-line continuations?

Previously, if a line lacked indentation, the outer loop would hit a contin=
ue
statement, entirely skipping the evaluation of dl.continuations for that li=
ne.

With the new _check_mixed_indent_chars() helper, an early return inside the
helper simply finishes checking the primary line, but execution then procee=
ds
to evaluate dl.continuations in the outer loop anyway. While scanning these
continuation lines might be desirable, it silently expands the style checke=
r's
scope in a commit presented as a pure functional no-op.

> -            if not cont.indent_str:
> -                continue
> -            if cont.linetype =3D=3D LineType.PREPROCESSOR:
> -                continue
> -            if re.search(r' \t', cont.indent_str):
> -                yield (cont.lineno, 'mixed tabs and spaces in indent')
> -            if cont.indent_str.count(' ') > 7:
> -                yield (cont.lineno, 'too many space characters in indent=
 (more than 7)')
> +            yield from _check_mixed_indent_chars(cont)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-b4-dts-sty=
le-checker-continued-lines-v2-0-c5cb4c9d9b66@oss.qualcomm.com?part=3D4
