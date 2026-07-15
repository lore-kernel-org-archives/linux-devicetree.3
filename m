Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6D23E7BC8
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122234; cv=none; b=EwqiIYj4jwGHBaLkfohDnJXJlRG2ZCKE22E1zYicYcykJpefCCUqR7D1/X1+FphV3F7UeYvg64HGMAWhOP79q468pqWIcSk9JF/MirNu4bGUWapEf2Au5Jmm2FD1XjSQSe1gEQHpyIrt8tbE24nnLxpIBh1jxHNn0dqZrf4j1nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122234; c=relaxed/simple;
	bh=VQX6iVoGPedWjQsPEhPMqaSbB6KtlrpfiNK2IvqawUA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KJSnGAQ91Zz5D8hXzOVtwUu/hRyfR9TBaxNBXB0C3Lhzhas+XhGM4CSC3+P7/NVSHpifJwYryURVMX6jmeiQGY4yRJeShtqgv8hAJCn0EbQbWzQp1MBQuQbwjFuGO2xs80e2oLdl1zxYSaXdM/7Cq29xc4vnLXGwJL/ZsmUQi1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZvoj4+g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZvoj4+g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB9AE1F000E9;
	Wed, 15 Jul 2026 13:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784122227;
	bh=UwIuksF6qbhVrfuTjIm4qawDV5MAxw3TOrGadPp4BhI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gZvoj4+g88F3/TAnDXXvtv6l15L1r3sWBw+tYJeDXVmG85ZiETnqHVmVApAbLihx4
	 YQL+vaQdlZee0G+wKEkLgtNjEC/clC62qESm+geA1zBg8OBvPIM9788Nk/HnMyY/dN
	 wv3FPNaiKs3ChC6YnjzZHyHRm78XOUqlBTHGij47Cn9+4WcnEVwcNcUE/7pLgF3JMt
	 8D4gbzmqksHIo123BDMofdXUBoG/GN/A2AAY1cEz5+DpminB5bGqcdsA1KP40wWzMs
	 mDBWQ4S2Nsv+EUzl1pPCZiLkO+a+WN12d6OtI2zE417ydgkK0U0Sn/J3UKt7eOphUA
	 Eixm8xFc6bR4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS
 LPI TLMM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ravi Hothi" <ravi.hothi@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260715132150.1322663-3-ravi.hothi@oss.qualcomm.com>
References: <20260715132150.1322663-1-ravi.hothi@oss.qualcomm.com>
 <20260715132150.1322663-3-ravi.hothi@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 13:30:26 +0000
Message-Id: <20260715133026.CB9AE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but lpi_config_set()=
 unconditionally overwrites unspecified pin configuration parameters (such =
as pull bias, drive strength, and output enable) with default values, rathe=
r than preserving the existing register state. This breaks the pinconf API =
contract, especially when changing a single parameter dynamically.
--

--- Patch [2]: [PATCH v3 2/2] pinctrl: qcom: milos-lpass-lpi: Add Eliza LPA=
SS LPI TLMM ---
commit 0b7a3c2b301461d37d7084e97a33317743f82c3e
Author: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS LPI TLMM

Eliza SoC has the same LPASS LPI pin mux functions as Milos but the
slew rate control is in the same GPIO config register rather than a
separate register. Add a new variant data struct with updated slew
offsets and LPI_FLAG_SLEW_RATE_SAME_REG flag, reusing the existing
pin descriptors and function table from Milos.

> diff --git a/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c b/drivers/pin=
ctrl/qcom/pinctrl-milos-lpass-lpi.c
> index 72b8ffd97860b..cb4934cd6f757 100644
> --- a/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c

[ ... ]

> @@ -196,8 +223,21 @@ static const struct lpi_pinctrl_variant_data milos_l=
pi_data =3D {
>  	.nfunctions =3D ARRAY_SIZE(milos_functions),
>  };
> =20
> +static const struct lpi_pinctrl_variant_data eliza_lpi_data =3D {
> +	.pins =3D milos_lpi_pins,
> +	.npins =3D ARRAY_SIZE(milos_lpi_pins),
> +	.groups =3D eliza_groups,
> +	.ngroups =3D ARRAY_SIZE(eliza_groups),
> +	.functions =3D milos_functions,
> +	.nfunctions =3D ARRAY_SIZE(milos_functions),
> +	.flags =3D LPI_FLAG_SLEW_RATE_SAME_REG,
> +};

[Severity: High]
This isn't a bug introduced by this patch, but since Eliza will use the sha=
red
LPASS LPI infrastructure, does the core lpi_config_set() function overwrite
unspecified pin configuration parameters?

Looking at drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:lpi_config_set(), varia=
bles
are initialized to defaults instead of the current hardware state:

	unsigned int param, arg, pullup =3D LPI_GPIO_BIAS_DISABLE, strength =3D 2;
	bool value, output_enabled =3D false;

After parsing explicitly provided configs, these defaults are unconditional=
ly
written back to the register:

	lpi_gpio_read_reg(pctrl, group, LPI_GPIO_CFG_REG, &val);

	u32p_replace_bits(&val, pullup, LPI_GPIO_PULL_MASK);
	u32p_replace_bits(&val, LPI_GPIO_DS_TO_VAL(strength),
			  LPI_GPIO_OUT_STRENGTH_MASK);
	u32p_replace_bits(&val, output_enabled, LPI_GPIO_OE_MASK);

	lpi_gpio_write_reg(pctrl, group, LPI_GPIO_CFG_REG, val);

Will this cause a partial pinconf update (or a dynamic change to a single G=
PIO
property) to wipe out the pin's existing drive strength and pull-up/down bi=
as,
potentially breaking audio interface signaling constraints?

>  static const struct of_device_id lpi_pinctrl_of_match[] =3D {
>  	{
> +		.compatible =3D "qcom,eliza-lpass-lpi-pinctrl",
> +		.data =3D &eliza_lpi_data,
> +	}, {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715132150.1322=
663-1-ravi.hothi@oss.qualcomm.com?part=3D2
