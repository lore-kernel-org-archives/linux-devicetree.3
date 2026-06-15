Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93543D1719
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781513379; cv=none; b=m8/nvlFdYfOL/Pg1EaVHIhLAPKOpnEoxSF+PpX8gNFyyE028cNORKGHoHycT5vNOEPRLrl7vxKzhik97EhZy+Q/MA49D96XsG2vgc0QtabvxivUrvnNlLdAsN6WrDJg8hKJ/6P9vTeeqRwiB2Js98PxsmrNZct5MZ0TYabd7dNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781513379; c=relaxed/simple;
	bh=OGWwQjYp/m8Ac183IXfDepFYGyqVyPluaYAi2VN4+gg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kN+HuHInZQV/5DxsjkqK8qP/MIqVy8A6OrM+78s0jUbj7TDJILSZmaIpHYGWmZqO6H8x7wiFgG2ydJ2l/OvgTmNsONED8sfTtx0Qd1uqA2FK/kibvmVpV2GmOIKWZRmTpgc7yfxvvpFdIirT/rqHzMWwqoIPsn9mJROrfTChngk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GXOCu0df; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXOCu0df"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D93D1F000E9;
	Mon, 15 Jun 2026 08:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781513373;
	bh=/la8RhNqZVnXkoAGJYebtLERkxibsheY+y/nLa4tygs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GXOCu0dfQ3B+T2msSS0HUwSgo0VlhWYEjt/Szt+uzsuE2QQgtJtpCSNi3efIFfIJJ
	 yfpjO+tX6xp55jpwL9vUA8YFWwLi9BS3gLuk2ok86xNrAlIYYDbos8sfA53XEGRaOP
	 rO7QNvCfvwbcq7NsugkMeNL1ZOxzgH5vgPKAPS8pCfpbCy8SgGIuT4hRKcAHksqi7g
	 ug1LA6YTwQFGtzgGSb3W7R3SNO8I3tIGjt+wI8Ih5Pyk3IzW92/GRvGUzwFzmQ/82Z
	 MzUARP2kC2NjxUxfk07CRAz4givJ1vJdp8xGfeVBcm+BniG0Fu6Qfr1+ntqI3SzvL5
	 rdTJROb3h+Mmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] pinctrl: samsung: Add Exynos8855 pinctrl
 configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alim Akhtar" <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260615085252.1964423-4-alim.akhtar@samsung.com>
References: <20260615085252.1964423-4-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 08:49:32 +0000
Message-Id: <20260615084933.0D93D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The CMGP pin controller (instance 1) is missing the `.eint_wkup_in=
it` callback, but its pin banks are configured for wakeup interrupts (`EINT=
_TYPE_WKUP`).
- [Low] The ALIVE and CMGP controllers erroneously configure `eint_gpio_ini=
t`, triggering spurious boot errors.

Pre-existing issues:
- [High] Calculating the PMU wakeup mask using the newly introduced, extrem=
ely sparse `eint_offset` values triggers C undefined behavior by shifting b=
eyond 63 bits.
--

commit 9e3fddb96151cd82aa6084b7afbcf1a84a9843ef
Author: Alim Akhtar <alim.akhtar@samsung.com>

pinctrl: samsung: Add Exynos8855 pinctrl configuration
   =20
Add pinctrl configuration for Exynos8855. The bank type
macros are reused from Exynos850 SoC.

> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pin=
ctrl/samsung/pinctrl-exynos-arm64.c
> index fe9f92cb037ea..db120ae4d847a 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
[ ... ]
> +/* pin banks of exynos8855 pin-controller 0 (ALIVE) */
> +static const struct samsung_pin_bank_data exynos8855_pin_banks0[] __init=
const =3D {
> +	/* Must start with EINTG banks, ordered by EINT group number. */
> +	EXYNOS850_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
[ ... ]
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x260, "gpj0", 0x4c),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x280, "gpj1", 0x50),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x2a0, "gpj2", 0x54),

[Severity: High]
This isn't a bug introduced by this patch, but the new Exynos8855 pin
definitions expose it. The new pin layout introduces extremely sparse
eint_offset values up to 0x54 (like gpj2 here).

In exynos_wkup_irq_set_wake(), the wake mask bit is calculated as:

unsigned long bit =3D 1UL << (2 * bank->eint_offset + irqd->hwirq);
...
eint_wake_mask_values[0] |=3D bit;

When computing the shift for an offset of 0x54 (84), the expression evaluat=
es
to 1UL << 168. Since 1UL is 64 bits wide on ARM64, this left shift invokes
C undefined behavior.

Even ignoring the undefined behavior, the result is implicitly cast to u32
when OR'd into eint_wake_mask_values[0], effectively truncating it to 0.

Does this completely break PMU wakeup configuration for all pins with an
eint_offset >=3D 0x10?

> +};
[ ... ]
> +static const struct samsung_pin_ctrl exynos8855_pin_ctrl[] __initconst =
=3D {
> +	{
> +		/* pin-controller instance 0 ALIVE data */
> +		.pin_banks	=3D exynos8855_pin_banks0,
> +		.nr_banks	=3D ARRAY_SIZE(exynos8855_pin_banks0),
> +		.eint_wkup_init =3D exynos_eint_wkup_init,
> +		.eint_gpio_init =3D exynos_eint_gpio_init,
> +	}, {

[Severity: Low]
Does the ALIVE controller need to configure eint_gpio_init?

Neither the ALIVE nor the CMGP instances contain any EINT_TYPE_GPIO banks
(they only contain EINT_TYPE_WKUP and EINT_TYPE_NONE). Because wake-up only
controllers typically do not have a generic hardware IRQ mapped for standard
GPIOs in the device tree, exynos_eint_gpio_init unconditionally attempts to
retrieve it, prints a spurious error, and returns -EINVAL:

dev_err(dev, "irq number not available\n");

Could this cause unnecessary boot log pollution and attempts to initialize
GPIO IRQ domains for zero eligible banks?

> +		/* pin-controller instance 1 CMGP data */
> +		.pin_banks	=3D exynos8855_pin_banks1,
> +		.nr_banks	=3D ARRAY_SIZE(exynos8855_pin_banks1),
> +		.eint_gpio_init =3D exynos_eint_gpio_init,
> +	}, {

[Severity: High]
Is the .eint_wkup_init callback missing here for the CMGP pin controller?

The CMGP pin controller banks (exynos8855_pin_banks1) are exclusively defin=
ed
using the EXYNOS850_PIN_BANK_EINTW macro, which sets .eint_type to
EINT_TYPE_WKUP. However, this instance only configures .eint_gpio_init and
omits .eint_wkup_init.

During initialization, exynos_eint_gpio_init() skips any banks that are not
EINT_TYPE_GPIO. Because .eint_wkup_init is missing, it looks like the wakeup
interrupts for gpm0 through gpm21 will never be registered, leaving them
without functional external wakeup interrupts.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615085252.1964=
423-1-alim.akhtar@samsung.com?part=3D3
