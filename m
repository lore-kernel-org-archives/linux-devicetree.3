Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F59136404B
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169403; cv=none; b=UQ88Ca9aZVybk5DbGbuwJQkYXXr1eNvNQI49m0eUzI1wQtdmY+2eTUhwomdxCZWKvr4pwvytwl1r8zbNkFH3NjqGUePx+rnYSzKkQfrT6EtrlHsMLvvxQxiTU2pO6bCVUOKv6Cd/Bece9v0TgURXyPLKw5zTLT2STVHjDq4zrPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169403; c=relaxed/simple;
	bh=05lHGJKqI5mT75eUo6u7LQ5QSNOKL+BvoQ4LkAdcE/s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ah9HaY6UYo+SVlMJ8elEWMTGGbC3oJbBGIoA5oUbfxB3El3IeML/EEu8jJjfJpDwn8lBfWA+ezEHi/vIlnsWMyv6FAg3qIdKpk8yDZZFz6t6DP8NSr3TcevmehoODu0Vp0zZ558jvZ1Wv1FLzRxAed1CopYmLYFAYCKLdkKqTB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kS/K6SE6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kS/K6SE6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2424D1F00893;
	Thu, 11 Jun 2026 09:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781169402;
	bh=/hWI3zextGGlcYjF/fIdrTeN2t4GFKJVj/6VtLjTLvQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kS/K6SE6VHIWF6LGbOMBlEwpLq7dM084RbYBRBt/FVguRBpRLEuSFYTZGaDY7woVt
	 HXM+eiZeFxfuVMIfU0m+Mv4HJeiucmWLL2xKxVPnNk9qsjgLoZ5wOt0BLIXPISd7Sq
	 iJ5Mgt+Fexo7n/G3a9sBfo8l+GDgKIAHEfnmnwle4myCZqWzEqUVEYIkNI/U+ti82L
	 lzTsD4LTHweV3RDHkLEk4s0NluM4geDhVUUXQdxEAjT4vni4raNa8XRwBUzF5jLIUM
	 mJuympP1ks0ZLV0yj7nM3HwleV2+HqTQpQKzN1W08wc3G1gZIKnnwBtgiHMcIKjLN7
	 sEZ1W/8Va7aCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] regulator: qcom-refgen: add support for the
 IPQ9650 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kathiravan Thirumoorthy" <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260611-ipq9650_refgen-v2-3-d96a91d5b99e@oss.qualcomm.com>
References: <20260611-ipq9650_refgen-v2-3-d96a91d5b99e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 09:16:41 +0000
Message-Id: <20260611091642.2424D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Unclocked MMIO access in `is_enabled` causes synchronous exter=
nal abort.
- [High] Clock reference count underflow due to unbalanced disable.
- [Medium] Missing validation for zero clocks returned by `devm_clk_bulk_ge=
t_all()`.
--

commit 0bec5912036c4b180d8ea012798dcb554afa8119
Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

regulator: qcom-refgen: add support for the IPQ9650 SoC

This commit adds support for the IPQ9650 SoC to the qcom-refgen regulator
driver. It introduces clock handling since this SoC requires explicitly
enabling clocks to bring up the PHYs properly.

> diff --git a/drivers/regulator/qcom-refgen-regulator.c b/drivers/regulato=
r/qcom-refgen-regulator.c
> index 6a3795469927e..e8821f159ff16 100644
> --- a/drivers/regulator/qcom-refgen-regulator.c
> +++ b/drivers/regulator/qcom-refgen-regulator.c

[ ... ]

> @@ -62,6 +77,42 @@ static int qcom_sdm845_refgen_is_enabled(struct regula=
tor_dev *rdev)
>  	return 1;
>  }
> =20
> +static int qcom_ipq9650_refgen_enable(struct regulator_dev *rdev)
> +{
> +	struct qcom_refgen_drvdata *drvdata =3D rdev_get_drvdata(rdev);
> +	int ret;
> +
> +	ret =3D clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int qcom_ipq9650_refgen_disable(struct regulator_dev *rdev)
> +{
> +	struct qcom_refgen_drvdata *drvdata =3D rdev_get_drvdata(rdev);
> +
> +	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);

[Severity: High]
If the bootloader leaves the REFGEN block enabled, the regulator framework
will treat this as boot-on and might skip calling the enable callback when
the first consumer enables it. When a consumer later disables it (or when
regulator_disable_unused() runs), this disable callback will execute
clk_bulk_disable_unprepare().

Since the driver never called clk_bulk_prepare_enable() itself, will this
cause the Linux clock framework's internal reference counts to underflow
and trigger warnings?

> +
> +	return 0;
> +}
> +
> +static const struct regulator_desc ipq9650_refgen_desc =3D {
> +	.enable_reg =3D REFGEN_REG_REFGEN_STATUS,
> +	.enable_mask =3D REFGEN_STATUS_OUT_MASK,
> +	.enable_val =3D REFGEN_STATUS_OUT_ENABLE,
> +	.enable_time =3D 5,
> +	.name =3D "refgen",
> +	.owner =3D THIS_MODULE,
> +	.type =3D REGULATOR_CURRENT,
> +	.ops =3D &(const struct regulator_ops) {
> +		.enable		=3D qcom_ipq9650_refgen_enable,
> +		.disable	=3D qcom_ipq9650_refgen_disable,
> +		.is_enabled	=3D regulator_is_enabled_regmap,

[Severity: Critical]
During devm_regulator_register(), the regulator framework invokes the
is_enabled callback to determine the initial hardware state. Because
regulator_is_enabled_regmap() directly performs a regmap_read(), and
qcom_refgen_probe() only retrieves the clocks without enabling them,
will this read occur while the clocks are gated?

On Qualcomm platforms, does accessing MMIO registers of a clock-gated
peripheral stall the bus and trigger a synchronous external abort?

> +	},
> +};
> +
>  static const struct regulator_desc sdm845_refgen_desc =3D {

[ ... ]

> @@ -106,10 +172,23 @@ static int qcom_refgen_probe(struct platform_device=
 *pdev)
>  	struct regmap *regmap;
>  	void __iomem *base;
> =20
> -	rdesc =3D of_device_get_match_data(dev);
> -	if (!rdesc)
> +	data =3D of_device_get_match_data(dev);
> +	if (!data)
>  		return -ENODATA;
> =20
> +	if (data->has_clocks) {
> +		drvdata =3D devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +		if (!drvdata)
> +			return -ENOMEM;
> +
> +		drvdata->num_clks =3D devm_clk_bulk_get_all(dev, &drvdata->clks);
> +		if (drvdata->num_clks < 0)

[Severity: Medium]
If the device tree node improperly omits the clocks property,
devm_clk_bulk_get_all() will return 0. Does this allow the probe
function to silently succeed?

Later calls to clk_bulk_prepare_enable() will also succeed without
enabling any hardware. Since clocks are mandatory on IPQ9650, should
this treat a return value of 0 as an error?

> +			return dev_err_probe(dev, drvdata->num_clks,
> +					     "failed to get clocks\n");
> +	}
> +
> +	rdesc =3D data->rdesc;
> +
>  	base =3D devm_platform_ioremap_resource(pdev, 0);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-ipq9650_re=
fgen-v2-0-d96a91d5b99e@oss.qualcomm.com?part=3D3
