Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D533D5C10
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 16:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779465987; cv=none; b=YapobVIax9FP0vr08kom+zKgA6q4rNR96x1nHJGdkoNBIo4d3yBhiHwaqDMB1JyGVLfR9LAk5rYMTl2/AfXYef76fenimB4bnlGyaSeB4k+Tqt38uBZ7AUw+nALgC8YQT+KG9qYQYoYIgWb/czvgg8RUkze5IiXBnxUskgDSDuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779465987; c=relaxed/simple;
	bh=AIeyCc6w5Sprt1PQo1uQ9hWgpQy/uPFu4TrVzs6RsN8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZXVAIiRhiu0XFPcqT2A0nlNX28Mi6vv1Aj7Sg+5TzhzndtYBYr/2yVoCeRwuN2XOIO+Nb/bLWXuiw5gOcn3RguWTQgA3HaXTO27GqJchpqu4Xoy2dtjOmFxA0O6MLKHegcuQleXtlma/YExDVLWx0O4v7gFl9WjhKCYmm4gHxp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UUZEO+TA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UUZEO+TA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E87781F000E9;
	Fri, 22 May 2026 16:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779465985;
	bh=G87z8nfCEs/aWwOr2F8BZva2G85EjzeBuuhKy8ju0AY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UUZEO+TAyj3+obQLXpCDzzHP2Zexfm8rWhs2KyqfVk5xKKGTR85SLFLmyOf5iVI+i
	 vEIwuy7jKETVj7pkJ76C4b34PYEHvYWO64jQJpTvcxIKmIbULhVcS6IH7ZM/cs5qn8
	 dLap1D2P0sphiaXKRtriYdvr7DFqTKS/4AfJlf0qAT6IYrHFYIE/T31rbKzovFScBm
	 5uNTrQqwYFp9bedZSodhbInNaKhxYu71aaJP5/kUBIhB7JNUnmtLZlREgqsqoZobDS
	 pBrzV8e3mb14LtMB/Yvg1o15JOXPgHFpQzQkisthXGxy+1HPUa58BcXh0fKeYTc/Cr
	 2AG84HsqhckVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 9/9] clk: eyeq: Add EyeQ7H compatibles
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260522-clk-eyeq7-v7-9-14ad6c2c5213@bootlin.com>
References: <20260522-clk-eyeq7-v7-9-14ad6c2c5213@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 16:06:23 +0000
Message-Id: <20260522160624.E87781F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Calculations for PLL multipliers, dividers, and accuracy in `eqc_p=
ll_parse_jfracr` suffer from severe truncation and overflows on 32-bit plat=
forms.
- [High] The PLL parsing functions for AINTP and JFRACR completely ignore t=
he defined post-divider configurations when calculating the clock frequency.

Pre-existing issues:
- [High] Using `readq()` to read two distinct 32-bit configuration register=
s simultaneously risks bus faults on 32-bit peripheral buses.
--

commit 2a35962c5575980a3ba602361782cb07def54c96
Author: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

clk: eyeq: Add EyeQ7H compatibles
   =20
Add the entries for the 14 Other Logic Blocks found in the EyeQ7H SoC. The
clock tree is more complex than the previous generation of SoC, as some
OLB depend on the clock output of other OLB instead of all referring to
the main oscillator.

> diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
> index 5200d5f0ff060..d55be678c597f 100644
> --- a/drivers/clk/clk-eyeq.c
> +++ b/drivers/clk/clk-eyeq.c

[ ... ]

> @@ -160,6 +196,29 @@ static void eqc_pll_downshift_factors(unsigned long =
*mult, unsigned long *div)
>  	*div >>=3D shift;
>  }
> =20
> +static int eqc_pll_parse_aintp(void __iomem *base, unsigned long *mult, =
unsigned long *div)
> +{
> +	u32 r0;
> +
> +	r0 =3D readl(base);
> +	if (r0 & AINTP_PCSR_BYPASS) {
> +		*mult =3D 1;
> +		*div =3D 1;
> +		return 0;
> +	}
> +
> +	if (!(r0 & AINTP_PCSR_PLL_LOCKED))
> +		return -EINVAL;
> +
> +	*mult =3D FIELD_GET(AINTP_PCSR_FB_DIV, r0);
> +	*div =3D FIELD_GET(AINTP_PCSR_REF_DIV, r0);

[Severity: High]
Does this calculation ignore post-dividers? The macros AINTP_PCSR_POST_DIV1
and AINTP_PCSR_POST_DIV2 are explicitly defined, but aren't used here. If t=
he
hardware is configured to output the post-divided clock, will the driver
report an erroneously high frequency to the clock framework?

> +
> +	if (!*mult || !*div)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
>  static int eqc_pll_parse_fracg(void __iomem *base, unsigned long *mult,
>  			       unsigned long *div, unsigned long *acc)
>  {

[ ... ]

> @@ -229,6 +288,60 @@ static int eqc_pll_parse_fracg(void __iomem *base, u=
nsigned long *mult,
>  	return 0;
>  }
> =20
> +static int eqc_pll_parse_jfracr(void __iomem *base, unsigned long *mult,
> +				unsigned long *div, unsigned long *acc)
> +{
> +	unsigned long spread;
> +	u32 r0, r1, r2;
> +	u64 val;
> +
> +	val =3D readq(base);

[Severity: High]
This is a pre-existing issue, but does using readq() to read two distinct
32-bit configuration registers risk bus faults on 32-bit peripheral buses?

Without explicit hardware support for 64-bit wide reads, should these
registers be read strictly using distinct readl() calls?

> +	r0 =3D val;
> +	r1 =3D val >> 32;
> +	r2 =3D readl(base + 8);
> +
> +	if (r0 & JFRACR_PCSR0_BYPASS) {
> +		*mult =3D 1;
> +		*div =3D 1;
> +		*acc =3D 0;
> +		return 0;
> +	}
> +
> +	/* Consider the PLL locked if either the phase or the frequency is lock=
ed */
> +	if (!(r0 & JFRACR_PCSR0_PLL_LOCKED))
> +		return -EINVAL;
> +
> +	*mult =3D FIELD_GET(JFRACR_PCSR0_FB_DIV, r0);
> +	*div =3D FIELD_GET(JFRACR_PCSR0_REF_DIV, r0);

[Severity: High]
Similar to the AINTP parser above, does this miss the post-dividers
JFRACR_PCSR0_POST_DIV1 and JFRACR_PCSR0_POST_DIV2 when calculating the
clock frequency?

> +
> +	/* fractional part on 24 bits */
> +	if (r1 & JFRACR_PCSR1_DSM_EN) {
> +		*div *=3D (1ULL << 24);
> +		*mult =3D *mult * (1ULL << 24) + FIELD_GET(JFRACR_PCSR1_FRAC_IN, r1);

[Severity: High]
On 32-bit platforms, mult is a pointer to a 32-bit unsigned long. Will
assigning the 64-bit result of this calculation back into *mult silently
truncate it before eqc_pll_downshift_factors() executes?

Should intermediate calculations use u64 variables instead?

> +	}
> +
> +	if (!*mult || !*div)
> +		return -EINVAL;
> +
> +	if (r2 & (JFRACR_PCSR2_RESET | JFRACR_PCSR2_DIS_SSCG)) {
> +		*acc =3D 0;
> +	} else {
> +		/* spread spectrum is identical to FRACG PLL */
> +		spread =3D FIELD_GET(JFRACR_PCSR2_SPREAD, r2);
> +		*acc =3D DIV_ROUND_CLOSEST(spread * 1000000000, 1024 * 2);

[Severity: High]
If spread is larger than 4, will spread * 1000000000 overflow a 32-bit
unsigned integer native calculation?

Should this use 1000000000ULL and DIV_ROUND_CLOSEST_ULL to prevent
truncation and incorrect clock rates?

> +
> +		if (r2 & JFRACR_PCSR2_DOWN_SPREAD) {
> +			*mult *=3D 2048 - spread;
> +			*div *=3D 2048;
> +		}
> +	}
> +
> +	/* make sure mult and div fit in 32 bits */
> +	eqc_pll_downshift_factors(mult, div);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-clk-eyeq7-=
v7-0-14ad6c2c5213@bootlin.com?part=3D9
