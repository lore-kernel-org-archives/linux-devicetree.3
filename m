Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B890336998C
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 07:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783064491; cv=none; b=E0eCaD4ok8NzM8yFQ9syaJ8GbViNL5H7Hjq8oRywuh5z7YBJnDKuz+UqSRzWKTJV+4UqyAOLjryLX+HB59zmGA1mpOlAbRVUT5YKnKxQ30e+x5CwQQ81j/iLK3tD5Mo9t8c234RAHzknrflYSG6F/4z5eHFtCgpb3U+30C2cYl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783064491; c=relaxed/simple;
	bh=TaaJbouv8Hyvf/PF5FbaxCI0DnCm3F7ez8vPIjfvT30=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lWCC8MFj1DKBZ2P3HtmCfGaq+ARj/tXiHtSH5yF+Jq0ombyJnlilS/umZxx7gP/I3bN+ChjFhl7P4+auYk5qgOt922YpXt+JdLiScNGDxt60QnarmfblKjbm1ZzFEs9zaDP9WEVJY/xbu3hQoeCrLDArw5/0TudU+mpmCTkB5E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmh/DSEl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmh/DSEl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0616A1F000E9;
	Fri,  3 Jul 2026 07:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783064490;
	bh=OhO0/uO84aHCk3NdQGLypRJpyy96cjSISJaGRg4ttsQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kmh/DSElVp77Fp3bnLCdv+8EHDaYb36Ew6OgKXX4qtfyQJTv67Ny+FAZYXgXKSzqd
	 xXzbGGm34wfy8NqzrAKHtV7WuV4Djv/8x0CS6tUa4tFUdqufRD7eRsgK5tdTDgxZov
	 JPaBhzmbzuj1qCplOQfBpWM0p6/FhKsUCERZbV/8IsytBkCM9pMqDK2UGWeSRGQhiZ
	 ManTPE4IgT6y0kDwCdSM6yorjGEKwBLmF+pnKV59a3mfHHdUXN5trFi5w8Cc1WndPT
	 T5UeH7WqMqkytQTvN9uuLS61CAiZDrN5/gYF9uYj/AVB3zg6BXNjSQ+1XcxzxTuSio
	 OXrMDnafQozag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS
 LPI TLMM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ravi Hothi" <ravi.hothi@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260703073029.2588960-3-ravi.hothi@oss.qualcomm.com>
References: <20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com>
 <20260703073029.2588960-3-ravi.hothi@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 07:41:29 +0000
Message-Id: <20260703074130.0616A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] lpi_config_set() unconditionally overwrites pull-up, drive strengt=
h, and output-enable configurations with default values if they are not exp=
licitly specified in the configs array.
--

commit c207cbbbbf4fca2f1793d2b498400b3981b0254c
Author: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

    pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS LPI TLMM
   =20
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
This isn't a bug introduced by this patch, but while reviewing the new slew
rate behavior, I noticed an issue in how lpi_config_set() handles the pin
configurations in drivers/pinctrl/qcom/pinctrl-lpass-lpi.c.

In drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:lpi_config_set(), the local
configuration variables are initialized to default values:

    unsigned int param, arg, pullup =3D LPI_GPIO_BIAS_DISABLE, strength =3D=
 2;
    bool value, output_enabled =3D false;

Later in the same function, these defaults are unconditionally applied to t=
he
register value instead of preserving the current hardware state:

    lpi_gpio_read_reg(pctrl, group, LPI_GPIO_CFG_REG, &val);

    u32p_replace_bits(&val, pullup, LPI_GPIO_PULL_MASK);
    u32p_replace_bits(&val, LPI_GPIO_DS_TO_VAL(strength),
                      LPI_GPIO_OUT_STRENGTH_MASK);
    u32p_replace_bits(&val, output_enabled, LPI_GPIO_OE_MASK);

    lpi_gpio_write_reg(pctrl, group, LPI_GPIO_CFG_REG, val);

Does this code accidentally overwrite unrequested settings?

For instance, if a driver updates a GPIO value or if a single configuration=
=20
such as the slew rate for Eliza is applied, the current register state is=20
read, but pull-up, drive strength, and output enable fields are uncondition=
ally
replaced with the initialized defaults.

Could this lead to silent clobbering of existing configurations, resulting =
in
floating pins or output being unintentionally disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703073029.2588=
960-1-ravi.hothi@oss.qualcomm.com?part=3D2
