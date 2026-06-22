Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFB03B813E
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 16:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782144349; cv=none; b=fM6uFjHnzMP3V6JepPHsQ33i/EQ95WL+FwclWQE76riDAe2LHOR1fQC9vW0kewdRlImW7eSfRkNwsr+Zy2/4z6MI6EakunHs8nPhB1uah6K2NzlqF4mkJ1AAQOV3D119whtRG5uXVqzDiktTIXbaOQJB83QumM+uGXbtGFrCNew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782144349; c=relaxed/simple;
	bh=h0bbc5aPnhglEOk7TzHjFHPZdbRW3wAPz7Tvf0BLcsE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N795DSrWzrgtQ0o1iKPVio46pqDUvnNUcrLrzec4PDOvr4L51VBBcjZtauTHLQNaxFEpoRkuMge/6wDoMZIvH0xS+AVw6tBt/HvyqR1z4IZ+i0rfmlxSS9ckL7eJfxHSjQYZN9gZi8XXackujY88BiPU9LUIk6xB53VMODd1ENI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kdnnnXkH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kdnnnXkH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F5B1F000E9;
	Mon, 22 Jun 2026 16:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782144348;
	bh=T/AXlZWD30fYRKIW0uRi/rHVonLT11yPuuM0o6V63b4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kdnnnXkHKSpeXJm80tGyd9x7H4M8RRD1Gm0mhJSwtzbdQjeB9hWSM9la6XW/R34BT
	 tF6/KU6soW4fVGKIEOhA1H0UnBmi5kAVf2jIwsf3Ba6+SKDHYukmXbSAQjfz/85waS
	 1OSndeOR24Vhm/Qncc9B7Dt7L28mci7s8W5DvnPF2K37hPoI5OpC0yvpK754yLRKEs
	 CU5mUkXfyftOicp9WUFOoiMbDIlQyilOnBHkgAeTZzxrBtN1xRxN+fQ9kWUFYsLkWB
	 MUS6QlAvl7itDHsUktU++Ic2q4XgByI38zTeNkOVSLDG8RHVef9PTK3+hmokQgBsEk
	 0cVec6WVGY0xg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 01/12] dt-bindings: mmc: renesas,sdhi: Document
 RZ/G3L (r9a08g046) SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: Biju <biju.das.au@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org
In-Reply-To: <20260622155610.184271-2-biju.das.jz@bp.renesas.com>
References: <20260622155610.184271-1-biju.das.jz@bp.renesas.com>
 <20260622155610.184271-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 16:05:47 +0000
Message-Id: <20260622160548.04F5B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Relaxing the global `maxItems` for `resets` and `reset-names` fr=
om 1 to 3 removes the strict constraint for legacy controllers, allowing th=
em to incorrectly define up to 3 resets.
--

commit 5bd955e3c9833c72a7847cd9926c293d95e5c927
Author: Biju Das <biju.das.jz@bp.renesas.com>

dt-bindings: mmc: renesas,sdhi: Document RZ/G3L (r9a08g046) SoC

Document the RZ/G3L (r9a08g046) SDHI controller. The RZ/G3L SDHI
controller is similar to RZ/G2L but has five clocks (core, clkh,
cd, aclk, aclkm) and three resets (rst, axim, axis), so update the
clocks/clock-names maximum to 5 and resets/reset-names maximum to 3.
It has an internal divider for all modes except HS400, and a 2048-bit
divider compared to 512 on others.

> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Do=
cumentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -116,7 +117,12 @@ properties:
>      maxItems: 1
> =20
>    resets:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 3
> +
> +  reset-names:
> +    minItems: 1
> +    maxItems: 3

[ ... ]

> @@ -155,60 +161,101 @@ allOf:
[ ... ]
> +        else:
> +          if:
> +            properties:
> +              compatible:
> +                contains:
> +                  enum:
> +                    - renesas,rcar-gen2-sdhi
> +                    - renesas,rcar-gen3-sdhi
> +                    - renesas,rcar-gen4-sdhi
> +          then:
> +            properties:
> +              clocks:
> +                minItems: 1
> +                maxItems: 3
> +              clock-names:
> +                minItems: 1
> +                uniqueItems: true
> +                items:
> +                  - const: core
> +                  - enum: [ clkh, cd ]
> +                  - const: cd
> +          else:
> +            properties:
> +              clocks:
> +                minItems: 1
> +                maxItems: 2
> +              clock-names:
> +                minItems: 1
> +                items:
> +                  - const: core
> +                  - const: cd

[Severity: Medium]
Since the top-level resets and reset-names maxItems were increased to 3, do
the conditional branches for R-Car Gen2/3/4 and the subsequent fallback bra=
nch
need to explicitly constrain resets and reset-names back to maxItems: 1?

Without overriding the top-level relaxation here, it appears legacy control=
lers
are now permitted to incorrectly define up to 3 resets.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622155610.1842=
71-1-biju.das.jz@bp.renesas.com?part=3D1
