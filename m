Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DC4336895
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 13:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600645; cv=none; b=PVNYeryhR3iG2ZRP1Okqblku+n6bs3Oa76dlOAhSnfZkZyg0SQJRh3Kz+81zS4viNOqSPugQ1RbHpYAYenEH+VwlWufplTKdeu0pohD2rdUITNfBXO+w0JlXQll3Le79dMf0E5oYSVnaTt0L8fYL3W0cy622tVoBpgIxSswrFcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600645; c=relaxed/simple;
	bh=HHnUgvAr3zfhswSCQTGMV9c2kjv1++xs/hC6OzmbZWY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P5BQgZr5uByUyfOBVK/o1w6vvxh8s9VxUQFWkGnm1FRoyv/9ScqMQfrT7OAl9GP4MNYOyrNBPSDpDIp2F/5EoVF1SW89sGdpJcv7lLfyT8VR7qs//tkrmWLVpe2GvUyomxG6hdZO4PrGtf05mWYEu8QAk+YzYJO+baq3Btrm79U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gzuxi8J0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gzuxi8J0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648261F000FF;
	Mon, 28 Sep 2026 13:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790600644;
	bh=gFsJio45c3KUbYZKrysMbo5WXSsCjizs9Bs72xoON9o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gzuxi8J0N723PK8fnS1obc3xpt7CnKATJ8nfLwv+V0LU/Iwiu6vDArs8WAM4dWwBb
	 et9Lc45UPGP3/9Dz6mpzZvynuA30Tc11XANMyKPuMW7ZS9H4eBCfixwcdcUUmY40Fs
	 ijPqK6Ruh0vcaAMZsYqvB8DQyeOWThFhGW0zT0Wub8WTs59Q7msjzLbJBoHldzcz1f
	 m5ZXXdmEYh8Wl0a9P1rzBJnYTXt++zf6z+dp6wX0FzxV5oMapsSWf0dKoBcfJVTSNV
	 oygozidi4wZIglPMQDQon/alVnJv+v6aKXiqU5e0NsNqqd6Z7BE29FWw8bqKXnkHLd
	 2kY0R2NHMnz2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 08/10] ASoC: qcom: Add QAIF IRQ handling and platform
 register
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260928-b4-qaif-shikra-audio-v8-8-ac618057fe85@oss.qualcomm.com>
References: <20260928-b4-qaif-shikra-audio-v8-0-ac618057fe85@oss.qualcomm.com>
 <20260928-b4-qaif-shikra-audio-v8-8-ac618057fe85@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 13:04:04 +0000
Message-Id: <20260928130404.648261F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] soc: qcom: premature stream publication leads to UAF in IRQ
- [Medium] soc: qcom: uninitialized stack read of iommu_spec.args
- [Medium] soc: qcom: early return on teardown failure leaves IRQs active
--

commit 324410c825bd2c2f359bf015a0cb8ddd83bf98e2
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
ASoC: qcom: Add QAIF IRQ handling and platform register

This commit finishes the QAIF PCM platform support by adding stream
registration and DMA interrupt servicing. It registers the ASoC component,
requests the QAIF interrupt, handles triggers, and dispatches IRQs to the
AIF and CIF handlers.

> diff --git a/sound/soc/qcom/qaif-platform.c b/sound/soc/qcom/qaif-platfor=
m.c
> index e24c4252825e2..aa452ce4140fb 100644
> --- a/sound/soc/qcom/qaif-platform.c
> +++ b/sound/soc/qcom/qaif-platform.c
[ ... ]
> @@ -462,3 +462,395 @@ static int qaif_platform_pcm_new(struct snd_soc_com=
ponent *component,
[ ... ]
> +static int qaif_platform_pcmops_trigger(struct snd_soc_component *compon=
ent,
> +					struct snd_pcm_substream *substream,
> +					int cmd)
> +{
[ ... ]
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
If regmap_update_bits() fails, this returns early. Since the subsequent
call to disable IRQs (qaif_platform_irq_op(..., QAIF_IRQ_DISABLE)) is
skipped, could this leave hardware IRQs active and cause an interrupt storm
during teardown?

[ ... ]
> +static irqreturn_t qaif_process_dma_irq(struct qaif_drv_data *drvdata,
> +					u32 stat_reg_addr,
> +					u32 clr_reg_addr,
> +					enum qaif_irq_type irq_type,
> +					enum qaif_dma_dir dma_type,
> +					enum qaif_irq irq,
> +					struct snd_pcm_substream **substream)
> +{
[ ... ]
> +	for (dma_idx =3D 0; dma_idx < num_dma; dma_idx++) {
> +		stream_dma_idx =3D dma_idx + stream_offset;
> +		ss =3D READ_ONCE(substream[stream_dma_idx]);

[Severity: High]
Is there a race condition with qaif_platform_pcmops_open() publishing the
stream before checking constraints?

In qaif_platform_pcmops_open(), the substream pointer is published to the
array early:

	if (qaif_is_cif_port(dai_id))
		WRITE_ONCE(drvdata->cif_substream[stream_dma_idx], substream);
	else
		WRITE_ONCE(drvdata->aif_substream[stream_dma_idx], substream);

If a subsequent hardware constraint check fails, the array entry is set to =
NULL
and the error is returned, causing ALSA to free the substream.=20

Since there is no synchronize_irq() on the open error path, could a spurious
interrupt be handled here and dereference the ss pointer after it has been
freed?

[ ... ]
> +int asoc_qcom_qaif_platform_register(struct platform_device *pdev)
> +{
> +	struct qaif_drv_data *drvdata =3D platform_get_drvdata(pdev);
> +	struct of_phandle_args iommu_spec;
> +	u32 sid;
> +	int ret;
> +
> +	if (!drvdata->variant->alloc_stream_dma_idx ||
> +	    !drvdata->variant->free_stream_dma_idx)
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				     "Variant missing mandatory callbacks\n");
> +
> +	ret =3D of_parse_phandle_with_args(pdev->dev.of_node,
> +					 "iommus", "#iommu-cells", 0,
> +					 &iommu_spec);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to parse iommus property\n");
> +	sid =3D iommu_spec.args[0];

[Severity: Medium]
If a device tree specifies #iommu-cells =3D <0> (or it is missing and handl=
ed
as 0), of_parse_phandle_with_args() will succeed with args_count =3D 0. Does
this leave the stack variable iommu_spec.args[0] uninitialized when it is
read here and assigned to sid?

> +	of_node_put(iommu_spec.np);
> +	drvdata->smmu_csid_bits =3D sid & QAIF_CSID_MASK;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-b4-qaif-sh=
ikra-audio-v8-0-ac618057fe85@oss.qualcomm.com?part=3D8
