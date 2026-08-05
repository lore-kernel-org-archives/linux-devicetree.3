Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1912A46EF8D
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785935305; cv=none; b=jTBksXF9T8GQfQXQ8sC2ut+Gri5G0kqvPz+3dQupo6GdGCSI0x7n1Q/JIaNgUkXDpYn32DSiQu7bZmo/M6aDyPTutIBeBGGwFIM4FGZ8ZbTrM0fYXHZD6Fw/i0/KFlL1HZ4hu3G0kZdPPnsFRC9udL65Qf4FikojJnGdA6fomcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785935305; c=relaxed/simple;
	bh=7+cxcHQUlrCI6L6ePABzq1ZuhKHZmgd0Mz/2Hybk/Wg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AZ45spr7BQLUffvMoqAO2ldY0fHehI3sGTb2mSY/K3VVMWlODMQ0DvTB6JoNoUUgCqTCEpXAOkdiJamrJ81RJG5V61FPwFDpXYj38P9N18WavTakJJNUmPQbOGOtZiMy1WlJ83njqhKMF6SzYPVqd9FlsKgdzYuvpEDLPa8ddqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jd+WKzO0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jd+WKzO0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EADA1F000E9;
	Wed,  5 Aug 2026 13:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785935303;
	bh=/PFcradC3U/DtqM27xCa6QDLCLoLBckAHANdQR8RzE0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jd+WKzO0L1rVZ3hzav316xRAZDCo432yJ7b3l9GZEowZsfVd6j+LoIUztzUXabxrm
	 fPY+q1WVIfOR/SOj9jG6SJLBAbz0YEiHqWwkHIH38EnFdAqw9lZnJwwBVFwzNuFnAP
	 GaECCMGhmmhk8VlfYHnhoorfPOHxywz+xkoNXmw7ydLyjnREf5Hf7w7fcsdPKUSQfq
	 I2JLj/XF7RBnp7xr6hWqElB0/SmzrwjHlV4ycsd9ZARf7fM9C+a0z3dMi9nm1SWprb
	 SgE/buyhAtnQM54erFH31dKwRwiHNYIuBssyvTzwL+QM3u1f8P1Xpx80+vxOnUJO9I
	 08lZS/IWQxdFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 32/36] pinctrl: airoha: add support of en7523 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260805123408.3767648-33-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
 <20260805123408.3767648-33-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 13:08:22 +0000
Message-Id: <20260805130823.5EADA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The common Airoha pinctrl probe function hardcodes the SCU compati=
ble string, unconditionally failing on EN7523.

Pre-existing issues:
- [High] Conflicting multiplexer bits are not cleared when switching functi=
ons on shared pins, leading to hardware state corruption.
--

--- Patch [32]: [PATCH v10 32/36] pinctrl: airoha: add support of en7523 So=
C ---
commit 5c0e4632d44fa5720497cb4a8eadc13fc1e3b799
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: add support of en7523 SoC

This patch adds support of Airoha en7523 SoC pin controller.

> diff --git a/drivers/pinctrl/airoha/pinctrl-en7523.c b/drivers/pinctrl/ai=
roha/pinctrl-en7523.c
> new file mode 100644
> index 0000000000000..91490418e9ab1
> --- /dev/null
> +++ b/drivers/pinctrl/airoha/pinctrl-en7523.c

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
This is a pre-existing issue, but can this lead to hardware state
corruption if functions sharing the same pins are toggled?

If a driver claims "mdio" (pins 20 and 21), airoha_pinmux_set_mux() will
set GPIO_SGMII_MDIO_MODE_MASK. If that driver is later unbound, the MDIO
bit remains set because airoha_pmxops lacks a .disable callback.

If another driver then claims "uart2" on those same shared pins,
airoha_pinmux_set_mux() will use regmap_update_bits() to set
GPIO_UART2_MODE_MASK:

    regmap_update_bits(pinctrl->chip_scu,
                       group->regmap[j].offset,
                       group->regmap[j].mask,
                       group->regmap[j].val);

Since the group mask only covers the specific function's bit, it won't clear
competing function bits. Could this result in both MDIO and UART2 being
simultaneously enabled on the same pins?

[ ... ]

> +static struct platform_driver airoha_pinctrl_driver =3D {
> +	.probe =3D airoha_pinctrl_probe,
> +	.driver =3D {
> +		.name =3D "pinctrl-airoha-en7523",
> +		.of_match_table =3D airoha_pinctrl_of_match,
> +	},
> +};

[Severity: High]
Could this result in a probe regression on the EN7523 SoC?

Looking at airoha_pinctrl_probe() in pinctrl-airoha.c, it appears to
hardcode the SCU compatible string:

    map =3D syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
    if (IS_ERR(map))
        return PTR_ERR(map);

Since the EN7523 SoC device tree uses a different compatible string,
won't this lookup always fail and return -ENODEV during boot? Does this
need to be parameterized (for example, through match data) to support
the new SoC?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805123408.3767=
648-1-mikhail.kshevetskiy@iopsys.eu?part=3D32
