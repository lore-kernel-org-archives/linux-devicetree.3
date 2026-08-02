Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BF82BD587
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 08:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785660979; cv=none; b=atV/m1PC4YRUtg1eHTUww7XOhYMebSaWX+wvBfcDUZ/c5Y5pIvPqQoTZnZthyqMi8/gxMELHNVrTgDaH7juPdDQwj6yT5qZ6Ekj2C4XPeHGG+wHTye+yF8sgoJQ0X8TjCrlYxcjfH/5B2Zb+Rik5KhGl0udN8xk5dwi879vFfFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785660979; c=relaxed/simple;
	bh=V5Pt47FU6oI2Efrpxba/dhETprwuvpNQhIdtjDsHC7g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZBAD1IbSiedNrawgqJFkNbRqF3nBzQAWVsKMJghINSK1Jazn3w2Dcn4KQHdKEgY300ClTzVRLWrF0jbZqC/8oZAMjYWM4AbqaN9g0pkkZGAF6SviHUjZ8lsMrH155/AnKeYtqE0cgIfiAI1Obne/uL2vywORcAwlpugYLdGEGwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K0RooIps; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K0RooIps"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD711F00AC4;
	Sun,  2 Aug 2026 08:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785660978;
	bh=c6mE05gInkP+5sqCtpcDYieXtfHg4D1dfdRueuhd0uY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K0RooIpsxi17JM1Inhu2iGHNE24yXIy9ExLXJ0yaAuqFsElcaEKdEq+fMNEM1GHhb
	 MHW2MPXfLIkOzZH2uP1ok5iUTAJaBjClBZCOo+XPwfDOZyPLTXeTfQtxjoh3orSUg6
	 yh58te5lqbDg+PNIEnw8ncjzi27ufhpDRYMFYIx0x6juP4Ryq0hdgNqrq1frYi6cxF
	 7bR8yXS/SV1A5EkuvgzA8HOHKanLB0Me5fUVrQhf10emiA0hX3kcsK4xbJgCbgVO6/
	 hU8k0Si7TzWJDzX8ckVBT2eBFef165x3C8GsGz4a6VifPc+jYvvU5CzeF5pR2AzvPv
	 GMLOUK587oZEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/11] dtc: dt-check-style: Fix alignment of values
 in continued property lines
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260802-n-dts-style-checker-continued-v2-6-6c5dbd1ccfe4@oss.qualcomm.com>
References: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
 <20260802-n-dts-style-checker-continued-v2-6-6c5dbd1ccfe4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 08:56:17 +0000
Message-Id: <20260802085617.BDD711F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Continuation alignment check incorrectly treats valid top-level =
elements like closing brackets (`>`) and array openers (`[` or `/bits/`) as=
 inner values, causing false positives on properly aligned device tree code.
--

--- Patch [6]: [PATCH v2 06/11] dtc: dt-check-style: Fix alignment of value=
s in continued property lines ---
commit de051474019f5f4a78cb7dedef4cd8e6a02500cf
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Fix alignment of values in continued property lines

This commit updates the device tree style checker to enforce different
alignments for property continuations depending on whether the continuation
starts a new phandle or continues an existing inner value.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index 04247e39a78e3..cb3cdfda5e739 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style

[ ... ]

> @@ -942,15 +943,20 @@ def check_continuation_alignment(ctx):
>              continue
>          # First '<' or '"' after '=3D'
>          rest =3D dl.raw[eq + 1:]
> -        m =3D re.search(r'[<"]', rest)
> +        m =3D re.search(r'\s*([<"])', rest)
>          if not m:
>              continue
> -        target_col =3D _display_col(dl.raw[:eq + 1 + m.start()])
> +        target_col =3D _display_col(dl.raw[:eq + 1 + m.start(1)])
>          for cont in dl.continuations:
> -            if _display_col(cont.indent_str) !=3D target_col:
> +            target_offset =3D 0
> +            err_msg_explanation =3D 'to < or "'
> +            if not re.match(r'[<"]', cont.stripped):
> +                target_offset =3D 1
> +                err_msg_explanation =3D 'to the value under <'

[Severity: Medium]
If a multi-line property continuation begins with characters like >, [,
or / instead of < or ", this logic applies target_offset =3D 1.

This seems to force closing brackets and array openers to indent to the inn=
er
value rather than aligning with the opening bracket, which could produce
false-positive linting errors on valid device tree formatting.

Does this regex incorrectly treat top-level structural characters as inner
values?

> diff --git a/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts b/scri=
pts/dtc/dt-style-selftest/good/dts-cont-align.dts
> index 36fb4eefcd83b..1a1c07c09a415 100644
> --- a/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
> +++ b/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts

[ ... ]

> @@ -18,9 +18,12 @@ interrupt-controller@10000 {
>  		interrupts =3D <1 2 3>,
>  			     <4 5 6>,
>  			     <7 8 9>;
> -		pinmux =3D <
> -			 0x01
> -			 0x02
> -			 >;
> +		pinmux =3D <0x01
> +			  0x02>,
> +			 <0x03
> +			  0x04>;

[Severity: Medium]
Since > isn't matched by the [<"] pattern in check_continuation_alignment,
it seems the tool might now incorrectly flag properly aligned closing brack=
ets
as a style violation if they are on a continuation line.

Was this previously passing test case removed because the new regex fails on
the standalone > character?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-n-dts-styl=
e-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com?part=3D6
