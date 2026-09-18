Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FED399357
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 07:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789717345; cv=none; b=A2C9Xgka2qFS/Pxmt8QunRPKIkw2x++ZyQnP4y8Faj674z2SJZPdQKXAEGj/4iwTGR+/i8gdZ7rsKBDtqmiC5vhHaImgi6AyXLKtcLhpPG92LPioI15POs3tdFPK5V+4BZrAQ92UERnmTFkTIuRs56FxZu8MCN86ST3ucrfRsEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789717345; c=relaxed/simple;
	bh=k5rE+t/gaYRt5pSvXIPnmpMMyjG5cpLvtbM3U65rbAA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cebSxrtI85Y1gTvLFBPYCMkl9LCnpagy/NxdodSyJu8FRhP9J5JfTmFCQA7C5FMWPPmzB2ahiJ2yaBxsWz3tQlinC9wYSiuwuxdaGKQm8X2Fpjw3iIXcD0QWI/Mk3sZbowrp33ymNVvAdmxVWd4N75HEJ2ye4IQfWsA7sN2iCwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GGAVLVB3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GGAVLVB3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 731651F000FF;
	Fri, 18 Sep 2026 07:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789717336;
	bh=3Frh09UPMwloa9UKfhSzmUsqKKcb4HZhTtuThKJIM1k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GGAVLVB3RLEMmkKcBGSbHMNAps7pJA9juGF33aDE3GaXHZDFTyvCeG+dIsePerLq+
	 Pj/oyNiv60lrjKIjXr3eGTu8gHDYwIZLH6Tnqb7xE2YeaRyx5hHiXVUoBXU4/M4haG
	 Vh7GQ0CTSAUly3yfEnXoXxFAz9UDA/q0Q+YpDNHMHui5NZiDqOoOdwP7qUQXvzaHyp
	 WF1eWC8mmSUzV015zU5gw3XGxkYgVyaBUAN5dDK72G/9szTwYwpEAiYXriJ0nLUOve
	 hg4LBEy/zTh/0jL+2QVJp9DxxhbnNyYTi5KGzXci/bq6IfCoogY63Q4fHv4Ufqb+ND
	 zPhmJs4lTF+bg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] regulator: add regulator driver for the Nexperia
 NEX10000UB
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260918-topic-sm8x50-nex10000ub-v1-3-5afe06bace03@linaro.org>
References: <20260918-topic-sm8x50-nex10000ub-v1-0-5afe06bace03@linaro.org>
 <20260918-topic-sm8x50-nex10000ub-v1-3-5afe06bace03@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 07:42:16 +0000
Message-Id: <20260918074216.731651F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] regulator: nex10000ub: missing enable_reg and enable_mask breaks s=
tate tracking
- [High] regulator: nex10000ub: failing of_parse_cb on missing optional GPI=
O drops DT constraints
- [High] regulator: nex10000ub: GPIOD_ASIS fails to configure enable GPIO a=
s output
--

commit b4dbdcd03d0963edf5545b4f355cad556309c6b2
Author: Neil Armstrong <neil.armstrong@linaro.org>

regulator: add regulator driver for the Nexperia NEX10000UB

Add regulator support for the Nexperia NEX10000UB dual output LCD
bias power supply which provides programmable positive and negative
output voltages mainly for display panels applications.

> diff --git a/drivers/regulator/nex10000ub-regulator.c b/drivers/regulator=
/nex10000ub-regulator.c
> new file mode 100644
> index 0000000000000..b45a805d5601d
> --- /dev/null
> +++ b/drivers/regulator/nex10000ub-regulator.c
[ ... ]
> +static const struct regulator_ops nex10000ub_regulator_ops =3D {
> +	.enable =3D regulator_enable_regmap,
> +	.disable =3D regulator_disable_regmap,
> +	.is_enabled =3D regulator_is_enabled_regmap,

[Severity: High]
Does this break the regulator core's state tracking?

The core regmap helpers regulator_enable_regmap, regulator_disable_regmap,
and regulator_is_enabled_regmap are registered here in
nex10000ub_regulator_ops, but NEX10000UB_REGULATOR_DESC below leaves
.enable_reg and .enable_mask zero-initialized.

When is_enabled is called, won't it bitwise AND the register value with a 0
mask, unconditionally returning 0? Similarly, enable and disable might
perform no-op writes with a 0 mask instead of properly utilizing the GPIOs.

> +	.list_voltage =3D regulator_list_voltage_linear,
> +	.map_voltage =3D regulator_map_voltage_linear,
> +	.get_voltage_sel =3D regulator_get_voltage_sel_regmap,
> +	.set_voltage_sel =3D regulator_set_voltage_sel_regmap,
> +};
> +
> +static int nex10000ub_of_parse_cb(struct device_node *np,
> +				  const struct regulator_desc *desc,
> +				  struct regulator_config *config)
> +{
> +	struct gpio_desc *ena_gpiod;
> +
> +	ena_gpiod =3D fwnode_gpiod_get_index(of_fwnode_handle(np), "enable", 0,
> +					   GPIOD_ASIS, desc->name);

[Severity: High]
Does using GPIOD_ASIS fail to configure the enable GPIO as an output?

If the pin is configured as an input by the bootloader, it will remain an
input. The regulator core uses gpiod_set_value_cansleep(), which only sets
the output value and does not implicitly switch the pin's direction to
output. Could this prevent the device from actually turning on or off?

> +	if (IS_ERR(ena_gpiod))
> +		return PTR_ERR(ena_gpiod);

[Severity: High]
Does returning the error directly here drop device tree constraints if the
optional enable GPIO is missing?

If the optional enable-gpios is omitted from the device tree,
fwnode_gpiod_get_index() returns -ENOENT, which is then propagated back to
the core. The core treats this as a fatal DT parse error, frees the
init_data, and registers the regulator without its DT configuration,
discarding all voltage ranges and always-on properties.

> +
> +	config->ena_gpiod =3D ena_gpiod;
> +
> +	return 0;
> +}
> +
> +#define NEX10000UB_REGULATOR_DESC(_id, _name)			\
> +	[NEX10000UB_REGULATOR_ID_##_id] =3D {			\
> +		.name =3D "nex10000ub-"#_name,			\
> +		.supply_name =3D "vin",				\
> +		.id =3D NEX10000UB_REGULATOR_ID_##_id,		\
> +		.of_match =3D of_match_ptr(#_name),		\
> +		.of_parse_cb =3D nex10000ub_of_parse_cb,		\
> +		.ops =3D &nex10000ub_regulator_ops,		\
> +		.n_voltages =3D NEX10000UB_VOUT_N_VOLTAGE,	\
> +		.min_uV =3D NEX10000UB_VOUT_VMIN,			\
> +		.uV_step =3D NEX10000UB_VOUT_STEP,		\
> +		.enable_time =3D 2000,				\
> +		.vsel_mask =3D NEX10000UB_VOUT_MASK,		\
> +		.vsel_reg =3D NEX10000UB_REG_##_id,		\
> +		.type =3D REGULATOR_VOLTAGE,			\
> +		.owner =3D THIS_MODULE,				\
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-topic-sm8x=
50-nex10000ub-v1-0-5afe06bace03@linaro.org?part=3D3
