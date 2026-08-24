Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6D23E6DC8
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787554171; cv=none; b=MKj2IIxQASzb4/EWxiiZ6V65+YIsxyi0juHBBWGsMD/H6vfKueT8RPEVR7vYVPopbp2b4hBfK90zinTx5nCyh8Yvj4NvAK/cT8XNnl7k8NRHgQnmmuGgAy/0IhpMQygXJqbS6jbxJUfiEG6MUa9zlf1AIzAHg3qC6buXZ1K43wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787554171; c=relaxed/simple;
	bh=QUInWTcwSFsN07jFbVx0Lb5UcVRVsdwIVNC1PcyncQE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QLQzzZYR64KdKewr1cY7xPSm+TVThTiQtbuT0zP3rC7fLUkShZ1FzOyamngAkChJNqJ2ZJDb8VR0lrJntGssuf38eiPXlILbhQuryUqcczvJPu9/A+bFqsXPdW3IHXiSIqV92jMHBdw8yUM0TnCdfYK5pMibPJjcuMelN4QUCK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X7pK8POv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X7pK8POv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 626781F000E9;
	Mon, 24 Aug 2026 06:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787554167;
	bh=CZLfVpoJ0BTXyuEPYIq3AOI5N4FkZs5KJkpMlNbrrMQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X7pK8POvxvyq7Yi/GIeqe+TXNDiyvMJ9EBMZwOARH+orDhcbLQOYJY+cIqpHiLRCb
	 SA0+TDXKo0wz+6LrbAUdkwtZz7kFV2D14ZdX0jIJ8HLWl1YN0NwhwdpUtXGQTkrfXy
	 tlv5/CbPO8sy3iQdx5lcz/rUx48r2JkYmyWyAbzqP+vhRzB38wiWNKHOWraF5ed+x1
	 LlKDDCrEunRieQf4T4BJYIRXg5FQ2PwcIq0zHgfh/h4HSdIAwmideKFYBTcDSAaqg8
	 VgLwgTiOU6A/roC6MEA4SG/QMbxwUmNXyL6ubRuA42DjxA9XE1uWxVz8kKFijaB90z
	 Le9rxje1KrKDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/9] ASoC: qcom: Add QAIF CPU DAI ops, regmap, DT
 parsing and platform init
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260824063627.3595610-5-harendra.gautam@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-5-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 06:49:26 +0000
Message-Id: <20260824064927.626781F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Shared AIF enable bit is improperly cleared during concurrent loop=
back stream stop.
- [High] Inconsistent frame clock inversion handling between set_fmt and DT=
 parser breaks I2S.
- [Medium] Device Tree TDM slot parameters are not validated, causing silen=
t truncation and hardware misconfiguration.
- [Low] Missing DAI type validation in DT parser allows CIF DAIs to overwri=
te AIF interface configurations.
--

--- Patch [4]: [PATCH v3 4/9] ASoC: qcom: Add QAIF CPU DAI ops, regmap, DT =
parsing and platform init ---
commit 11d4fc6e518b0a0de63f9a65aeca246850ab08f1
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Subject: ASoC: qcom: Add QAIF CPU DAI ops, regmap, DT parsing and platform =
init

This patch implements the CIF and AIF DAI operations for the QAIF CPU drive=
r.
It configures the DMA paths, MI2S/TDM formats, registers the regmap, and
parses per-interface configuration from the device tree.

> diff --git a/sound/soc/qcom/qaif-cpu.c b/sound/soc/qcom/qaif-cpu.c
> new file mode 100644
> index 0000000000000..8792d01254a68
> --- /dev/null
> +++ b/sound/soc/qcom/qaif-cpu.c

[ ... ]

> +static int qaif_aif_cpu_daiops_trigger(struct snd_pcm_substream *substre=
am,
> +				       int cmd, struct snd_soc_dai *dai)
> +{
> +	struct qaif_drv_data *drvdata =3D snd_soc_dai_get_drvdata(dai);
> +	const struct qaif_variant *v =3D drvdata->variant;
> +	const struct qaif_aif_config *cfg;
> +	unsigned int enable_bit;
> +	int idx, ret;
> +
> +	idx =3D v->get_dma_idx(dai->driver->id);
> +	if (idx < 0) {
> +		dev_err(dai->dev, "Invalid DMA index: %d\n", idx);
> +		return -EINVAL;
> +	}
> +
> +	cfg =3D &drvdata->aif_intf_cfg[idx];
> +	if (cfg->loopback_en)
> +		enable_bit =3D QAIF_AIF_CTL_ENABLE_BIT;
> +	else if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
> +		enable_bit =3D QAIF_AIF_CTL_ENABLE_TX_BIT;
> +	else
> +		enable_bit =3D QAIF_AIF_CTL_ENABLE_RX_BIT;
> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		ret =3D regmap_update_bits(drvdata->audio_qaif_map,
> +					 QAIF_AUD_INTF_CTL_REG(idx), enable_bit, enable_bit);
> +		if (ret)
> +			dev_err(dai->dev, "error setting AIF enable bit: %d\n", ret);
> +		return ret;
> +	case SNDRV_PCM_TRIGGER_STOP:
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		ret =3D regmap_update_bits(drvdata->audio_qaif_map,
> +					 QAIF_AUD_INTF_CTL_REG(idx), enable_bit, 0);

[Severity: High]
When loopback is enabled, enable_bit is assigned to the global
QAIF_AIF_CTL_ENABLE_BIT instead of a stream-specific bit.

If both streams are running concurrently in full-duplex, will stopping one
stream unconditionally clear this shared enable bit and disrupt the other
active stream?

[ ... ]

> +static int qaif_aif_cpu_daiops_set_fmt(struct snd_soc_dai *dai,
> +				       unsigned int fmt)
> +{
> +	struct qaif_drv_data *drvdata =3D snd_soc_dai_get_drvdata(dai);
> +	const struct qaif_variant *v =3D drvdata->variant;
> +	int idx =3D v->get_dma_idx(dai->driver->id);
> +	struct qaif_aif_config *cfg;
> +
> +	if (idx < 0)
> +		return -EINVAL;
> +
> +	cfg =3D &drvdata->aif_intf_cfg[idx];

[ ... ]

> +	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
> +	case SND_SOC_DAIFMT_NB_NF:
> +	case SND_SOC_DAIFMT_NB_IF:
> +		cfg->invert_sync =3D (fmt & SND_SOC_DAIFMT_INV_MASK) =3D=3D
> +				   SND_SOC_DAIFMT_NB_IF;
> +		break;

[Severity: High]
If a machine driver sets the format to SND_SOC_DAIFMT_I2S with
SND_SOC_DAIFMT_NB_NF, this code clears cfg->invert_sync to false.

However, the device tree parser hardcodes cfg->invert_sync to true for I2S.
Does this set_fmt override conflict with the hardware requirements establis=
hed
during DT parsing and break the I2S setup?

[ ... ]

> +static int of_qaif_parse_aif_intf_cfg(struct device *dev,
> +				      struct qaif_drv_data *data)
> +{
> +	const struct qaif_variant *v =3D data->variant;
> +	struct device_node *np =3D dev->of_node;
> +	struct device_node *intf_np;
> +	struct qaif_aif_config *cfg;
> +	int ret;
> +	u32 dai_id;
> +	int intf_idx;
> +	int num_interfaces =3D 0;
> +	u32 val_buf[QAIF_MAX_LANES];
> +	int j, n;
> +	unsigned long configured_intf_mask =3D 0;
> +
> +	for_each_child_of_node(np, intf_np) {
> +		if (!of_property_present(intf_np, "reg"))
> +			continue;
> +
> +		if (num_interfaces >=3D QAIF_MAX_AIF_CFG_CNT) {
> +			dev_warn(dev, "Too many AIF interfaces, limiting to %d\n",
> +				 QAIF_MAX_AIF_CFG_CNT);
> +			of_node_put(intf_np);
> +			break;
> +		}
> +
> +		ret =3D of_property_read_u32(intf_np, "reg", &dai_id);
> +		if (ret) {
> +			dev_err(dev, "Missing reg for interface %pOFn\n", intf_np);
> +			of_node_put(intf_np);
> +			return ret;
> +		}
> +
> +		intf_idx =3D v->get_dma_idx(dai_id);

[Severity: Low]
This loop iterates over all child nodes with a reg property and assumes they
are AIF DAIs.

If a malformed device tree includes a CIF DAI child node, could its ID
overlap with an AIF DAI index when passed to get_dma_idx(), causing array
corruption in drvdata->aif_intf_cfg or a false duplicate registration error?

[ ... ]

> +		if (!qaif_is_mi2s_port(dai_id)) {
> +			ret =3D of_property_read_u32(intf_np, "dai-tdm-slot-width",
> +						   &cfg->slot_width);
> +			if (ret || !cfg->slot_width) {
> +				dev_err(dev, "Missing/invalid dai-tdm-slot-width for %pOFn\n",
> +					intf_np);
> +				of_node_put(intf_np);
> +				return ret ? ret : -EINVAL;
> +			}
> +			ret =3D of_property_read_u32(intf_np, "dai-tdm-slot-num",
> +						   &cfg->slot_num);

[Severity: Medium]
The values from dai-tdm-slot-width and dai-tdm-slot-num are read directly
into cfg without bounds checking against hardware maximums.

In qaif_aif_cpu_daiops_hw_params(), the unvalidated slot_width is shifted
and masked:

qaif_aif_cpu_daiops_hw_params()
    ...
    QAIF_AIF_SLOT_WIDTH(slot_width) |
    ...

If a device tree specifies a width greater than 32, does this result in
silent bitwise truncation and hardware misconfiguration instead of returning
an error during probe?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824063627.3595=
610-1-harendra.gautam@oss.qualcomm.com?part=3D4
