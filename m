Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36154401A26
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 15:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538989; cv=none; b=CQLjQFAojhETwT4XR7dWfilZdbnuCEtHrtjTL9HBePMO/EzrcoA4abS0cKBEYNNHvW9R/qrABSQ/g4hNhqdDvvstqmNKnNImoZzq11IkbNL0o/2qTtjDksgExvlvm50Ap4RDCD1taR8xmIdVSQDibjjTM6uXOGJv3RFJNH8RdmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538989; c=relaxed/simple;
	bh=igqIDQMs9yz1ATD7by4joA4LQGwOJphDAZYkLwMEQJQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lwtThEC0yeoLn7+5Td8rZDqH6jOPfrtjoaYFPw+dX77dlI1cVgzUWbOD7KCX4LziLEYCw9fT5CwSxprsqWeDMy1DjxzqwQccsad0FZfvE/Kj951hNh2JR1Q2xI5i1acA/47sVOOgiUWGDyz0zmoqcT8kpOHnwc202H0aebkiwRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LKKz+EME; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LKKz+EME"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971971F000E9;
	Mon, 15 Jun 2026 15:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781538987;
	bh=D8FoPZlpjFw3fO4irJheDGaOjHrvNBNe7wH+BIFnzyk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LKKz+EME1itcSRFS7gVComhnF08LT+SexNdlNhxNTSQFCh5nSZiRpNkvYHRlU6fI4
	 rANdGXQi5hNFnt4zl2umTD2wKKd21GJ7Iz5hVx4n6mIUWxus6ylAAhKVLEw5Uz+ZD1
	 epBH7sCMalGQaJtBQnvDfqUaJ02UhHn9a1aUzBxRpSfLian/u4/WsxsEZqGjFONWl1
	 ALWdQn++S4LCrTDNWZzRqI/QSuVo7krwEfnzTxkq00l6NvosQbcqWeYy92x5bnXDp+
	 KNCoz7bQS6/r32v4Sg5kBdcB4Af2lBsyd1cgITf4NQXheBqUqRLIuYPR3YVnu3Im70
	 PAMkXXDZS/ndw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/12] dt-bindings: rtc: renesas,rzn1-rtc: Add RZ/T2H
 and RZ/N2H support
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org
In-Reply-To: <20260615154805.1619693-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615154805.1619693-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 15:56:27 +0000
Message-Id: <20260615155627.971971F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding schema enforces a non-existent `timer` interrupt for=
 the new RZ/T2H and RZ/N2H SoC variants.
--

commit be9b5c77c196688e72ded5e0e7c0ff1038239897
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

dt-bindings: rtc: renesas,rzn1-rtc: Add RZ/T2H and RZ/N2H support

This commit adds compatible strings for the RTC block on the Renesas RZ/T2H
and RZ/N2H SoCs. It notes that these variants do not implement the RTCA0SUBU
and RTCA0TCR registers and updates the binding schema to require additional
clock inputs.

> diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml =
b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> index 1860f0e4c31a2..ea7b039a91e77 100644
> --- a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml

[ ... ]

> @@ -54,6 +58,23 @@ required:
>    - clock-names
>    - power-domains
> =20
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,r9a09g077-rtc
> +              - renesas,r9a09g087-rtc
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +        clock-names:
> +          minItems: 2

[Severity: Medium]
The commit message mentions that these new SoC variants do not implement the
RTCA0TCR (Timer Control Register). Does this mean the hardware also lacks
the timer interrupt?

If the timer interrupt is not present on these variants, should this
conditional block also relax the interrupts and interrupt-names constraints?
The base binding expects three interrupts (alarm, timer, and pps). Without
an override here, won't device tree validation fail for accurately described
hardware that omits the timer interrupt?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615154805.1619=
693-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D1
