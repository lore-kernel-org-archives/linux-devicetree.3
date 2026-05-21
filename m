Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE0D3E92A5
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779370412; cv=none; b=apKDoWWKg+Wx1brOoWLRN9LK/LtNEcixJ3c5BYAlNzOTZNqVDbEixvHU7vhGvVc3ObSswA9io9+ernttn+SSZKaoiauAU38bftLCfvHjyTPsEuy4LZzpr2e2VYWcAWUbmUERDj6IgV1WFWqr3RzAjMbgEfPx/FBrN0fmVmpUg+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779370412; c=relaxed/simple;
	bh=HXnII7reO1xQ0plqGTTDS7o69vDUWFuOOn55w6egLPc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R3w2Wy1/nAh6pMhkj6J1pb5J51CgljOiQ3h0HUXTd4kDxUBSY1qipu/9azvlfKAAcKGBzY24RgvtdXeaWdtcXdCCFzdv69WAWIGou6CObTJQ99Re9pF+A0GaZ152aX+SmpZyk992SuHVdTc66k3omjxp3SzQ65LU4aI08HOU20g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d8tbsWp0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d8tbsWp0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542AC1F000E9;
	Thu, 21 May 2026 13:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779370409;
	bh=mwq3KWPWqNYIy1HLTAyrdvuz2j7+fhWtQ8+WxQj8DbQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d8tbsWp0X74njwtS/WFB5uXgxtaDkawRvMK1AZL6VnQTCNXh6oOlOcaMgotMmOywT
	 n5DTq4qBg9O/R+Sw4xTMxWECexyjZqhld89jd5M5jSRt5Yy4LAZMCaObG80a+ja9Tq
	 Sxcjh2uk+fJIKZEbV/yi3TdWapupY1gjZWgdIZJV4LJpl79WlHtrsDQBJBIAh9Tij1
	 fxtRiCxH9SELzCEgasTQZXPmZzD2Sb60K5nwBhcj84JHVwbMD4C8bSKEWVAZoQx7lL
	 0dxoWWjd+Mchmm2uEYXHAsGMiKxa1lWflpundlz14Q5DyRT/pQAb4hEQvTnb6lMQJy
	 5vJjCxeYoWMDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 16/22] media: i2c: maxim-serdes: add MAX96717 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan via B4 Relay" <devnull+dumitru.ceclan.analog.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260521-gmsl2-3_serdes-v12-16-b26d92931196@analog.com>
References: <20260521-gmsl2-3_serdes-v12-16-b26d92931196@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 13:33:28 +0000
Message-Id: <20260521133329.542AC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Incorrect array mapping logic for Slew Rate PIN configuration
- [High] Unconditional hardcoding of rclkout pin mux bypasses pinctrl frame=
work
- [High] Race condition exposing GPIOs and Clock before hardware initializa=
tion
- [High] gpio_get_direction returns an error for input pins
- [Medium] Kconfig dependency propagation issue for VIDEO_MAX96717
- [Medium] Log spam in clock determine_rate callback
--

commit e3bc10c21430d0bc98ab74141ac3217a5001c9ab
Author: Cosmin Tanislav <demonsingur@gmail.com>

    media: i2c: maxim-serdes: add MAX96717 driver
   =20
    Add a new MAX96717 driver that also supports MAX9295A, MAX96717F and
    MAX96793.
   =20
    Integrate it with the common serializer framework, while keeping
    compatibility with existing usecases, avoiding code duplication, and
    also enabling more features across all chips.

> diff --git a/drivers/media/i2c/maxim-serdes/Kconfig b/drivers/media/i2c/m=
axim-serdes/Kconfig
> index f5a4ca80a263b..ddbb5791e9349 100644
> --- a/drivers/media/i2c/maxim-serdes/Kconfig
> +++ b/drivers/media/i2c/maxim-serdes/Kconfig
> @@ -15,3 +15,21 @@ config VIDEO_MAXIM_SERDES
[ ... ]
> +config VIDEO_MAX96717
> +	tristate "Maxim MAX96717 Serializer support"
> +	depends on COMMON_CLK
> +	depends on I2C
> +	depends on PINCTRL
> +	select VIDEO_MAXIM_SERDES

[Severity: Medium]
Does this symbol need to inherit the dependencies of VIDEO_MAXIM_SERDES? If
VIDEO_MAXIM_SERDES has dependencies that are not met, could selecting it he=
re
cause unmet direct dependency warnings or silent build failures on platforms
lacking the required infrastructure?

> diff --git a/drivers/media/i2c/maxim-serdes/max96717.c b/drivers/media/i2=
c/maxim-serdes/max96717.c
> new file mode 100644
> index 0000000000000..afca6ba51851f
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max96717.c
[ ... ]
> +static int max96717_get_pin_config_reg(unsigned int offset, u32 param,
> +				       unsigned int *reg, unsigned int *mask,
> +				       unsigned int *val)
> +{
[ ... ]
> +	switch (param) {
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
> +		} else if (offset < 7) {
> +			return -EINVAL;

[Severity: High]
Since the offset parameter represents the absolute hardware GPIO pin number
(0 to 10), does this logic incorrectly treat it as a contiguous index?=20

For example, if offset is 3 (GPIO 3), will it write to PIO05_SLEW instead of
returning -EINVAL?

[ ... ]
> +static int max96717_gpio_get_direction(struct gpio_chip *gc, unsigned in=
t offset)
> +{
> +	unsigned long config =3D pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENA=
BLE, 0);
> +	struct max96717_priv *priv =3D gpiochip_get_data(gc);
> +	int ret;
> +
> +	ret =3D max96717_conf_pin_config_get(priv->pctldev, offset, &config);
> +	if (ret)
> +		return ret;
> +
> +	return pinconf_to_config_argument(config) ? GPIO_LINE_DIRECTION_OUT
> +						  : GPIO_LINE_DIRECTION_IN;
> +}

[Severity: High]
Because max96717_conf_pin_config_get() correctly returns -EINVAL when output
enable is false, does returning the error here break direction querying for
all input pins instead of interpreting it as GPIO_LINE_DIRECTION_IN?

[ ... ]
> +static int max96717_clk_determine_rate(struct clk_hw *hw,
> +				       struct clk_rate_request *req)
> +{
> +	struct max96717_priv *priv =3D clk_hw_to_priv(hw);
> +	struct device *dev =3D &priv->client->dev;
> +	unsigned int idx;
> +
> +	idx =3D max96717_clk_find_best_index(priv, req->rate);
> +
> +	if (req->rate !=3D max96717_predef_freqs[idx].freq) {
> +		dev_warn(dev, "Request CLK freq:%lu, found CLK freq:%lu\n",
> +			 req->rate, max96717_predef_freqs[idx].freq);
> +	}

[Severity: Medium]
Since the clock framework routinely queries determine_rate to find the
closest available frequency, will this dev_warn() flood the kernel log duri=
ng
normal clock rate negotiations?

[ ... ]
> +static int max96717_register_clkout(struct max96717_priv *priv)
> +{
> +	struct device *dev =3D &priv->client->dev;
> +	struct clk_init_data init =3D { .ops =3D &max96717_clk_ops };
> +	int ret;
> +
> +	ret =3D max96717_mux_set_rclkout(priv, MAX96717_RCLK_MFP);
> +	if (ret)
> +		return ret;

[Severity: High]
Does hardcoding MAX96717_RCLK_MFP (pin 4) here bypass the pinctrl framework
and override device tree configurations if a board uses the alternate
supported pin (MFP 2) for rclkout?

[ ... ]
> +static int max96717_probe(struct i2c_client *client)
> +{
[ ... ]
> +	ret =3D max96717_wait_for_device(priv);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D max96717_gpiochip_probe(priv);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D max96717_register_clkout(priv);
> +	if (ret)
> +		return ret;
> +
> +	return max_ser_probe(client, &priv->ser);
> +}

[Severity: High]
Can exposing the GPIOs and clock to userspace and other subsystems before
max_ser_probe() completes lead to erratic hardware behavior?=20

Mandatory hardware initialization (like setting CMU2 PFDDIV to 1.1V for
correct functionality) happens later inside max_ser_init() which is trigger=
ed
by max_ser_probe().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-gmsl2-3_se=
rdes-v12-0-b26d92931196@analog.com?part=3D16
