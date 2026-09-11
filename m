Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB9A3C1412
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 09:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789119605; cv=none; b=Tfw4dfeogPwvBFmiD9SI1Pk/nalbZlwWfhR7Ex1vhRnPh5CguINAEetW8IM2kdxgW+03Wg6obLl57pq6BPV1/zT31dv8AtQzsBubMADN/x+sPKPEKs42Q4A+Q9BP/12MABg5WIiJHZtn0baJA61AKHwT3KkLuVkUymaOG8m1iuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789119605; c=relaxed/simple;
	bh=lwSjLSdWaZUoAJbH2zpPSo4/LBtWIqw82QxvM0EQLJw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RQndOzcYE9dsjcSc6/eEAwFlKLoNs+/fvtNTljByw5Xei3Ikabwpz9UxWviHSZZSZtTx2cbF7o0rVQhoDsMOiSValTgTvhucNwiMqqftUUheT1LJfqHkJSEcHl6DvTRq8icJqgzXrqr+G2hb0A+UyPsjR0Xf+3WGI0XaBYkUZ50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=enD6ckcE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="enD6ckcE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F151F000FF;
	Fri, 11 Sep 2026 09:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789119602;
	bh=BftRkx8dvQ4N6L4avwpp7fXXA80wZYEa3bFVxEXcvNs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=enD6ckcEx3G52l/q2Wbdj4KyQkViW2Uzhr0Kt1cYV701U1nIIlxeWca9Gm9tZKNqx
	 BIjD3QYDRr2AJA1y7YXa4P+r8eFmJCQZl9HkCNFe759xMgKnuW3E248EklS9C06rTs
	 vgU4Ilh0dtWxiPDotcdbjB4wQISKvTp7noROltWTHsFz9QmL54CCl5AdtmCCsKC+Ys
	 RX7mpIAlHiBdCBNEhIpAh1JHvvCAbwjwnkRLsRzwVw7RAjO9+o8AUFQt6fS9DSDgqN
	 5EfbYkzVztDeEaWS5Um4Mkia7R/TWlVziT2r9JCI9pxRtjQWzFfSXSW0V6+Nsm2rQa
	 zMzT3qGqIe61w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 08/10] ASoC: qcom: Add QAIF IRQ handling and platform
 register
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260911-b4-qaif-shikra-audio-v6-8-e9addb358201@oss.qualcomm.com>
References: <20260911-b4-qaif-shikra-audio-v6-0-e9addb358201@oss.qualcomm.com>
 <20260911-b4-qaif-shikra-audio-v6-8-e9addb358201@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 09:40:01 +0000
Message-Id: <20260911094001.82F151F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Access of uninitialized stack memory `iommu_spec.args[0]` if the p=
arsed device tree node specifies `#iommu-cells =3D <0>`.
- [High] Improper error handling and missing resource teardown on failure p=
aths in `qaif_platform_pcmops_trigger` and `qaif_platform_irq_op`.
- [Medium] GENMASK underflow due to unchecked zero values for DMA stream co=
unts.
--

commit c2987b134a7bc5719cab9cbf2c22298109505210
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add QAIF IRQ handling and platform register

Finish the QAIF PCM platform support so streams can be registered, started,
stopped and serviced by DMA interrupts.

> diff --git a/sound/soc/qcom/qaif-platform.c b/sound/soc/qcom/qaif-platfor=
m.c
> index 84ce3ad9a1f2d..762ba3eb65753 100644
> --- a/sound/soc/qcom/qaif-platform.c
> +++ b/sound/soc/qcom/qaif-platform.c
> @@ -537,3 +537,395 @@ static int qaif_platform_copy(struct snd_soc_compon=
ent *component,

[ ... ]

> +static int qaif_platform_irq_op(struct qaif_drv_data *drvdata, int dir,
> +				enum qaif_irq_type irq_type, int idx,
> +				enum qaif_irq_op op)
> +{

[ ... ]

> +	ret =3D regmap_write_bits(map, per_reg, bit, val);
> +	if (ret)
> +		return ret;
> +	ret =3D regmap_write_bits(map, xrun_reg, bit, val);
> +	if (ret)
> +		return ret;

[Severity: High]
Does returning early here leave the error response interrupts enabled?

If regmap_write_bits() fails for xrun_reg, it returns immediately and skips
writing to err_reg, which could leave the hardware in an inconsistent state.

> +	return regmap_write_bits(map, err_reg, bit, val);
> +}
> +
> +static int qaif_platform_pcmops_trigger(struct snd_soc_component *compon=
ent,
> +					struct snd_pcm_substream *substream,
> +					int cmd)
> +{

[ ... ]

> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:

[ ... ]

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

[Severity: High]
If qaif_platform_irq_op() fails, this breaks out without rolling back the
DMA enable bit. Can this leave the DMA engine running without interrupts?

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

[Severity: High]
Does this early return leave the dynamic clock and interrupts enabled if
the DMA disable step fails?

> +		ret =3D regmap_update_bits(map,
> +					 qaif_dmacfg_reg(v, idx, substream->stream, dai_id),
> +					 QAIF_DMACFG_DYNCLK_BIT, 0);
> +		if (ret)
> +			dev_err(soc_runtime->dev, "error disabling dma_dynclk: %d\n", ret);
> +		ret =3D qaif_platform_irq_op(drvdata, substream->stream, irq_type,
> +					   idx, QAIF_IRQ_DISABLE);

[Severity: High]
If disabling the dynamic clock fails, is the error code in 'ret' masked by
the subsequent assignment from qaif_platform_irq_op()?

> +		if (ret)
> +			dev_err(soc_runtime->dev, "error disabling irq regs: %d\n", ret);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	return ret;
> +}

[ ... ]

> +int asoc_qcom_qaif_platform_register(struct platform_device *pdev)
> +{

[ ... ]

> +	ret =3D of_parse_phandle_with_args(pdev->dev.of_node,
> +					 "iommus", "#iommu-cells", 0,
> +					 &iommu_spec);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to parse iommus property\n");
> +	sid =3D iommu_spec.args[0];

[Severity: High]
Does this code access uninitialized stack memory?

If the parsed device tree node specifies #iommu-cells =3D <0>,
of_parse_phandle_with_args() can succeed with args_count =3D 0 but does not
populate the args array. This would leave iommu_spec.args[0] uninitialized
when used as the SMMU Stream ID.

> +	of_node_put(iommu_spec.np);
> +	drvdata->smmu_csid_bits =3D sid & QAIF_CSID_MASK;

[ ... ]

Outside of the provided diff, in qaif_map_ee_resource():

[Severity: Medium]
Is there a risk of a GENMASK() underflow when mapping resources?

If a variant specifies a DMA count like num_rddma as 0,
GENMASK(v->num_rddma - 1, 0) is evaluated. This creates a negative high
bit index parameter, leading to undefined behavior.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-b4-qaif-sh=
ikra-audio-v6-0-e9addb358201@oss.qualcomm.com?part=3D8
