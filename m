Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E27D2DB78C
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 15:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783782604; cv=none; b=uDt9eIFWE4xnEhAfYrFTlZji251bQHALm8d26Ck8WnOz4Lg/l973gjjryhtzTKQncOSJNo0uXC/I/MSj57RyJyyqzJbtC94ap4DroH3jMC6vb16SAcQ7L4JEoIrMo1+u88KMYLGrCTcvCe/JwEug4i34SsdwHw+fAI/ruifg4NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783782604; c=relaxed/simple;
	bh=g8LMexC9djXxUGRy+ytEljS+W7jIQ9MN5Dz7U8FPuJw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M0dafm2Oc64vFOPLjh+0AR1P6jlxEVd61/uZcMClTLNjcDp4iMgdUYEK/XUaz3NJ/98Oev+CnOBqUMNckcqzOnjSUs4VN28U3YbPbvtsihp282wRF3oUYNVdaFOATgp26X+48bO4fbI2gKcqU7XaLMpRgrF8cZOolA/vlIRLjUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y9iSsXsy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y9iSsXsy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C7E1F00A3D;
	Sat, 11 Jul 2026 15:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783782603;
	bh=BD7JWnzu0kKWZL/jdYkykH8874e0P84JpCAZxLVxysM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y9iSsXsy3KTxMgb+YiFuZcs1lgYzZMZ0Y4z/hEENMAz4KSi+T05Gakz71sb7AMG9H
	 GnTLuo0yTryhio4LRCYZiUfL3Yypdv9F49COLBLCmjIg6wQ36aCU9eknxRfT/On1JM
	 K1GSjTX8zp2bRV2Z5z1ALisFoVHfxE1SMyvk6O3EnXfo7IiAmMRWJeP+d07MCaTTH2
	 lq50W9r8JkrvbVEt9J9QPgGjEnYwydDzMR+famag6/Iqic0pNk4sl1FX4PSMj9ZyHI
	 F2iiZd0uji9uZQDdpvpn6zLiMstG+NEKL0RarZDjQjtARQaR6fGTzGle5ImNLsoIjt
	 /3jk9lzH7E+tg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: codecs: add TAS2557 mono smart amplifier
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gianluca Boiano" <morf3089@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260711145722.188556-3-morf3089@gmail.com>
References: <20260711145722.188556-1-morf3089@gmail.com>
 <20260711145722.188556-3-morf3089@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 15:10:01 +0000
Message-Id: <20260711151002.C0C7E1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Incorrect ASI data-slot offset calculation for the right channel s=
kips the correct audio slot.
- [Medium] Missing SNS_CTRL_REG configuration when enabling ISENSE/VSENSE A=
LSA controls at runtime.
- [Medium] `tas2557_failsafe_recovery` unintentionally unmutes the capture =
path upon fault recovery.
- [Medium] `tas2557_set_dai_fmt()` updates DAC format registers but fails t=
o update ADC format registers.
- [Medium] `tas2557_startup_data` hardcodes ASI2 DAC format but omits ASI1 =
DAC format configuration.
--

--- Patch [2]: [PATCH v2 2/2] ASoC: codecs: add TAS2557 mono smart amplifie=
r driver ---
commit d1471370278591a7f73ca18bb2ac75981e6b8a92
Author: Gianluca Boiano <morf3089@gmail.com>
Subject: ASoC: codecs: add TAS2557 mono smart amplifier driver

The TAS2557 is a mono Class-D smart amplifier with an on-chip DSP for
speaker protection. It uses I2S/TDM and requires board-specific firmware
loaded per speaker design. Amplifier power is managed through DAPM and
includes fault interrupt recovery and volume controls.

> diff --git a/sound/soc/codecs/tas2557.c b/sound/soc/codecs/tas2557.c
> new file mode 100644
> --- /dev/null
> +++ b/sound/soc/codecs/tas2557.c
[ ... ]
> +static const unsigned int tas2557_startup_data[] =3D {
> +	TAS2557_GPI_PIN_REG,              0x15,	/* enable DIN, MCLK, CCI */
> +	TAS2557_GPIO1_PIN_REG,            0x01,	/* enable BCLK (ASI1) */
> +	TAS2557_GPIO2_PIN_REG,            0x01,	/* enable WCLK (ASI1) */
> +	/* ASI2 GPIO wiring; arm the BCLK source (GPIO5) before its dividers */
> +	TAS2557_GPIO6_PIN_REG,            0x01,	/* GPIO6 =3D ASI2 WCLK input */
> +	TAS2557_GPIO8_PIN_REG,            0x02,	/* GPIO8 =3D ASI2 DIN */
> +	TAS2557_GPIO5_PIN_REG,            0x01,	/* GPIO5 =3D ASI2 BCLK input */
> +	TAS2557_ASI2_DAC_FORMAT_REG,      0x18,	/* ASI2: 32-bit I2S */

[Severity: Medium]
Is it intentional to omit the equivalent formatting register for ASI1 here?

The comment above mentions both ASI interfaces are enabled and configured
identically, but if the board wiring uses ASI1, it looks like it would be l=
eft
at its reset default word length while ASI2 is explicitly set to 32-bit.

> +	TAS2557_ASI2_BDIV_CLK_SEL_REG,   0x01,
[ ... ]
> +static int tas2557_failsafe_recovery(struct tas2557_priv *tas2557)
> +{
[ ... ]
> +	if (tas2557->powered) {
> +		ret =3D tas2557_load_data(tas2557, tas2557_startup_data);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret =3D tas2557_apply_runtime_state(tas2557);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret =3D tas2557_load_config_post_power(tas2557);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (!tas2557->dac_muted) {
> +			ret =3D tas2557_load_data(tas2557, tas2557_unmute_data);
> +			if (ret < 0)
> +				return ret;
> +		} else {

[Severity: Medium]
Does this sequence inadvertently unmute the capture path upon fault recover=
y?

When the DAC is unmuted but the capture stream is muted, calling
tas2557_load_data with tas2557_unmute_data clears the mute bits for both the
DAC and ISENSE paths.

Should this check tas2557->sense_muted and re-assert the capture mutes like
it does in tas2557_enable?

> +			/* Muted: clocks not guaranteed, keep detection off */
> +			ret =3D tas2557_clk_err_detect(tas2557, false);
[ ... ]
> +static int tas2557_hw_params(struct snd_pcm_substream *substream,
> +			     struct snd_pcm_hw_params *params,
> +			     struct snd_soc_dai *dai)
> +{
[ ... ]
> +	if (!tas2557->tdm_configured) {
> +		width =3D tas2557->tdm_slot_width > 0 ?
> +				tas2557->tdm_slot_width :
> +				params_physical_width(params);
> +		offset =3D (tas2557->channel =3D=3D 0) ? 1 : 1 + width * 2;

[Severity: High]
Can this offset calculation skip the correct audio slot for the right chann=
el?

For a 32-bit word, 1 + width * 2 evaluates to 65 BCLKs, which falls complet=
ely
outside the standard 64-bit stereo I2S frame where the right channel is
expected at offset 33.

> +		tas2557->asi_offset =3D offset;
> +	}
[ ... ]
> +static int tas2557_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
> +{
[ ... ]
> +	mutex_lock(&tas2557->lock);
> +	tas2557->dai_fmt =3D asi_fmt;
> +	ret =3D tas2557_dev_update_bits(tas2557, TAS2557_ASI1_DAC_FORMAT_REG,
> +				      TAS2557_FORMAT_MASK, asi_fmt);
> +	if (ret >=3D 0)
> +		ret =3D tas2557_dev_update_bits(tas2557,
> +					      TAS2557_ASI2_DAC_FORMAT_REG,
> +					      TAS2557_FORMAT_MASK, asi_fmt);

[Severity: Medium]
Should the ADC format registers be updated here as well?

This currently updates the DAC format registers (TAS2557_ASI1_DAC_FORMAT_REG
and TAS2557_ASI2_DAC_FORMAT_REG) but leaves the corresponding ADC format
registers unmodified at their reset defaults. Could this cause the capture
stream to use the wrong ASI data format?

> +	mutex_unlock(&tas2557->lock);
[ ... ]
> +static int tas2557_isense_put(struct snd_kcontrol *kc,
> +			      struct snd_ctl_elem_value *ucontrol)
> +{
[ ... ]
> +	tas2557->isense_enabled =3D en;
> +
> +	if (tas2557->powered)
> +		ret =3D tas2557_dev_update_bits(tas2557, TAS2557_POWER_CTRL2_REG,
> +					      TAS2557_ISENSE_ENABLE,
> +					      en ? TAS2557_ISENSE_ENABLE : 0);

[Severity: Medium]
If the amplifier powers up with ISENSE and VSENSE disabled, does enabling
them later via this control miss updating TAS2557_SNS_CTRL_REG?

In tas2557_apply_runtime_state, the slot routing is only written if at least
one sense line is already enabled. If the ALSA switches are turned on later,
the hardware might transmit on the default slot instead of the DT-configured
slot.

> +
> +	mutex_unlock(&tas2557->lock);
[ ... ]
> +static int tas2557_vsense_put(struct snd_kcontrol *kc,
> +			      struct snd_ctl_elem_value *ucontrol)
> +{
[ ... ]
> +	tas2557->vsense_enabled =3D en;
> +
> +	if (tas2557->powered)
> +		ret =3D tas2557_dev_update_bits(tas2557, TAS2557_POWER_CTRL2_REG,
> +					      TAS2557_VSENSE_ENABLE,
> +					      en ? TAS2557_VSENSE_ENABLE : 0);

[Severity: Medium]
Similarly, does toggling VSENSE power at runtime need to configure the
SNS_CTRL_REG routing if it wasn't done during startup?

> +
> +	mutex_unlock(&tas2557->lock);
[ ... ]
> +static int tas2557_i2c_probe(struct i2c_client *client)
> +{
[ ... ]
> +	/*
> +	 * Seed the cached ASI data-slot offset before any hw_params() or
> +	 * set_tdm_slot() call arrives; 32 is the fixed ASI word length
> +	 * used by tas2557_startup_data.
> +	 */
> +	tas2557->asi_offset =3D (tas2557->channel =3D=3D 0) ? 1 : 1 + 32 * 2;

[Severity: High]
Does this seed the same incorrect right channel offset mentioned earlier in
tas2557_hw_params?

> +
> +	ret =3D devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(tas2557_supplies=
),
> +					     tas2557_supplies);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711145722.1885=
56-1-morf3089@gmail.com?part=3D2
