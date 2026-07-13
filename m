Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FE312C534
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783945760; cv=none; b=DsHzZiqE2xPy3fwOh+UpK0FIiJiTthxUWGpTrVFhGuEQpXMXm3Vybb6NZNlpcXN92132/vvufTSbNaOrwj+FaCK/rvRZ/OOUtlMWmg3ZOvBHx2RNMypPftKpBkfd8uW4X81DUEnr6DkAtJYggrozJ11ogxnvvbeUowiUG0kGyWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783945760; c=relaxed/simple;
	bh=ic6SZ9e0y1yp/9gPrNwf/6u20yKpYV5Qmprmx6OEZzE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UudqB/mCJaCk4lXJ1FGmZU/5k8VvGsJ/7pDvpTH7ZOh6KL6EiX+kaJreBdLfcZTYU1Vt8/5d1G0QhgeOkoh2n7yf4RWoKJUYdg/47umSSBbA1i7yIXqMyakLYd+PRAexa9P+KFJiddVSwjwHabQfpN2zShCz3cgTUv5I8xtGenQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=con8P73Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="con8P73Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15C1C1F000E9;
	Mon, 13 Jul 2026 12:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783945759;
	bh=QS+yiTaDWSUYZyTsLC2uxqWlHFohCWzlJzbGU5um09g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=con8P73Z+dv5UJfuU51ULADGXpDjxGYFGe7U3IgldqwdN9vuA9bYvY9OaEML+xHgv
	 v547F8cjuvGRFqboqMX+ApqbOt4CmyGTAm4cu6faUmQv2xoSTMF7LSDNN/S+Bg5lAe
	 gfRkuFuuUt+D+zbI1nP+LqWizT4dI46xwW1M0txcuFX2Fo1qdLTO3/NIVtzrcqDk04
	 11SwTnYPmFh4DTp2vQ9smDrmODGPTRznryuug9jypFm/jnODZhIUmoV7ve88fA/uLO
	 hYNmJem/ZN4298zGK6vIKEEV0vwamNe3eHDap0rAzmLndJdxEwjScz4DV5+eLruXdm
	 W5vZBuJwB0I9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS
 LPI TLMM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ravi Hothi" <ravi.hothi@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260713121518.2724474-3-ravi.hothi@oss.qualcomm.com>
References: <20260713121518.2724474-1-ravi.hothi@oss.qualcomm.com>
 <20260713121518.2724474-3-ravi.hothi@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 12:29:18 +0000
Message-Id: <20260713122919.15C1C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Calling pinctrl configurations destructively overwrites unrelated =
pin state with default values.
--

--- Patch [2]: [PATCH v2 2/2] pinctrl: qcom: milos-lpass-lpi: Add Eliza LPA=
SS LPI TLMM ---
commit 582da1f0b8240dfeb6e4051b30e4e3d9b11be196
Author: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS LPI TLMM

This commit adds variant data for the Eliza SoC to the Milos LPASS LPI
driver. It updates the slew offsets and adds the LPI_FLAG_SLEW_RATE_SAME_REG
flag, reusing existing pin descriptors and function tables.

> diff --git a/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c b/drivers/pin=
ctrl/qcom/pinctrl-milos-lpass-lpi.c
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
> +

[Severity: High]
This is a pre-existing issue, but will adding these new pin groups trigger
destructive overwrites in the core lpi_config_set()?

When the pinctrl core or GPIO subsystem invokes lpi_config_set() to change
a pin's configuration (like direction or value), it appears to destructively
overwrite orthogonal pin states with default values.

In drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:lpi_config_set(), the local
variables are initialized to default values:

    unsigned int param, arg, pullup =3D LPI_GPIO_BIAS_DISABLE, strength =3D=
 2;
    bool value, output_enabled =3D false;

After processing the requested configs, the function reads the current
register but unconditionally overwrites these fields:

    lpi_gpio_read_reg(pctrl, group, LPI_GPIO_CFG_REG, &val);

    u32p_replace_bits(&val, pullup, LPI_GPIO_PULL_MASK);
    u32p_replace_bits(&val, LPI_GPIO_DS_TO_VAL(strength),
                      LPI_GPIO_OUT_STRENGTH_MASK);
    u32p_replace_bits(&val, output_enabled, LPI_GPIO_OE_MASK);

Does this mean merely setting a GPIO output value will reset its drive
strength to 2mA and disable any pull bias?

Similarly, would applying a pull bias on an output pin inadvertently clear
LPI_GPIO_OE_MASK and convert it into an input?

>  static const struct of_device_id lpi_pinctrl_of_match[] =3D {
>  	{
> +		.compatible =3D "qcom,eliza-lpass-lpi-pinctrl",
> +		.data =3D &eliza_lpi_data,
> +	}, {
>  		.compatible =3D "qcom,milos-lpass-lpi-pinctrl",
>  		.data =3D &milos_lpi_data,
>  	},

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713121518.2724=
474-1-ravi.hothi@oss.qualcomm.com?part=3D2
