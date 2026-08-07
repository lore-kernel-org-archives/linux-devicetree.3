Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FBC441618
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 20:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786134124; cv=none; b=cL9LvrsWpGUW0tc4XDMCMr3B2pdL317MioOfs6SpXW0ow584tLvs8M+92FBo38BOkw3/fRhIJlXKenzH9zhzLGHPnUhYrRNb3pvNkGOYg+Fz6w++cPkqNhKQaOVhGjL6FXiOuuMyRV2GmuVMMdTyLMriCOzxmxoAsid6jIX2VuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786134124; c=relaxed/simple;
	bh=sx08VGAQDnaLmGPOs1OoOJydwNMxaieA2qKWiPgeNZI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=blsi8qAFUF4CLaWyfB+IjioB/pg+WAoN//bNotjMWBejMBDW8+QKhZjVyRPp4ipnuVm1yt5fr7/yq8Y9bfcB15keYiqgSrGO8QzulFP6VveCyEHM5t1IeOAwX155KEha7+BFMDw0ACotgSq2QAomkB5+PLxZT2VZlNnfYX8DOPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yaaq6Vm0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yaaq6Vm0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74F21F000E9;
	Fri,  7 Aug 2026 20:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786134122;
	bh=IJ8+wxA4p/SjqY8ItaLyrgn2ciZDO1MMMALdUDAKF/w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yaaq6Vm0OM0JjyBFr3ciaNxJ8zNvHINsr1xMcLcKF7i0+r5DivJlnzkCn3V8rS5kT
	 Ct/8WJplZh7XL6VKVM0QdIssngeI5L028bs2D01S5wN/tKbEOCu4Am5cI0rTdrkihi
	 a0zmnI1aOgkLR1Qa1xEVgzc44kHBAC+KqchfYAbI2K/o37ypimfrm4Fwq+5N3c/l57
	 xiEmi1ej9cpj4LWJKVzbh/zcHUMtoXsvqShglD0CSweIYQu3YYnkynpm/MRZauxAuZ
	 2przMulXXPWw2MXHCkxlKjppxwZTEbxN9TaV3e9Dr/L43blfK+ZFA/hwunj8RVg7RV
	 U675/69p2RMEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] ASoC: airoha: Add AFE and machine driver for
 Airoha AN7581
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260807200936.201827-5-ansuelsmth@gmail.com>
References: <20260807200936.201827-1-ansuelsmth@gmail.com>
 <20260807200936.201827-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 20:22:00 +0000
Message-Id: <20260807202201.D74F21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Use of uninitialized `dev` pointer and zero-sized allocation for `=
afe->irqs` and `afe->memif` causes a kernel panic on probe.
- [High] Potential NULL pointer dereference in `mtk_dai_etdm_config` if `se=
t_fmt` is not called.
- [Medium] Unconditional `devm_kzalloc` in `mtk_dai_etdm_set_fmt` leads to =
a memory leak on repeated calls.
- [Medium] Device tree node reference leak on the success path in `an7581_w=
m8960_machine_probe`.
- [Medium] IRQ handler inappropriately returns `IRQ_HANDLED` when no interr=
upts match.
- [Medium] Clock inversion flags are successfully parsed but completely ign=
ored by hardware configuration.
- [Medium] The IRQ handler clears the interrupt status flag after processin=
g the event, potentially discarding new interrupts.
- [Medium] The machine driver modifies a globally defined static `snd_soc_d=
ai_link` array during probe.
--

--- Patch [4]: [PATCH v5 4/4] ASoC: airoha: Add AFE and machine driver for =
Airoha AN7581 ---
commit c3c67d6bafbbabd1b6c6e75b8c29e6aac51229d2
Author: Christian Marangi <ansuelsmth@gmail.com>

ASoC: airoha: Add AFE and machine driver for Airoha AN7581

This adds support for the Sound system present on the Airoha AN7581 SoC,
based on the mediatek AFE drivers. It also includes the machine driver
to create an actual sound card for the AFE.

> diff --git a/sound/soc/mediatek/an7581/an7581-afe-pcm.c b/sound/soc/media=
tek/an7581/an7581-afe-pcm.c
> new file mode 100644
> --- /dev/null
> +++ b/sound/soc/mediatek/an7581/an7581-afe-pcm.c
> @@ -0,0 +1,517 @@
> [ ... ]
> +static irqreturn_t an7581_afe_irq_handler(int irq_id, void *dev)
> +{
> [ ... ]
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
> +	for (i =3D 0; i < AN7581_MEMIF_NUM; i++) {
> +		struct regmap *irq_regmap;
> +
> +		irq_desc =3D &an7581_memif_irq_descs[i];
> +		if (!(status & irq_desc->status_bit))
> +			continue;
> +
> +		irq_regmap =3D afe->irqs[irq_desc->irq].regmap;
> +		regmap_set_bits(irq_regmap, irq_desc->clear_reg,
> +				BIT(AFE_IRQ_CLR_SHIFT));

[Severity: Medium]
By clearing the interrupt status flag after calling the potentially
time-consuming snd_pcm_period_elapsed(), is there a risk of inadvertently
acknowledging and dropping a new interrupt that fired during the handler's
execution?

> +		regmap_clear_bits(irq_regmap, irq_desc->clear_reg,
> +				  BIT(AFE_IRQ_CLR_SHIFT));
> +
> +		regmap_set_bits(irq_regmap, irq_desc->clear_reg,
> +				BIT(AFE_IRQ_MISS_FLG_CLR_SHIFT));
> +		regmap_clear_bits(irq_regmap, irq_desc->clear_reg,
> +				  BIT(AFE_IRQ_MISS_FLG_CLR_SHIFT));
> +	}
> +
> +	return IRQ_HANDLED;

[Severity: Medium]
Should this return IRQ_NONE if no interrupt flags were actually matched in
the status register? Returning IRQ_HANDLED unconditionally might prevent
the IRQ subsystem from detecting a spurious interrupt storm.

> +}
> [ ... ]
> +static int an7581_afe_pcm_dev_probe(struct platform_device *pdev)
> +{
> +	struct an7581_afe_private *afe_priv;
> +	struct reset_control *reset;
> +	struct mtk_base_afe *afe;
> +	struct device *dev;
> +	int i, irq_id, ret;
> +	void *base;
> +
> +	afe =3D devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
> +	if (!afe)
> +		return -ENOMEM;
> +
> +	afe->irqs =3D devm_kcalloc(dev, afe->irqs_size, sizeof(*afe->irqs),
> +				 GFP_KERNEL);

[Severity: High]
Is it safe to use the dev pointer here before it is initialized? It looks
like dev gets assigned later in this function.

Also, since afe was just allocated with devm_kzalloc(), wouldn't
afe->irqs_size be 0? Passing a size of 0 to devm_kcalloc() will return
ZERO_SIZE_PTR, which could cause a panic when it is dereferenced later
during initialization.

> +	if (!afe->irqs)
> +		return -ENOMEM;
> [ ... ]
> diff --git a/sound/soc/mediatek/an7581/an7581-dai-etdm.c b/sound/soc/medi=
atek/an7581/an7581-dai-etdm.c
> new file mode 100644
> --- /dev/null
> +++ b/sound/soc/mediatek/an7581/an7581-dai-etdm.c
> @@ -0,0 +1,433 @@
> [ ... ]
> +static int mtk_dai_etdm_config(struct mtk_base_afe *afe,
> +			       struct snd_pcm_hw_params *params,
> +			       struct snd_soc_dai *dai,
> +			       int stream)
> +{
> +	struct an7581_afe_private *afe_priv =3D afe->platform_priv;
> +	struct mtk_dai_etdm_priv *etdm_data =3D afe_priv->dai_priv[dai->id];
> [ ... ]
> +	/* CON0 */
> +	mask =3D ETDM_SLAVE_MODE | ETDM_BIT_LEN | ETDM_WRD_LEN |
> +	       ETDM_FMT | ETDM_CH_NUM;
> +	val =3D FIELD_PREP(ETDM_BIT_LEN, params_width(params) - 1) |
> +	      FIELD_PREP(ETDM_WRD_LEN, get_etdm_wlen(bit_width) - 1) |
> +	      FIELD_PREP(ETDM_FMT, etdm_data->format) |

[Severity: High]
Is it possible for mtk_dai_etdm_config() to be called without set_fmt
having been called first? If so, could dereferencing etdm_data->format
here result in a NULL pointer dereference, as etdm_data is only allocated
in mtk_dai_etdm_set_fmt()?

> +	      FIELD_PREP(ETDM_CH_NUM,
> +			 get_etdm_ch_fixup(params_channels(params)) - 1);
> +	if (etdm_data->slave_mode)
> +		val |=3D ETDM_SLAVE_MODE;

[Severity: Medium]
Does the hardware configuration ignore the etdm_data->bck_inv and
etdm_data->lrck_inv flags? It appears they are parsed from the format=20
mask in mtk_dai_etdm_set_fmt() but never actually applied to any hardware
registers here.

> [ ... ]
> +static int mtk_dai_etdm_set_fmt(struct snd_soc_dai *dai, unsigned int fm=
t)
> +{
> +	struct mtk_base_afe *afe =3D snd_soc_dai_get_drvdata(dai);
> +	struct an7581_afe_private *afe_priv =3D afe->platform_priv;
> +	struct mtk_dai_etdm_priv *etdm_data;
> +	void *priv_data;
> +
> +	priv_data =3D devm_kzalloc(afe->dev, sizeof(struct mtk_dai_etdm_priv),
> +				 GFP_KERNEL);

[Severity: Medium]
Could this unconditionally allocate memory on every call, potentially
leaking the previous allocation if set_fmt is called multiple times by
ALSA core or machine drivers?

> +	if (!priv_data)
> +		return -ENOMEM;
> +
> +	afe_priv->dai_priv[dai->id] =3D priv_data;
> +	etdm_data =3D afe_priv->dai_priv[dai->id];
> [ ... ]
> diff --git a/sound/soc/mediatek/an7581/an7581-wm8960.c b/sound/soc/mediat=
ek/an7581/an7581-wm8960.c
> new file mode 100644
> --- /dev/null
> +++ b/sound/soc/mediatek/an7581/an7581-wm8960.c
> @@ -0,0 +1,161 @@
> [ ... ]
> +static int an7581_wm8960_machine_probe(struct platform_device *pdev)
> +{
> [ ... ]
> +	for_each_card_prelinks(card, i, dai_link) {
> +		struct snd_soc_dai_link_component *platform;
> +
> +		dai_link->num_platforms =3D 2;
> +		for_each_link_platforms(dai_link, d, platform) {
> +			if (platform->name)
> +				continue;
> +			platform->of_node =3D platform_dai_node;

[Severity: Medium]
Could modifying the globally defined static an7581_wm8960_dai_links
array here cause stale pointers to be left behind across module reloads
or unbind/bind cycles?

> +		}
> +	}
> [ ... ]
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
Does returning 0 early in the success path skip the of_node_put() calls,=20
leaking the device tree node references acquired earlier via=20
of_parse_phandle()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807200936.2018=
27-1-ansuelsmth@gmail.com?part=3D4
