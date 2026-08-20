Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1556E2F7F02
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787193785; cv=none; b=frEGNnDw8ppbetlQDh+l0kJwjhOQJS+ENBeUYwv+hDtQuzVcC0S0i4wJqCSsUMm7HpwzTPs2pdaZCXmXaAWBoM8AilnGvC+MQuvElxJd8jhfFTX86IBq2xDGvO8KdVuV3CHbM5/mj5uOgf6UKYdHn4rssV6QSmcVAxxid98oPU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787193785; c=relaxed/simple;
	bh=wWJSL3fVBvDvff3NUeMCkd0adfDNe4+0gElFrTKZ+9s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P346CPCzAjQrOIrNB/i1chvgaBqDbk3anNwpcnO3j60tfP101T8GlaRtFXnuIutwoDoUSxfJg7JsLueQbdS63iwkGFrF6V9KpvXWVypOBUzzUiUXSSAtU6+O8nX1Ke/G0BRNVw8SxvK/IQHxdcuTPkbA6eZx9b/9mt9Nv0bdjL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gGAaJj8K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gGAaJj8K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A9D41F000E9;
	Thu, 20 Aug 2026 02:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787193783;
	bh=kNrNP/itvmLJy2kPwGhveEJXpkvTe/BZXuSDAZTGmXc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gGAaJj8K62IPIFWZwmagjtVgXnvifrI15BVlt26u87Bv9KVJqhQqMzTyNcmZGW2DL
	 0alLzWasIu2aJp1Cb1cItAF1ka18W9yRp0aS5H6RnQpxyuLF84xYXiS3sulFfrvYvi
	 p7VicUN6tyoR5n7xuXjHTjAgF5jPMldwyT7uTdWpAyaQksvziMIxWOP9Hzp5XBlOht
	 Ab7XdTziE+thseQyOfpAX3JEdqqQKZHn4BjKdQNedV7DNenX5Q+ZH/POSTM2Y/CrcX
	 tGHZSONz134C6DDmXrWWgJuNRz1K7wRb24NYFll68H/nZzVHJIzSjQ+noQG2vQ8ds5
	 IZaRlloQcDaCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neo Chang" <YLCHANG2@nuvoton.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260820022925.1174132-3-YLCHANG2@nuvoton.com>
References: <20260820022925.1174132-1-YLCHANG2@nuvoton.com>
 <20260820022925.1174132-3-YLCHANG2@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 02:43:03 +0000
Message-Id: <20260820024303.6A9D41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Firmware loading fails unconditionally due to incorrect reply expe=
ctations for SET_KCS_SETUP command.
- [High] Asymmetric TDM stream initialization breaks audio capture.
- [Medium] ALSA get/put controls return 0 (success) instead of an error cod=
e when rejecting access due to active audio streams.
- [Medium] State desynchronization due to lockless, non-atomic hardware and=
 software state updates in ALSA put controls.
- [Medium] Time-of-check to time-of-use (TOCTOU) race when verifying DAPM b=
ias level.
- [Medium] Data race on `load_fw_done` flag causes missing memory visibilit=
y guarantees.
--

--- Patch [2]: [PATCH v9 2/2] ASoC: codecs: nau8360: Add support for NAU83G=
60 amplifier ---
commit 3ed3adfaf194e4108f1d8c262cd549795ef7302a
Author: Neo Chang <YLCHANG2@nuvoton.com>
Subject: ASoC: codecs: nau8360: Add support for NAU83G60 amplifier

This commit adds support for the Nuvoton NAU83G60 audio codec, which
features a stereo 30W+30W smart amplifier with an integrated low-latency
Advanced Audio DSP.

> diff --git a/sound/soc/codecs/nau8360-dsp.c b/sound/soc/codecs/nau8360-ds=
p.c
> --- a/sound/soc/codecs/nau8360-dsp.c
> +++ b/sound/soc/codecs/nau8360-dsp.c
> @@ -95,7 +95,7 @@ static const struct nau8360_cmd_info nau8360_dsp_cmd_ta=
ble[] =3D {
>  	NAU_DSP_CMD(NAU8360_DSP_CMD_GET_KCS_RSLTS,    1, 0, 1),
>  	NAU_DSP_CMD(NAU8360_DSP_CMD_GET_KCS_SETUP,    1, 0, 1),
>  	NAU_DSP_CMD(NAU8360_DSP_CMD_SET_KCS_SETUP,    1, 1, 1),

[Severity: High]
Is the reply parameter configuration correct for the SET_KCS_SETUP command?

When nau8360_dsp_kcs_setup() issues this command with get_len =3D 0, the
table incorrectly expects reply_data =3D 1. This causes nau8360_reply_from_=
dsp()
to receive an ACK where frag_len is 1, hit the if (!data || frag_len =3D=3D=
 1)
check, and return -EINVAL. This looks like it causes firmware loading and
DSP initialization to unconditionally fail.

> diff --git a/sound/soc/codecs/nau8360.c b/sound/soc/codecs/nau8360.c
> --- a/sound/soc/codecs/nau8360.c
> +++ b/sound/soc/codecs/nau8360.c
> @@ -350,6 +350,7 @@ static int nau8360_anc_put(struct snd_kcontrol *kcont=
rol,
>  	int ret, value =3D NAU8360_PEQ_BAND_8;
> =20
>  	ret =3D snd_soc_put_volsw(kcontrol, ucontrol);
>  	/* update anc flag if return value 1 and register value changed */
>  	if (ret !=3D 1)
>  		return ret;
> =20
>  	mutex_lock(&nau8360->lock);
>  	nau8360->anc_enable =3D ucontrol->value.integer.value[0];

[Severity: Medium]
Could this sequence result in desynchronized hardware and software states?

Because the hardware register is updated locklessly via snd_soc_put_volsw()
before acquiring the mutex, concurrent writes from two threads could
interleave. This would leave the software state inverted compared to the
actual hardware register.

[ ... ]

> @@ -387,8 +387,8 @@ static int nau8360_peq_coeff_get(struct snd_kcontrol =
*kcontrol,
>  	/* Use the DAPM lock to prevent race conditions during DAPM power-up
>  	 * state transitions, and check component active status to prohibit
>  	 * PEQ access during active audio streams (playback and capture).
>  	 */
>  	snd_soc_dapm_mutex_lock(dapm);
>  	if (snd_soc_component_active(cp)) {
>  		dev_dbg(nau8360->dev,
>  			"PEQ coefficient access is ignored during audio is active");
>  		goto unlock_dapm;
>  	}

[Severity: Medium]
Should this return an error code like -EBUSY instead of 0?

By jumping to unlock_dapm and returning 0 when an audio stream is active,
userspace receives a misleading success response and assumes the buffer is
valid, resulting in reading uninitialized memory.

[ ... ]

> @@ -559,6 +559,6 @@ static int nau8360_dac_mux_put_enum(struct snd_kcontr=
ol *kcontrol,
>  	unsigned int *item =3D ucontrol->value.enumerated.item;
>  	int ret =3D 0;
> =20
>  	if (snd_soc_dapm_get_bias_level(dapm) > SND_SOC_BIAS_STANDBY) {

[Severity: Medium]
Does the lockless bias level check expose a time-of-check to time-of-use ra=
ce?

A concurrent thread could start a PCM stream immediately after this check,
altering the bias level before the path modification completes. This might
allow userspace to bypass the active playback check and modify DSP routing
during an active stream.

>  		dev_warn(nau8360->dev, "changing path is not allowed during playback");
>  		return ret;
>  	}

[Severity: Medium]
Does returning ret (which is 0 here) mislead userspace?

Returning 0 causes the ALSA put control to indicate success, when the
operation was actually rejected due to active playback. Returning an error
like -EBUSY might be more appropriate.

> =20
>  	ret =3D snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
>  	if (ret <=3D 0)
>  		return ret;
> =20
>  	nau8360_dsp_switch(component, snd_soc_enum_item_to_val(e, item[0]));

[Severity: Medium]
Is it safe to execute snd_soc_dapm_put_enum_double() and nau8360_dsp_switch=
()
without a shared lock?

Interleaved execution between two concurrent writers could leave the
hardware enum state out of sync with the software DSP switch state.

[ ... ]

> @@ -642,6 +642,6 @@ static int nau8360_startup(struct snd_pcm_substream *=
substream, struct snd_soc_dai *dai)
>  	int val =3D 0;
> =20
>  	if (!nau8360->load_fw_done) {

[Severity: Medium]
Is a memory barrier needed for this lockless read?

On weakly-ordered architectures, reading load_fw_done without a memory
barrier like smp_load_acquire() might allow the CPU to see the flag as true
before the side effects of nau8360_dsp_init() are fully visible.

>  		dev_warn(nau8360->dev, "DSP firmware is not ready yet!");
>  		return -EBUSY;
>  	}
> =20
>  	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
>  		regmap_read(nau8360->regmap, NAU8360_R0B_I2S_PCM_CTRL1, &val);
>  		if ((val & i2s_mask) =3D=3D i2s_fmt)
>  			regmap_update_bits(nau8360->regmap, NAU8360_R0B_I2S_PCM_CTRL1,
>  				NAU8360_EN_TDM_RX, NAU8360_EN_TDM_RX);

[Severity: High]
How does the capture stream re-enable TDM TX?

The nau8360_shutdown() function unconditionally clears NAU8360_EN_TDM_TX
when capture is closed. However, this startup function only contains logic
to re-enable NAU8360_EN_TDM_RX for playback. This appears to leave the TX
path disabled in hardware for subsequent captures, breaking audio capture
after the first open/close cycle.

[ ... ]

> @@ -658,6 +658,6 @@ static void nau8360_shutdown(struct snd_pcm_substream=
 *substream,
> =20
>  	tdm_mask =3D (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) ?
>  		NAU8360_EN_TDM_RX : NAU8360_EN_TDM_TX;
>  	regmap_update_bits(nau8360->regmap, NAU8360_R0B_I2S_PCM_CTRL1,
>  		tdm_mask, 0);

[ ... ]

> @@ -1198,6 +1198,6 @@ static void nau8360_load_fw_work(struct work_struct=
 *work)
>  		nau8360_dsp_enable(nau8360->regmap, false);
>  		return;
>  	}
>  	nau8360->load_fw_done =3D true;
>  }

[Severity: Medium]
Should this use a memory barrier when updating the shared flag?

Because the flag is read locklessly in nau8360_startup(), an architecture
with weak memory ordering might need smp_store_release() to ensure the
DSP initialization completes before the flag update is visible to other CPU=
s.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820022925.1174=
132-1-YLCHANG2@nuvoton.com?part=3D2
