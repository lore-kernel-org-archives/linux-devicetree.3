Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5AA31E830
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 02:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787624983; cv=none; b=F4C3QsoaJwsT9nwfjDrZF6Lg2PvpMTpRSBjOSh0v81l6HLq7sV20uGxpTyX92YMg2M1yfNQMQFhQ50eBZ8lyN8hACn/V4TCFE9YuP9iRcSV8XRPmaVVxmOppsdXR9Qvo66q+tnuPD5Uydda5YZMZZazkK4vUK3db+s/OvWwsTg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787624983; c=relaxed/simple;
	bh=84QHTJHLKh9BGI3g7BtUENC4CStNgfmhW2guNs39uWY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jmn7K6BIIxKoMFxh4t2OmkEEWyXwAK4KGElceGknEojd1alue0U7vY9VWk3q8WC3M9bvNOWtkWejZRbMHWBcL1AsvyKB4ITC/QtQ3dF87LJ3KAlU/BJoblvcvsRutq7KsabjpdIln99G54EAn7sfqb1bvtr56wka0GsV9VZ02ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ws0cDLQV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ws0cDLQV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4361F00A3A;
	Tue, 25 Aug 2026 02:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787624981;
	bh=4rzkU77KTIE8tnzWx9CiEUmB9vBJDQWtL5DbyQcSRlA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ws0cDLQV0LTIv0ur9LU5YbblxMVUQ8N7MqMLgvw4NQWKfJZfnAbKsXdpoY3Uiei05
	 McwFJWmF6166UTIpUZKZrS7rspELfIDQ9Hu3pweIJYXEbeO7eWXMT1ds5/idqTe/HJ
	 +Vxu7+C0mpWFeLuaSxV1C4+HW/hRKAd8atuE3QGfr+jlBBRix5RkVVB6o3FZau6SVd
	 PJZI9EZyVnVSj56XAZHAP7U5GZZ42Ogkj13y+i/Hf5xRQIl0Rf8gQq2iiB0skXNy2b
	 IdLoor9k//HankgE44aoYKddoFm0dhxYEO04OpuAkYCUPc/NdWUQs/MAA8ngaKCWBk
	 k/asTyC2R2lUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neo Chang" <YLCHANG2@nuvoton.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260825021644.1203076-3-YLCHANG2@nuvoton.com>
References: <20260825021644.1203076-1-YLCHANG2@nuvoton.com>
 <20260825021644.1203076-3-YLCHANG2@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 02:29:41 +0000
Message-Id: <20260825022941.8A4361F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Regmap `val_bits =3D 16` causes all 32-bit DSP commands to be reje=
cted and replies to be truncated, completely breaking DSP initialization.
- [High] Asymmetric clearing of TDM TX and RX enable flags breaks subsequen=
t audio capture streams.
- [High] AB-BA lock inversion deadlock between `nau8360->lock` and the ASoC=
 DAPM mutex.
- [High] Audio playback can resume before asynchronous DSP firmware loading=
 completes, potentially causing DSP crashes or invalid audio output.
- [High] The background work `load_fw_work` is scheduled in the ASoC compon=
ent `.probe` callback, but the driver lacks an ASoC component `.remove` cal=
lback to cancel it.
- [High] nau8360_resume() corrupts the cached clock and DSP state by callin=
g nau8360_dsp_bootup() without bypassing the regcache.
--

--- Patch [2]: [PATCH v10 2/2] ASoC: codecs: nau8360: Add support for NAU83=
G60 amplifier ---
commit a968f346c53b7f4b17a1854ba82cf86c1d38cc5f
Author: Neo Chang <YLCHANG2@nuvoton.com>
Subject: ASoC: codecs: nau8360: Add support for NAU83G60 amplifier

This commit introduces support for the Nuvoton NAU83G60 stereo smart
amplifier. The driver implements I2C control, DSP firmware loading for
the KCS algorithm, and DAPM routing for DAC, ADC, and internal engines.

> --- /dev/null
> +++ b/sound/soc/codecs/nau8360.c
[ ... ]
> +static int nau8360_peq_coeff_put(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *cp =3D snd_kcontrol_chip(kcontrol);
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(cp);
> +	struct nau8360 *nau8360 =3D snd_soc_component_get_drvdata(cp);
[ ... ]
> +	snd_soc_dapm_mutex_lock(dapm);
> +	if (snd_soc_component_active(cp)) {
> +		dev_dbg(nau8360->dev,
> +			"PEQ coefficient access is ignored during audio is active");
> +		ret =3D -EBUSY;
> +		goto unlock_dapm;
> +	}
> +
> +	reg =3D nau8360_peq_regaddr(kcontrol->id.name);
> +	if (reg < 0) {
> +		ret =3D reg;
> +		goto unlock_dapm;
> +	}
> +
> +	data =3D kmemdup(ucontrol->value.bytes.data, params->max, GFP_KERNEL);
> +	if (!data) {
> +		ret =3D -ENOMEM;
> +		goto unlock_dapm;
> +	}
> +
> +	mutex_lock(&nau8360->lock);

[Severity: High]
Could this lock ordering cause an AB-BA deadlock with the ALSA mixer?

In nau8360_peq_coeff_put(), the code acquires snd_soc_dapm_mutex_lock() bef=
ore
mutex_lock(&nau8360->lock). However, in nau8360_dac_mux_put_enum() below, t=
he
driver acquires mutex_lock(&nau8360->lock) and then calls
snd_soc_dapm_put_enum_double(), which blocks acquiring the DAPM mutex.
Since the ALSA core permits concurrent put callbacks on different kcontrols,
this inversion might hang the system.

> +static int nau8360_dac_mux_put_enum(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_dapm_kcontrol_to_dapm(kco=
ntrol);
> +	struct snd_soc_component *component =3D snd_soc_dapm_to_component(dapm);
> +	struct nau8360 *nau8360 =3D snd_soc_component_get_drvdata(component);
> +	struct soc_enum *e =3D (struct soc_enum *)kcontrol->private_value;
> +	unsigned int *item =3D ucontrol->value.enumerated.item;
> +	int ret =3D 0;
> +
> +	if (snd_soc_dapm_get_bias_level(dapm) > SND_SOC_BIAS_STANDBY) {
> +		dev_warn(nau8360->dev, "changing path is not allowed during playback");
> +		return ret;
> +	}
> +
> +	mutex_lock(&nau8360->lock);
> +
> +	ret =3D snd_soc_dapm_put_enum_double(kcontrol, ucontrol);

[ ... ]
> +static int nau8360_startup(struct snd_pcm_substream *substream, struct s=
nd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component =3D dai->component;
> +	struct nau8360 *nau8360 =3D snd_soc_component_get_drvdata(component);
> +	unsigned int i2s_mask =3D NAU8360_FRAME_START_MASK | NAU8360_RX_OFFSET_=
MASK;
> +	unsigned int i2s_fmt =3D NAU8360_FRAME_START_H2L | NAU8360_RX_OFFSET_I2=
S;
> +	int val =3D 0;
> +
> +	flush_work(&nau8360->load_fw_work);
> +
> +	if (nau8360_dsp_active(component) && !nau8360->load_fw_done) {
> +		dev_warn(nau8360->dev, "DSP firmware is not ready yet!");
> +		return -EBUSY;
> +	}
> +
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
> +		regmap_read(nau8360->regmap, NAU8360_R0B_I2S_PCM_CTRL1, &val);
> +		if ((val & i2s_mask) =3D=3D i2s_fmt)
> +			regmap_update_bits(nau8360->regmap, NAU8360_R0B_I2S_PCM_CTRL1,
> +				NAU8360_EN_TDM_RX, NAU8360_EN_TDM_RX);
> +
> +		if (nau8360_dsp_active(component))
> +			snd_soc_dapm_enable_pin(nau8360->dapm, "Sense");
> +	}
> +
> +	return 0;
> +}
> +
> +static void nau8360_shutdown(struct snd_pcm_substream *substream,
> +	struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component =3D dai->component;
> +	struct nau8360 *nau8360 =3D snd_soc_component_get_drvdata(component);
> +	unsigned int tdm_mask;
> +
> +	tdm_mask =3D (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) ?
> +		NAU8360_EN_TDM_RX : NAU8360_EN_TDM_TX;
> +	regmap_update_bits(nau8360->regmap, NAU8360_R0B_I2S_PCM_CTRL1,
> +		tdm_mask, 0);

[Severity: High]
Does this asymmetric clearing of TDM flags break subsequent capture streams?

In nau8360_shutdown(), NAU8360_EN_TDM_TX is permanently cleared when a capt=
ure
stream is closed. However, nau8360_startup() lacks any logic to restore
NAU8360_EN_TDM_TX for capture streams. This seems to result in the TDM capt=
ure
interface being permanently disabled after the first use. Additionally,
startup() restricts RX restoration strictly to the I2S format, which might
break playback for Left/Right-Justified formats.

[ ... ]
> +static inline void nau8360_dsp_software_reset(struct snd_soc_component *=
component)
> +{
> +	/* Enable PLL for successful DSP reset. After DSP is alive,
> +	 * system clock switches to internal clock and disable PLL.
> +	 */
> +	snd_soc_component_update_bits(component, NAU8360_R72_PLL_CFG0,
> +		NAU8360_PD_PLL_MASK, NAU8360_PD_PLL_EN);
> +	msleep(50);
> +	snd_soc_component_write(component, NAU8360_R01_DSP_SOFTWARE_RST, 0x5a5a=
);
> +	snd_soc_component_write(component, NAU8360_R01_DSP_SOFTWARE_RST, 0xa5a5=
);
> +	snd_soc_component_set_sysclk(component, NAU8360_CLK_ID_INT, 0, 0,
> +		SND_SOC_CLOCK_IN);
> +}
[ ... ]
> +static int __maybe_unused nau8360_resume(struct snd_soc_component *compo=
nent)
> +{
> +	struct nau8360 *nau8360 =3D snd_soc_component_get_drvdata(component);
> +	struct regmap *regmap =3D nau8360->regmap;
> +
> +	regcache_cache_only(regmap, false);
> +
> +	nau8360_dsp_bootup(component);
> +
> +	nau8360_peq_mem_enable(regmap, true);
> +	regcache_sync(regmap);

[Severity: High]
Might this sequence corrupt the cached clock and DSP state during resume?

By calling regcache_cache_only(regmap, false) before nau8360_dsp_bootup(), =
the
cache is active when nau8360_dsp_software_reset() sets the sysclk to
NAU8360_CLK_ID_INT. These writes will update the regcache and clear its dir=
ty
flags. When regcache_sync() runs immediately afterward, it sees the cache
matches the hardware for these clock registers, leaving the clobbered inter=
nal
clock settings in place instead of restoring the pre-suspend values.

> +	nau8360_peq_mem_enable(regmap, false);
> +
> +	/* disable Sense at standby */
> +	snd_soc_dapm_disable_pin(nau8360->dapm, "Sense");
> +	snd_soc_dapm_sync(nau8360->dapm);
> +
> +	nau8360_dsp_fw_load(nau8360);
> +
> +	return 0;
> +}

[Severity: High]
Can audio playback resume before the asynchronous DSP firmware loading
completes?

In nau8360_resume(), nau8360_dsp_fw_load() schedules background work to load
firmware over I2C and returns immediately. During an ALSA PCM stream resume,
the core framework issues prepare() and trigger(RESUME) to restart the stre=
am
without calling startup(). Since there is no .prepare callback in
nau8360_dai_ops below to flush the background work, an active audio stream
will forcefully restart while the DSP is still being configured.

> +static const struct snd_soc_component_driver soc_comp_dev_nau8360 =3D {
> +	.probe			=3D nau8360_codec_probe,
> +	.set_sysclk		=3D nau8360_set_sysclk,
> +	.set_pll		=3D nau8360_set_pll,
> +	.suspend		=3D nau8360_suspend,
> +	.resume			=3D nau8360_resume,
> +	.controls		=3D nau8360_snd_controls,
> +	.num_controls		=3D ARRAY_SIZE(nau8360_snd_controls),
> +	.dapm_widgets		=3D nau8360_dapm_widgets,
> +	.num_dapm_widgets	=3D ARRAY_SIZE(nau8360_dapm_widgets),
> +	.dapm_routes		=3D nau8360_dapm_routes,
> +	.num_dapm_routes	=3D ARRAY_SIZE(nau8360_dapm_routes),
> +	.suspend_bias_off	=3D 1,
> +	.idle_bias_on		=3D 1,
> +	.use_pmdown_time	=3D 1,
> +	.endianness		=3D 1,
> +};

[Severity: High]
Could the missing .remove callback in the ASoC component driver lead to a U=
AF?

The background task load_fw_work is scheduled during the ASoC component
.probe() and dereferences nau8360->dapm when it runs. If the ASoC component
unbinds, the core frees the DAPM context. Because soc_comp_dev_nau8360 omits
a .remove callback to flush or cancel the workqueue, the background task can
continue executing and access freed memory.

> +static const struct snd_soc_dai_ops nau8360_dai_ops =3D {
> +	.startup	=3D nau8360_startup,
> +	.shutdown	=3D nau8360_shutdown,
> +	.hw_params	=3D nau8360_hw_params,
> +	.set_fmt	=3D nau8360_set_fmt,
> +	.set_tdm_slot	=3D nau8360_set_tdm_slot,
> +};
[ ... ]
> +static const struct regmap_config nau8360_regmap_config =3D {
> +	.reg_bits =3D NAU8360_REG_ADDR_LEN,
> +	.val_bits =3D NAU8360_REG_DATA_LEN,
> +
> +	.max_register =3D NAU8360_REG_MAX,
> +	.readable_reg =3D nau8360_readable_reg,

[Severity: High]
Will setting .val_bits to 16 truncate or reject 32-bit DSP messages?

The custom nau8360_reg_write and nau8360_reg_read functions perform 32-bit =
I2C
transactions for DSP registers. However, by setting NAU8360_REG_DATA_LEN
(which appears to be 16) for .val_bits, the core regmap framework will set
map->max_val to 0xFFFF. When nau8360_message_to_dsp() writes 32-bit command
payloads, the regmap core's value check will immediately reject the write w=
ith
-EINVAL. Additionally, 32-bit reads from the DSP will have their upper 16 b=
its
silently truncated.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825021644.1203=
076-1-YLCHANG2@nuvoton.com?part=3D2
