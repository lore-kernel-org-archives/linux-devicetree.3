Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792507750;
	b=LG0FV6pvhB1/MEZSgDGvmQXETIMFEowemurhwO6qNtJHnhI24tsiJKUzgsZjdcpdAXV2
	 YbcZ8X3L8DeymD9rApliHjcknfMas+sb0T0qa7Xhl2Gsm3OiBgu9t5tJI/Ffurh1biGw4
	 3AQZU1dfTVQ/gSFYKg55bDoA5XdgV79LUBBa+OHLo0sXSCtcce9MYD2RNCsckFTaV1Er+
	 oa3T7lhXa6ue9bv2di0R8EXi2VKmvTBX24K2BUJxZWuXfoZInvA5H/OoThWNH6ZoCy6m4
	 JaKL34a8H/7g+M0j6qmYfaksC/nyAhhk/VMZshJWmNsXaDjrPmAr22+W6ATqSR7895w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507750;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=po93OuJjOT9e1ZVPJZRxpXLH8Gv/o4VTm01+JBTQC5M=;
	b=BATZTAIKJipBQacUk5q6I/6tkHNLmvrOy6ayTAkmrYXKhokw4pOqs7OGv9038gCQAqm4
	 kdsCG3N6ARJHCLh9XL5usqH0Bab8JXagfFujJ0oqnbHKEQfFwsfwR3u30hCqFt4CQe3c2
	 NJ8Tiw9rS6+plDUAkcNeimXiLy2jDqACJS3oO6NaJDPLxeJIevlI+6qjJISMOOCUGcC64
	 b1wplpwWR1pU/9eMNdujUE79rxNeOCATT/hdII5RnRanZ/t9XN1baLTKQ1mABuh6xcuI7
	 9eDEsfrplH6jQ7B1vUFW/mUCigyK5P339DMq5YR3ShLTaNZhEkMqQJBNWhw4VB2xzQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZH4t6sNP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01869606A31A
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 14:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZH4t6sNP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9538B1F000C4;
	Tue, 20 Oct 2026 14:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792507749;
	bh=po93OuJjOT9e1ZVPJZRxpXLH8Gv/o4VTm01+JBTQC5M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZH4t6sNPdpASHv5k/Ut09fElEj8+u5c1lUmALnxrSjkZWsGZibwVGp/XLbyXDTfvt
	 utLrRSWRcOmh6dFEl7gSUXf0c90qmzeJ1u4zDb+4kUjlPAOwXo1kMtD3Cv16/i/zAk
	 kRhgHrNH0dPgRz3ZzUpJ/XzRc5unguzRQNUIxAa8Y2l6Ot0InjTfLda6fHQG3rKJf7
	 a1I/zyL+MVdRajUxQnbzvhHmnS3rI1v6bFQS2S10zddag7nglEtk10QYCJ29GdS3eT
	 pdn0pntRvH2hXja7NNqG3sGxR3HU9SVR6m+43QkwFePSEglkP7t4xGVWWH3BqS+Bwr
	 G/AXtzpIzJ81A==
Message-ID: <sashiko-outbox-179194@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ASoC: codecs: add support for Everest ES7202 PDM
 ADC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jun Yan" <jerrysteve1101@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261020143135.623897-3-jerrysteve1101@gmail.com>
References: <20261020143135.623897-1-jerrysteve1101@gmail.com>
 <20261020143135.623897-3-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 14:49:09 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] ASoC: es7202: unsigned supply_uv breaks regulator_get_voltage() =
error check
- [Medium] ASoC: es7202: unmute in es7202_hw_init() skipped due to regmap c=
ache default
- [Medium] ASoC: es7202: broken power-up sequence and mute state in es7202_=
resume()
- [Low] ASoC: es7202: unused es7202_of_match warning with of_match_ptr() wh=
en !CONFIG_OF
--

commit 4a58517803f32764e08604ccc9d3e4df540a41cb
Author: Jun Yan <jerrysteve1101@gmail.com>

ASoC: codecs: add support for Everest ES7202 PDM ADC

This commit adds an ASoC codec driver for the Everest Semiconductor ES7202
2-channel PDM analog-to-digital converter controlled over I2C.

Link: https://archive.org/details/es-7202-ds

> diff --git a/sound/soc/codecs/es7202.c b/sound/soc/codecs/es7202.c
> new file mode 100644
> index 0000000000000..c30b0123c91f8
> --- /dev/null
> +++ b/sound/soc/codecs/es7202.c
> @@ -0,0 +1,372 @@

[ ... ]

> +struct es7202_priv {
> +	struct regmap *regmap;
> +	struct regulator *supply;
> +	struct gpio_desc *reset_gpio;
> +	unsigned int supply_uv;
> +};
> +
> +static bool es7202_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	/* status and device-id registers are read-only, never cached */
> +	return reg =3D=3D ES7202_CHIP_STA ||
> +	       reg =3D=3D ES7202_DEV_ID1 ||
> +	       reg =3D=3D ES7202_DEV_ID0;
> +}
> +
> +static const struct reg_default es7202_reg_defaults[] =3D {
> +	{ ES7202_RESET,		0x10 },
> +	{ ES7202_SOFT_MODE,	0x00 },
> +	{ ES7202_CLK_DIV,	0x04 },
> +	{ ES7202_CLK_EN,	0x00 },
> +	{ ES7202_T1_VMID,	0x01 },
> +	{ ES7202_T2_VMID,	0x18 },
> +	{ ES7202_PDM_INF_CTL,	0x30 },

[ ... ]

> +static int es7202_mute_pdm(struct es7202_priv *es7202, bool mute)
> +{
> +	return regmap_update_bits(es7202->regmap, ES7202_PDM_INF_CTL,
> +				  ES7202_PDM_INF_CTL_MUTE,
> +				  mute ? ES7202_PDM_INF_CTL_MUTE : 0);
> +}
> +
> +static int es7202_hw_init(struct es7202_priv *es7202)
> +{
> +	struct regmap *regmap =3D es7202->regmap;
> +	bool is_1v8 =3D es7202->supply_uv > 0 &&
> +		      es7202->supply_uv <=3D ES7202_SUPPLY_1V8_MAX_UV;
> +	/*
> +	 * Power-up sequence from the vendor driver.
> +	 * The analog front-end is configured for the actual supply voltage
> +	 * (1.8 V vs 3.3 V) and the analog blocks are ramped out of
> +	 * power-down in stages.
> +	 */
> +	const struct reg_sequence init_seq[] =3D {
> +		{ ES7202_SOFT_MODE,	ES7202_MODE_SOFT_MODE_SEL },
> +		{ ES7202_ANALOG_MISC1,	ES7202_ANALOG_MISC1_OFFSETSEL1 |
> +					(is_1v8 ? 0 : ES7202_ANALOG_MISC1_SUPPLYSEL) },
> +
> +		/* 30.75 dB gain */
> +		{ ES7202_PGA1,		ES7202_PGA_SELMIC1 |
> +					FIELD_PREP(ES7202_PGA_MIC1_GAIN, 11) },
> +		{ ES7202_PGA2,		ES7202_PGA_SELMIC2 |
> +					FIELD_PREP(ES7202_PGA_MIC2_GAIN, 11) },
> +
> +		/* analog on, rest powered down */
> +		{ ES7202_ANALOG_EN,	ES7202_ANALOG_EN_PDN_ADCVREFGEN |
> +					ES7202_ANALOG_EN_MODTOP1_RST |
> +					ES7202_ANALOG_EN_MODTOP2_RST |
> +					ES7202_ANALOG_EN_PDN_MOD1 |
> +					ES7202_ANALOG_EN_PDN_MOD2 |
> +					ES7202_ANALOG_EN_PDN_PGA1 |
> +					ES7202_ANALOG_EN_PDN_PGA2 },
> +
> +		{ ES7202_BIAS_VMID,	FIELD_PREP(ES7202_BIAS_ADCBIAS_SWH1, 3) |
> +					ES7202_BIAS_ENDITHER |
> +					FIELD_PREP(ES7202_BIAS_VMIDSEL, 3) },
> +
> +		/* VREFGEN on; 3.3 V also drops MODTOP reset */
> +		{ ES7202_ANALOG_EN,	is_1v8 ?
> +					(ES7202_ANALOG_EN_MODTOP1_RST |
> +					 ES7202_ANALOG_EN_MODTOP2_RST |
> +					 ES7202_ANALOG_EN_PDN_MOD1 |
> +					 ES7202_ANALOG_EN_PDN_MOD2 |
> +					 ES7202_ANALOG_EN_PDN_PGA1 |
> +					 ES7202_ANALOG_EN_PDN_PGA2) :
> +					(ES7202_ANALOG_EN_PDN_MOD1 |
> +					 ES7202_ANALOG_EN_PDN_MOD2 |
> +					 ES7202_ANALOG_EN_PDN_PGA1 |
> +					 ES7202_ANALOG_EN_PDN_PGA2) },
> +
> +		{ ES7202_ANALOG_EN,	0 },
> +		{ ES7202_MOD1_BIAS,	FIELD_PREP(ES7202_MOD1_BIAS_SW0, 5) |
> +					FIELD_PREP(ES7202_MOD1_BIAS_SW1, 8) },
> +		{ ES7202_CLK_DIV,	FIELD_PREP(ES7202_CLK_DIV_MCLK_DIV, 1) },
> +		{ ES7202_T2_VMID,	0x01 },
> +		{ ES7202_MISC_CTL,	ES7202_MISC_DSM_DITHER_ON },
> +		{ ES7202_RESET,		ES7202_RESET_CSM_ON },
> +		{ ES7202_CLK_EN,	ES7202_CLK_ANA_CLK_ON | ES7202_CLK_MCLK_ON },
> +		{ ES7202_BIAS_VMID,	FIELD_PREP(ES7202_BIAS_ADCBIAS_SWH1, 3) |
> +					ES7202_BIAS_ENDITHER |
> +					FIELD_PREP(ES7202_BIAS_VMIDSEL, 2) },
> +	};
> +	int ret;
> +
> +	ret =3D regmap_multi_reg_write(regmap, init_seq, ARRAY_SIZE(init_seq));
> +	if (ret)
> +		return ret;
> +
> +	return es7202_mute_pdm(es7202, false);
> +}

[Severity: Medium]
Will es7202_mute_pdm(es7202, false) at the end of es7202_hw_init() ever
write to the hardware?

In es7202_reg_defaults[], ES7202_PDM_INF_CTL is initialized in the
REGCACHE_MAPLE cache to 0x30, which already has the ES7202_PDM_INF_CTL_MUTE
bits [1:0] cleared. Because init_seq does not touch ES7202_PDM_INF_CTL or
reset the register file (ES7202_RESET_RST_REGS), regmap_update_bits() in
es7202_mute_pdm(es7202, false) sees that the cached value is already 0x30
and skips the I2C write.

If the driver was previously unbound via es7202_i2c_remove() or the system
went through es7202_i2c_shutdown() (both of which write 0x33 to mute
ES7202_PDM_INF_CTL in hardware) and is then rebound or warm-rebooted on a
board without the optional reset-gpios or a switched vdd-supply, both
es7202_hw_init() and the subsequent es7202_mute_stream() on capture startup
will be skipped by the regmap cache, leaving the hardware muted.

[ ... ]

> +static int es7202_suspend(struct snd_soc_component *component)
> +{
> +	struct es7202_priv *es7202 =3D snd_soc_component_get_drvdata(component);
> +
> +	return es7202_mute_pdm(es7202, true);
> +}
> +
> +static int es7202_resume(struct snd_soc_component *component)
> +{
> +	struct es7202_priv *es7202 =3D snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	regcache_mark_dirty(es7202->regmap);
> +	ret =3D regcache_sync(es7202->regmap);
> +	if (ret)
> +		return ret;
> +
> +	return es7202_mute_pdm(es7202, false);
> +}

[Severity: Medium]
Does es7202_resume() properly restore the hardware state and mute status
after system suspend?

In es7202_hw_init(), the chip requires a staged power-up sequence that
enables ES7202_SOFT_MODE, configures ES7202_ANALOG_MISC1 for the supply
voltage, ramps ES7202_ANALOG_EN across three writes while fast-charging VMID
with VMIDSEL=3D3 in ES7202_BIAS_VMID, and finally switches ES7202_BIAS_VMID=
 to
VMIDSEL=3D2.

In es7202_resume(), regcache_sync() writes the final cached register values
in ascending address order (0x00 to 0x1e). If the device lost power or was
reset during suspend, this writes ES7202_RESET (0x00) before
ES7202_SOFT_MODE (0x01) and powers on all analog blocks at once in
ES7202_ANALOG_EN (0x10 =3D 0x00) before ES7202_ANALOG_MISC1 (0x1b) is
configured for 3.3 V, skipping the analog ramp and VMID fast-charge stages.

Additionally, es7202_suspend() calls es7202_mute_pdm(es7202, true), which
updates the cached value of ES7202_PDM_INF_CTL to muted (0x33), and
es7202_resume() then unconditionally calls es7202_mute_pdm(es7202, false),
unmuting the PDM output even if no capture stream was active and the DAI was
muted via es7202_mute_stream() prior to suspend.

[ ... ]

> +static int es7202_i2c_probe(struct i2c_client *i2c)
> +{
> +	struct device *dev =3D &i2c->dev;
> +	struct es7202_priv *es7202;
> +	unsigned int id1, id0, device_id;
> +	int ret;

[ ... ]

> +	es7202->supply =3D devm_regulator_get_optional(dev, "vdd");
> +	if (IS_ERR(es7202->supply)) {
> +		if (PTR_ERR(es7202->supply) !=3D -ENODEV)
> +			return dev_err_probe(dev, PTR_ERR(es7202->supply),
> +					     "failed to get supply\n");
> +
> +		es7202->supply =3D NULL;
> +		es7202->supply_uv =3D ES7202_SUPPLY_3V3_DEFAULT_UV;
> +	} else {
> +		ret =3D regulator_enable(es7202->supply);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to enable supply\n");
> +
> +		ret =3D devm_add_action_or_reset(dev, es7202_disable_supply,
> +					       es7202->supply);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to add supply disable action\n");
> +
> +		es7202->supply_uv =3D regulator_get_voltage(es7202->supply);
> +		if (es7202->supply_uv < 0)
> +			es7202->supply_uv =3D ES7202_SUPPLY_3V3_DEFAULT_UV;
> +	}

[Severity: Medium]
Since es7202->supply_uv is declared as unsigned int in struct es7202_priv,
won't the check:

	es7202->supply_uv =3D regulator_get_voltage(es7202->supply);
	if (es7202->supply_uv < 0)
		es7202->supply_uv =3D ES7202_SUPPLY_3V3_DEFAULT_UV;

always evaluate to false?

If regulator_get_voltage() returns a negative error code (such as -EINVAL
when a regulator does not support voltage queries or when CONFIG_REGULATOR =
is
disabled), storing it directly into unsigned int es7202->supply_uv wraps it
to a large positive value and skips the fallback to
ES7202_SUPPLY_3V3_DEFAULT_UV.

[ ... ]

> +static const struct of_device_id es7202_of_match[] =3D {
> +	{ .compatible =3D "everest,es7202" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, es7202_of_match);
> +
> +static const struct i2c_device_id es7202_i2c_id[] =3D {
> +	{ "es7202" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, es7202_i2c_id);
> +
> +static struct i2c_driver es7202_i2c_driver =3D {
> +	.driver =3D {
> +		.name		=3D "es7202",
> +		.of_match_table	=3D of_match_ptr(es7202_of_match),
> +	},

[Severity: Low]
When CONFIG_OF is disabled, of_match_ptr(es7202_of_match) expands to NULL
while es7202_of_match is defined unconditionally without __maybe_unused.
Could of_match_ptr() be dropped here to avoid an unused-const-variable
warning when building with !CONFIG_OF?

> +	.probe		=3D es7202_i2c_probe,
> +	.remove		=3D es7202_i2c_remove,
> +	.shutdown	=3D es7202_i2c_shutdown,
> +	.id_table	=3D es7202_i2c_id,
> +};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020143135.6238=
97-1-jerrysteve1101@gmail.com?part=3D2
