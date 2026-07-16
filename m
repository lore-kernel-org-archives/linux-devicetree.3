Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4C23F4DFC
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222490; cv=none; b=GtZL00XItdaltH/j1mQc8cNExHPlomwURQ3Pv2vUZlMtp6Ea55/+m6sqp6WhtRfcczQe/O3NI4WY4gB6nRRphyznPzNHNDsTNp0TB9eKY3NZvhD8KF2ILH7GnV6rxp/o028fiL1o2I5ng1Pwl1M7iW//J6eycI7zU93dkuulwyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222490; c=relaxed/simple;
	bh=yBhbLCplZwVp6P/R0us0TVe8V8oLJfjmK/4tUKDEsqs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dlhvJslVml1eaRIIyrFG0Ei8tsqCSnOEyINl70qlszwnWnn7Lw3CxlEZe6eQCMHOIoGVb2EhoLdVzUXBha/DVqqrD0w4gMsc5TnRR2r64+UiQ/FlD9sNqBeaRs+1U9v856n+Z48s4wxfCNOZ7Z7ya6g/jFsW1u4IFkBT2ZCsjnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RO+LR9uV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RO+LR9uV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6910F1F000E9;
	Thu, 16 Jul 2026 17:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784222488;
	bh=fRxXyn86qdWN+65VIuFEEEFnrSq6Nl+KB3KQ36ydTU8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RO+LR9uVhLtJU9dlKiUGUGRTlbVlPpczyDuwLWnTMwSaT/q3y+iJ28BQBxaRqC2qZ
	 9Xd2XDnQoKegy33pAJF2f+Dr1TlHxgDpWNFdUB0yCzdemDiW3W/l6vOOe99gOAIoxP
	 wJ4R6L047MjoVmXgiFlZTB93581IUT4qIH5E7XtHF7KoMTohP6nNDOEmHgVuqSPYpR
	 OA6XLeWXpulhMilyZ3mIYO3QRgMt4J3dwt15nYALLeko6se8nM1FF+xyTHWcWUeMvf
	 EUqQrzLJ5pVvNoyj6dzXEiQvTX82oURRwI3UvXqgdOQJoxvL2rYmIi9c+gS/isrDNS
	 ZPouy8rKQgXCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: samsung: Add Exynos9610 CMU
 bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandru Chimac" <alex@chimac.ro>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260716-exynos9610-clocks-v2-1-c13ce8ef1861@chimac.ro>
References: <20260716-exynos9610-clocks-v2-0-c13ce8ef1861@chimac.ro>
 <20260716-exynos9610-clocks-v2-1-c13ce8ef1861@chimac.ro>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 17:21:27 +0000
Message-Id: <20260716172128.6910F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Clock IDs for CMU_CMGP muxes and dividers overlap, reusing IDs 0 t=
hrough 6, causing ID collisions.
- [Low] Incorrect header file referenced in the YAML binding description.
--

--- Patch [1]: [PATCH v2 1/5] dt-bindings: clock: samsung: Add Exynos9610 C=
MU bindings ---
commit 23fcebc1c69a1cfdcd9b3f745d13b2ff694b6b10
Author: Alexandru Chimac <alex@chimac.ro>

dt-bindings: clock: samsung: Add Exynos9610 CMU bindings

This commit adds the device tree binding documentation for the Exynos9610 c=
lock
controller. It defines the compatible strings and properties for various cl=
ock
management units, and introduces the corresponding header file with clock I=
Ds.

> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos9610-c=
mu.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos9610-cmu.ya=
ml
> new file mode 100644
> index 0000000000000..4406c25545229
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos9610-cmu.yaml
[ ... ]
> @@ -0,0 +1,335 @@
[ ... ]
> +description: |
> +  Exynos9610 clock controller is comprised of several CMU units, generat=
ing
> +  clocks for different domains. Those CMU units are modeled as separate =
device
> +  tree nodes, and might depend on each other. The root clock in that roo=
t tree
> +  is an external clock: OSCCLK (26MHz). This external clock must be defi=
ned
> +  as a fixed-rate clock in the device tree.
> +
> +  CMU_TOP is a top-level CMU, where all base clocks are prepared using P=
LLs and
> +  dividers; all other clocks of function blocks (other CMUs) are usually
> +  derived from CMU_TOP.
> +
> +  Each clock is assigned an identifier and client nodes can use this ide=
ntifier
> +  to specify the clock which they consume. All clocks available for usage
> +  in clock consumer nodes are defined as preprocessor macros in
> +  'include/dt-bindings/clock/samsung,exynos9610.h'.

[Severity: Low]
This isn't a bug, but there is a typo in the header file name here. Should
it be samsung,exynos9610-cmu.h instead of samsung,exynos9610.h?

> +
> +properties:
> +  compatible:
[ ... ]
> diff --git a/include/dt-bindings/clock/samsung,exynos9610-cmu.h b/include=
/dt-bindings/clock/samsung,exynos9610-cmu.h
> new file mode 100644
> index 0000000000000..c07093bae253e
> --- /dev/null
> +++ b/include/dt-bindings/clock/samsung,exynos9610-cmu.h
[ ... ]
> @@ -0,0 +1,722 @@
[ ... ]
> +/* CMU_CMGP muxes */
> +#define CLK_MOUT_CLK_CMGP_ADC			0
> +#define CLK_MOUT_CLK_CMGP_I2C			1
> +#define CLK_MOUT_CLK_CMGP_USI00			2
> +#define CLK_MOUT_CLK_CMGP_USI01			3
> +#define CLK_MOUT_CLK_CMGP_USI02			4
> +#define CLK_MOUT_CLK_CMGP_USI03			5
> +#define CLK_MOUT_CLK_CMGP_USI04			6
> +
> +/* CMU_CMGP dividers */
> +#define CLK_DOUT_CLK_CMGP_ADC			0
> +#define CLK_DOUT_CLK_CMGP_I2C			1
> +#define CLK_DOUT_CLK_CMGP_USI00			2
> +#define CLK_DOUT_CLK_CMGP_USI01			3
> +#define CLK_DOUT_CLK_CMGP_USI02			4
> +#define CLK_DOUT_CLK_CMGP_USI03			5
> +#define CLK_DOUT_CLK_CMGP_USI04			6

[Severity: High]
Does this overlap in clock IDs cause a collision within the CMU_CMGP clock
controller domain?

Since both the muxes and dividers share the same IDs (0 through 6), it seems
one clock will overwrite the other in the provider's clock array. Will cons=
umers
requesting a divider receive the corresponding mux instead, breaking device
drivers that depend on CMGP clocks like the ADC, I2C, and USI?

> +
> +/* CMU_CMGP gates */
> +#define CLK_GOUT_CMGP_CMU_PCLK			7

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-exynos9610=
-clocks-v2-0-c13ce8ef1861@chimac.ro?part=3D1
