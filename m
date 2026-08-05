Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85831DE8BF
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785935483; cv=none; b=HE5DqupzF4xZrOrAlew2EGJfym/VjmX0Ase2iVy2idyuBVjfeYsqYDDrzD3Qg9UMOTbMMNPtGtvQMP9q5mlnJJtlRmVJBLXGo05WzSFtb8OmiLN3q5ye/UlCl6FmqVVWPULoTdFSCNKSi5ox//xoFz3b4Dmurk/CTk74WqBxLJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785935483; c=relaxed/simple;
	bh=Vnq8YhWT57Y9bn4Mr8CaEP+ruSLdrl8dE2TsjJBrKX0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OXt2EXyHpYdjwv4AyZT5V/JP+hsN+LXLeiQ/2tr9mQ3+C5S/+Xox5/PrP0+CHaUSVlFc7I2Ybx5qwliG+z+5cqS64S+MkfPe/F+GzMTR7wV/GGUDyihNBbDvP+lgltZ130BY2zUlwMvlzpYLhR8zG1QP2VSTPdZo8ft8WLYxTTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EBVM1AdE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EBVM1AdE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4735E1F000E9;
	Wed,  5 Aug 2026 13:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785935482;
	bh=LlDFYLs712bsYys+Jzw0c5fXTAeut6JBPeMwvyXo/G8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EBVM1AdEQmj2CES7D4ifQVYzNt/OH/MZV6f6dgMMqr5WJdZ8MiGgF90Ec+WZ3oQNu
	 ipCAtM6YVccqkZAEG1ywI8GTM/nmqTCMV6zyEebJAeV1OoSU3Rfmjl+74TN0Icd0yQ
	 7OzSpwNi3VNQf3h/tHIhmxw3ilWeF/zSEAO25r1lEBU44gE2CmCvfftVnI7l4bbpNm
	 ISyCYsvkQBvekAHtOlyDqdt0p91hTCKPJDYd5shvVxfURXPU5EwW88/Y0gEwzrnDtd
	 xQhPD+5Y/XhvIKnvoNCVs0b85ny8VOPShoYH8IduoFQAqm2qzlszXS06+SdadKfr7o
	 H4NP0BlDjdDvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 35/36] pinctrl: airoha: add support of an7563 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260805123408.3767648-36-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
 <20260805123408.3767648-36-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 13:11:21 +0000
Message-Id: <20260805131122.4735E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Pinmux function groups fail to clear conflicting independent mux b=
its, leading to multiple active functions on the same pad.

Pre-existing issues:
- [High] The pinctrl driver framework lacks `.gpio_request_enable`, prevent=
ing dedicated GPIO pads from being returned to GPIO mode at runtime.
--

--- Patch [35]: [PATCH v10 35/36] pinctrl: airoha: add support of an7563 So=
C ---
commit 5532fca9c49b720f31c9db638ccbdf1a32ecb7ac
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: add support of an7563 SoC
   =20
This patch adds support of Airoha an7563 SoC pin controller.

> diff --git a/drivers/pinctrl/airoha/pinctrl-an7563.c b/drivers/pinctrl/ai=
roha/pinctrl-an7563.c
> new file mode 100644
> index 0000000000000..40cbbe90cc464
> --- /dev/null
> +++ b/drivers/pinctrl/airoha/pinctrl-an7563.c
> @@ -0,0 +1,1115 @@

[ ... ]

> +static const char *const pnand_groups[] =3D { "pnand" };
> +static const char *const gpio_groups[] =3D {
> +	"gpio28", "gpio29", "gpio30", "gpio31", "gpio32",
> +	"gpio33", "gpio34", "gpio35", "gpio36", "gpio37"
> +};

[Severity: High]
This is a pre-existing issue in the shared driver core, but does the
omission of dedicated GPIO pads (0-27) here prevent them from being returned
to GPIO mode at runtime?

The shared pinctrl driver framework appears to lack the gpio_request_enable
callback. Because pins 0-27 are explicitly excluded from gpio_groups, they
cannot be muxed to GPIO mode via devicetree either.=20

If a pad was previously configured for an alternate function (like PWM) by
the bootloader, standard GPIO requests might succeed in software but the pin
could remain physically stuck in the alternate function.

> +static const char *const pcie_reset_groups[] =3D {
> +	"pcie_reset0", "pcie_reset1"
> +};

[ ... ]

> +static const struct airoha_pinctrl_func_group mdio_func_group[] =3D {
> +	{
> +		.name =3D "mdio",
> +		.regmap[0] =3D {
> +			AIROHA_FUNC_MUX,
> +			REG_GPIO_PON_MODE,
> +			GPIO_SGMII_MDIO_MODE_MASK,
> +			GPIO_SGMII_MDIO_MODE_MASK
> +		},
> +		.regmap_size =3D 1,
> +	},
> +};

[Severity: High]
Can this lead to multiple active functions on the same pad?

This group sets the MDIO mux bit (GPIO_SGMII_MDIO_MODE_MASK) but does not
seem to include conflicting I2C (I2C_SCL_GPIO_MODE_MASK) or PWM bits in its
mask to clear them.=20

If a pad's state is switched from one function to another, or the bootloader
leaves a pad configured for GPIO, the previous routing bits might remain
active. Could this result in multiple internal SoC peripherals simultaneous=
ly
driving the same pad and causing undefined bus behavior?

> +static const struct airoha_pinctrl_func_group uart_func_group[] =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805123408.3767=
648-1-mikhail.kshevetskiy@iopsys.eu?part=3D35
