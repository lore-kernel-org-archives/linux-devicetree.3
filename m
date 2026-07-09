Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76A11D5160
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 22:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783636021; cv=none; b=RyVTw42ppQ326yE8ZgJGRRwsijXKXBwN+PVtF7bsBQ1/iLEElTCqMfb7e6Va0sDAVqfBfbPkJRpv5pY/qYXpECEiKPYMkZfRYRzW5Ad7EMkfAH3HQzBso9yr3B7hV5opsaFjSWaQqtWxKusoEcnL0w3jQaf/8vOtxAPc1NX5fyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783636021; c=relaxed/simple;
	bh=rb+i7awvzQPl3bpmRMSWzcBUZidlpriTUj6+YCZHyjM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O47YqJ5hFCkBnfVAj1WFHfV8Wwl+fgSWce2lCxx91l2j6Ekmbdil5XTHa5cPWYeQP5GUhnLliDL3S05FvVfundA9u34f/GTii4SVg5IuPyNoECrDlj1wz2CdwcpQ3MwUDlnzDwlR9Fu/vmG4Z+WCpkanE7b86eAdI/pGndGZh3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eR00FS2j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eR00FS2j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 721A11F000E9;
	Thu,  9 Jul 2026 22:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783636019;
	bh=+OW0VVc/zSf4BRrqFMkbgb5tpdm9bEoClVno4/bba10=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eR00FS2jjcrKfK7mB+hKwLrJFBoe1ER05CZJ5hkCvI1mvxNDG+6hWbASJMXZ1eh5M
	 ZezJnSvRP+pkmZCd2V0C80FHqW9yccwBemVqKqyY4cXiZb5y0YJdnQlEh7IBy+wJBJ
	 A2HASFdH18GRwNIRkDYZS7HQ/6o4CHfnGlBt+8dyQ4h0jPD1DqBJgDtHgUjn4iZZlX
	 nOka0hTGFIGZaclzcJQF5AfHnz8ZFv7EmJSc2H+bwaFHwk+z0yC+Tkf7EQUR/YeuET
	 8kmoOIMj2vFvc2JNDZy7mZySL5b0jj4chHWI7Pttviie8e421fNfrShYwbqRFi0tw4
	 4UBlTY7ng17Uw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] ASoC: codecs: add TAS2557 mono smart amplifier
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gianluca Boiano" <morf3089@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260709221331.989109-3-morf3089@gmail.com>
References: <20260709221331.989109-1-morf3089@gmail.com>
 <20260709221331.989109-3-morf3089@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 22:26:59 +0000
Message-Id: <20260709222659.721A11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] The failsafe recovery path resets the hardware but completely fail=
s to restore dynamic runtime configurations (DAC gain, ASI offsets, I/V sen=
se slots).
- [High] TDM slot configurations and RX/TX offsets are ignored and overwrit=
ten by `hw_params` and flawed static calculations, rendering `snd_soc_dai_s=
et_tdm_slot()` ineffective and corrupting audio on the right channel.
- [High] DAI format configuration from `set_dai_fmt()` is permanently wiped=
 out by hardcoded startup data upon device enable.
- [High] Use-after-free of the `tas2557->fw_done` completion structure duri=
ng driver unbind.
- [High] Capture-only streams are permanently muted, and concurrent capture=
 streams are broken when a playback stream stops.
- [Medium] The `ISENSE Switch` and `VSENSE Switch` ALSA controls are uncond=
itionally forcefully overridden by hardcoded values during stream power-up.
- [Medium] Race condition between asynchronous firmware loading and DAPM st=
ream start, causing random playback failures.
--

--- Patch [2]: [PATCH v1 2/2] ASoC: codecs: add TAS2557 mono smart amplifie=
r driver ---
commit e815fd708cfa73cfc0683782f9e776870209a100
Author: Gianluca Boiano <morf3089@gmail.com>

ASoC: codecs: add TAS2557 mono smart amplifier driver

The TAS2557 is a mono Class-D smart amplifier with an on-chip DSP. This
commit adds the driver for the device, including firmware loading, power
management, ALSA controls, and IRQ-based fault recovery.

> diff --git a/sound/soc/codecs/tas2557.c b/sound/soc/codecs/tas2557.c
> index 0000000000000..08ab437b63091
> --- /dev/null
> +++ b/sound/soc/codecs/tas2557.c
[ ... ]
> @@ -191,24 +191,20 @@
>  static const unsigned int tas2557_startup_data[] =3D {
>  	TAS2557_GPI_PIN_REG,              0x15,	/* enable DIN, MCLK, CCI */
>  	TAS2557_GPIO1_PIN_REG,            0x01,	/* enable BCLK (ASI1) */
>  	TAS2557_GPIO2_PIN_REG,            0x01,	/* enable WCLK (ASI1) */
>  	/* ASI2 GPIO wiring; arm the BCLK source (GPIO5) before its dividers */
>  	TAS2557_GPIO6_PIN_REG,            0x01,	/* GPIO6 =3D ASI2 WCLK input */
>  	TAS2557_GPIO8_PIN_REG,            0x02,	/* GPIO8 =3D ASI2 DIN */
>  	TAS2557_GPIO5_PIN_REG,            0x01,	/* GPIO5 =3D ASI2 BCLK input */
>  	TAS2557_ASI2_DAC_FORMAT_REG,      0x18,	/* ASI2: 32-bit I2S */

[Severity: High]
Does this hardcoded startup sequence permanently override the custom DAI
format?

Any custom format set earlier via set_dai_fmt() to the=20
TAS2557_ASIx_DAC_FORMAT_REG register appears to be erased on stream start=20
when tas2557_startup_data unconditionally writes 0x18 (32-bit I2S).

>  	TAS2557_ASI2_BDIV_CLK_SEL_REG,   0x01,
>  	TAS2557_ASI2_BDIV_CLK_RATIO_REG, 0x01,
>  	TAS2557_ASI2_BDIV_CLK_RATIO_REG, 0x81,	/* power up BDIV */
>  	TAS2557_ASI2_WDIV_CLK_RATIO_REG, 0x40,
>  	TAS2557_ASI2_WDIV_CLK_RATIO_REG, 0xc0,	/* power up WDIV */
>  	TAS2557_GPIO7_PIN_REG,            0x15,	/* GPIO7 =3D ASI2 DOUT */
>  	/* Power sequencing: Class-D + Boost first, then DSP/PLL */
>  	TAS2557_POWER_CTRL2_REG, 0xA0,		/* Class-D, Boost power up */
>  	TAS2557_POWER_CTRL2_REG, 0xA3,		/* Class-D, Boost, IV-sense power up */

[Severity: Medium]
Could this hardcoded startup data silently override the ALSA mixer controls?

Writing 0xA3 unconditionally activates both ISENSE and VSENSE whenever
a stream powers up, ignoring any user preferences previously cached by the
ISENSE and VSENSE ALSA switches.

>  	TAS2557_POWER_CTRL1_REG, 0xF8,		/* PLL, DSP, clock dividers power up */
>  	TAS2557_UDELAY, 2000,			/* 2 ms stabilisation */
>  	TAS2557_CLK_ERR_CTRL, 0x2b,		/* enable clock error detection */
[ ... ]
> @@ -1334,14 +1334,10 @@
>  done:
>  	complete(&tas2557->fw_done);
>  }

[Severity: High]
Can this completion sequence lead to a use-after-free during driver unbind?

If tas2557_fw_ready() completes fw_done outside the protection of
tas2557->lock:

tas2557_fw_ready():
    mutex_unlock(&tas2557->lock);
    complete(&tas2557->fw_done);

A concurrent unbind thread waking up in tas2557_fw_teardown() could acquire
the mutex, free the driver state, and exit. Devres would then free the
tas2557 allocation while complete() is still attempting to release the
wait-queue spinlock inside the freed memory.

>  static void tas2557_fw_teardown(void *data)
>  {
>  	struct tas2557_priv *tas2557 =3D data;
> =20
>  	if (tas2557->fw_requested)
>  		wait_for_completion(&tas2557->fw_done);
> =20
>  	mutex_lock(&tas2557->lock);
[ ... ]
> @@ -1520,11 +1520,7 @@
>  	tas2557_hw_reset(tas2557);
> =20
>  	ret =3D tas2557_load_data(tas2557, tas2557_default_data);
>  	if (ret < 0)
>  		return ret;
> =20
>  	if (tas2557->fw) {

[Severity: High]
Does this recovery path miss restoring the dynamic runtime configurations?

After performing a hardware reset and reloading default data, this
sequence appears to skip re-applying the runtime states established in
tas2557_enable().

Missing the restoration of SPK_CTRL_REG, SNS_CTRL_REG, and ASI offset
registers could leave the device at its default maximum volume (0 dB)
and break both TDM routing and I/V capture routing until a full stream
restart.

>  		ret =3D tas2557_set_program(tas2557, tas2557->current_program,
>  					  (int)tas2557->current_config);
>  		if (ret < 0)
>  			return ret;
>  	}
[ ... ]
> @@ -1621,9 +1621,6 @@
>  	if (enable && !tas2557->powered) {
>  		if (!tas2557->fw) {
>  			dev_warn(tas2557->dev,
>  				 "firmware not loaded, cannot produce audio; install %s\n",
>  				 tas2557->fw_name[0] ? tas2557->fw_name
>  						     : TAS2557_FW_NAME);
>  			return -ENODEV;
>  		}

[Severity: Medium]
Is there a race condition here if a stream starts before the async firmware
load completes?

Since request_firmware_nowait() is used in probe without blocking
component registration, a fast userspace audio request could reach
tas2557_enable() while tas2557->fw is still NULL, causing the stream
to forcefully fail with -ENODEV instead of deferring.

> =20
>  		/*
>  		 * Re-apply firmware program + config for the current sample
[ ... ]
> @@ -1685,7 +1685,4 @@
>  		if (tas2557->muted) {
>  			ret =3D tas2557_clk_err_detect(tas2557, false);
>  		} else {
>  			ret =3D tas2557_load_data(tas2557, tas2557_unmute_data);
>  			if (ret >=3D 0)
>  				ret =3D tas2557_clk_err_detect(tas2557, true);
>  		}

[Severity: High]
Are capture-only streams permanently muted by this design?

Because .no_capture_mute =3D 1 is set in tas2557_dai_ops, the ASoC core
skips calling tas2557_mute_stream(0) when a capture stream starts.
Because tas2557->muted is initialized to true, tas2557_enable() will
skip the unmute sequence here, keeping the capture paths completely
silent.

Furthermore, if a concurrent playback stream halts, tas2557_mute_stream()
unconditionally writes 0x03 to TAS2557_MUTE_REG, which breaks the ongoing
capture stream by hard-muting all paths.

>  		if (ret < 0)
>  			return ret;
[ ... ]
> @@ -1753,8 +1753,5 @@
>  	width =3D tas2557->tdm_slot_width > 0 ? tas2557->tdm_slot_width :
>  					      params_physical_width(params);
>  	offset =3D (tas2557->channel =3D=3D 0) ? 1 : 1 + width * 2;
>  	tas2557->asi_offset =3D offset;
> =20

[Severity: High]
Will this static calculation overwrite offsets configured by set_tdm_slot()?

When tas2557_hw_params() unconditionally resets tas2557->asi_offset,
any custom RX offset requested by machine drivers is lost.

Additionally, since tas2557_enable() only restores TAS2557_ASIx_OFFSET1_REG
(RX) and completely omits restoring TAS2557_ASIx_OFFSET2_REG (TX),
the capture offsets seem to be permanently lost after a device reset.

>  	/* Playback runs over ASI2; ASI1 is programmed too (per TI driver) */
>  	ret =3D tas2557_dev_write(tas2557, TAS2557_ASI2_OFFSET1_REG, offset);
>  	if (ret < 0)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709221331.9891=
09-1-morf3089@gmail.com?part=3D2
