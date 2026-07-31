Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF77A3624DB
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785481088; cv=none; b=s3m8vXgWGAlYZh3LvjIA4i6OIrg3pUuxK/XYbveHrggDoFW+guZRc1J2uOZ5wHl1KtOUu0dEZGvibxAYWW9Bl3UcFQAxrEpwdlwTEi/5Kjk5l30nKOuy2H9ETD3TigkH1Ku+04aK4lUQ4UDNVzunb2MXN4BkYmBIlea78yFbqq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785481088; c=relaxed/simple;
	bh=0CKwluDZ0mZPi56C7BWDIelH/8h1Wasl41Pz1d5SWGg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bt4Sq1ywnmTWaIYajsFUJfg9q7LFhuh9noUWtROvWf+w6Zg1BsNKsxKpFw4aMDLtRxb9b8cI3iDve63b1UTgA7sQBTFnbVoXOscHVmAMmy3mCToIsqQ8QCwNDMo7I55/OE6+qT1hQmng8YvKccSzl02kxS8EtcvrkqG/XnaKktI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EP42fHRV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EP42fHRV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA0701F000E9;
	Fri, 31 Jul 2026 06:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785481086;
	bh=sFZs8pFK//2lmd8Mv+GvMGY576DqTlLul7Mqso3j1Lk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EP42fHRVEpSINElxzUTbZ/3UtSiOaKfZemfOm9AksKic0TjDp9X4El1jAcpUUzq5c
	 Vc4RrOVUmxerVmZN+CMC464KhTbZ9fehH8IUZq5O63NAUDr+5Xe3VvKmQM54J4crDP
	 XIlGmlJkQqMId+kFy3VqJOzTb0EKzKkTnIjeCm/H5UuR6IkNc7clnaI79rStg5LXPJ
	 230nLv5PgCgZ7I4kAcU9Gsco1I4qfcY+yUVmY5eS0Ex5+H3Trg2QVhJshQrk1vVcZU
	 F4rsrgSIrjnv8C/iaaIvO9VZpXNQONkoL1aYZb3afWMv5t0cOjGCqQ0QtKshjjoDn1
	 DOHsA06p19ShQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] ASoC: airoha: Add AFE and machine driver for
 Airoha AN7581
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260731064326.2284228-5-ansuelsmth@gmail.com>
References: <20260731064326.2284228-1-ansuelsmth@gmail.com>
 <20260731064326.2284228-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 06:58:05 +0000
Message-Id: <20260731065805.EA0701F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] The IRQ handler fails to clear the capture interrupt when playback=
 and capture interrupts fire simultaneously, causing an interrupt storm.
- [High] A race condition between `mtk_dai_etdm_startup` and `mtk_dai_etdm_=
shutdown` can leave the AFE hardware disabled despite an active stream.
- [High] `mtk_dai_etdm_config()` unconditionally dereferences `etdm_data`, =
causing a NULL pointer dereference if `set_fmt` was never called.
- [Medium] Device node references acquired via `of_parse_phandle()` are lea=
ked on the successful execution of the machine driver probe.
- [Medium] Memory leak in `mtk_dai_etdm_set_fmt()` due to unconditional `de=
vm_kzalloc()` on every invocation.
- [Medium] Resource leak in the error path of the frontend startup callback.
- [Medium] Userspace can flood the kernel log by requesting an unsupported =
audio sample rate.
- [Medium] The driver parses clock inversion formats but ignores them durin=
g hardware configuration.
--

--- Patch [4]: [PATCH v4 4/4] ASoC: airoha: Add AFE and machine driver for =
Airoha AN7581 ---
commit 3f052d96adc8dfcd1fd37b31f3811e7ab7a88417
Author: Christian Marangi <ansuelsmth@gmail.com>

ASoC: airoha: Add AFE and machine driver for Airoha AN7581

Add support for the Sound system present on Airoha AN7581 SoC. This is
based on the mediatek AFE drivers. Also add the machine driver to create
an actual sound card for the AFE.

> diff --git a/sound/soc/mediatek/an7581/an7581-afe-pcm.c b/sound/soc/media=
tek/an7581/an7581-afe-pcm.c
> new file mode 100644
> index 0000000000000..74f72e45d11dc
> --- /dev/null
> +++ b/sound/soc/mediatek/an7581/an7581-afe-pcm.c
> @@ -0,0 +1,529 @@

[ ... ]

> +unsigned int an7581_afe_rate_transform(struct device *dev, unsigned int =
rate)
> +{
> +	switch (rate) {

[ ... ]

> +	case 384000:
> +		return ARH_AFE_RATE_384K;
> +	default:
> +		dev_warn(dev, "%s(), rate %u invalid, using %d!!!\n",
> +			 __func__, rate, ARH_AFE_RATE_48K);

[Severity: Medium]
Could this un-ratelimited warning allow a local user to flood the kernel lo=
g?

If a user requests a valid ALSA rate like 64000 Hz via hw_params, it will f=
all
through to this default case. Calling this in a loop might spam dmesg and
cause a denial of service.

> +		return ARH_AFE_RATE_48K;
> +	}
> +}

[ ... ]

> +static int an7581_afe_fe_startup(struct snd_pcm_substream *substream,
> +				 struct snd_soc_dai *dai)
> +{
> +	struct snd_pcm_runtime *runtime =3D substream->runtime;
> +	struct mtk_base_afe *afe =3D snd_soc_dai_get_drvdata(dai);
> +	int ret;
> +
> +	ret =3D mtk_afe_fe_startup(substream, dai);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE) {
> +		ret =3D snd_pcm_hw_constraint_minmax(runtime,
> +						   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
> +						   0x2000, UINT_MAX);
> +		if (ret < 0)
> +			dev_err(afe->dev, "hw_constraint_minmax failed\n");

[Severity: Medium]
Will this leak resources if snd_pcm_hw_constraint_minmax() fails?=20

If this function returns a negative error code here, the ALSA core won't
invoke the shutdown callback, meaning mtk_afe_fe_shutdown() is skipped
and the resources acquired by mtk_afe_fe_startup() remain held.

> +	}
> +
> +	return ret;
> +}

[ ... ]

> +static irqreturn_t an7581_afe_irq_handler(int irq_id, void *dev)
> +{
> +	const struct an7581_memif_irq_desc *irq_desc;
> +	struct mtk_base_afe *afe =3D dev;
> +	struct regmap *irq_regmap;
> +	u32 clear_reg, status;
> +	int substream, i;
> +
> +	regmap_read(afe->regmap, AFE_IRQ_STS, &status);
> +	if (status & AFE_IRQ_STS_PLAY)
> +		substream =3D AN7581_MEMIF_DL1;
> +	else
> +		substream =3D AN7581_MEMIF_UL1;
> +
> +	irq_desc =3D &an7581_memif_irq_descs[substream];
> +	irq_regmap =3D afe->irqs[irq_desc->irq].regmap;
> +	clear_reg =3D irq_desc->clear_reg;
> +
> +	for (i =3D 0; i < AN7581_MEMIF_NUM; i++) {
> +		struct mtk_base_afe_memif *memif =3D &afe->memif[i];
> +
> +		if (!memif->substream)
> +			continue;
> +
> +		if (memif->irq_usage < 0)
> +			continue;
> +
> +		irq_desc =3D &an7581_memif_irq_descs[i];
> +		if (status & irq_desc->status_bit)
> +			snd_pcm_period_elapsed(memif->substream);
> +	}
> +
> +	regmap_set_bits(irq_regmap, clear_reg,
> +			BIT(AFE_IRQ_CLR_SHIFT));

[Severity: High]
Does this logic leave capture interrupts un-cleared if playback and capture
interrupts fire simultaneously?

If both AFE_IRQ_STS_PLAY and AFE_IRQ_STS_RECORD are set in the status, the
initial branch statically assigns substream =3D AN7581_MEMIF_DL1 and clear_=
reg
to the DL1 clear register. While both ALSA streams will be notified, only
the DL1 interrupt is cleared here. The hardware would keep the capture
interrupt active, resulting in an interrupt storm upon exiting the ISR.

> +	regmap_clear_bits(irq_regmap, clear_reg,
> +			  BIT(AFE_IRQ_CLR_SHIFT));

[ ... ]

> diff --git a/sound/soc/mediatek/an7581/an7581-dai-etdm.c b/sound/soc/medi=
atek/an7581/an7581-dai-etdm.c
> new file mode 100644
> index 0000000000000..d7efd41becb17
> --- /dev/null
> +++ b/sound/soc/mediatek/an7581/an7581-dai-etdm.c
> @@ -0,0 +1,458 @@

[ ... ]

> +static int mtk_dai_etdm_startup(struct snd_pcm_substream *substream,
> +				struct snd_soc_dai *dai)
> +{
> +	struct mtk_base_afe *afe =3D snd_soc_dai_get_drvdata(dai);
> +	struct an7581_afe_private *afe_priv =3D afe->platform_priv;
> +
> +	regmap_set_bits(afe->regmap, AFE_DAC_CON0,
> +			BIT(AFE_AFE_ENABLE_SHIFT));
> +
> +	mutex_lock(&afe_priv->user_lock);
> +	afe_priv->users++;
> +	mutex_unlock(&afe_priv->user_lock);

[Severity: High]
Is there a race condition between mtk_dai_etdm_startup() and=20
mtk_dai_etdm_shutdown() that could leave the hardware disabled while active?

By setting AFE_AFE_ENABLE_SHIFT before acquiring user_lock, if shutdown() is
executing concurrently for a different stream (e.g., stopping capture while
starting playback), shutdown() might acquire the lock, decrement users to 0,
and clear the enable bit right after startup() sets it. When startup()
eventually increments users, the driver thinks the hardware is active, but =
it
remains disabled.

> +
> +	return 0;
> +}

[ ... ]

> +static int mtk_dai_etdm_config(struct mtk_base_afe *afe,
> +			       struct snd_pcm_hw_params *params,
> +			       struct snd_soc_dai *dai,
> +			       int stream)
> +{
> +	struct an7581_afe_private *afe_priv =3D afe->platform_priv;
> +	struct mtk_dai_etdm_priv *etdm_data =3D afe_priv->dai_priv[dai->id];
> +	unsigned int rate =3D params_rate(params);
> +	unsigned int etdm_rate =3D an7581_etdm_rate_transform(afe->dev, rate);
> +	unsigned int channels =3D params_channels(params);
> +	unsigned int bit_width =3D params_width(params);
> +	unsigned int wlen =3D get_etdm_wlen(bit_width);
> +	unsigned int val =3D 0, val1 =3D 0;
> +	unsigned int mask =3D 0, mask1 =3D 0;
> +
> +	dev_dbg(afe->dev, "%s(), stream %d, rate %u, bitwidth %u\n",
> +		__func__, stream, rate, bit_width);
> +
> +	/* CON0 */
> +	mask |=3D ETDM_SLAVE_MODE;
> +	if (etdm_data->slave_mode)
> +		val |=3D ETDM_SLAVE_MODE;

[Severity: High]
Could this result in a NULL pointer dereference if a machine driver omits
the .dai_fmt configuration?

If mtk_dai_etdm_set_fmt() is never called, etdm_data will remain NULL, and
dereferencing it here would crash the kernel.

[Severity: Medium]
Are the clock inversion flags from etdm_data intentionally ignored here?

In mtk_dai_etdm_set_fmt(), SND_SOC_DAIFMT_INV_MASK is parsed and sets
etdm_data->bck_inv and etdm_data->lrck_inv. However, they appear to be
unused during this hardware configuration step, meaning the IN_CLK_INV and
OUT_CLK_INV hardware registers are never updated to reflect the requested
inversion.

> +	mask |=3D ETDM_BIT_LEN;
> +	val |=3D FIELD_PREP(ETDM_BIT_LEN, bit_width - 1);

[ ... ]

> +static int mtk_dai_etdm_hw_params(struct snd_pcm_substream *substream,
> +				  struct snd_pcm_hw_params *params,
> +				  struct snd_soc_dai *dai)
> +{

[ ... ]

> +	switch (rate) {

[ ... ]

> +	case 352800:
> +	case 384000:
> +		mtk_dai_etdm_config(afe, params, dai, substream->stream);
> +		return 0;
> +	default:
> +		dev_err(afe->dev,
> +			"Sample rate %d invalid\n",
> +			rate);

[Severity: Medium]
Could this un-ratelimited error allow a local user to flood the kernel log?

If a user requests a valid ALSA rate like 64000 Hz, it falls through to this
default case, similarly to an7581_afe_rate_transform().

> +		return -EINVAL;
> +	}
> +}

[ ... ]

> +static int mtk_dai_etdm_set_fmt(struct snd_soc_dai *dai, unsigned int fm=
t)
> +{
> +	struct mtk_base_afe *afe =3D snd_soc_dai_get_drvdata(dai);
> +	struct an7581_afe_private *afe_priv =3D afe->platform_priv;
> +	struct mtk_dai_etdm_priv *etdm_data;
> +	void *priv_data;
> +
> +	switch (dai->id) {
> +	case AN7581_DAI_ETDM:
> +		break;
> +	default:
> +		dev_warn(afe->dev, "%s(), id %d not support\n",
> +			 __func__, dai->id);
> +		return -EINVAL;
> +	}
> +
> +	priv_data =3D devm_kzalloc(afe->dev, sizeof(struct mtk_dai_etdm_priv),
> +				 GFP_KERNEL);
> +	if (!priv_data)
> +		return -ENOMEM;
> +
> +	afe_priv->dai_priv[dai->id] =3D priv_data;

[Severity: Medium]
Does allocating priv_data unconditionally on every invocation leak memory?

The ASoC framework can call .set_fmt multiple times (e.g., dynamically from
userspace). Each call overwrites the dai_priv pointer, leaving the prior
devm_kzalloc() allocations leaked for the lifetime of the device.

> +	etdm_data =3D afe_priv->dai_priv[dai->id];

[ ... ]

> diff --git a/sound/soc/mediatek/an7581/an7581-wm8960.c b/sound/soc/mediat=
ek/an7581/an7581-wm8960.c
> new file mode 100644
> index 0000000000000..03ea5732563cf
> --- /dev/null
> +++ b/sound/soc/mediatek/an7581/an7581-wm8960.c
> @@ -0,0 +1,161 @@

[ ... ]

> +static int an7581_wm8960_machine_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	ret =3D snd_soc_of_parse_audio_routing(card, "audio-routing");
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to parse audio-routing: %d\n", ret);
> +		goto err_of_node_put;
> +	}
> +
> +	ret =3D devm_snd_soc_register_card(&pdev->dev, card);
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret, "%s snd_soc_register_card fail\n", __fu=
nc__);
> +		goto err_of_node_put;
> +	}
> +
> +	return 0;

[Severity: Medium]
Does returning here leak the references to the device nodes?

of_parse_phandle() increments the reference count of the returned nodes. By
returning successfully, it bypasses the of_node_put() calls in the error
block. Because the driver has no .remove callback or devm action to release
them upon device unbind, the references seem permanently leaked.

> +
> +err_of_node_put:
> +	of_node_put(platform_dai_node);
> +	of_node_put(codec_dai_node);
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731064326.2284=
228-1-ansuelsmth@gmail.com?part=3D4
