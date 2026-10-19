Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50BD4CDDD7
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405785; cv=none; b=X1hD+Q5XQjCeMfFPwpk/zt7xE1vGY5g+kjeJO74jjPyCz/+gyhW4TATdiPdtJeUVnKF60Pjel3PjjJk1fbdqfrKSW5CevKHcjXc8edEqe6r/Z6DfUJnmJUdB6sCw9a3thqbXyL4XeZ+lOn+YguKZoIsYVI6aEoPkv0ki4U4N6q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405785; c=relaxed/simple;
	bh=Q+Xm+ijS9Y34wn0wlnq8c+vLJdQEmjltJ8gU3GeDsso=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=DY2qdkbiTTMG4C8w1O2kkRLdLS8m6zmjy27xLyK9tNsO+eHJn2M0KaZmFM8Nq/oxYM9BImZYr7z2qoj4YOdicUFP1jUazK2/Kuc34B5Ly6DLQOySqMBUhL8w3z8+wHlekxVdKGhV1NygujwQW5Kvvt74JCwxiY2+HlqXeymxCME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k5nN0Liz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k5nN0Liz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF681F000C4;
	Mon, 19 Oct 2026 10:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792405783;
	bh=99lf2PCE2oqMBq58uRrpJEBoOhjzoK+pSpH56KVdk+I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k5nN0LizSKzjI6PHzMeib/L5CyHs6rnCvBKQFmfiyYvfDDLf0qDvs9Rv+xDc8qjoY
	 GZi8eChDQKgn7lapM/OCNC3aoTuNjpsSmBAi6R5OSlG3kI97DXU22xKBenlkaEHooZ
	 NW2RageHmHYuormpc0ufi7s0cWB7lkgjmycW2TndpDUOkZgpEBm+TR7yeAKrNPbiPx
	 Yr/6WvAJ34cuFgvrH70wjlK1oG6kKBsB1Y0VpLBZfB0NUPGr7ozYp65kSKzTMJEdyu
	 9klsgap1dQ96d9h1vESDBMs+g5f4sDRTfBVUbWVVlqfjG/breuBUg+9l8v9wN0ZhWM
	 ONeYK51Ssi29Q==
Message-ID: <sashiko-outbox-176987@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: codecs: Add support for Fortemedia FM34NE
 DSP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019101357.117462-3-clamor95@gmail.com>
References: <20261019101357.117462-1-clamor95@gmail.com>
 <20261019101357.117462-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 10:29:42 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] ASoC: fm34ne-dsp: goto mixing and stuck bypass_gpio in fm34ne_ds=
p_set_config()
- [Medium] ASoC: fm34ne-dsp: conflicting DAPM widget events clobber DSP sta=
te
- [Low] ASoC: fm34ne-dsp: reset GPIO left deasserted when DSP is disabled
--

commit 44c3b6ffa34580e6c173c2874d0fa14d84f97af1
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ASoC: codecs: Add support for Fortemedia FM34NE DSP

This commit adds an ASoC codec driver for the Fortemedia FM34NE digital
sound processing chip used for active noise suppression on ASUS
Transformer devices.

> diff --git a/sound/soc/codecs/fm34ne-dsp.c b/sound/soc/codecs/fm34ne-dsp.c
> new file mode 100644
> index 0000000000000..608b94e6ea0ca
> --- /dev/null
> +++ b/sound/soc/codecs/fm34ne-dsp.c

[ ... ]

> +static int fm34ne_dsp_set_config(struct fm34ne_dsp *dsp, enum dsp_state =
state)
> +{
> +	struct device *dev =3D &dsp->client->dev;
> +	int ret;
> +
> +	guard(mutex)(&dsp->lock);
> +
> +	gpiod_set_value_cansleep(dsp->bypass_gpio, 1);
> +	msleep(20);
> +
> +	switch (state) {
> +	case FM34NE_NS_ENABLE:
> +		ret =3D i2c_master_send(dsp->client, dsp->info->enable_parameter,
> +				      dsp->info->enable_parameter_length);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to set DSP enable %d\n", ret);
> +			goto exit;
> +		}
> +
> +		ret =3D i2c_master_send(dsp->client, dsp->info->enable_noise_suppressi=
on,
> +				      dsp->info->enable_ns_length);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to enable DSP noise suppression %d\n", ret);
> +			goto exit;
> +		}
> +
> +		break;
> +
> +	case FM34NE_NS_DISABLE:
> +		ret =3D i2c_master_send(dsp->client, dsp->info->enable_parameter,
> +				      dsp->info->enable_parameter_length);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to set DSP enable with %d\n", ret);
> +			goto exit;
> +		}
> +
> +		ret =3D i2c_master_send(dsp->client, dsp->info->disable_noise_suppress=
ion,
> +				      dsp->info->disable_ns_length);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to disable DSP noise suppression with %d\n", ret=
);
> +			goto exit;
> +		}
> +
> +		break;
> +
> +	case FM34NE_BYPASS:
> +	default:
> +		ret =3D i2c_master_send(dsp->client, bypass_parameter, sizeof(bypass_p=
arameter));
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to set DSP bypass with %d\n", ret);
> +			goto exit;
> +		}
> +
> +		break;
> +	}
> +
> +exit:
> +	if (ret < 0)
> +		return ret;
> +
> +	gpiod_set_value_cansleep(dsp->bypass_gpio, 0);
> +
> +	return 0;
> +}

[Severity: Medium]
In sound/soc/codecs/fm34ne-dsp.c, fm34ne_dsp_set_config() mixes
guard(mutex)(&dsp->lock) with goto exit labels, which goes against the
scope-based cleanup guidelines in include/linux/cleanup.h.

Also, if any i2c_master_send() call fails during a DAPM widget event
(via fm34ne_dsp_int_state_control() or fm34ne_dsp_ext_state_control()),
the exit label returns early when ret < 0 before resetting
dsp->bypass_gpio back to 0:

exit:
	if (ret < 0)
		return ret;

	gpiod_set_value_cansleep(dsp->bypass_gpio, 0);

Should fm34ne_dsp_set_config() deassert dsp->bypass_gpio before
returning on error so the DSP is not left stuck in programming mode, and
avoid mixing guard(mutex) with goto labels (as well as explicitly
including <linux/cleanup.h> and <linux/mutex.h>)?

> +static int fm34ne_dsp_ext_state_control(struct snd_soc_dapm_widget *w,
> +					struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =3D snd_soc_dapm_to_component(w->da=
pm);
> +	struct fm34ne_dsp *dsp =3D snd_soc_component_get_drvdata(component);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		return fm34ne_dsp_set_config(dsp, FM34NE_BYPASS);
> +
> +	default:
> +		WARN(1, "Unexpected event");
> +		return -EINVAL;
> +	}
> +}
> +
> +static int fm34ne_dsp_int_state_control(struct snd_soc_dapm_widget *w,
> +					struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =3D snd_soc_dapm_to_component(w->da=
pm);
> +	struct fm34ne_dsp *dsp =3D snd_soc_component_get_drvdata(component);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		return fm34ne_dsp_set_config(dsp, FM34NE_NS_ENABLE);
> +
> +	case SND_SOC_DAPM_PRE_PMD:
> +		return fm34ne_dsp_set_config(dsp, FM34NE_NS_DISABLE);
> +
> +	default:
> +		WARN(1, "Unexpected event");
> +		return -EINVAL;
> +	}
> +}
> +
> +static const struct snd_soc_dapm_widget fm34ne_dsp_dapm_widgets[] =3D {
> +	SND_SOC_DAPM_INPUT("DSP DMIC"),
> +	SND_SOC_DAPM_INPUT("DSP AMIC"),
> +
> +	SND_SOC_DAPM_OUT_DRV_E("DSP Processing Engine INT", SND_SOC_NOPM,
> +			       0, 0, NULL, 0, fm34ne_dsp_int_state_control,
> +			       SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
> +	SND_SOC_DAPM_OUT_DRV_E("DSP Processing Engine EXT", SND_SOC_NOPM,
> +			       0, 0, NULL, 0, fm34ne_dsp_ext_state_control,
> +			       SND_SOC_DAPM_POST_PMU),
> +
> +	SND_SOC_DAPM_OUTPUT("DSP Digital Mic"),
> +	SND_SOC_DAPM_OUTPUT("DSP Analog Mic"),
> +};

[Severity: Medium]
Can transitions between "DSP Processing Engine INT" and
"DSP Processing Engine EXT" clobber the shared DSP state?

Both widgets call fm34ne_dsp_set_config() to update the global hardware
state without tracking which engine is active:

1. If "DSP Processing Engine EXT" powers up (SND_SOC_DAPM_POST_PMU ->
FM34NE_BYPASS) and "DSP Processing Engine INT" subsequently powers down
(SND_SOC_DAPM_PRE_PMD -> FM34NE_NS_DISABLE), fm34ne_dsp_int_state_control()
sends dsp->info->enable_parameter and dsp->info->disable_noise_suppression,
taking the DSP out of bypass mode while the external analog mic path is
still active.

2. Conversely, "DSP Processing Engine EXT" only handles
SND_SOC_DAPM_POST_PMU and has no PMD handler. If both paths are active
and "DSP Processing Engine EXT" powers down while
"DSP Processing Engine INT" remains powered on, the DSP stays in
FM34NE_BYPASS instead of restoring FM34NE_NS_ENABLE.

Should the driver coordinate state across these widgets (or model the
routing so the active path's configuration is preserved)?

[ ... ]

> +static void fm34ne_dsp_reset(struct fm34ne_dsp *dsp)
> +{
> +	gpiod_set_value_cansleep(dsp->reset_gpio, 1);
> +	msleep(20);
> +	gpiod_set_value_cansleep(dsp->reset_gpio, 0);
> +	msleep(100);
> +}
> +
> +static void fm34ne_dsp_disable_hw(struct fm34ne_dsp *dsp)
> +{
> +	gpiod_set_value_cansleep(dsp->bypass_gpio, 0);
> +	regulator_disable(dsp->vdd_supply);
> +	clk_disable_unprepare(dsp->dap_mclk);
> +}
> +
> +static int fm34ne_dsp_probe(struct snd_soc_component *component)
> +{

[ ... ]

> +exit:
> +	fm34ne_dsp_reset(dsp);
> +	fm34ne_dsp_disable_hw(dsp);
> +
> +	return ret;
> +}
> +
> +static void fm34ne_dsp_remove(struct snd_soc_component *component)
> +{
> +	struct fm34ne_dsp *dsp =3D snd_soc_component_get_drvdata(component);
> +
> +	fm34ne_dsp_reset(dsp);
> +	fm34ne_dsp_disable_hw(dsp);
> +}

[ ... ]

> +static int fm34ne_probe(struct i2c_client *client)
> +{

[ ... ]

> +	dsp->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW=
);
> +	if (IS_ERR(dsp->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(dsp->reset_gpio),
> +				     "Failed to get reset GPIO\n");

[Severity: Low]
Is the reset_gpio state inverted during probe and hardware disable?

In fm34ne_probe(), dsp->reset_gpio is requested with GPIOD_OUT_LOW
(deasserted) before vdd_supply and dap_mclk are enabled in
fm34ne_dsp_enable_hw().

In addition, both fm34ne_dsp_remove() and the error path in
fm34ne_dsp_probe() call fm34ne_dsp_reset() right before
fm34ne_dsp_disable_hw():

	fm34ne_dsp_reset(dsp);
	fm34ne_dsp_disable_hw(dsp);

fm34ne_dsp_reset() asserts reset_gpio (1) for 20 ms, then deasserts
reset_gpio (0) and sleeps 100 ms waiting for the chip to boot, only for
fm34ne_dsp_disable_hw() to immediately turn off vdd_supply and dap_mclk
with reset_gpio left deasserted.

Should fm34ne_probe() request reset_gpio with GPIOD_OUT_HIGH, and should
fm34ne_dsp_disable_hw() assert reset_gpio (1) instead of calling
fm34ne_dsp_reset() before power-down?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019101357.1174=
62-1-clamor95@gmail.com?part=3D2
