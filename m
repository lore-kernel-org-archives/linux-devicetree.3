Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AC911CA9
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 16:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281679; cv=none; b=C391/K9OSayWHnmyLea2AVC0wfQ369uRzWoQMaRWoqlB7aoazkb+izs+buDrscbmJl6jX736OKKr2XOEa9sr2q2D5bhOdxOQiGtapVefzbuQJLMW5RIKMf7m2HLMuzk5IdWmWmJaMwWzyRJpLBOhdN6wISRiyu3DxB/w/7PGbJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281679; c=relaxed/simple;
	bh=LjxJt28S1BNQ4oZ4S4ExxeQcXICMCAhYTtJ57ouGZ+0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pR0rWYEPYhIcVc4lfpkZY6wiPpGXnMy6NYrhHCCQnKaytHEvaLMDMyUpeLrAmIVWOJ2GzXE9Zq+DpsvxHRoMhUPSs5UYuVGuAvjU5WW0yrkvRiEmaj+Q5IBK6dYMr9lrKqqcIwCUNmdz7djUIWqbUR0xsAehwjk1UZK65ss5fv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WLaDllXV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WLaDllXV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4131F000E9;
	Fri, 12 Jun 2026 16:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781281678;
	bh=VxnzDZ8OzuCdfuLXMeTGXgWYMK2qgo+iv86B/JQxuV4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WLaDllXVaeUqMkYu7HQdy6/1KwD/w0paS4DbrI0DMb6Tak8dpiauJUxyeERvKeucm
	 l8OpptFStXdaO/N1J+5BLr32XYAZt7nIW8/pR4+s6pX0tGn/x8QQcBa4Sk9/I73ghy
	 tS74eeRij4tvLOJdSfXGitHEFcrDaxjUd5I0naPyO/TbTcgPteh4HIVB0XOHZ97/bP
	 NO/fcknAcF0LrVe4ElBnBGc+gkGO17GDFmsc6CkA/AZRmzgQAK+AlLDCM1IssapVQv
	 qBE/gO2yBx8sEGozW5PzX+KnDzCN530Jo6g2EFj+SJsoTsiK7JS9e2IPHRqTD5SS1D
	 aMJLPm2cE8wHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] pinctrl: samsung: Add Exynos8855 pinctrl
 configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alim Akhtar" <alim.akhtar@samsung.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260612163020.411761-4-alim.akhtar@samsung.com>
References: <20260612163020.411761-4-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 16:27:57 +0000
Message-Id: <20260612162757.DD4131F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Assigning `.eint_gpio_init =3D exynos_eint_gpio_init` for the AL=
IVE and CMGP pin controllers is incorrect and will trigger an unconditional=
 `dev_err` on boot.

Pre-existing issues:
- [High] Out-of-bounds shift and integer truncation in `exynos_wkup_irq_set=
_wake` due to sparse `eint_offset` values in Exynos8855 pin banks.
--

commit 44d88e7478f7688359e44e48fa60a820ac3e8dfa
Author: Alim Akhtar <alim.akhtar@samsung.com>

pinctrl: samsung: Add Exynos8855 pinctrl configuration

Add pinctrl configuration for Exynos8855. The bank type macros are
reused from Exynos850 SoC.

> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pin=
ctrl/samsung/pinctrl-exynos-arm64.c
> index fe9f92cb037ea..ba2a11f8e19d8 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c

[ ... ]

> +/* pin banks of exynos8855 pin-controller 1 (CMGP) */
> +static const struct samsung_pin_bank_data exynos8855_pin_banks1[] __init=
const =3D {
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x00,  "gpm0",  0x00),

[ ... ]

> +	EXYNOS850_PIN_BANK_EINTW(1, 0x280, "gpm20", 0x50),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x2a0, "gpm21", 0x54),
> +};

[Severity: High]
This is a pre-existing issue, but does the configuration of these eint_offs=
et
values (up to 0x54) expose an out-of-bounds shift issue?

Looking at exynos_wkup_irq_set_wake() in
drivers/pinctrl/samsung/pinctrl-exynos.c, it sets wake mask bits using:

    unsigned long bit =3D 1UL << (2 * bank->eint_offset + irqd->hwirq);

If eint_offset is 0x54, the shift amount becomes 168, which invokes C
undefined behavior. Even for shifts between 32 and 63, the 64-bit value is
bitwise OR'd into a u32, dropping the upper bits and breaking the hardware
wakeup masks for these pins.

Will this logic need updating to support these sparse CMGP banks?

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
> +		/* pin-controller instance 1 CMGP data */
> +		.pin_banks	=3D exynos8855_pin_banks1,
> +		.nr_banks	=3D ARRAY_SIZE(exynos8855_pin_banks1),
> +		.eint_wkup_init =3D exynos_eint_wkup_init,
> +		.eint_gpio_init =3D exynos_eint_gpio_init,
> +	}, {

[Severity: Medium]
Is it correct to assign exynos_eint_gpio_init to the eint_gpio_init
callback for the ALIVE and CMGP controllers?

Because these controllers only contain EINT_TYPE_WKUP and EINT_TYPE_NONE
banks, they do not support standard GPIO interrupts and typically lack an
interrupts property in the device tree.

When exynos_eint_gpio_init runs and sees no irq, won't it unconditionally
log an error during boot:

    dev_err(dev, "irq number not available\n");
   =20
and return -EINVAL? Does this initialization need to be omitted here,
similar to how it is handled in exynos850_pin_ctrl?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612163020.4117=
61-1-alim.akhtar@samsung.com?part=3D3
