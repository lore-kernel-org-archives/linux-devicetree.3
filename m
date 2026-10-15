Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ECD457E6D
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 06:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792044858; cv=none; b=hbiJNCVpMYtR06fjGsrn9dNt2QeGfOVRoogv5a3RUqJNm5IOQDP1sVL3azA40eqJSuljw7AsPxqy2iltGlOoZDmDSahxSD6WsAMDOqYVFltOq5fwbjbdvV0wfymsQVS7NE+8S10EV3x4R40fDj8hPxn4EhX9Qk3AgxcaJFJHLl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792044858; c=relaxed/simple;
	bh=imQf+O2hNss+xysUdvoVWZ0bOZRzURuetfmotv27mUE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=HqiOR8Em5iwY530GmfaNjEd25RsDmS3UfgMpmkjp24iiBvTpn60snkpwlueZvU3d5jpaWBJBDvjcGyq5IFgs9K/AH5DO94pRoq+qOoqtqrQ1n7V5O8QFmGeEETqLTteT7agf/Q+ahbZ0lZACZ1CUfK8CJzO5qaENfn2h8vGPERY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lncMKiKU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lncMKiKU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 984CF1F000C9;
	Thu, 15 Oct 2026 06:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792044848;
	bh=EXIj9VpuWinPYqJxhGQg8sdmMebjENPkyLayjQfRQvM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lncMKiKUIiT9+pa7M5L3IZXaqddaVbwVuF47ITwh57bN/ar6xTYi8diGM230i4Oww
	 9fTVTk+bv12EfT94Fs2uEFzb15KQmju6vPb+2Uf76YyyLU+4zUm0mS7yzIXxIa3pXP
	 eDgteD5Wy4PXQ2SrD0PdB8m6HbcARg6gl9/7StYwoRqb5spNamc/ueWvmf1Nrz5Jl9
	 JgqhQjDqG35FlUA7UVL/JsBtHyfhoKzunwUHBUBO2BC5CireXGLECPfoWT1HJROXbs
	 2OvgdOFmEJJkSymuOAKnenoFHX5zrgF8j0jpxf0j6UtpQR5v9zlD54JzKluOH2ihka
	 99IdrhOX933cQ==
Message-ID: <sashiko-outbox-172334@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ASoC: codecs: Add driver for Iron Device MA5311
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hyunuk Son" <hyunuk.son@irondevice.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015060408.128711-3-hyunuk.son@irondevice.com>
References: <20261015060408.128711-1-hyunuk.son@irondevice.com>
 <20261015060408.128711-3-hyunuk.son@irondevice.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 06:14:08 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] asoc: missing symmetric constraints allows concurrent PLL reconfig=
uration
- [Medium] irq: thread handler incorrectly returns negative error codes
- [Medium] asoc: uninitialized kernel stack memory leak in ALSA control get=
ters
- [Medium] asoc: hardware reset ALSA control irrevocably desynchronizes DAP=
M state
- [Medium] asoc: falsely advertised 44.1kHz capability fails unconditionally
- [Medium] asoc: ma5311: TOCTOU race between capture_mode_put and DAPM even=
ts
- [Low] i2c: missing named initializers for i2c_device_id array
--

commit cea868f0ad866edece054bdcc99ee119173a63e4
Author: Hyunuk Son <hyunuk.son@irondevice.com>
Date:   Thu Oct 15 06:04:07 2026 +0000

    ASoC: codecs: Add driver for Iron Device MA5311
   =20
    Add an ASoC codec driver for the Iron Device MA5311.
   =20
    The driver supports audio playback and capture through I2S
    and TDM interfaces. It provides ALSA mixer controls for audio
    configuration and uses regmap for register access.

> diff --git a/sound/soc/codecs/ma5311.c b/sound/soc/codecs/ma5311.c
> new file mode 100644
> index 0000000000000..ea6d6793bfb21
> --- /dev/null
> +++ b/sound/soc/codecs/ma5311.c

[ ... ]

> +static int ma5311_adc_volume_control_get(struct snd_kcontrol *kcontrol,
> +					 struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	struct ma5311_priv *ma5311 =3D snd_soc_component_get_drvdata(component);
> +	const struct soc_mixer_control *mc =3D
> +	    (const struct soc_mixer_control *)kcontrol->private_value;
> +	unsigned int *cache =3D ma5311_adc_volume_control_cache(ma5311, mc->reg=
);
> +	unsigned int val;
> +
> +	if (!cache)
> +		return -EINVAL;
> +
> +	regmap_read(ma5311->adc_regmap, mc->reg, &val);
> +
> +	ucontrol->value.integer.value[0] =3D val & MA5311_ADC_VOL_CTRL_MASK;

[Severity: Medium]
Does this code leak uninitialized kernel stack memory to userspace if the I=
2C
transaction fails? The driver uses REGCACHE_NONE, so every read triggers a
physical I2C transaction. If regmap_read() fails and returns a negative err=
or
code, val remains uninitialized, but it is masked and copied to the ucontrol
value anyway.

> +	*cache =3D ucontrol->value.integer.value[0];
> +
> +	return 0;
> +}
> +
> +static int ma5311_adc_volume_control_put(struct snd_kcontrol *kcontrol,
> +					 struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	struct ma5311_priv *ma5311 =3D snd_soc_component_get_drvdata(component);
> +	const struct soc_mixer_control *mc =3D
> +	    (const struct soc_mixer_control *)kcontrol->private_value;
> +	unsigned int val =3D ucontrol->value.integer.value[0];
> +	unsigned int *cache;
> +
> +	if (val < 0 || val > MA5311_ADC_VOL_CTRL_MASK)
> +		return -EINVAL;
> +
> +	cache =3D ma5311_adc_volume_control_cache(ma5311, mc->reg);
> +
> +	if (!cache)
> +		return -EINVAL;
> +
> +	if (*cache =3D=3D val)
> +		return 0;
> +
> +	regmap_update_bits(ma5311->adc_regmap, mc->reg,
> +			   MA5311_ADC_VOL_CTRL_MASK, val);

[Severity: Medium]
Should the software cache update be skipped if the regmap update fails? The
return value of regmap_update_bits() is ignored here, which silently updates
the software cache even when the hardware I2C write fails.

> +
> +	*cache =3D val;
> +
> +	return 1;
> +}

[ ... ]

> +static int ma5311_capture_mode_put(struct snd_kcontrol *kcontrol,
> +				   struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	struct ma5311_priv *ma5311 =3D snd_soc_component_get_drvdata(component);
> +	unsigned int val =3D ucontrol->value.enumerated.item[0];
> +
> +	if (val >=3D ARRAY_SIZE(ma5311_capture_mode_text)) {
> +		dev_err(ma5311->dev, "%s: Out of range\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	if (ma5311->capture_mode =3D=3D val)
> +		return 0;
> +
> +	if (ma5311->adc_power_status) {

[Severity: Medium]
Could this lockless check of adc_power_status lead to a TOCTOU race window?
If a user-space application writes to this mixer control concurrently with
the start or stop of a stream, ma5311_adc_event() (which holds the
dapm_mutex) might update the hardware state right after this check passes,
leading to corrupted audio capture and an inconsistent hardware state.

> +		dev_err(ma5311->dev, "Try after capture is complete.\n");
> +		return -EBUSY;
> +	}

[ ... ]

> +static int ma5311_reset_control_put(struct snd_kcontrol *kcontrol,
> +				    struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	struct ma5311_priv *ma5311 =3D snd_soc_component_get_drvdata(component);
> +	unsigned int val =3D ucontrol->value.enumerated.item[0];
> +	int ret;
> +
> +	if (!val)
> +		return 0;
> +
> +	if (!ma5311->reset_gpio)
> +		return -ENODEV;
> +
> +	ma5311->last_bclk =3D 0;
> +
> +	gpiod_set_value_cansleep(ma5311->reset_gpio, 1);
> +	msleep(MA5311_RESET_ASSERT_MS);
> +	gpiod_set_value_cansleep(ma5311->reset_gpio, 0);
> +	msleep(MA5311_RESET_RECOVERY_MS);
> +
> +	ret =3D ma5311_reset(component);

[Severity: Medium]
Will this hardware reset irrevocably desynchronize the DAPM state if
triggered during an active stream? Because the regmaps use REGCACHE_NONE and
this operation holds no stream locks, the ALSA framework cannot automatical=
ly
restore the previously configured dynamic state (PLL settings, DAPM routing,
etc) after the reset.

> +	dev_dbg(component->dev, "Hardware Reset Done\n");
> +	return ret;
> +}

[ ... ]

> +static int ma5311_dai_hw_params(struct snd_pcm_substream *substream,
> +				struct snd_pcm_hw_params *params,
> +				struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component =3D dai->component;
> +	struct ma5311_priv *ma5311 =3D snd_soc_component_get_drvdata(component);
> +	unsigned int bclk =3D 0;
> +	int ret;
> +
> +	switch (params_rate(params)) {
> +	case 8000:
> +	case 12000:
> +	case 16000:
> +	case 24000:
> +	case 32000:
> +	case 44100:

[Severity: Medium]
Does the advertised support for 44.1kHz streams unconditionally fail in
ma5311_setup_pll()? The hardware parameters explicitly accept 44100 here,
but the ma5311_pll_matches table only contains exact multiples of 48kHz,
which will result in no matching BCLK entry and a failure to configure
the PLL.

> +	case 48000:
> +	case 96000:
> +		break;

[ ... ]

> +static struct snd_soc_dai_driver ma5311_dai[] =3D {
> +	{
> +	 .name =3D "ma5311-amplifier",
> +	 .id =3D 0,
> +	 .playback =3D {
> +		      .stream_name =3D "Playback",
> +		      .channels_min =3D 1,
> +		      .channels_max =3D 2,
> +		      .rates =3D MA5311_RATES_PLAYBACK,
> +		      .formats =3D MA5311_FORMATS,
> +		      },
> +	 .capture =3D {
> +		     .stream_name =3D "Capture",
> +		     .channels_min =3D 1,
> +		     .channels_max =3D 8,
> +		     .rates =3D MA5311_RATES_CAPTURE,
> +		     .formats =3D MA5311_FORMATS,
> +		     },
> +	 .ops =3D &ma5311_dai_ops_amp,

[Severity: High]
Is it possible for concurrent playback and capture streams with different
rates to silently overwrite the shared PLL settings? Without the
.symmetric_rates =3D 1, .symmetric_channels =3D 1, and .symmetric_samplebit=
s =3D 1
flags, ALSA won't enforce symmetry. This means a second stream could
reconfigure the PLL via ma5311_setup_pll() and instantly break the clock and
format for the first stream.

> +	  },
> +};

[ ... ]

> +static irqreturn_t ma5311_irq_thread(int irq, void *data)
> +{
> +	struct ma5311_priv *ma5311 =3D data;
> +	unsigned int dac_status;
> +	unsigned int dac_ocp_status;
> +	unsigned int dac_scp_status;
> +	int ret =3D 0;
> +
> +	ret |=3D regmap_read(ma5311->ctrl_regmap,
> +			   MA5311_DAC_EA_DAC_STATUS, &dac_status);
> +
> +	ret |=3D regmap_read(ma5311->ctrl_regmap,
> +			   MA5311_DAC_EB_DAC_OCP_STATUS, &dac_ocp_status);
> +
> +	ret |=3D regmap_read(ma5311->ctrl_regmap,
> +			   MA5311_DAC_EC_DAC_SCP_STATUS, &dac_scp_status);
> +
> +	if (ret) {
> +		dev_crit(ma5311->dev,
> +			 "Error Occurred During Interrupt Handling\n");
> +		return ret;

[Severity: Medium]
Should this return IRQ_NONE instead of the negative error code from
regmap_read()? Returning a negative errno value from an IRQ thread handler
causes the core IRQ subsystem to misinterpret the state, which can trigger
spurious interrupt warnings and permanently disable the interrupt line.

> +	}

[ ... ]

> +static const struct i2c_device_id ma5311_i2c_id[] =3D { { "ma5311", 0 },=
 { } };

[Severity: Low]
Could you use named initializers for this array element? The global I2C
subsystem guidelines require arrays of type struct i2c_device_id to use nam=
ed
initializers (e.g., { .name =3D "ma5311", .driver_data =3D 0 }).

> +
> +MODULE_DEVICE_TABLE(i2c, ma5311_i2c_id);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015060408.1287=
11-1-hyunuk.son@irondevice.com?part=3D2
