Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BED2882BE
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 11:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782386192; cv=none; b=nYnnS3H4IPHUqNNR+X4bu5rWDXZXNtvR6xV5RkhI5GTeY+Srv0rJB2o8V3strl/Z5jPdhaH8UsEEprYyr7pqofh1YKe1lzu4FMOBZN95ZPlFiSwBB28iB3+YHXZHAglwMkSSHT1BjbLi6Xvofle83FOv/t2O884pHgLxlFGx2K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782386192; c=relaxed/simple;
	bh=7L6R1rJskAJC7AFSqhP23eYiFrRbIYyW4QM+eWwrNyI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ckZn8AHXqf04iL86Z/JwoQ03YZKF45aOJ28TPimfjbD6sMN9XgT+2KPRwn/ZBiIdgiDy8RGr0fJ972dy5z1rF5tDtbeQ260KFVH6tk/1u8zk33R04SUjCNz8CwEiDnMHLqYfh3C27zgYbZtgiRkRtrtRgRWyXKAfLEClCzEFA+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivO1hz3F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivO1hz3F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD701F000E9;
	Thu, 25 Jun 2026 11:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782386190;
	bh=n+LIeb1pXjCxpojl9AyJWNMmB0nzgnVQn67mHljUuiE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ivO1hz3FcqHtrzb7XZWZ6IPep9hyUOPc9kTXyqkVdiNVwLm88QeQO2RyHIZieTVXF
	 vEUKp+BK0Di+ljz/3pdoocCNcoWfK5vDP02mmGYEyy1m0qXbkyuX12FiT4bWferDPV
	 XNJ9zx+shJIYTBSPFUYh1utGsTXcG8NwBlWaL7AXeAOR1W3XDrNpPSCDmCkPdWQ48C
	 AkSK3PP7B/A2nuXLZPkFGk5GOIy6nAXUvrj3LLm/bPJKTKtfYeHpHLD/DHVEx0HkV0
	 2wxuqVkaQni7R3uN4HRxg6k9xbFGxfs/vhT8rbPtygYCUjdXl+d59jXCBPRhe537UL
	 NIIjHPVdH2cHQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 2/3] pinctrl: mediatek: mt8516/mt8167: Migrate
 driver to pinctrl-paris platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Leonardo Scorcia" <l.scorcia@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260625104742.113803-3-l.scorcia@gmail.com>
References: <20260625104742.113803-1-l.scorcia@gmail.com>
 <20260625104742.113803-3-l.scorcia@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 11:16:28 +0000
Message-Id: <20260625111629.6CD701F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] Pinmux mode field spacing is incorrectly changed from 4 bits t=
o 3 bits per pin, corrupting all pinmux configurations.
- [High] Incorrect register bit offsets and widths for Drive Strength (DRV)=
 and Slew Rate (SR) corrupt hardware configuration.
- [High] SMT register bit mappings are swapped between pins 106 and 109.
- [High] SMT bit mappings for MT8516 pins 70-73 (MSDC2 DAT) are incorrectly=
 assigned the MT8167 layout, breaking MT8516 SD/eMMC.
- [High] Driver drops support for `mediatek,pctl-regmap` without providing =
a fallback, breaking ABI backward compatibility with existing device trees.
--

commit b99ee859c088809165f9a4794ca1471b372efd64
Author: Luca Leonardo Scorcia <l.scorcia@gmail.com>

pinctrl: mediatek: mt8516/mt8167: Migrate driver to pinctrl-paris platform

Migrate the mt8516/mt8167 pinctrl driver to the paris platform driver.
This change lets us correctly describe the two base addresses (GPIO/EINT)
used by the SoCs in their device tree. It also adds support for driving
strength capability and R1R0 pullup-pulldown on pins.

> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8516.c b/drivers/pinctrl/=
mediatek/pinctrl-mt8516.c
> --- a/drivers/pinctrl/mediatek/pinctrl-mt8516.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8516.c
[ ... ]
> +static const struct mtk_pin_field_calc mt8516_pin_mode_range[] =3D {
> +	PIN_FIELD15(0, 124, 0x300, 0x10, 0, 3),
> +};

[Severity: Critical]
Does this configuration cause a regression in pin multiplexing across the S=
oC?

The legacy driver used a 4-bit shift per pin to pack 5 pins per 32-bit
register. By passing 3 as the width here, the framework calculates mode
offsets using 3 bits per pin. This causes pinmux writes to align with
the wrong bits and can overwrite the configurations of adjacent pins.

[ ... ]
> +static const struct mtk_pin_field_calc mt8516_pin_smt_range[] =3D {
[ ... ]
> +	PIN_FIELD16(70, 70, 0xa30, 0x10, 3, 1),
> +	PIN_FIELD16(71, 71, 0xa30, 0x10, 4, 1),
> +	PIN_FIELD16(72, 72, 0xa30, 0x10, 5, 1),
> +	PIN_FIELD16(73, 73, 0xa30, 0x10, 6, 1),

[Severity: High]
Does this break the SMT configuration for the MT8516 MSDC2 interface?

The unified array assigns the MT8167 layout to pins 70-73 (bits 3, 4, 5, 6).
The MT8516 requires bits 6, 5, 4, 3, as defined in its IES layout and the
legacy driver.

[ ... ]
> +	PIN_FIELD16(106, 106, 0xa20, 0x10, 13, 1),
> +	PIN_FIELD16(107, 107, 0xa20, 0x10, 14, 1),
> +	PIN_FIELD16(108, 108, 0xa20, 0x10, 15, 1),
> +	PIN_FIELD16(109, 109, 0xa30, 0x10, 0, 1),

[Severity: High]
Are the SMT bits for pins 106 and 109 swapped?

In the IES range, pin 106 maps to 0x930 bit 0 and pin 109 maps to 0x920
bit 13. SMT layouts typically mirror IES layouts offset by 0x100.
The mappings here write to the wrong hardware bits for these pins.

[ ... ]
> +static const struct mtk_pin_field_calc mt8516_pin_drv_range[] =3D {
> +	PINS_FIELD16(0, 4, 0xd00, 0x10, 0, 2),
[ ... ]
> +static const struct mtk_pin_field_calc mt8516_pin_sr_range[] =3D {
> +	PINS_FIELD16(0, 4, 0xd00, 0x10, 3, 1),

[Severity: High]
Can this corrupt the Slew Rate hardware configuration?

Setting the Slew Rate offset to 3, and using a 2-bit width starting at bit 0
for the Drive Strength of these pins, differs from the hardware requirement=
s.
Additionally, a 2-bit mask restricts DRV_GRP4 pins (such as MSDC) from
supporting drive strengths greater than 8mA, causing the framework to reject
higher values.

[ ... ]
> +static struct platform_driver mt8516_pinctrl_driver =3D {
>  	.driver =3D {
>  		.name =3D "mediatek-mt8516-pinctrl",
> -		.of_match_table =3D mt8516_pctrl_match,
> -		.pm =3D pm_sleep_ptr(&mtk_eint_pm_ops),
> +		.of_match_table =3D mt8516_pinctrl_of_match,
> +		.pm =3D pm_sleep_ptr(&mtk_paris_pinctrl_pm_ops),
>  	},
> +	.probe =3D mtk_paris_pinctrl_probe,
>  };

[Severity: High]
Will this migration cause probing to fail on older device trees?

The paris framework probe relies on devm_platform_ioremap_resource_byname
which strictly requires a reg-names property. The legacy driver supported a
mediatek,pctl-regmap fallback. Dropping this fallback might introduce a
regression with existing device trees lacking the reg-names property.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625104742.1138=
03-1-l.scorcia@gmail.com?part=3D2
