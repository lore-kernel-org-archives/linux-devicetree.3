Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B468D275870
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 16:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781107689; cv=none; b=QO7kMNefDZhs485T2rLPStRm18bM/WmOUlCZ9cJSJvyNhOx2P4TfFyWjhZUciLwOhyd6yeHb+YXZQ25LJ/sjKd2iHsrXDolcZvXoqplGm/eu9vTWXeGlQlI3DX+ubxuLkORZIxR8YSY02WMF5AO0tnl49JWNGvMwGrFKs8K/i2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781107689; c=relaxed/simple;
	bh=4QZz5xfgmU942o6JyFDLJvViW4hPE1PZox/k2LYaNVo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dSelDrMLkqwOIlK8HHz74W3Vgt8qy1ClbCHJMtwz2f/qi5fKlC+ecUEScuu4A2khQI/9jWiwXirwdhTWhRnHlL6gtGp7UhijF6L1/GOD3iTDTvfOB+1S/9IqcsR4/rc1HtPLG0YWaTcJMbWB/ittDTOpw6d+m9tvvXcpYybUkuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gs3Qs/8i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gs3Qs/8i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D3521F00898;
	Wed, 10 Jun 2026 16:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781107688;
	bh=7ZBPl1nwBEQ/TFL40fsNy9bHJg1K2TDe3TJCZu+c6v8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gs3Qs/8ioFI2A9z4JRLzmtDJQJQQQVpShdi/LBD/26CtZLnp0x7lWLE8JaVwp2Ywh
	 1XCfXxD6jFS/lDTcg4GCbJK+RlhZArl/LBkFfqyzAA0aZ59aJ6MjeD2jgSA7f9wBWM
	 OzoCFC0rgaSa9ORgr8x0trGb+9EH4Ipzw0dmSn2qAWKmwPblc8Zd1rtuIBc8jqq+fx
	 nn0sZ3YRmGuJPvtzWfm9ybrZchRh15us690yp3fKop6EeDc/27QQwm9W0ftxI3YXKs
	 1o642eGHYZ0XMSW0w8+3vaJHgern/TvkFwHNJNKc5hjrvdrgDNqK6g5t6Jw5QuEKM3
	 5bVTG7+JD/kkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] ASoC: codecs: add Qualcomm WSA885X I2C codec
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasad Kumpatla" <prasad.kumpatla@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260610155708.151067-3-prasad.kumpatla@oss.qualcomm.com>
References: <20260610155708.151067-3-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 16:08:08 +0000
Message-Id: <20260610160808.5D3521F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] Manual snd_soc_component_exit_regmap() call on a devm-managed =
regmap causes a double free and potential Use-After-Free.
- [High] Volume control changes do not take effect dynamically during activ=
e playback.
- [Medium] ALSA Kcontrol .put callbacks unconditionally return 0 instead of=
 1 when values are successfully changed.
- [Medium] Shared configuration variables are modified by ALSA kcontrols an=
d read by DAI callbacks without locking.
- [Low] Passing 'int *' to regmap_read() causes incompatible pointer type c=
ompiler warnings.
--

commit e03e869e67ca57141b83b27db8520ee9f2d72031
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Date:   Wed Jun 10 15:57:08 2026 +0000

ASoC: codecs: add Qualcomm WSA885X I2C codec driver

Add an ASoC codec driver for the Qualcomm WSA885X smart speaker
amplifier accessed over I2C. The driver provides the control-side
support needed for playback bring-up, including register programming,
serial interface setup, clock handling, mute and gain control, reset
handling and interrupt support.

> diff --git a/sound/soc/codecs/wsa885x-i2c.c b/sound/soc/codecs/wsa885x-i2=
c.c
> new file mode 100644
> index 0000000000000..a7d8f8d48a21c
> --- /dev/null
> +++ b/sound/soc/codecs/wsa885x-i2c.c
[ ... ]
> +static int wsa885x_wait_for_pde_state(struct wsa885x_i2c_priv *wsa885x, =
int ps)
> +{
> +	int act_ps =3D -1, cnt =3D 0, clock_valid =3D -1;
> +	int rc =3D 0;
> +
> +	if (!wsa885x || !wsa885x->regmap)
> +		return -EINVAL;
> +
> +	if (ps < 0 || ps > 3)
> +		return -EINVAL;
> +
> +	do {
> +		usleep_range(1000, 1500);
> +		rc =3D regmap_read(wsa885x->regmap,
> +				 WSA885X_SMP_AMP_CTRL_STEREO_PDE23_ACT_PS,
> +				 &act_ps);

[Severity: Low]
Does this trigger a compiler warning? regmap_read() expects an unsigned
int * for its third argument, but act_ps is declared as an int. Should
act_ps and clock_valid be declared as unsigned int to match the API
signature?

[ ... ]
> +static int wsa885x_codec_mute_stream(struct snd_soc_dai *dai, int mute, =
int stream)
> +{
[ ... ]
> +	} else {
> +		regmap_multi_reg_write(wsa885x->regmap, unmute_prep_head_regs,
> +				       ARRAY_SIZE(unmute_prep_head_regs));
> +		regmap_write(wsa885x->regmap, WSA885X_SMP_AMP_CTRL_STEREO_OT23_USAGE,
> +			     wsa885x->usage_mode);
> +		regmap_multi_reg_write(wsa885x->regmap, unmute_prep_tail_regs,
> +				       ARRAY_SIZE(unmute_prep_tail_regs));
> +		regmap_write(wsa885x->regmap,
> +			     WSA885X_SMP_AMP_CTRL_STEREO_FU21_CH_VOL_CH2X0_MSB,
> +			     (s8)wsa885x->stereo_vol_db);
> +		regmap_write(wsa885x->regmap,
> +			     WSA885X_SMP_AMP_CTRL_STEREO_FU21_CH_VOL_CH2X1_MSB,
> +			     (s8)wsa885x->stereo_vol_db);

[Severity: Medium]
Can this lead to a race condition where mismatched channel volumes are
applied? The stereo_vol_db is read twice sequentially here without lock
protection.

If a concurrent call to wsa885x_stereo_gain_offset_put() occurs, could it
update stereo_vol_db exactly between these two regmap writes?

[ ... ]
> +static void wsa885x_component_remove(struct snd_soc_component *component)
> +{
> +	if (!component)
> +		return;
> +
> +	snd_soc_component_exit_regmap(component);
> +}

[Severity: Critical]
Is it safe to manually exit the regmap here? Since the regmap was allocated
using devm_regmap_init_i2c(), devres will attempt to free it automatically.
Calling snd_soc_component_exit_regmap() here causes an early free, which
can result in a double free.

Additionally, because the interrupt handler is registered via
devm_request_threaded_irq() before the component is registered, the IRQ
remains active after this component removal. If the interrupt fires in this
window, will wsa885x_interrupt_handler() trigger a use-after-free when
accessing wsa885x->regmap?

[ ... ]
> +static int wsa885x_stereo_gain_offset_put(struct snd_kcontrol *kcontrol,
> +					  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component;
> +	struct wsa885x_i2c_priv *wsa885x;
> +	long val;
> +
> +	if (!kcontrol || !ucontrol)
> +		return -EINVAL;
> +
> +	component =3D snd_kcontrol_chip(kcontrol);
> +	if (!component)
> +		return -EINVAL;
> +
> +	wsa885x =3D snd_soc_component_get_drvdata(component);
> +	if (!wsa885x)
> +		return -EINVAL;
> +
> +	val =3D ucontrol->value.integer.value[0];
> +
> +	if (val < 0 || val > WSA885X_FU21_VOL_STEPS) {
> +		dev_err(component->dev, "%s: Invalid range, Val: %ld\n", __func__, val=
);
> +		return -EINVAL;
> +	}
> +	wsa885x->stereo_vol_db =3D (int)val - 84;
> +	return 0;
> +}

[Severity: High]
Will this update take effect immediately during playback? The cached
volume is updated, but it doesn't look like the new value is written to the
hardware registers here. Are users expected to pause and restart the stream
for the volume change to apply?

[Severity: Medium]
Should this return 1 instead of 0 when the value actually changes?
ALSA kcontrol .put callbacks are expected to return 1 if the control was
modified so the core can generate a state change event for userspace.

[ ... ]
> +static int wsa885x_i2c_usage_modes_put(struct snd_kcontrol *kcontrol,
> +				       struct snd_ctl_elem_value *ucontrol)
> +{
[ ... ]
> +	val =3D ucontrol->value.integer.value[0];
> +
> +	if (val < 0 || val > WSA885X_USAGE_MODE_MAX)
> +		return -EINVAL;
> +
> +	wsa885x_i2c->usage_mode =3D val;
> +
> +	return 0;
> +}

[Severity: Medium]
Does this need to return 1 when the usage_mode changes so ALSA generates
a state change event, similar to the volume control above?

[ ... ]
> +static int wsa885x_i2c_rx_slot_mask_put(struct snd_kcontrol *kcontrol,
> +					struct snd_ctl_elem_value *ucontrol)
> +{
[ ... ]
> +	mask =3D ucontrol->value.integer.value[0];
> +
> +	if (!wsa885x_is_valid_rx_slot_mask(mask))
> +		return -EINVAL;
> +
> +	wsa885x_i2c->rx_slot_mask =3D mask;
> +
> +	return 0;
> +}

[Severity: Medium]
Does this also need to return 1 when the mask changes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610155708.1510=
67-1-prasad.kumpatla@oss.qualcomm.com?part=3D2
