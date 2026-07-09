Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3337B4D98EC
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 18:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783620723; cv=none; b=P86GJdn2zWgoLTgjMB1PH2MJKTEVZBrvaUenVwa0SLAPqZ9FQ9BiczLx3NgpO2gK7fiaEtsaRSZvbl2w2D5nHoOhXjwSQ+cRDI6v1UavTfNeEJIZEJj3Bd9nenkYEYppO/HjouNa3FCLFZGDARfrxQgBsaeYGm9DK/cm8xPOhD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783620723; c=relaxed/simple;
	bh=xjMf9pzfstD2zKrEqxwepj7LPHMJ+HAo1WkSFugfVGY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QRXqt+y17s+6EGQePA5db4oqlT3Vg9mzW7HqwgFoYZ2WwJl4ADKjK62Lu4ffsFDu6H90pVG/tB1796n5CYoQYsR9XhpPjII53dIiyEi35z8NbGb1th8KxAtQf8bLMj2suUaW+KbNgCrEp3tQEQvsfBSbH83x3bVtN4MbN1XAhKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z5L8HAzo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z5L8HAzo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3321F000E9;
	Thu,  9 Jul 2026 18:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783620722;
	bh=O/Z5lKPvfziymzPPpfgZaMv1jWCKNdC5bT6bxmVUGts=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z5L8HAzoalVaFvAwRcd6Xina4pjZEZdIjMVbr+OCjafKjAzqmU0GtIjEnZIl8hr8i
	 3cyVI386fsJ2Mi7ukQbqCPxhJBqKz3HjprfYiQz8vHx/3NkvwkfSN/r4f5srD/6RW1
	 TYZ+BuVYeeVP5MF0pNlhIXaTJbBXpeYqLvfirqnUHONmmURiV4g9ZL4BvCZhCKlt1F
	 b0lVg7cHWney3jJ2uDZf9fKpDkcXzYLdneS9+laYQTy/S8D3GyLySqV6JbrDEIEuCk
	 ORWjrl9JZoYm48c/QtMYFnIfypdn82ocwjamfGt8wxvlAMf2jABI4Lha29m8/ygZ1c
	 A7ehYeAmeHhcQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] ASoC: codecs: add Qualcomm WSA885X codec driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasad Kumpatla" <prasad.kumpatla@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260709175915.3805851-3-prasad.kumpatla@oss.qualcomm.com>
References: <20260709175915.3805851-1-prasad.kumpatla@oss.qualcomm.com>
 <20260709175915.3805851-3-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 18:12:01 +0000
Message-Id: <20260709181201.BD3321F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The ASoC component is registered before the IRQ handler is request=
ed, creating a race condition where unhandled interrupts can disable the IR=
Q line or cause use-after-free during teardown.
- [High] The SDCA_COMMIT register is not marked as volatile, causing volume=
 and state changes to silently fail after the first commit.
- [High] Incorrect I2S TDM RX slot mask for STEREO mode deprives the right =
PA of audio data.
- [Medium] Supported fractional and high sample rates are missing from WSA8=
85X_RATES.
--

--- Patch [2]: [PATCH v3 2/2] ASoC: codecs: add Qualcomm WSA885X codec driv=
er ---
commit c6cb8f530e0636df275b374514b9c75c67764cac
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: ASoC: codecs: add Qualcomm WSA885X codec driver

This commit introduces an ASoC codec driver for the Qualcomm WSA885X stereo
smart speaker amplifier. It adds support for programming the register map, =
DAI
operations, and mixer controls. The driver handles power-state sequencing in
DAI callbacks and uses regmap for control path operations.

> diff --git a/sound/soc/codecs/wsa885x.c b/sound/soc/codecs/wsa885x.c
> new file mode 100644
> index 0000000000000..d2f4b980ac27d
> --- /dev/null
> +++ b/sound/soc/codecs/wsa885x.c
> @@ -195,5 +195,5 @@
> =20
>  #define WSA885X_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 | \
>  			       SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 | \
>  			       SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_192000)
> =20

[Severity: Medium]
Are we missing supported fractional and high sample rates here?

If SNDRV_PCM_RATE_44100 and others are missing from WSA885X_RATES, the ALSA
core framework will reject any attempt to open a stream at 44.1kHz.

This would make the code blocks handling 44100Hz and other missing rates in
wsa885x_codec_hw_params() dead code and prevent playback of standard CD qua=
lity
audio.

[ ... ]

> @@ -881,13 +881,13 @@ static int wsa885x_codec_mute_stream(struct snd_soc=
_dai *dai, int mute, int stre
>  		ret =3D wsa885x_wait_for_pde_state(wsa885x, ps0);
>  		if (ret)
>  			goto exit_unlock;
> =20
>  		if (wsa885x->rx_slot_mask =3D=3D WSA885X_CHANNEL_STEREO) {
>  			regmap_write(wsa885x->regmap, WSA885X_DIG_CTRL1_I2S_TDM_CH_RX, 0x08);
>  			regmap_write(wsa885x->regmap, WSA885X_DIG_CTRL0_PA_FSM_CTL, 0x03);
>  		} else if (wsa885x->rx_slot_mask =3D=3D WSA885X_CHANNEL_MONO_LEFT) {
>  			regmap_write(wsa885x->regmap, WSA885X_DIG_CTRL1_I2S_TDM_CH_RX, 0x08);
>  			regmap_write(wsa885x->regmap, WSA885X_DIG_CTRL0_PA_FSM_CTL, 0x01);

[Severity: High]
In stereo mode, should the TDM RX slot mask be 0x09 instead of 0x08?

Currently, the driver writes 0x08 to WSA885X_DIG_CTRL1_I2S_TDM_CH_RX for bo=
th
WSA885X_CHANNEL_STEREO and WSA885X_CHANNEL_MONO_LEFT. This leaves the right
amplifier channel without valid audio data, breaking stereo playback.

[ ... ]

> @@ -965,15 +965,15 @@ static bool wsa885x_volatile_register(struct device=
 *dev, unsigned int reg)
>  {
>  	switch (reg) {
>  	case WSA885X_ANA_TOP_PLL_STATUS_0:
>  	case WSA885X_ANA_TOP_PLL_STATUS_1:
>  	case WSA885X_SMP_AMP_CTRL_STEREO_PDE23_ACT_PS:
>  	case WSA885X_SMP_AMP_CTRL_STEREO_CS21_CLOCK_VALID:
>  	case WSA885X_INTR_STATUS0:
>  	case WSA885X_INTR_STATUS0 + 1:
>  	case WSA885X_INTR_STATUS0 + 2:
>  	case WSA885X_INTR_CLEAR0:
>  	case WSA885X_INTR_CLEAR0 + 1:
>  	case WSA885X_INTR_CLEAR0 + 2:
>  		return true;
>  	default:
>  		return false;
>  	}
>  }

[Severity: High]
Should WSA885X_DIG_CTRL0_SDCA_COMMIT be included in this volatile register
list?

When a user changes the volume or starts a stream, the driver performs:

    regmap_write(wsa885x->regmap, WSA885X_DIG_CTRL0_SDCA_COMMIT, 0x01);

Because this register is missing from wsa885x_volatile_register(), regmap
caches the value 0x01. Subsequent writes of 0x01 are dropped by the regmap
cache, causing volume and state changes to silently fail.

[ ... ]

> @@ -1486,9 +1486,9 @@ static int wsa885x_probe(struct i2c_client *client)
> =20
>  	ret =3D devm_snd_soc_register_component(dev, component_driver,
>  					      wsa885x_dai,
>  					      ARRAY_SIZE(wsa885x_dai));
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Codec component registration failed\n"=
);
> =20
>  	ret =3D wsa885x_register_irq(wsa885x);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "wsa885x irq registration failed\n");

[Severity: High]
Could this ordering cause a race condition between unmasking hardware
interrupts and registering the IRQ handler?

The component registration triggers wsa885x_component_probe(), which calls
wsa885x_unmask_interrupts(). Because this happens before
wsa885x_register_irq() runs, any pending or new hardware interrupt will
assert before the handler is actually registered.

This can cause the kernel to permanently disable the IRQ line or cause a
use-after-free during teardown, since devres will free the IRQ handler befo=
re
the component is unregistered.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709175915.3805=
851-1-prasad.kumpatla@oss.qualcomm.com?part=3D2
