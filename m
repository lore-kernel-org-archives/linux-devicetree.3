Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7211D11CAF
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 00:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778630562; cv=none; b=dqkhE7CziaQoWmlZrweHm1jBRip6EzLwQRWvZS1dahCofqFstmplyIVzlqa5v3mJkwBOpQNsD4G4sQyv0um0u8GVgN+KK1tuzQt4r88rKBaLIqJ4EiSc/boe99PHMq4kzyqkr+dkckYSpm0tGG49g6HJ+HtowSAMy2zxNyBJWvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778630562; c=relaxed/simple;
	bh=Mo1ru3vT0K+Kg6LOcXZdloxqk5zTx1qmQgQF76Fk4QI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U9GCx6ybL+QQTNpl9qo7JRlYH1nWYeojELr3XG8Kqm1U5oz+jlpWDWu94rpTJ+RFR9toyOBp603K7m+AqZAbSei7Whtvl6wycwVTQDkPwyBmbhj5k/NAeo9m6lCGhZq2kHFAWaJqjuqdssS9c1aZ5VQdkgP5uegKSJlXkYmk1Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LPjgTWsN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LPjgTWsN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0482C2BCB0;
	Wed, 13 May 2026 00:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778630562;
	bh=Mo1ru3vT0K+Kg6LOcXZdloxqk5zTx1qmQgQF76Fk4QI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=LPjgTWsNv2jh+nF9ILC6i0BAVZdeNIGeZ9HQImm/5fC9XU7etrvyR7mKNe2T1dyPA
	 H/9fNlDPi9bYFirUdvaKdyIIv+3T3lYfBXcQfYO4yafEx3lGsK0N/XU0+vQaNWEol7
	 Blm3rOJBNuZjnsyigKd9/Yd5pJUMfZ3Q2GRaaQCqRoASLgVxRsOfCdNuSRbb5DB8A2
	 o5ck46nwhXLGqccj92hxJIe/n/Y56tATZQSC65RBoDk/w1a9Qmpw+qK8j3uviosg4M
	 bWijhyz0/zrJqu5S/hwIPAcolz3LO69dnE4y7YqfQJ1HET4pVIbVvvwLTRi9v8Wmtd
	 FbpYocKgNCJyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] clk: renesas: rzv2h-cpg: Use per-SoC PLL reference
 frequency for calculations
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511191910.1945705-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260511191910.1945705-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 00:02:41 +0000
Message-Id: <20260513000241.D0482C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] On 32-bit architectures, the calculation `output +=3D p.k * input_=
fref;` performs an incorrect zero-extended addition when `p.k` is negative,=
 corrupting the PLL calculation.
- [Low] The newly added `input_fref` field is documented as being in MHz, b=
ut the code initializes and expects it in Hz.
--

commit a6beaf951f9f846b0e14a16acf1b5de978587208
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

clk: renesas: rzv2h-cpg: Use per-SoC PLL reference frequency for calculatio=
ns

This commit modifies the rzv2h-cpg driver to use a per-SoC PLL reference
input frequency instead of a hardcoded 24MHz constant. It adds an
input_fref field to struct rzv2h_pll_limits and updates the PLL parameter
calculations to use it.

> diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-=
cpg.c
> index f6c47fb89bca5..cd990dc10fa96 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
[ ... ]
> @@ -330,9 +331,9 @@ bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits=
 *limits,
>  					continue;
> =20
>  				/* PLL_M component of (output * 65536 * PLL_P) */
> -				output =3D mul_u32_u32(p.m * 65536, RZ_V2H_OSC_CLK_IN_MEGA);
> +				output =3D mul_u32_u32(p.m * 65536, input_fref);
>  				/* PLL_K component of (output * 65536 * PLL_P) */
> -				output +=3D p.k * RZ_V2H_OSC_CLK_IN_MEGA;
> +				output +=3D p.k * input_fref;

On 32-bit architectures, does this calculation perform an incorrect
zero-extended addition when p.k is negative?

Since p.k is a signed 16-bit integer (s16) and input_fref is unsigned long
(32-bit on ARM32 architectures), negative values of p.k might get promoted =
to
a 32-bit unsigned integer before multiplication.

This would yield a 32-bit unsigned result. When added to the u64 output
variable, this result would be zero-extended to 64 bits instead of being
sign-extended, adding a large positive value rather than subtracting the
frequency offset.

While this existed prior to this patch, replacing the RZ_V2H_OSC_CLK_IN_MEGA
constant with input_fref maintains the same integer promotion behavior.

Could p.k be explicitly cast to a signed 64-bit integer here?

>  				/* Make it in mHz */
>  				output *=3D MILLI;
>  				output =3D DIV_U64_ROUND_CLOSEST(output, 65536 * p.p * divider);
> diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
> index c360df9fa735c..402bfeaffdfc4 100644
> --- a/include/linux/clk/renesas.h
> +++ b/include/linux/clk/renesas.h
> @@ -53,6 +53,8 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 div=
ider, int target) { }
>   * various parameters used to configure a PLL. These limits ensure
>   * the PLL operates within valid and stable ranges.
>   *
> + * @input_fref: Reference input frequency to the PLL (in MHz)

This isn't a bug, but is the documentation correct about the unit being in =
MHz?

Looking later in the diff, the field appears to be initialized in Hz:

[ ... ]

> @@ -156,6 +160,7 @@ struct rzv2h_pll_div_pars {
> =20
>  #define RZV2H_CPG_PLL_DSI_LIMITS(name)					\
>  	static const struct rzv2h_pll_limits (name) =3D {			\
> +		.input_fref =3D 24 * MEGA,				\
>  		.fout =3D { .min =3D 25 * MEGA, .max =3D 375 * MEGA },	\

It seems the field is initialized and expected in Hz (24,000,000 Hz) rather
than MHz. Should the documentation be updated to state (in Hz) to match the
implementation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511191910.1945=
705-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D1
