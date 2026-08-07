Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67C232E141
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 13:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786110711; cv=none; b=RrOJrOecPG7k5vECLBrGGyE+OwoBIrLFttXgxweqKT3dLykSB6RiEUPY00vDOfF5Os+BrdyfkYxZdmo/+hcAwlgEAP2tAZd8imsWO4qtCfJZQ9qVbKloKsFeLtuH9lZYJ4JuRUgXtpFx4z8dsvwREjXgOkQJgc1cYO7vVyOrGS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786110711; c=relaxed/simple;
	bh=rThCgGgKFU8tny7Xa4RzkHoVLOgs+I89QMMpY85E1Os=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l8ZXnvwg+sbVD67Uaf0YoppjDfLXHMjxwO5UjO/AZULs4HeRDt1kLOhPDgK/vtrvLzNWtEdg6X48BuROpAIHFZ4Vo+H8j47xIsGCZhTZxwexaKne4HCF3x7bCy45SkZE1/zRmgZbyMM+/L/OTbK/TBoNh0nGYHYB2lZCLU19RFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cD+Ex5xd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cD+Ex5xd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5481F00A3E;
	Fri,  7 Aug 2026 13:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786110696;
	bh=4XzbfYaznPu3wIIjHj+ZahW6QiwoOUvMyF+8z0SW49M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cD+Ex5xdMntPRHdODqT/ZWs1gXw+Q0FEqXnBaDNe7+HqlOcebQosku8Jrguz8Y2/c
	 mxUYdHjjk8d/Nyteu7Bp21/dFfeR3AcBKF31DVCpHzHz/DNaWpfwbDmaxEpPbkcbQ5
	 Jfgb9lhiQVo3IInhqmfKQWXnARaz7pwLjLF0idYCpADLoIjoLwr4IK1XStw7rh9lma
	 qo+2UalmDIRjG7EYTPTEzLlespz3oE4Lrz3wjmmVHBdU6aqKuxk3UpKJ/E+BSZCcvW
	 rRet45qQAYwGFan+/K/+1EV7LFr/ettFyxp4kvhQ76HtLbE0T2jQq3dLV4YeTQ5q+6
	 yvkmMu6eopO+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 16/22] media: i2c: maxim-serdes: add MAX96717 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260807-gmsl2-3_serdes-v15-16-7212e9e5156a@analog.com>
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
 <20260807-gmsl2-3_serdes-v15-16-7212e9e5156a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 13:51:35 +0000
Message-Id: <20260807135136.4D5481F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Incorrect mapping of absolute pin offsets to sparse hardware slew =
rate registers.
- [High] Changing a GPIO's direction to input fails to enable the receiver,=
 causing silent 0 reads.
- [Medium] Boolean DT property `maxim,jitter-compensation` defaults to disa=
bling the feature.
- [Medium] Missing upper bounds check on `num_data_lanes` allows silent tru=
ncation and link corruption.
--

--- Patch [16]: [PATCH v15 16/22] media: i2c: maxim-serdes: add MAX96717 dr=
iver ---
commit 1c2ed4219d13c6784d889f29a381e8396c67efec
Author: Cosmin Tanislav <demonsingur@gmail.com>

media: i2c: maxim-serdes: add MAX96717 driver

Add a new MAX96717 driver that also supports MAX9295A, MAX96717F and
MAX96793. Integrate it with the common serializer framework, while keeping
compatibility with existing usecases, avoiding code duplication, and
also enabling more features across all chips.

> diff --git a/drivers/media/i2c/maxim-serdes/max96717.c b/drivers/media/i2=
c/maxim-serdes/max96717.c
> new file mode 100644
> index 0000000000000..6cc4060e10f34
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max96717.c

[ ... ]

> +static const struct pinconf_generic_params max96717_cfg_params[] =3D {
> +	{ "maxim,jitter-compensation", MAX96717_PINCTRL_JITTER_COMPENSATION_EN,=
 0 },

[Severity: Medium]
When specifying a boolean property like maxim,jitter-compensation in the
device tree without a value, the generic pinctrl parsing applies this
default value of 0. Does this cause max96717_conf_pin_config_set_one() to
receive arg =3D 0 and explicitly clear the TX_COMP_EN bit instead of enabli=
ng
it?=20

Should the default value be 1 to ensure the feature is enabled when
requested?

[ ... ]

> +static int max96717_get_pin_config_reg(unsigned int offset, u32 param,
> +				       unsigned int *reg, unsigned int *mask,
> +				       unsigned int *val)
> +{
> +	*reg =3D MAX96717_GPIO_A(offset);
> +
> +	switch (param) {

[ ... ]

> +	case PIN_CONFIG_SLEW_RATE:
> +		if (offset < 3) {
> +			*reg =3D MAX96717_PIO_SLEW_0;
> +			if (offset =3D=3D 0)
> +				*mask =3D MAX96717_PIO_SLEW_0_PIO00_SLEW;
> +			else if (offset =3D=3D 1)
> +				*mask =3D MAX96717_PIO_SLEW_0_PIO01_SLEW;
> +			else
> +				*mask =3D MAX96717_PIO_SLEW_0_PIO02_SLEW;
> +		} else if (offset < 5) {
> +			*reg =3D MAX96717_PIO_SLEW_1;
> +			if (offset =3D=3D 3)
> +				*mask =3D MAX96717_PIO_SLEW_1_PIO05_SLEW;
> +			else
> +				*mask =3D MAX96717_PIO_SLEW_1_PIO06_SLEW;

[Severity: High]
Does this logic incorrectly map absolute GPIO pin indices to the sparse
hardware slew rate fields?

If a caller passes offset =3D=3D 4 (which maps to MAX96717_RCLK_MFP), it lo=
oks
like this falls into the offset < 5 branch and sets the mask to
MAX96717_PIO_SLEW_1_PIO06_SLEW. Would this inadvertently modify the slew
rate of GPIO6 instead of configuring the intended clock signal?

[ ... ]

> +static int max96717_gpio_direction_input(struct gpio_chip *gc, unsigned =
int offset)
> +{
> +	unsigned long config =3D pinconf_to_config_packed(PIN_CONFIG_INPUT_ENAB=
LE, 1);
> +	struct max96717_priv *priv =3D gpiochip_get_data(gc);
> +
> +	return max96717_conf_pin_config_set_one(priv, offset, config);
> +}

[Severity: High]
When changing a pin's direction to input, does PIN_CONFIG_INPUT_ENABLE
correctly enable the receiver?

Looking at max96717_conf_pin_config_set_one(), PIN_CONFIG_OUTPUT_ENABLE
explicitly disables MAX96717_PINCTRL_RX_EN:

	case PIN_CONFIG_OUTPUT_ENABLE:
		config =3D pinconf_to_config_packed(MAX96717_PINCTRL_RX_EN, 0);
		return max96717_conf_pin_config_set_one(priv, offset, config);

Since max96717_gpio_direction_input() does not re-enable RX_EN, would
switching a pin from output back to input leave its receiver permanently
disabled, causing subsequent reads to silently return 0?

[ ... ]

> +static int max96717_init_phy(struct max_ser *ser,
> +			     struct max_ser_phy *phy)
> +{
> +	struct max96717_priv *priv =3D ser_to_priv(ser);
> +	unsigned int num_data_lanes =3D phy->mipi.num_data_lanes;
> +	unsigned int used_data_lanes =3D 0;
> +	unsigned int val;
> +	unsigned int i;
> +	int ret;
> +
> +	if (num_data_lanes =3D=3D 3 && !priv->info->supports_3_data_lanes) {
> +		dev_err(priv->dev, "Unsupported 3 data lane mode\n");
> +		return -EINVAL;
> +	}
> +
> +	if (phy->mipi.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK &&
> +	    !priv->info->supports_noncontinuous_clock) {
> +		dev_err(priv->dev, "Unsupported non-continuous mode\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Configure a lane count. */
> +	ret =3D regmap_update_bits(priv->regmap, MAX96717_MIPI_RX1,
> +				 MAX96717_MIPI_RX1_CTRL_NUM_LANES,
> +				 FIELD_PREP(MAX96717_MIPI_RX1_CTRL_NUM_LANES,
> +					    num_data_lanes - 1));

[Severity: Medium]
Is there a missing upper bound check on num_data_lanes here?

While the V4L2 core allows up to 8 data lanes, this hardware appears to
support a maximum of 4. If the device tree mistakenly provides 5 lanes,
num_data_lanes - 1 becomes 4, which would overflow the 2-bit field mask
GENMASK(5, 4) and truncate to 0 via FIELD_PREP.

Additionally, a value larger than 4 could cause the following polarity loop
to iterate out of bounds and corrupt unrelated hardware fields:

	for (i =3D 0, val =3D 0; i < num_data_lanes; i++)
		if (phy->mipi.lane_polarities[i + 1])
			val |=3D BIT(i);

Should this function reject configurations where num_data_lanes exceeds
the hardware limits?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-gmsl2-3_se=
rdes-v15-0-7212e9e5156a@analog.com?part=3D16
