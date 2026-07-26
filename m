Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E3624DD17
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785081294; cv=none; b=DWizZWp8w3QYHyFJBtF7tbsJ4TQFTBGqoMI18zWwFHgEHAWekPbMriQLcuNF2FB4iWA9iiROmj6Rgk997ACX/QPcg3JNUvQUbIIr1VbwgDqkBgYUqszvkSgvq2p271LBl0kJom190za81c0eVARYOJfydB/TZZuainrYkthHe3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785081294; c=relaxed/simple;
	bh=f8NWiWzNtd0IWNRK06gIqtw0fiYEMKk1ZDxW9gbcvzI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tauA36WUYUvkTTm6m99Xj7UrdBJ4WRximhC3Ws87+nIyI+TMFCiinUfzgI3gH+Hn+2cOb1ke8sArXR0Pn0KwI9D1GI4RydE1jkxESU7VEC9QJuCdooZxoGpT/G880ROx8xOkZttTX0lzTo9DmGoFR54dQ9jU6ZKgNpKKBUIKlzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hOiEOOGa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hOiEOOGa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC6A1F000E9;
	Sun, 26 Jul 2026 15:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785081292;
	bh=bUEFWM2jI3+SkMgl9WcYoJPsrT0lDvWDsT1HGJDNTbU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hOiEOOGakY5F4J4+5CDK7qDkepEzaLNj1Ivki0c6ARn0ob/mOpbRQDzndUa+DdJAa
	 YcjU6sDVhQc8RobJIPMUH6AUp1+my0C4GCwxnvoVVoW52aX4Fp7EdvouYeIXG3MpIT
	 QoS+BaIf9dYTFbCc5pqhBsJwv19hf07hcGON8gPGSRIKI9wSRD7rvX8X2/8lmb0Jxw
	 NUStzvo70EhANS24hkwmrQHnnTXt0pdrxazAkTiqU2B2J3wtZAaqcoN86Hc1Xv0w/8
	 scYgnCu/u+bn4Nod5gE5akqEcJhDxmDDdXUiteRtg4AJcN0tp/kZJ0nd1MDHp7smO+
	 AwMMJ2VhfEfgg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 8/9] dtc: dt-check-style: Introduce 'stricter' mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260726-n-dts-style-checker-continued-v1-8-b05b8f897670@oss.qualcomm.com>
References: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
 <20260726-n-dts-style-checker-continued-v1-8-b05b8f897670@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 15:54:51 +0000
Message-Id: <20260726155452.5BC6A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Missing trailing commas in `applies_to` arguments cause them to =
be evaluated as strings instead of tuples, breaking the `--list-rules` outp=
ut formatting.
- [Low] Misleading documentation for `Rule.mode` claims dictionary support,=
 which would crash the script.
- [Low] Copy-paste error in the header comment of the `dts-line-length.dts`=
 test fixture.
--

--- Patch [8]: [PATCH 8/9] dtc: dt-check-style: Introduce 'stricter' mode -=
--
commit 2b6676a210ee00e188dac94bab5f81848b3977f1
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Introduce 'stricter' mode
   =20
Two rules, which are enabled in 'strict' mode make little sense for DTS:

1. line-length, limiting length of line to 80 characters: DTS often has
   a bit longer lines, especially for interconnects or heavily nested
   opp-level.  Checkpatch already does not warn for exceeding 80
   characters.

2. unused-labels, discouraging unused labels in DTS or YAML (not DTSI or
   DTSO): while not harming this leads to many false positives, e.g.
   unused PMIC regulators in DTS.

Introduce another 'mode' of running beside existing relaxed and strict:
a 'stricter' one where these two rules are moved for DTS.  Intention is
to have in-tree DTS passing 'strict' mode.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index 8c049c04b865c..7e1d80ceab780 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style

[ ... ]

> @@ -332,7 +334,8 @@ class Rule:
>      def __init__(self, name, mode, description, check,
>                   applies_to=3D('yaml', 'dts', 'dtsi', 'dtso')):
>          self.name =3D name
> -        self.mode =3D mode               # 'relaxed' or 'strict'
> +        # 'relaxed', 'strict', 'stricter' ordictionary mapping file_type=
 to mode
> +        self.mode =3D mode

[Severity: Low]
This isn't a bug, but is there a typo ("ordictionary") in this comment?=20

Also, if a dictionary were actually passed for mode based on this comment,=
=20
wouldn't it cause a crash in select_rules() with a TypeError? The rank=20
dictionary expects r.mode to be a hashable type rather than a dict.

[ ... ]

> @@ -1042,20 +1045,27 @@ RULES =3D [
>           check_node_close_alone),
>      Rule('line-length', 'strict',
>           'lines must not exceed 80 columns',
> -         check_line_length),
> +         check_line_length, applies_to=3D('yaml')),

[Severity: Medium]
Will python evaluate applies_to=3D('yaml') as a string rather than a=20
single-element tuple because it lacks a trailing comma?

It looks like this causes the --list-rules output to iterate over the=20
characters of the string instead, resulting in [y,a,m,l] when applies_to=20
is consumed by ','.join(r.applies_to) in main().=20

Could a trailing comma be added like ('yaml',) to ensure it is treated=20
as a tuple? This same issue seems to apply to the other single-element tupl=
es=20
added below for applies_to=3D('yaml') and applies_to=3D('dts').

> +    Rule('line-length-dts', 'stricter',
> +         'lines must not exceed 80 columns',
> +         check_line_length, applies_to=3D('dts', 'dtsi', 'dtso')),
>      Rule('continuation-alignment', 'strict',
>           'multi-line property continuations align under "<" or "\\""',
>           check_continuation_alignment),
>      Rule('unused-labels', 'strict',
>           'every label must be &-referenced in the same example/file '
>           '(skipped for .dtsi/.dtso since labels there are exported)',
> -         check_unused_labels, applies_to=3D('yaml', 'dts')),
> +         check_unused_labels, applies_to=3D('yaml')),
> +    Rule('unused-labels-dts', 'stricter',
> +         'every label must be &-referenced in the same example/file '
> +         '(skipped for .dtsi/.dtso since labels there are exported)',
> +         check_unused_labels, applies_to=3D('dts')),
>  ]

[ ... ]

> diff --git a/scripts/dtc/dt-style-selftest/bad/dts-line-length.dts b/scri=
pts/dtc/dt-style-selftest/bad/dts-line-length.dts
> new file mode 100644
> index 0000000000000..d1dacc5c76fbf
> --- /dev/null
> +++ b/scripts/dtc/dt-style-selftest/bad/dts-line-length.dts
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +/*
> + * Test fixture: Unused label in DTS
> + */

[Severity: Low]
This isn't a bug, but does this comment accurately describe the test fixtur=
e?=20
It appears it might have been copy-pasted from the unused-label test, since=
=20
this file is testing line lengths.

> +
> +/dts-v1/;
> +
> +/ {
> +	soc@0 {
> +		compatible =3D "simple-bus";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726-n-dts-styl=
e-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com?part=3D8
