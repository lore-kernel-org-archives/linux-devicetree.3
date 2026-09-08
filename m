Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFC6372B58
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 09:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859025; cv=none; b=NLb+AAmDxC2x67HzjzYCmWmwWpiFh/Oy4XNvl6lRzKjyIcZPXTeS7GPT7vF+ZuMOFUI181OKYDYgZlmpHOl9C7ICjfxf/8YYH2H4OCaBrQ7IAxnAO35EubmJIQEI3+h5GSFf/cvoinWXoTEpz1dMtB5RKAffCzoIA94srBmefz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859025; c=relaxed/simple;
	bh=66RCoQpOIsuNUvlV0mRSOOWACT6+Y/JTGQCPTtvyLWI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oz+iaLrLjhTPPXT83DUeiKLUxt1bf8Dxy3CkLxr9Oh1WX9n8jQ11ciUJDw2RVF2om+NMOklXBsHg4rOi+0NkHyII7pVxQYn9ZjwBFVQGtNR9H8UJI9Ifpr1suHcZGse34wAmwj5FPdi5vLQqOsIVZ84mkGLW9GxDAumxKSRro/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KspjujCh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KspjujCh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58B11F00A3A;
	Tue,  8 Sep 2026 09:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788859024;
	bh=fF9Z8LaU15qGHUrPKA/9szRNq5wiB6TwzIexIdgr57I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KspjujChQGBZM88dI52P+hY7Vbtk3HvW7eF6OE0AZHN38Drmwm4L/xQ2/9C785a7k
	 HwCs5vnU5ke+EsaOuNWx6sk0/g2Ng6E1683qBojNfZQoyU3kloSCeAhoLlWR85CpbB
	 pS/BMP5oHpnZd4lVlvr9e1LUatM05zgNaTYIGexFW8pwr2COQE76/hnSNZjUoX7G8n
	 S3gff61k3i+8acA4gTYh35sgKRXvnGYRVHmTzrgEyr7ly5eQbYcG48Jn2Ruca/Bt7c
	 OSmhCoXBGybf2uzwrAHYuywxPMUskFRHMB0nHC9fDeBy5Ujsi2sAEkCVw40UEzoeuk
	 Kn0pZY49hGm4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/5] ASoC: airoha: Add AFE driver for Airoha AN7581
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260908090448.3332-5-ansuelsmth@gmail.com>
References: <20260908090448.3332-1-ansuelsmth@gmail.com>
 <20260908090448.3332-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 09:17:03 +0000
Message-Id: <20260908091703.D58B11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Unconditional NULL pointer dereference in `mtk_dai_etdm_config` if=
 `snd_soc_dai_set_fmt` is never called.
- [High] Unbalanced error path in `an7581_afe_fe_startup` leaves a dangling=
 substream pointer leading to a Use-After-Free.
- [High] Impossible hardware constraints for capture streams due to a mix-u=
p between frames and bytes.
- [Medium] Repeated, unbounded memory allocations in `mtk_dai_etdm_set_fmt`=
 overwrite the previous pointer without freeing it.
- [Medium] DAI format clock inversion settings are successfully parsed but =
silently ignored by the hardware configuration.
--

commit e1645bd481353127d1a22ed7f6309ae66d234cd2
Author: Christian Marangi <ansuelsmth@gmail.com>

ASoC: airoha: Add AFE driver for Airoha AN7581

Add support for the Sound system present on Airoha AN7581 SoC. This is
based on the Mediatek AFE drivers and adds the PCM and the ETDM driver.

> diff --git a/sound/soc/mediatek/an7581/an7581-afe-pcm.c b/sound/soc/media=
tek/an7581/an7581-afe-pcm.c
> new file mode 100644
> index 0000000000000..a1d742362538e
> --- /dev/null
> +++ b/sound/soc/mediatek/an7581/an7581-afe-pcm.c
[ ... ]
> @@ -0,0 +1,515 @@
[ ... ]
> +static int an7581_afe_fe_startup(struct snd_pcm_substream *substream, st=
ruct snd_soc_dai *dai)
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

[Severity: High]
Is this constraint using the correct parameter? The=20
SNDRV_PCM_HW_PARAM_PERIOD_SIZE parameter is measured in frames, not bytes.

For an 8-channel, 32-bit capture stream (32 bytes per frame), 8192 frames
equals 262,144 bytes, which exceeds the absolute maximum period_bytes_max
of 131,072 bytes. This would cause the ALSA core interval intersection
to fail and return -EINVAL.

Was this intended to be SNDRV_PCM_HW_PARAM_PERIOD_BYTES?

> +		if (ret < 0)
> +			dev_err(afe->dev, "hw_constraint_minmax failed\n");
> +	}
> +
> +	return ret;
> +}

[Severity: High]
If snd_pcm_hw_constraint_minmax() fails here, does this error path leave
a dangling substream pointer?

The earlier call to mtk_afe_fe_startup() saves the substream into the
hardware tracking structure at memif->substream. Because we return
immediately on failure without calling mtk_afe_fe_shutdown(), the ALSA core
will destroy the stream without running the DAI .shutdown callback.

Could this lead to a use-after-free if a shared IRQ fires later and tries
to access the freed memif->substream pointer?

[ ... ]
> diff --git a/sound/soc/mediatek/an7581/an7581-dai-etdm.c b/sound/soc/medi=
atek/an7581/an7581-dai-etdm.c
> new file mode 100644
> index 0000000000000..7fbfd8fe18362
> --- /dev/null
> +++ b/sound/soc/mediatek/an7581/an7581-dai-etdm.c
[ ... ]
> @@ -0,0 +1,433 @@
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
> +	unsigned int bit_width =3D params_width(params);
> +	unsigned int mask, mask1;
> +	unsigned int val, val1;
> +
> +	dev_dbg(afe->dev, "%s(), stream %d, rate %u, bitwidth %u\n",
> +		__func__, stream, rate, params_width(params));
> +
> +	/* CON0 */
> +	mask =3D ETDM_SLAVE_MODE | ETDM_BIT_LEN | ETDM_WRD_LEN |
> +	       ETDM_FMT | ETDM_CH_NUM;
> +	val =3D FIELD_PREP(ETDM_BIT_LEN, params_width(params) - 1) |
> +	      FIELD_PREP(ETDM_WRD_LEN, get_etdm_wlen(bit_width) - 1) |
> +	      FIELD_PREP(ETDM_FMT, etdm_data->format) |

[Severity: High]
What happens if a machine driver does not configure the .dai_fmt on the
DAI link?

If the ALSA core never invokes mtk_dai_etdm_set_fmt(), the pointer at
afe_priv->dai_priv[dai->id] remains NULL. When a stream is opened and
mtk_dai_etdm_config() runs, it appears this code will blindly fetch and
dereference etdm_data->format.

Can this cause a kernel panic due to a NULL pointer dereference?

[Severity: Medium]
Are the clock inversion settings being silently ignored here?

The mtk_dai_etdm_set_fmt() function successfully parses the
SND_SOC_DAIFMT_INV_MASK flags and stores them in etdm_data->bck_inv and
etdm_data->lrck_inv. However, they don't seem to be applied when
programming the ETDM_IN1_CON4 or ETDM_OUT1_CON5 registers in this
configuration step.

> +	      FIELD_PREP(ETDM_CH_NUM,
> +			 get_etdm_ch_fixup(params_channels(params)) - 1);
[ ... ]
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
> +	if (!priv_data)
> +		return -ENOMEM;
> +
> +	afe_priv->dai_priv[dai->id] =3D priv_data;

[Severity: Medium]
Will this cause a memory leak if the DAI format is set multiple times?

A machine driver might configure the format dynamically or multiple times
during stream restarts. Because this unconditionally allocates memory with
devm_kzalloc() and overwrites the shared afe_priv->dai_priv[dai->id]
pointer, it seems previous allocations will remain leaked for the lifespan
of the device.

> +	etdm_data =3D afe_priv->dai_priv[dai->id];
> +
> +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908090448.3332=
-1-ansuelsmth@gmail.com?part=3D4
