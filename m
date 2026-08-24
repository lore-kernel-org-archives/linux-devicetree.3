Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18E53E867A
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787554421; cv=none; b=l/+R7JnxVz1jnEsot+2dHFqmqCY3cv548Wn/riy/94isoq/xJdph38FqsqYXXUdwhHOdjqy/HNWTbHmJBwy5yTBLuKDatTLLmtxOqmoVsWNwxYiOd49OKpUvfMDernXiWTHmTj+G3XR7J1cEoI/7EIn9PxkVi1y79jo8cVYOG7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787554421; c=relaxed/simple;
	bh=Og8RaQk46u/+7CQ2Zkivg0t4lJQINx73B0q8cZHLHG0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=an6RQ/RpURFBzOmoK7BMhOOYQEtCWVfT4og8G7mBb35tgGkzxAvv1vqKGVYA0aUsP/1gPu2LD8N9R0NlS12L+gRRmq2weqbEHNBsksZprsV3W3EaCYhhxW7ISk75WwdcW3Y/hjSkFU5RGU9WkxY2ktOdZn3L0xB8epRdSqlVG+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GWa0VkBm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GWa0VkBm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E41F1F00A3A;
	Mon, 24 Aug 2026 06:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787554419;
	bh=MpbvQTAn3dPv4OTjt9cgCs/bhOZ8m89oDTpEhsjHENY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GWa0VkBmimWnt4Wn+sefGrHUqimUOeH3WXv4Tx1O/xsjCPiL1zJ5gSW708QsTczK2
	 uG4WVuOiSgmB0gDQMz+6H/8tqWwrHP5+ndHsSVVW4j3J/gMmeMcN2vkb3nS/uVVEOB
	 u76/d3xONoRMEuwBQb12dYLzslUUS92XJT7DNrmmLjhYrdVs5KKVdWV38SAoyork9K
	 E87LxMernrqY+S1z5autBGRzgVIAmi7dMEB960AGj0mnxc5vUXrHREBeZxCwcvQ9y9
	 wONgCb6wmoE05WFNqw3/YdJwwDxfjmuLkKgiGXHdupcqgOk3JynKf/ZTP5URosrsPm
	 pMZgNsLcLi/vQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/9] ASoC: qcom: Add QAIF IRQ handling,
 suspend/resume and platform register
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260824063627.3595610-8-harendra.gautam@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-8-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 06:53:38 +0000
Message-Id: <20260824065339.3E41F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Hardcoded cell count for 'iommus' property parsing ignores `#iommu=
-cells`.
- [High] Incomplete hardware context restore during system resume.
- [Medium] Early return in SNDRV_PCM_TRIGGER_STOP leaves interrupts enabled=
 on failure.
--

--- Patch [7]: [PATCH v3 7/9] ASoC: qcom: Add QAIF IRQ handling, suspend/re=
sume and platform register ---
commit e0106aaa99b0a121b196914494fc9a99b9c5df66
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

    ASoC: qcom: Add QAIF IRQ handling, suspend/resume and platform register
   =20
    Register the ASoC component, request the QAIF interrupt and add trigger
    handling to enable or disable DMA and its interrupt sources. Dispatch t=
he
    top-level IRQ status to the AIF and CIF DMA handlers, report period ela=
psed
    events to ALSA, warn on xrun conditions and stop the stream on bus erro=
rs.

> diff --git a/sound/soc/qcom/qaif-platform.c b/sound/soc/qcom/qaif-platfor=
m.c
> index 4b4647641d113..2e5dc5b081cd1 100644
> --- a/sound/soc/qcom/qaif-platform.c
> +++ b/sound/soc/qcom/qaif-platform.c
> @@ -542,3 +542,394 @@ static int qaif_platform_copy(struct snd_soc_compon=
ent *component,

[ ... ]

> +static int qaif_platform_pcmops_trigger(struct snd_soc_component *compon=
ent,
> +					struct snd_pcm_substream *substream,
> +					int cmd)
> +{
> +	struct snd_soc_pcm_runtime *soc_runtime =3D snd_soc_substream_to_rtd(su=
bstream);
> +	struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(soc_runtime, 0);
> +	struct qaif_drv_data *drvdata =3D snd_soc_component_get_drvdata(compone=
nt);
> +	const struct qaif_variant *v =3D drvdata->variant;
> +	struct qaif_pcm_data *data =3D substream->runtime->private_data;
> +	unsigned int dai_id =3D cpu_dai->driver->id;
> +	enum qaif_irq_type irq_type =3D qaif_is_cif_dma_port(dai_id) ? QAIF_CIF=
_IRQ : QAIF_AIF_IRQ;
> +	struct regmap *map =3D drvdata->audio_qaif_map;
> +	int idx =3D data->dma_reg_idx;
> +	int ret;
> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		ret =3D qaif_platform_irq_op(drvdata, substream->stream, irq_type,
> +					   idx, QAIF_IRQ_CLEAR);

[Severity: High]
Does this code fully restore the hardware context during a system resume?

If power is lost during suspend, the hardware registers might be zeroed. It
looks like the trigger path handles SNDRV_PCM_TRIGGER_RESUME by enabling
the DMA control bit and interrupts, but without reprogramming the lost DMA
configuration such as base address, buffer limits, and period lengths.

Could this cause the hardware to fetch from unmapped memory and trigger
IOMMU faults or memory corruption if we resume a paused or active stream?

> +		if (ret) {
> +			dev_err(soc_runtime->dev, "error clearing irq regs: %d\n", ret);
> +			return ret;
> +		}
> +		ret =3D regmap_update_bits(map,
> +					 qaif_dmacfg_reg(v, idx, substream->stream, dai_id),
> +					 QAIF_DMACFG_DYNCLK_BIT, QAIF_DMACFG_DYNCLK_BIT);
> +		if (ret) {
> +			dev_err(soc_runtime->dev, "error enabling dma_dynclk: %d\n", ret);
> +			return ret;
> +		}
> +		ret =3D regmap_update_bits(map,
> +					 qaif_dmactl_reg(v, idx, substream->stream, dai_id),
> +					 QAIF_DMACTL_ENABLE_BIT, QAIF_DMACTL_ENABLE_BIT);
> +		if (ret) {
> +			dev_err(soc_runtime->dev, "error enabling DMA: %d\n", ret);
> +			return ret;
> +		}
> +		ret =3D qaif_platform_irq_op(drvdata, substream->stream, irq_type,
> +					   idx, QAIF_IRQ_ENABLE);
> +		if (ret)
> +			dev_err(soc_runtime->dev, "error enabling irq regs: %d\n", ret);
> +		break;
> +	case SNDRV_PCM_TRIGGER_STOP:
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		ret =3D regmap_update_bits(map,
> +					 qaif_dmactl_reg(v, idx, substream->stream, dai_id),
> +					 QAIF_DMACTL_ENABLE_BIT, 0);
> +		if (ret) {
> +			dev_err(soc_runtime->dev, "error disabling DMA: %d\n", ret);
> +			return ret;
> +		}

[Severity: Medium]
Can this early return lead to an interrupt storm?

If regmap_update_bits() fails during SNDRV_PCM_TRIGGER_STOP, this skips
the subsequent qaif_platform_irq_op() call that disables the interrupts.

Even if disabling DMA fails, wouldn't we still want to ensure interrupts
are disabled during the teardown sequence?

> +		ret =3D regmap_update_bits(map,
> +					 qaif_dmacfg_reg(v, idx, substream->stream, dai_id),
> +					 QAIF_DMACFG_DYNCLK_BIT, 0);
> +		if (ret)
> +			dev_err(soc_runtime->dev, "error disabling dma_dynclk: %d\n", ret);
> +		ret =3D qaif_platform_irq_op(drvdata, substream->stream, irq_type,
> +					   idx, QAIF_IRQ_DISABLE);
> +		if (ret)
> +			dev_err(soc_runtime->dev, "error disabling irq regs: %d\n", ret);
> +		break;

[ ... ]

> +int asoc_qcom_qaif_platform_register(struct platform_device *pdev)
> +{
> +	struct qaif_drv_data *drvdata =3D platform_get_drvdata(pdev);
> +	struct of_phandle_args iommu_spec;
> +	u32 sid;
> +	int ret;
> +
> +	if (!drvdata || !drvdata->variant)
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				     "Invalid drvdata or variant\n");
> +
> +	ret =3D of_parse_phandle_with_fixed_args(pdev->dev.of_node,
> +					       "iommus", 2, 0,
> +					       &iommu_spec);

[Severity: High]
Does this code correctly handle generic IOMMU bindings?

The driver uses a fixed cell count of 2 to parse the "iommus" property.
If the target IOMMU configuration on a platform uses a different
#iommu-cells value (e.g., 1), won't this cause parsing to fail during
driver probe?

> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to parse iommus property\n");
> +	sid =3D iommu_spec.args[0];
> +	of_node_put(iommu_spec.np);
> +	drvdata->smmu_csid_bits =3D sid & QAIF_CSID_MASK;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824063627.3595=
610-1-harendra.gautam@oss.qualcomm.com?part=3D7
