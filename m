Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6410932B11D
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 18:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779994609; cv=none; b=BDpHDRbjwaRNTYeXAceJdkBP+2eZp2N7JE8ud751qJdQkv5JmHtt5uiUl6TR5QQCJ5vdBRil7qWrdXan+WGLXUkaSnZIn9sbYUl30zxVQCee4XN2EWfFTVe6fQ/R3tcSTm4aovSEVkY9b/44P2MFj1G576e6i3zARulsgWnVzXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779994609; c=relaxed/simple;
	bh=xaPonPAngCwocGK0RNZl3C95svk/TV3yFS9LRwBU2A0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sg9SGifiiqeNYI6CSUvp4hAzPHYs3qdKrFWn2Tcy5V1OaT1IVyaYQ3Ma8FTnKcZPFc9XPYHnradT3Svr5u/d3AqEUxS5M9LAJR2wJLgH031OC7t2NxgORfavnpAdiZBPAbeTpOFNuqkKlNILC0bHWHoe4ILPI5HhEUw0DIyAXeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZqYjx6eO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZqYjx6eO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DC61F000E9;
	Thu, 28 May 2026 18:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779994608;
	bh=x2fVzZ4S7gWGxy8ZHcbyrpqQNiHNBhPt0BfADpwLze0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZqYjx6eONU/YkSJrWjO9RFy8ty3E0ABrJcnGAapJcdywbwFHDYqMvrRWkfC+HazGs
	 20RzfhlXHs2vM1OcJ4u4I1l/YTGd9DQ50ei57gxozLz+NPxeX6MdpvBsfWdfCjg3i0
	 fwUU+5q/EGG08CsXQJ90YsNX9tSNUYr15aTzqh53SgxGpiI6YTFe9ZH1YNW1TTTtEt
	 3HTmKNQw4W8RlLDW4zk3MY3kLQIiozi9dLnXXHJIwSSlRMEEQkgz30mIPQMgNJmYJf
	 kzg4BxrXvHz0EK8xmZEG6OmuZCUJRuVsRDlcszFsQX000Agb41R6aJjWoNLpIFmB7C
	 2WYffeG+nTzJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] ASoC: airoha: Add AFE and machine driver for
 Airoha AN7581
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260528174840.28644-5-ansuelsmth@gmail.com>
References: <20260528174840.28644-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 18:56:47 +0000
Message-Id: <20260528185647.E0DC61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] IRQ handler is requested before its required data structures are a=
llocated, leading to a potential NULL pointer dereference.
- [High] The interrupt handler fails to clear all active interrupts when mu=
ltiple fire simultaneously, causing an interrupt storm and duplicate ALSA s=
tate updates.
- [High] Potential NULL pointer dereference in `mtk_dai_etdm_config()` if t=
he `.set_fmt` callback is not invoked.
- [High] Device-specific regmaps are stored in a static global array, break=
ing multi-instance support.
- [Medium] Unconditional memory allocation in the `.set_fmt` callback cause=
s a memory leak.
- [Medium] Device tree node references are leaked on successful probe in th=
e machine driver.
- [Medium] Clock inversion settings parsed in `.set_fmt` are silently ignor=
ed during hardware configuration.
- [Medium] Incorrect constraint applied to `SNDRV_PCM_HW_PARAM_PERIOD_SIZE`=
, forcing excessive latency.
- [Medium] Hardware enablement state and atomic user counters are updated n=
on-atomically, leading to a TOCTOU race condition.
--

commit 7488a2b7823cb2f6f02588d00f40f601dc2dcb3a
Author: Christian Marangi <ansuelsmth@gmail.com>

ASoC: airoha: Add AFE and machine driver for Airoha AN7581
   =20
Add support for the Sound system present on Airoha AN7581 SoC. This is
based on the mediatek AFE drivers.

> diff --git a/sound/soc/mediatek/an7581/an7581-afe-pcm.c b/sound/soc/media=
tek/an7581/an7581-afe-pcm.c
> new file mode 100644
> index 0000000000000..d6c3fc09951c5
> --- /dev/null
> +++ b/sound/soc/mediatek/an7581/an7581-afe-pcm.c

[ ... ]

> +static struct mtk_base_irq_data irq_data[AN7581_IRQ_NUM] =3D {
> +	[AN7581_IRQ_0] =3D {
> +		.id =3D AN7581_IRQ_0,

[Severity: High]
Does this break support for multiple AFE hardware instances?

The device-specific regmap pointers are written directly into this static
global array during an7581_afe_pcm_dev_probe(), which would cause the first
device's IRQ handler to access the second device's memory-mapped registers.

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

[Severity: Medium]
Will this enforce excessive latency?

The constraint is applied to SNDRV_PCM_HW_PARAM_PERIOD_SIZE, which is
measured in frames. At an 8000 Hz sample rate, a minimum of 0x2000 (8192)
frames enforces a minimum period latency of over 1 second. Was the
intention to constrain SNDRV_PCM_HW_PARAM_PERIOD_BYTES instead?

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
> +	irq_regmap =3D irq_data[irq_desc->irq].regmap;
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
Can this cause an interrupt storm and duplicate ALSA state updates?

If both AFE_IRQ_STS_PLAY and AFE_IRQ_STS_RECORD are set in the status
register, the if/else block only selects AN7581_MEMIF_DL1. As a result, only
the playback interrupt is cleared, leaving the capture interrupt active.

The loop then calls snd_pcm_period_elapsed() for both streams. Since the
capture interrupt isn't cleared, the IRQ handler will immediately re-trigge=
r,
observe the capture interrupt bit, clear it, and call
snd_pcm_period_elapsed() a second time for the same capture period.

[ ... ]

> +static int an7581_afe_pcm_dev_probe(struct platform_device *pdev)
> +{
> +	struct an7581_afe_private *afe_priv;
> +	struct reset_control *reset;
> +	struct mtk_base_afe *afe;
> +	struct device *dev;
> +	int i, irq_id, ret;
> +	void *base;
> +
[ ... ]
> +	/* request irq */
> +	irq_id =3D platform_get_irq(pdev, 0);
> +	if (irq_id < 0)
> +		return irq_id;
> +
> +	ret =3D devm_request_irq(dev, irq_id, an7581_afe_irq_handler,
> +			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to request irq for asys-isr\n");
> +
> +	/* init memif */
> +	afe->memif_size =3D AN7581_MEMIF_NUM;
> +	afe->memif =3D devm_kcalloc(dev, afe->memif_size, sizeof(*afe->memif),
> +				  GFP_KERNEL);

[Severity: High]
Could this result in a NULL pointer dereference?

The IRQ handler is requested before afe->memif is allocated. If an interrupt
triggers immediately (e.g., from pending bootloader state or a shared IRQ
line), an7581_afe_irq_handler() will execute and unconditionally iterate
over afe->memif. Accessing &afe->memif[i] when the pointer is NULL will
cause a panic.

> diff --git a/sound/soc/mediatek/an7581/an7581-dai-etdm.c b/sound/soc/medi=
atek/an7581/an7581-dai-etdm.c
> new file mode 100644
> index 0000000000000..1022bedea9911
> --- /dev/null
> +++ b/sound/soc/mediatek/an7581/an7581-dai-etdm.c

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
> +	atomic_inc(&afe_priv->users);
> +
> +	return 0;
> +}
> +
> +static void mtk_dai_etdm_shutdown(struct snd_pcm_substream *substream,
> +				  struct snd_soc_dai *dai)
> +{
> +	struct mtk_base_afe *afe =3D snd_soc_dai_get_drvdata(dai);
> +	struct an7581_afe_private *afe_priv =3D afe->platform_priv;
> +
> +	if (atomic_dec_and_test(&afe_priv->users))
> +		regmap_clear_bits(afe->regmap, AFE_DAC_CON0,
> +				  BIT(AFE_AFE_ENABLE_SHIFT));
> +}

[Severity: Medium]
Could this introduce a race condition?

The hardware enablement state and atomic user counters are updated
non-atomically. If multiple streams are opened/closed concurrently, thread A
could increment the atomic counter immediately after thread B decrements it
to 0 but before thread B disables the hardware. Thread B will then disable
the hardware while thread A considers it successfully enabled, leaving the
hardware incorrectly powered off.

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

[Severity: High]
Can this cause a NULL pointer dereference?

The etdm_data pointer is dynamically allocated and assigned in
mtk_dai_etdm_set_fmt(). If a machine driver does not define a dai_fmt and
the .set_fmt callback is never invoked, etdm_data will remain NULL. When an
audio stream is started, this will unconditionally dereference etdm_data,
causing a panic.

[Severity: Medium]
Are the clock inversion settings being ignored?

The .set_fmt callback parses SND_SOC_DAIFMT_INV_MASK and populates
etdm_data->bck_inv and etdm_data->lrck_inv. However, these fields are never
read or programmed into the hardware registers here in mtk_dai_etdm_config(=
),
meaning any requested phase inversions are silently ignored.

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

[Severity: Medium]
Does this cause a memory leak?

A new mtk_dai_etdm_priv struct is allocated via devm_kzalloc() on every
invocation of mtk_dai_etdm_set_fmt(). Since snd_soc_dai_set_fmt() can be
called multiple times during the device lifecycle (e.g., from hw_params or
userspace topologies), each call leaks the previously allocated memory until
the device is unbound.

> diff --git a/sound/soc/mediatek/an7581/an7581-wm8960.c b/sound/soc/mediat=
ek/an7581/an7581-wm8960.c
> new file mode 100644
> index 0000000000000..4e60e112018cc
> --- /dev/null
> +++ b/sound/soc/mediatek/an7581/an7581-wm8960.c

[ ... ]

> +static int an7581_wm8960_machine_probe(struct platform_device *pdev)
> +{
> +	struct device_node *platform_dai_node, *codec_dai_node;
> +	struct snd_soc_card *card =3D &an7581_wm8960_card;
> +	struct device_node *platform, *codec;
> +	struct snd_soc_dai_link *dai_link;
> +	int ret, i;
> +
> +	card->dev =3D &pdev->dev;
> +
> +	platform =3D of_get_child_by_name(pdev->dev.of_node, "platform");
> +
> +	if (platform) {
> +		platform_dai_node =3D of_parse_phandle(platform, "sound-dai", 0);
> +		of_node_put(platform);
> +
> +		if (!platform_dai_node) {
> +			dev_err(&pdev->dev, "Failed to parse platform/sound-dai property\n");
> +			return -EINVAL;
> +		}
> +	} else {
> +		dev_err(&pdev->dev, "Property 'platform' missing or invalid\n");
> +		return -EINVAL;
> +	}
> +
> +	for_each_card_prelinks(card, i, dai_link) {
> +		if (dai_link->platforms->name)
> +			continue;
> +		dai_link->platforms->of_node =3D platform_dai_node;
> +	}
> +
> +	codec =3D of_get_child_by_name(pdev->dev.of_node, "codec");
> +
> +	if (codec) {
> +		codec_dai_node =3D of_parse_phandle(codec, "sound-dai", 0);
> +		of_node_put(codec);
> +
> +		if (!codec_dai_node) {
> +			of_node_put(platform_dai_node);
> +			dev_err(&pdev->dev, "Failed to parse codec/sound-dai property\n");
> +			return -EINVAL;
> +		}
> +	} else {
> +		of_node_put(platform_dai_node);
> +		dev_err(&pdev->dev, "Property 'codec' missing or invalid\n");
> +		return -EINVAL;
> +	}
> +
> +	for_each_card_prelinks(card, i, dai_link) {
> +		if (dai_link->codecs->name)
> +			continue;
> +		dai_link->codecs->of_node =3D codec_dai_node;
> +	}
> +
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
> +
> +err_of_node_put:
> +	of_node_put(platform_dai_node);
> +	of_node_put(codec_dai_node);
> +	return ret;
> +}

[Severity: Medium]
Are device tree node references leaked here on successful probe?

The of_parse_phandle() function increments the reference count of the
returned nodes for platform_dai_node and codec_dai_node. While the error
paths correctly call of_node_put(), the success path returns 0 without
ever dropping these references. Since there is no .remove callback or
devres action to clean them up, the OF nodes are permanently leaked.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528174840.2864=
4-1-ansuelsmth@gmail.com?part=3D4
