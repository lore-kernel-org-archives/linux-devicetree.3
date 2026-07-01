Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E98531159C
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 14:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915277; cv=none; b=K8VrOZaN/QpSuvEDAEjKj4F9OVTjuBb+l43LFAv6tBQf3wMi6PEfLQANNELO60VC77HCmoKeFyy2Fhw6hjQ+er7Fonzwb2xzcaXhMcjQlXd7PgJfP3FSmAy58PdwTgAblQxByj8dsoR6kb0tWq2MXuRraNk+6NPa2oNCpVkXdBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915277; c=relaxed/simple;
	bh=u2s+oqKRyhdPfqsTDFcgCUAohKm8o9KV5WUohUD0hFg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o8hAgoz8RtPq0ya9HO4tjgST+Lcl2M4NQSBw9VkVbQpB2lvdKGRz0YEZ+dxNGorw4Q8RaKdaYhjIfjD8FSRO825+C+BQ49Q53t2d8Xj4xp5lvya5S97TQby9KyopnqjrAgLZG02s01y9vUQeWrVx2u1Tbb15iyYQuxk9jtNtk+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UzkhlMxM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UzkhlMxM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E93DD1F000E9;
	Wed,  1 Jul 2026 14:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782915276;
	bh=wRK4K42U4ia6LiMedFMH1b/P2RZCArwmzGOfAG49ZAY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UzkhlMxMR8rRlAWSnxiVrobwmDjTz2c0HBjzxoBkfEjWzTSKXHW97IknI0V9Zt1A6
	 MTU1LO3gwa/Z/tRE75UGnQJp19Qw+3KiVjo5mnl6MKXT2kxs51zdwrrHcR0wQSRaOf
	 ja5hbUU/4S0B8mV816VIaJs6QwpzOstVOY8fs4dU01On3uOxDzLOWcP26ota0+QX5D
	 BZhFNYV4JPVQvvACwM5/26f82B6jSkytL/iGJd1C/B2CA3pjH3HihzoswYSJnDCDsu
	 r3+bdz74Nap28JhfWUuObbqcw7+rk8K0KiXVLABTi7mCXrq3XSq/psdqcNkcMVBdaD
	 o5wruCoXJsAZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: codecs: add Qualcomm WSA885X codec driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasad Kumpatla" <prasad.kumpatla@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260701135913.1641328-3-prasad.kumpatla@oss.qualcomm.com>
References: <20260701135913.1641328-1-prasad.kumpatla@oss.qualcomm.com>
 <20260701135913.1641328-3-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 14:14:35 +0000
Message-Id: <20260701141435.E93DD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] The `hw_free` callback destructively resets persistent DAI configu=
rations, breaking subsequent playback.
- [High] Calling `snd_soc_component_exit_regmap` on a devm-managed regmap c=
auses a double free and Use-After-Free.
- [Medium] Missing state_lock acquisition in ALSA kcontrol put handlers cau=
ses data races with DAI callbacks.
- [Medium] Incomplete hardware state restoration in `mute_stream` leaves th=
e receiver path latched in mono configuration.
- [Medium] Misleading DAI capabilities advertise unsupported sample rates.
- [Medium] Speculative missing spin-up delay after powerdown GPIO deasserti=
on.
--

commit e15bd0da567eddb8e96d21ded36e450db91c562c
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

ASoC: codecs: add Qualcomm WSA885X codec driver
   =20
Add an ASoC codec driver for the Qualcomm WSA885X stereo smart speaker
amplifier controlled over I2C.

> diff --git a/sound/soc/codecs/wsa885x.c b/sound/soc/codecs/wsa885x.c
> new file mode 100644
> index 0000000000000..7a3f6373f5d95
> --- /dev/null
> +++ b/sound/soc/codecs/wsa885x.c
> @@ -0,0 +1,1490 @@

[ ... ]

> +static int wsa885x_codec_hw_params(struct snd_pcm_substream *substream,
> +				   struct snd_pcm_hw_params *params,
> +				   struct snd_soc_dai *dai)
> +{
> +	struct wsa885x_priv *wsa885x;
> +	u8 pcm_rate, cs21_sample_rate_idx, cs24_sample_rate_idx;
> +
> +	wsa885x =3D snd_soc_component_get_drvdata(dai->component);
> +
> +	switch (params_rate(params)) {
> +	case 8000:

[ ... ]

> +	case 352800:
> +	case 384000:
> +		pcm_rate =3D WSA885X_I2S_CTL0_PCM_RATE_384_OR_352KHZ;
> +		cs21_sample_rate_idx =3D WSA885X_RX_RATE_384000HZ;
> +		cs24_sample_rate_idx =3D WSA885X_VI_RATE_384000HZ;
> +		break;
> +	default:
> +		dev_err(wsa885x->dev, "sampling rate %d is not supported\n", params_ra=
te(params));
> +		return -EINVAL;
> +	}

[ ... ]

> +static int wsa885x_codec_mute_stream(struct snd_soc_dai *dai, int mute, =
int stream)
> +{

[ ... ]

> +		if (wsa885x->rx_slot_mask =3D=3D WSA885X_CHANNEL_STEREO) {
> +			regmap_write(wsa885x->regmap, WSA885X_DIG_CTRL0_PA_FSM_CTL, 0x03);
> +		} else if (wsa885x->rx_slot_mask =3D=3D WSA885X_CHANNEL_MONO_LEFT) {
> +			regmap_write(wsa885x->regmap, WSA885X_DIG_CTRL0_PA_FSM_CTL, 0x01);
> +		} else if (wsa885x->rx_slot_mask =3D=3D WSA885X_CHANNEL_MONO_RIGHT) {
> +			regmap_write(wsa885x->regmap, WSA885X_DIG_CTRL0_PA_FSM_CTL, 0x02);
> +			regmap_write(wsa885x->regmap, WSA885X_DIG_CTRL1_I2S_TDM_CH_RX, 0x01);
> +		}

[Severity: Medium]
Does this leave the hardware latched in a mono right configuration?

If the active rx_slot_mask is WSA885X_CHANNEL_MONO_RIGHT,
WSA885X_DIG_CTRL1_I2S_TDM_CH_RX is explicitly set to 0x01. If the mask is
later changed to STEREO or MONO_LEFT via kcontrol, the subsequent un-mute
operation evaluates the other branches but doesn't restore
WSA885X_DIG_CTRL1_I2S_TDM_CH_RX back to its default (0x08).

[ ... ]

> +static int wsa885x_codec_hw_free(struct snd_pcm_substream *substream,
> +				 struct snd_soc_dai *dai)
> +{
> +	static const struct reg_sequence regs[] =3D {
> +		{ WSA885X_DIG_CTRL1_I2S_RESET_CTL, 0x00 },
> +		{ WSA885X_DIG_CTRL1_I2S_CFG0_TDM_TX, 0x00 },
> +		{ WSA885X_DIG_CTRL1_I2S_CFG1_TDM_TX, 0x00 },
> +		{ WSA885X_DIG_CTRL1_I2S_TDM_CTL1, 0x05 },
> +		{ WSA885X_DIG_CTRL1_I2S_TDM_CTL0, 0x00 },
> +		{ WSA885X_DIG_CTRL1_I2S_TDM_CH_TX, 0x00 },
> +		{ WSA885X_DIG_CTRL1_I2S_CTL0, 0x06 },
> +		{ WSA885X_DIG_CTRL1_I2S_TDM_CH_RX, 0x08 },
> +		{ WSA885X_DIG_CTRL0_PA_FSM_CTL, 0x00 },
> +		{ WSA885X_DIG_CTRL0_POWER_FSM_CTL1, 0x00 },
> +		{ WSA885X_DIG_CTRL0_CLK_SOURCE_ENABLE, 0x00 },
> +		{ WSA885X_DIG_CTRL0_SYS_CLK_SEL, 0x00 },
> +		{ WSA885X_ANA_TOP_BG_TVP_OVRD_CTL, 0x00 },
> +	};

[Severity: High]
Does clearing these registers break subsequent audio playback?

These register sequences clear persistent TDM and clock configurations like
WSA885X_DIG_CTRL0_SYS_CLK_SEL and WSA885X_DIG_CTRL0_CLK_SOURCE_ENABLE.=20

Since machine drivers often invoke set_sysclk and set_tdm_slot only once
during machine initialization or startup, won't hw_free leaving the codec
without a clock source cause the next stream to fail?

[ ... ]

> +static struct snd_soc_dai_driver wsa885x_dai[] =3D {
> +	{
> +		.name =3D "wsa885x_dai_drv",
> +		.playback =3D {
> +			.stream_name =3D "WSA885X TDM Playback",
> +			.channels_min =3D 1,
> +			.channels_max =3D 2,
> +				.rates =3D SNDRV_PCM_RATE_8000_192000 |
> +					 SNDRV_PCM_RATE_352800 |
> +					 SNDRV_PCM_RATE_384000,

[Severity: Medium]
Does this inadvertently advertise unsupported intermediate sample rates?

SNDRV_PCM_RATE_8000_192000 includes intermediate rates like 11025Hz, 22050H=
z,
and 64000Hz, but wsa885x_codec_hw_params() falls through to the default
case and returns -EINVAL for them. This can cause userspace applications to
fail abruptly when they try to negotiate formats.

[ ... ]

> +static void wsa885x_component_remove(struct snd_soc_component *component)
> +{
> +	if (!component)
> +		return;
> +
> +	snd_soc_component_exit_regmap(component);
> +}

[Severity: High]
Can this lead to a double free and use-after-free?

wsa885x->regmap is allocated via devm_regmap_init_i2c(), so devres will
automatically call regmap_exit() on device unbind. Calling
snd_soc_component_exit_regmap() here explicitly calls regmap_exit() early.=
=20

If the sound card unbinds the ASoC component first, the regmap is freed, but
the I2C device is still bound and its IRQ handler remains active. If an
interrupt triggers, wsa885x_interrupt_handler() will access the freed regmap
resulting in a use-after-free. Later, devres will double-free the regmap
when the I2C device is actually removed.

[ ... ]

> +static int wsa885x_rx_slot_mask_put(struct snd_kcontrol *kcontrol,
> +				    struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	struct wsa885x_priv *wsa885x =3D snd_soc_component_get_drvdata(componen=
t);
> +	u32 mask =3D ucontrol->value.integer.value[0];
> +
> +	if (!wsa885x_is_valid_rx_slot_mask(mask))
> +		return -EINVAL;
> +
> +	if (wsa885x->rx_slot_mask =3D=3D mask)
> +		return 0;
> +
> +	wsa885x->rx_slot_mask =3D mask;

[Severity: Medium]
Should this modification be protected by wsa885x->state_lock?

wsa885x_codec_mute_stream() evaluates rx_slot_mask multiple times in an
if-else if chain. If this kcontrol is written concurrently, mute_stream()
could see different values for rx_slot_mask during the same invocation,
potentially skipping all conditional branches and leaving
WSA885X_DIG_CTRL0_PA_FSM_CTL unconfigured.

[ ... ]

> +static int wsa885x_probe(struct i2c_client *client)
> +{

[ ... ]

> +	wsa885x->sd_n =3D devm_gpiod_get(dev, "powerdown", GPIOD_OUT_HIGH);
> +	if (IS_ERR(wsa885x->sd_n))
> +		return dev_err_probe(dev, PTR_ERR(wsa885x->sd_n),
> +							 "Shutdown Control GPIO not found\n");
> +
> +	gpiod_set_value_cansleep(wsa885x->sd_n, false);
> +
> +	ret =3D devm_add_action_or_reset(dev, wsa885x_gpio_powerdown, wsa885x);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "devm_add_action_or_reset failed\n");
> +
> +	i2c_set_clientdata(client, wsa885x);
> +
> +	ret =3D devm_snd_soc_register_component(dev, component_driver,
> +					      wsa885x_dai,
> +					      ARRAY_SIZE(wsa885x_dai));

[Severity: Medium]
Does the codec require a stabilization delay after deasserting the shutdown
GPIO?

Hardware audio codecs typically need a short delay (e.g. 5-20ms) after
coming out of hard reset before their internal digital logic can acknowledge
I2C traffic. Since wsa885x_component_probe() will issue I2C commands
immediately upon component registration via wsa885x_hw_init(), could this
lead to I2C NACKs or timeouts on some platforms?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701135913.1641=
328-1-prasad.kumpatla@oss.qualcomm.com?part=3D2
