Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDFE3FE641
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 11:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781003719; cv=none; b=Sz4CPyfWqXtQsxjOsHkmkI9oOJ8EEdA2i5h1CL7idxmwDZVVPhHr5mfuadrJ4sI2RrMAy71pMDPParLdVIXTudH4cnzr1MT7pKCSnq9HDohLoPPRWFnlmgS97bxzO/lg4bvaYBFPDdxqE+HE4slxGSkMn+oaNm8Qc4ANfH3R/Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781003719; c=relaxed/simple;
	bh=4EkxfEfmLFUMA8xLnD4QUlk+qEVUBV2uRoce5dM5Gdo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b/VTIugjpvMZ4dfHSpEOUBHO65IkCj8CP4tLRBiFNrGjEYEF8geETDx8jFUBXUJTfmF3rcqDStpgKGrXPERiATxi4KQ8VKwhwbRuMh0y1xNFeVmXeecU6VuP8H2ZArtROGZV/qlxou/d8QVkWjO2bAc3AyLTWpoKyJGtx0ZtPSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WAA26i5B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WAA26i5B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC111F00898;
	Tue,  9 Jun 2026 11:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781003718;
	bh=kDd5Y9W22pzd4wkYCJ1ZkOveYBOaeCFoasD/toVQx+U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WAA26i5Bz4qIcEPjzI2b7OMJoyr05SRg7PK0DgmgZFyevdBpY4IJm01ieIB2wSZUq
	 UfeMVKi8FzBhMxgZx7pBMTRdOcd794W6Dgnx4XDNbzYa4ESpDMhvpOHwB4H0Z3wt0L
	 0lgvw8hx8SkBY0ch4XPnc7j5A28iykFcgZml/nlmeGhf3gfBTS+2LEd4uCsnXKVyUT
	 +zIkRlsu23IMzUauZvMmCyAMEWLNeWhdea6fo8eayF4nKJFcjSiObw2sxZgtNbCvD+
	 u33KvPbFRRX+DPaMMQE8N56UhfG00uC4C4gi/a8GAKHWXZKkeoyP2bp89g1uGVkE3t
	 ppGiHLgu6l/tA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] clk: renesas: rzv2h-cpg: Use per-SoC PLL
 reference frequency for calculations
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org
In-Reply-To: <20260609105924.962573-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260609105924.962573-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 11:15:17 +0000
Message-Id: <20260609111517.CEC111F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The newly introduced `input_fref` field in `struct rzv2h_pll_limits=
` is explicitly documented as expecting a value in MHz, but the implementat=
ion treats it strictly as Hz.

Pre-existing issues:
- [High] On 32-bit platforms, the fractional PLL calculation `p.k * input_f=
ref` silently overflows and undergoes incorrect zero-extension, leading to =
severely incorrect frequencies.
--

commit 296b80de7b99b08d8c347f40aa51a8cb9a19cd69
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

clk: renesas: rzv2h-cpg: Use per-SoC PLL reference frequency for calculatio=
ns

Introduce a per-SoC PLL reference input frequency parameter to avoid
relying on a hardcoded 24MHz constant during PLL configuration math.
This abstraction permits the reuse of the common PLL divider logic on
newer SoC platforms like the RZ/T2H, which feature a 48 MHz PLL reference
clock input instead of the 24 MHz signal used by RZ/V2H(P).

> diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-=
cpg.c
> index f6c47fb89bca5..513f8283c4796 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

[ ... ]

> @@ -330,9 +330,9 @@ bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits=
 *limits,
>  					continue;
> =20
>  				/* PLL_M component of (output * 65536 * PLL_P) */
> -				output =3D mul_u32_u32(p.m * 65536, RZ_V2H_OSC_CLK_IN_MEGA);
> +				output =3D mul_u32_u32(p.m * 65536, input_fref);
>  				/* PLL_K component of (output * 65536 * PLL_P) */
> -				output +=3D p.k * RZ_V2H_OSC_CLK_IN_MEGA;
> +				output +=3D p.k * input_fref;

[Severity: High]
This is a pre-existing issue, but does this calculation silently overflow on
32-bit platforms?

Looking at rzv2h_get_pll_pars(), p.k is an s16 which can be negative.
Because input_fref is an unsigned long, which is 32-bit on 32-bit
architectures, multiplying the signed negative p.k promotes it to an
unsigned long.

This results in a large positive 32-bit integer instead of a properly
signed negative value. Since the destination output is a u64, this 32-bit
unsigned result is zero-extended to 64 bits, incorrectly increasing the
output frequency rather than appropriately subtracting from it.

Should this explicitly cast to 64-bit to ensure proper sign extension?
For example:

output +=3D (s64)p.k * (u64)input_fref;

>  				/* Make it in mHz */
>  				output *=3D MILLI;
>  				output =3D DIV_U64_ROUND_CLOSEST(output, 65536 * p.p * divider);

[ ... ]

> diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
> index c360df9fa735c..94ee70b20b44c 100644
> --- a/include/linux/clk/renesas.h
> +++ b/include/linux/clk/renesas.h
> @@ -53,6 +53,9 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 div=
ider, int target) { }
>   * various parameters used to configure a PLL. These limits ensure
>   * the PLL operates within valid and stable ranges.
>   *
> + * @input_fref: Reference input frequency to the PLL (in MHz). If set
> + * to 0, a default value of 24MHz is used.
> + *

[Severity: Low]
Is the documentation for input_fref in struct rzv2h_pll_limits accurate?

The kernel-doc mentions this field expects a value in MHz. However, looking
at the core calculation helper rzv2h_get_pll_pars(), the code expects this
to be in Hz.

If a driver author sets input_fref to 48 (following the MHz documentation),
the ternary operator in rzv2h_get_pll_pars() evaluates to 48 instead of the
24MHz fallback:

unsigned long input_fref =3D limits->input_fref ?: (24 * MEGA);

This results in an input frequency of exactly 48 Hz, which would cause
subsequent fvco bounds checks to fail.

Could the documentation be updated to clarify that this field expects the
frequency in Hz?

>   * @fout: Output frequency range (in MHz)
>   * @fout.min: Minimum allowed output frequency
>   * @fout.max: Maximum allowed output frequency

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609105924.9625=
73-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D1
