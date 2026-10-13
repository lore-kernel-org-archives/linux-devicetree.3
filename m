Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC644E7816
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890898; cv=none; b=Rz+5viazNrvJZFuFolgCzNS2rQgkOVpWmhMN26JkUC6mOUhjhABABzNdhcSg8AAC7hBHdXKKWO82PZChbK3ugVae5tBBK+sRSTL4TI07SIpKAdoOHuC1lJGgb/MLRaER0U38aWpE5lJc0v+h/eyiBLj53UDjGEYeZORIgzEWO+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890898; c=relaxed/simple;
	bh=IF9YPO4ta/WL/msO8XLl8UOmbG2SbZIt5+8xaZqVlFs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=InrSKw/jhjJgeGej76glLLrVOw3K6ckQGFR7lkUlbc3jt674ZL+6qUcGuglLz1q6NQV0Qz/YXZDsHTLJV3/BYgtbv7yw00RdOZjlXQEqCVpua1W+RKYyazPNjckM70Ld+VE9rGX9NJ37/ABS7Fd9CBdvxffX9yBNKPOcPRBrL3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8qs+8j3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8qs+8j3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF2511F000FF;
	Tue, 13 Oct 2026 11:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791890897;
	bh=MTUodpPk6sPiZMMBFe6F2kDkOphSgqyanG8WAX6yH28=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W8qs+8j3ek7QHRgKsPWV25YSZhPgIsS9aVt4SIqRNn+JbMrISC8uDmW2O6CxPi1Wk
	 EiNSd2Nu5JhOF39+dFxm+fTawIKr443jLVdm4mm9v7c/kVzSwIlQSL5aXz9ALjOZZc
	 fmnQ30x/0Rssod03zMNJ6S6tcBvD/NsczKhBDfOsJM4YiKyw/T3B6DmvjVVEHUOr21
	 Rl6KD4ioZvCwB+TxWHHE6pR4TYEbWZJGiJj/pg1AOpw2FhovTAZvXvppSpOdBEJ7qT
	 hzwDkHUUQXD+PdbD037tY+hcXUClK4b+oSsBnebVYdn/blSRuKwvaweLoZS9/4tU2X
	 7V3O1czZ+O/vA==
Message-ID: <sashiko-outbox-169625@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 08/10] ASoC: qcom: Add QAIF IRQ handling and platform
 register
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013-b4-qaif-shikra-audio-v9-8-f3022e28f2fd@oss.qualcomm.com>
References: <20261013-b4-qaif-shikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com>
 <20261013-b4-qaif-shikra-audio-v9-8-f3022e28f2fd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 11:28:16 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] ASoC: qcom: qaif: uninitialized stack memory read of iommu_spec.ar=
gs[0]
- [Medium] ASoC: qcom: qaif: missing error rollback in trigger() leaves DMA=
 running
- [Low] ASoC: qcom: qaif: error code masking in sync_stop() drops timeout e=
rror
--

commit 76d65e08a800bae1b501d23afbe5c442b2a5c8cc
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add QAIF IRQ handling and platform register
   =20
This commit finishes the QAIF PCM platform support by allowing streams to be
registered, started, stopped, and serviced by DMA interrupts. It registers
the ASoC component, requests the QAIF interrupt, and adds trigger handling
to manage DMA and its interrupt sources.

> diff --git a/sound/soc/qcom/qaif-platform.c b/sound/soc/qcom/qaif-platfor=
m.c
> index e24c4252825e2..facba3be2d8ea 100644
> --- a/sound/soc/qcom/qaif-platform.c
> +++ b/sound/soc/qcom/qaif-platform.c
[ ... ]
> @@ -462,3 +470,416 @@ static int qaif_platform_pcm_new(struct snd_soc_com=
ponent *component,
[ ... ]
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
> +			break;
> +		}
> +		irq_op_err =3D qaif_platform_irq_op(drvdata, substream->stream, irq_ty=
pe,
> +						  idx, QAIF_IRQ_ENABLE);
> +		if (irq_op_err)
> +			dev_err(soc_runtime->dev, "error enabling irq regs: %d\n", irq_op_err=
);
> +		break;

[Severity: Medium]
Does this error path leave the DMA hardware and dynamic clock running
indefinitely?

If qaif_platform_irq_op() fails to enable the IRQ registers, the switch
breaks and an error is returned, but there is no rollback to disable the
dynamic clock and DMA control bits. Since ALSA core does not automatically
issue a STOP trigger if START fails, the hardware might remain active.

[ ... ]
> +static int qaif_platform_pcmops_sync_stop(struct snd_soc_component *comp=
onent,
> +					  struct snd_pcm_substream *substream)
> +{
[ ... ]
> +	/*
> +	 * Wait for the DMA channel to report shutdown complete before
> +	 * clearing its interrupts, so a fast STOP->START or suspend/resume
> +	 * does not race a channel still shutting down.
> +	 */
> +	ret =3D regmap_read_poll_timeout(map,
> +				       qaif_dma_shutdown_stat_reg(v, idx,
> +								  substream->stream,
> +								  dai_id),
> +				       val,
> +				       !(val & QAIF_DMA_SHUTDOWN_IN_PROGRESS_BIT),
> +				       QAIF_DMA_SHUTDOWN_POLL_US,
> +				       QAIF_DMA_SHUTDOWN_TIMEOUT_US);
> +	if (ret)
> +		dev_err(soc_runtime->dev, "timeout waiting for DMA shutdown: %d\n", re=
t);
> +
> +	synchronize_irq(drvdata->audio_qaif_irq);
> +	ret =3D qaif_platform_irq_op(drvdata, substream->stream, irq_type,
> +				   idx, QAIF_IRQ_CLEAR);
> +	if (ret)
> +		dev_err(soc_runtime->dev, "error clearing irq regs: %d\n", ret);
> +	return ret;

[Severity: Low]
Is the error code from regmap_read_poll_timeout() intentionally overwritten
here?

If the DMA shutdown times out, ret is set to -ETIMEDOUT. However, the
subsequent call to qaif_platform_irq_op() overwrites ret with its own
success status (0). This causes the timeout error to be silently discarded
and reported as a success to the ALSA core.

[ ... ]
> +int asoc_qcom_qaif_platform_register(struct platform_device *pdev)
> +{
> +	struct qaif_drv_data *drvdata =3D platform_get_drvdata(pdev);
> +	struct of_phandle_args iommu_spec;
> +	u32 sid;
> +	int ret;
[ ... ]
> +	ret =3D of_parse_phandle_with_args(pdev->dev.of_node,
> +					 "iommus", "#iommu-cells", 0,
> +					 &iommu_spec);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to parse iommus property\n");
> +	sid =3D iommu_spec.args[0];

[Severity: High]
Is it possible for iommu_spec.args[0] to contain uninitialized stack data
here?

If the target iommus node specifies #iommu-cells =3D <0>,
of_parse_phandle_with_args() successfully sets args_count =3D 0 but leaves
the args array uninitialized. Unconditionally reading args[0] could lead to
configuring the SMMU stream ID with random kernel stack memory.

> +	of_node_put(iommu_spec.np);
> +	drvdata->smmu_csid_bits =3D sid & QAIF_CSID_MASK;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-b4-qaif-sh=
ikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com?part=3D8
