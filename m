Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704AF2F6596
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 02:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780973733; cv=none; b=pz8UwPBuDqSnPgjbmeiW/RCIYc2YVd4FE9aF0qnGXh/v3PQp3qWHtld9MAlB/kC+gHpIA2udvgQDK70JqqvX1mIgR8ByIZyBKlpf65NnVa6QRqKgbeN3ph+P0sfbkQ6bhHbvWHRhEenf/gN/3vsJZRTYw6qfl0gfiv/B7N6ozHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780973733; c=relaxed/simple;
	bh=6RaRCv1yMzMO8GnZFuZ52cbD4mRpXKWcTe+m1BFXscw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gwkQgZ7RL4gcchOYq4kJ7zhUPSn/4ZwnQPLqjhPgintmwjFcnOZkZ81dKe2G5VzpCFKg7fcL46VvjKR5Ug7tlowWGHblXrNI8vxqgQcTEIwS3PamFWzzuaPhVwZ6xunQuJyrWrn41Yuv18WLML8NuLL53WbmNP1aaN4RXM/RYvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=frDui+WJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="frDui+WJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090C11F00893;
	Tue,  9 Jun 2026 02:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780973732;
	bh=I2uIMSxEnBzFl4HGVqno1RFIRPvR10dEQpMNHAMX07k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=frDui+WJJBHXbV/ArDUClK5h+LLuRgvNiTk40cxfyJo/NnTNxOph2hEbALe0x7oRn
	 LIjg6ww12LdLMh97h/XEFZOOnHttfcR5DITCL+Jmae52w6hkJyYd4mTaMhxzKypN35
	 V1WP2nBF36+RGwRbEnGtmVFknwDqUznlnTTTzGFwfnS7j3xZbCMVEDW5aibVLIuGi1
	 gFW967TXqwlELUz/34pSxoxSs08U6I/XtlW3OaBEhwbdkF5tkBG1Sr1GDOALcnLgOP
	 mZuZ6EmmfSqiMrnIDaNUV6Pm3Amrb1jW7NyhrT97PJZrrk2DAxhNXDeuFIVo5Z+Y4H
	 kd/RzZOp+RO6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neo Chang" <YLCHANG2@nuvoton.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609024128.585938-3-YLCHANG2@nuvoton.com>
References: <20260609024128.585938-3-YLCHANG2@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 02:55:31 +0000
Message-Id: <20260609025532.090C11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:
- [Critical] 32-bit DSP payloads are silently discarded by the 16-bit regma=
p configuration.
- [High] ACPI probing fails due to Device Tree-exclusive APIs.
- [High] Use-After-Free due to uncancelled asynchronous firmware loading.
- [High] DMA-unsafe stack buffers used for I2C transfers.
- [High] Uninitialized stack variables used when regmap_read fails.
- [High] Uninitialized `ret` variable returned in TDM kcontrols.
- [High] DSP protocol corruption due to missing locking in the DAPM clock e=
vent handler.
- [Medium] Setting TDM slots to 'Slot None' fails to update hardware regist=
ers.
- [Medium] TDM TX slot offsets become mathematically incorrect when channel=
 length changes.
- [Medium] Missing `FW_LOADER` dependency causes silent probe failure.
- [Medium] Data race on `tdm_chan_len` state during concurrent `hw_params` =
operations.
- [Medium] TDM streams are not disabled when slots or slot_width evaluates =
to zero.
--

commit 68a685818cfb23df9395e09002059cbcf768941a
Author: Neo Chang <YLCHANG2@nuvoton.com>

ASoC: codecs: nau8360: Add support for NAU83G60 amplifier

Add support for the Nuvoton NAU83G60 audio codec. The NAU83G60 is a
stereo 30W+30W smart amplifier with an integrated low-latency
Advanced Audio DSP.

> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig

[ ... ]

> @@ -2837,6 +2838,15 @@ config SND_SOC_NAU8825
>  	tristate
>  	depends on I2C
> =20
> +config SND_SOC_NAU8360
> +	tristate "Nuvoton Technology Corporation NAU83G60 Stereo Smart Amplifie=
r"
> +	depends on I2C

[Severity: Medium]
Could the omission of a select FW_LOADER dependency cause silent probe
failures on minimal configurations when request_firmware_nowait() is called?

> +	help
> +	  The NAU83G60 is a stereo 30W+30W smart amplifier with integrated

[ ... ]

> diff --git a/sound/soc/codecs/nau8360-dsp.c b/sound/soc/codecs/nau8360-ds=
p.c
> --- /dev/null
> +++ b/sound/soc/codecs/nau8360-dsp.c

[ ... ]

> @@ -149,6 +149,42 @@ static int nau8360_message_to_dsp(struct snd_soc_com=
ponent *component,
> ...
> +	/* sending payload + padding */
> +	payload =3D nau8360_pack_param(param_offset, param_size);
> +	snd_soc_component_write(component, dsp_addr, payload);

[Severity: Critical]
Will these 32-bit DSP payloads be silently discarded by the regmap validati=
on
layer since val_bits is set to 16, and should we check the return value of
snd_soc_component_write()?

> +	frag_cnt++;

[ ... ]

> @@ -308,6 +308,24 @@ static void nau8360_dsp_fw_cb(const struct firmware =
*fw, void *context)
> ...
> +	mutex_lock(&nau8360->lock);

[Severity: High]
Can this result in a use-after-free if the device is unbound before the
asynchronous firmware callback finishes, considering the devm-managed nau83=
60
struct might already be freed?

[ ... ]

> @@ -345,6 +345,26 @@ static int nau8360_dsp_chan_kcs_setup(struct snd_soc=
_component *cp,
> ...
> +	ret =3D request_firmware_nowait(THIS_MODULE, true,
> +		fw_name, cp->dev, GFP_KERNEL, ctx, nau8360_dsp_fw_cb);

[Severity: High]
Is there a risk of a use-after-free here since the asynchronous request is
launched without an associated cancellation handle in a remove hook?

[ ... ]

> @@ -404,6 +404,22 @@ static int nau8360_dsp_clock_event(struct snd_soc_da=
pm_widget *w,
> ...
> +	dsp_dbg(component->dev, "send DSP command %s", dsp_cmd_table[cmd]);
> +	ret =3D nau8360_send_dsp_broadcast(component, cmd);

[Severity: High]
Does this transmit multi-fragment I2C payloads without acquiring the
protective nau8360->lock, potentially corrupting the DSP protocol if
asynchronous firmware loading is executing concurrently?

[ ... ]

> diff --git a/sound/soc/codecs/nau8360.c b/sound/soc/codecs/nau8360.c
> --- /dev/null
> +++ b/sound/soc/codecs/nau8360.c

[ ... ]

> @@ -493,6 +493,34 @@ static int nau8360_tdm_tx_slot_put(struct snd_kcontr=
ol *kcontrol,
> +	struct soc_enum *e =3D (struct soc_enum *)kcontrol->private_value;
> +	unsigned int *item =3D ucontrol->value.enumerated.item;
> +	unsigned int mask =3D e->mask << e->shift_l;
> +	int ret, scale, slot, func_idx, val_to_cache;
> +	bool changed =3D false;
> +	bool is_none =3D (item[0] =3D=3D NAU8360_TDM_TXN);
> +

[ ... ]

> +	if (is_none) {
> +		dev_dbg(cp->dev, "Slot is None, skipping register update");
> +		goto done;
> +	}

[Severity: Medium]
Does bypassing the register update here leave the hardware state stale when
Slot None is selected?

> +
> +	compute_slotx_scale(cp, &scale);
> +	slot =3D item[0] * scale;
> +	ret =3D snd_soc_component_update_bits(cp, e->reg, mask, slot << e->shif=
t_l);

[Severity: Medium]
Do the TX slot offsets become mathematically incorrect if
nau8360_set_tdm_slot() is later called to change the channel length without
recalculating the existing active TX offsets?

> +
> +done:
> +	mutex_unlock(&nau8360->lock);
> +	return ret < 0 ? ret : (int)changed;

[Severity: High]
Could this return an uninitialized ret variable to user-space if the
requested slot matches the current cached slot or if Slot None is chosen,
jumping directly to the done label?

> +}

[ ... ]

> @@ -998,6 +998,22 @@ static inline int nau8360_vbat_level(struct regmap *=
regmap, int *vbat)
> +{
> +	struct device *dev =3D regmap_get_device(regmap);
> +	int value;
> +
> +	regmap_read(regmap, NAU8360_R21_VBAT_READOUT, &value);
> +
> +	/* multiple 100 on value scale */
> +	*vbat =3D (value * 100 + NAU8360_VBAT_BASE) / NAU8360_VBAT_STEP;

[Severity: High]
Can this evaluate an uninitialized stack variable if the underlying I2C read
fails, causing unpredictable hardware behavior?

[ ... ]

> @@ -1111,6 +1111,54 @@ static int nau8360_set_tdm_slot(struct snd_soc_dai=
 *dai, unsigned int tx_mask,
> ...
> +	if (!slots || !slot_width)
> +		return 0;

[Severity: Medium]
Will returning early here prevent the hardware from explicitly disabling TDM
streams when slots or slot_width evaluates to zero?

[ ... ]

> +	mutex_unlock(&nau8360->lock);
> +
> +	nau8360->tdm_chan_len =3D slot_width;

[Severity: Medium]
Does modifying this shared state variable outside the bounds of the
synchronization mutex introduce a data race during concurrent hardware
parameter operations?

> +	regmap_update_bits(nau8360->regmap, NAU8360_R0C_I2S_PCM_CTRL2,
> +		NAU8360_TDM_CLEN_MASK,
> +		((nau8360->tdm_chan_len - 16) >> 3) << NAU8360_TDM_CLEN_SFT);

[ ... ]

> @@ -2313,6 +2313,22 @@ static int nau8360_reg_write(void *context, unsign=
ed int reg, unsigned int value)
> ...
> +	u8 buf[6];
> ...
> +	ret =3D i2c_master_send(client, buf, count);

[Severity: High]
Is it safe to pass stack-allocated buffers to the I2C transfer layer,
considering stack memory might not be DMA-mappable with CONFIG_VMAP_STACK
enabled?

[ ... ]

> @@ -2335,6 +2335,26 @@ static int nau8360_reg_read(void *context, unsigne=
d int reg, unsigned int *value)
> ...
> +	u8 buf[4];
> +	u16 reg_buf;
> ...
> +	ret =3D i2c_transfer(client->adapter, xfer, ARRAY_SIZE(xfer));

[Severity: High]
Can passing these stack-allocated buffers to i2c_transfer() cause issues
if the I2C controller utilizes a DMA engine?

[ ... ]

> @@ -2358,6 +2358,16 @@ static const struct regmap_config nau8360_regmap_c=
onfig =3D {
> +	.reg_bits =3D NAU8360_REG_ADDR_LEN,
> +	.val_bits =3D NAU8360_REG_DATA_LEN,

[Severity: Critical]
Does setting val_bits to 16 restrict the regmap core to a maximum value of
0xFFFF, which would silently discard the 32-bit DSP payloads used in
nau8360_message_to_dsp()?

[ ... ]

> @@ -2379,6 +2379,30 @@ static int nau8360_read_device_properties(struct n=
au8360 *nau8360)
> ...
> +	ret =3D of_property_count_strings(np, "firmware-name");

[Severity: High]
Could this cause ACPI probing to fail since of_property_count_strings()
expects a non-NULL Device Tree node? Should we use device_property_* array
reading functions instead to ensure ACPI compatibility?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609024128.5859=
38-1-YLCHANG2@nuvoton.com?part=3D2
