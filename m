Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F85477E39
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 13:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780580584; cv=none; b=aCOS61/4xqjkEddAHhlOFxtvjALV75IKhkbk/BlzRc5uPSwd/daBgKsncRtcpEFlQOxVTfkeSXWO9NpWjJDFBS4+EYM4DM45f5m/5e1RPjrdNYbEZWpiskUttYMLR1xuUSRV70DnjUirpHLMN/Lil3cqWsR/OhY+4/HQl322AJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780580584; c=relaxed/simple;
	bh=mi6s70uhVvQ/mxlejOBp/QzZESb13UbmNsov40reoLI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pLhCdrUSM2jH6ne1zsknu6anBmpZzSFvDrYtLQn5RamXWxSC8wFFN4VoZ4QIznN9XfIsKZcVwdn7DrQWG4ek35eqaoqomIpRxC5zH1dp/xH+AI8KaN2+GUysEcXzulcdYjEylNyeshzgcbL8jMBLCnzlGHxMh59lO/CtMIrdmBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DG1BvFBB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DG1BvFBB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD19F1F00893;
	Thu,  4 Jun 2026 13:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780580583;
	bh=KXtWbEO9ZGoW8wQUmHAkX4y0tqBm5WW9ZgRrvzTvNZo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DG1BvFBBrOM+USXtLSsEn6xH6y3SdK4fPuqs7UIN1syj7CTaH6V2bN9B4VjFMLV3i
	 ImPM5RaSOw/shShACMZl8R5stKHdC9ix2Qajy5vx/8T0AydVn6WjiRGydGUbSg97nb
	 ccUGuzkzu6U87ytGrM3n87N7MxYTT9Hr2fLiHflwsBLLLreZks2h7WM9KSO7vhIdFf
	 eRoJVErpjzWCGcIKpZvOAhbs8Go6hVA8Bbov6s25qQS67+awnuHd1lUlrXy475eHhn
	 JoWG2ZyBqSRNFdZ30gk0wIEHmpjYqMgmlECoHPDukvAnWC427p+PSMyU5HhtjdvowN
	 7l9anHKwiY7pQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 9/9] clk: eyeq: Add EyeQ7H compatibles
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260604-clk-eyeq7-v8-9-53f618174cf6@bootlin.com>
References: <20260604-clk-eyeq7-v8-9-53f618174cf6@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 13:43:02 +0000
Message-Id: <20260604134302.BD19F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Calculations for PLL multipliers, dividers, and spread spectrum ac=
curacy silently overflow and truncate on 32-bit architectures, potentially =
causing division-by-zero panics.
- [Medium] JFRACR and FRACG PLLs improperly override parent clock accuracy =
with 0 when Spread Spectrum is disabled.
- [Medium] Probe error path leaks I/O mapping, clock structures, and clock =
arrays.
--

commit 7c67e45031944ff1b7e739015f039ca13888eefa
Author: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

clk: eyeq: Add EyeQ7H compatibles

This commit adds entries for 14 Other Logic Blocks found in the
EyeQ7H SoC. It introduces parsing for two types of PLLs, JFRACR and
AINTP, and handles more complex clock tree routing.

> diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
> index 5200d5f0ff060..bf4a8421cfccf 100644
> --- a/drivers/clk/clk-eyeq.c
> +++ b/drivers/clk/clk-eyeq.c

[ ... ]

> @@ -229,6 +290,60 @@ static int eqc_pll_parse_fracg(void __iomem *base, u=
nsigned long *mult,
>  	return 0;
>  }
> =20
> +static int eqc_pll_parse_jfracr(void __iomem *base, unsigned long *mult,
> +				unsigned long *div, unsigned long *acc)
> +{

[ ... ]

> +	/* fractional part on 24 bits */
> +	if (r1 & JFRACR_PCSR1_DSM_EN) {
> +		*div *=3D (1ULL << 24);
> +		*mult =3D *mult * (1ULL << 24) + FIELD_GET(JFRACR_PCSR1_FRAC_IN, r1);
> +	}

[Severity: High]
This isn't a bug introduced by this patch, but do these calculations silent=
ly
overflow and truncate on 32-bit architectures?

The variables *mult and *div are unsigned long pointers, which are 32 bits
wide on 32-bit systems. When *div is multiplied by (1ULL << 24) and then
by 2048 (if DOWN_SPREAD is enabled), it evaluates to ref_div * (1 << 35).
If ref_div is 32, this becomes 1 << 40, which truncates to exactly 0.

This truncated 0 is later passed to clk_hw_register_fixed_factor_pdata(),
which can cause an immediate division-by-zero panic in the Common Clock
Framework when clk_factor_recalc_rate() divides by fix->div.

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
This is a pre-existing issue in the FRACG code duplicated here, but does
this spread spectrum accuracy calculation overflow on 32-bit architectures?

The operation spread * 1000000000 is evaluated in 32-bit math. If spread
is greater than 4, it wraps around UINT_MAX, resulting in an incorrect
clock accuracy.

[ ... ]

> @@ -339,6 +481,32 @@ static int eqc_probe_pll_fracg(struct device *dev, s=
truct device_node *np,
>  	return 0;
>  }
> =20
> +static int eqc_probe_pll_jfracr(struct device *dev, struct device_node *=
np,
> +				const struct eqc_clock *clk, void __iomem *base,
> +				struct clk_hw_onecell_data *cells)
> +{

[ ... ]

> +	hw =3D clk_hw_register_fixed_factor_pdata(dev, np, clk->name, &parent_d=
ata, 0, mult,
> +						div, acc, CLK_FIXED_FACTOR_FIXED_ACCURACY);

[Severity: Medium]
This isn't a new bug as it exists in the FRACG probe function as well, but
does passing CLK_FIXED_FACTOR_FIXED_ACCURACY unconditionally override the
parent clock accuracy when Spread Spectrum is disabled?

When the DIS_SSCG bit is set, the driver calculates acc =3D 0. By always
providing this flag, the Common Clock Framework treats the PLL's absolute
accuracy as exactly 0 ppb error. This wipes out and fails to inherit the
parent clock's natural accuracy, which could break downstream consumers
that rely on accurate tolerance reporting.

[ ... ]

> @@ -411,6 +579,22 @@ static int eqc_probe(struct platform_device *pdev)

[Severity: Medium]
This is a pre-existing issue in eqc_probe(), but does the error path leak
resources?

At the end of eqc_probe(), if of_clk_add_hw_provider() fails, the function
returns directly without unmapping the I/O memory from ioremap(), freeing
the cells array from kzalloc_flex(), or unregistering the previously
initialized clocks.

Because the clocks are registered with clk_hw_register_fixed_factor_pdata()
(which bypasses the devm_ auto-cleanup wrapper), failing to unregister them
manually leaves orphaned clock objects in the system.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-clk-eyeq7-=
v8-0-53f618174cf6@bootlin.com?part=3D9
