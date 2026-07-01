Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB4547885C
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 11:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905265; cv=none; b=qYJCA4rYwMV1B9uiBhq5a2jw33En4maSUEiIQ/LvY+2ALLOVZ71Wvg2OEenDEzQOZP28f1aN+z2QUuieK6R+bM5jMW7bZWXZem5cI5wmT2gQ5zdWYiwmu1d0s01gfPx+g6jVECpt7Q1klCxC+vP4vw67MEOBYOrBUOm1djGAmc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905265; c=relaxed/simple;
	bh=sTW7LrJhOsRjrcrzX6hGhVpGvI4WNxIXeSZd77Z9r5M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mj4IM/DQVWon7UpTLJyBpNsN0qM+SAqmXzpqduXXc0yDZLOh3NcOs1uQv4rM+5L0XP6tlKkrYc6xxjsWAAJP8xarkEc0X90gxwqEUH1yNjacSgi8wwQuh9ZIrsrMCXf1dciXsVtRJX9oICm/94jCzqV4k7GVary8geScwEGGXTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IHWQa37a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IHWQa37a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C6401F000E9;
	Wed,  1 Jul 2026 11:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782905261;
	bh=6TzNnqMJMxobiHxKW4Zjgqw/Tclyi4oOIAuFAi+4FcA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IHWQa37agC5PSHVdT1ZPKfLdAARp5+doySYWkcmxrpuFQXZip5aVphZXc/RkyRNl1
	 2DMbSMOrixMJ3c1lY5FDTMV9+u74YKo6KHzUgKjRxziOKc6mOlqa2ULDYSAna7r/sE
	 qlgOB05sxiIezX0p7vZZJvmZZKWZTGP+IajtIcMGVUPSA5rnMWmXvbIf4DrYZgm3GX
	 rRHZZWgLxh3ezvMrgjoYHWBQbZLxRqGxNsc6wltJidgkPd+Sz/IHNG3mNVZfhmIgba
	 5mqlVwLkMmntnmA95a8n62tOTAv8QoZ77L/TMbNVrROAf9gMezhG19NMW4I9o/YSsL
	 KOJ21ev+EGkqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/11] ASoC: qcom: Add QAIF IRQ handling,
 suspend/resume and platform register
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260701105757.2779738-10-harendra.gautam@oss.qualcomm.com>
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
 <20260701105757.2779738-10-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 11:27:40 +0000
Message-Id: <20260701112741.0C6401F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Incorrect Device Tree parsing for the SMMU Stream ID breaks probin=
g on systems without an SMMU or with different #iommu-cells.
- [High] regcache_sync() in the component resume callback executes without =
enabling the required audio clocks, causing a bus fault.
- [High] snd_pcm_stop() is called from the IRQ handler without holding the =
required PCM stream lock.
- [High] Setting regmap to cache_only mode during component suspend without=
 disabling the interrupt creates an unhandled IRQ storm.
- [Medium] The IRQ handler incorrectly returns IRQ_NONE after successfully =
clearing a hardware interrupt if the substream is NULL.
- [Medium] Undefined behavior from a negative bitshift when using GENMASK()=
 on zero-count DMA channels.
- [Medium] The driver fails to notify the ALSA core when a hardware XRUN (o=
verflow/underflow) occurs.
--

commit 28e9637822bfe9fbb6803c1d7c7e397c87d18f6e
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add QAIF IRQ handling, suspend/resume and platform register

This patch completes the QAIF PCM platform support by adding IRQ handling
for DMA events and platform registration. It also introduces suspend and
resume callbacks to handle register state while clocks are toggled, and
reads the SMMU stream ID from the device tree.

> diff --git a/sound/soc/qcom/qaif-platform.c b/sound/soc/qcom/qaif-platfor=
m.c
> index 85964a1760e50..d0738d85f5947 100644
> --- a/sound/soc/qcom/qaif-platform.c
> +++ b/sound/soc/qcom/qaif-platform.c
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
> +	if (dma_type =3D=3D QAIF_DMA_WRDMA)
> +		num_dma =3D (irq_type =3D=3D QAIF_AIF_IRQ) ? v->num_wrdma : v->num_cod=
ec_wrdma;
> +	else
> +		num_dma =3D (irq_type =3D=3D QAIF_AIF_IRQ) ? v->num_rddma : v->num_cod=
ec_rddma;
> +	mask =3D GENMASK(num_dma - 1, 0);

[Severity: Medium]
Does this code cause undefined behavior if num_dma evaluates to 0?

Depending on the architecture and compiler, GENMASK(-1, 0) expands to a shi=
ft
by a negative number. This could create an invalid mask that accidentally
clears all interrupts or misconfigures the hardware for non-existent channe=
ls.

> +	rv =3D regmap_read(drvdata->audio_qaif_map, stat_reg_addr, &reg);
> +	if (rv) {
> +		dev_err(regmap_get_device(drvdata->audio_qaif_map),
> +			"error reading stat reg 0x%x: %d\n", stat_reg_addr, rv);
> +		return IRQ_NONE;
> +	}
> +
> +	regmap_write(drvdata->audio_qaif_map, clr_reg_addr, reg & mask);
> +
> +	for (dma_idx =3D 0; dma_idx < num_dma; dma_idx++) {
> +		stream_dma_idx =3D dma_idx + stream_offset;
> +		if ((reg & BIT(dma_idx)) && substream[stream_dma_idx]) {
> +			stream =3D substream[stream_dma_idx];
> +			switch (irq) {
> +			case QAIF_IRQ_PERIOD:
> +				snd_pcm_period_elapsed(stream);
> +				ret =3D IRQ_HANDLED;
> +				break;
> +
> +			case QAIF_IRQ_OVERFLOW:
> +			case QAIF_IRQ_UNDERFLOW:
> +				dev_warn_ratelimited(regmap_get_device(drvdata->audio_qaif_map),
> +						     "QAIF DMA xRun\n");
> +				ret =3D IRQ_HANDLED;
> +				break;

[Severity: Medium]
Does this miss notifying the ALSA core about the xrun condition?

The hardware interrupt is caught and logged, but it doesn't appear
snd_pcm_stop_xrun() is called. This might leave userspace applications
unaware of dropped audio frames or stream stalls, leading to broken
synchronization.

> +
> +			case QAIF_IRQ_ERROR:
> +				snd_pcm_stop(stream, SNDRV_PCM_STATE_DISCONNECTED);

[Severity: High]
Can this cause data races or waitqueue corruption?

Calling snd_pcm_stop() requires the caller to hold the PCM stream lock. Sin=
ce
this is called directly from the IRQ handler in qaif_process_dma_irq()
without holding snd_pcm_stream_lock_irqsave(), it seems unsafe.

> +				dev_err(regmap_get_device(drvdata->audio_qaif_map),
> +					"QAIF bus error\n");
> +				ret =3D IRQ_HANDLED;
> +				break;
> +			}
> +		}
> +	}
> +	return ret;
> +}

[Severity: Medium]
Will this return IRQ_NONE after successfully clearing a hardware interrupt?

If a hardware interrupt fires and the handler successfully clears it via
the regmap_write() call earlier in qaif_process_dma_irq(), but the
corresponding substream is NULL (for example, due to a race during stream
teardown), ret remains IRQ_NONE.

If the generic IRQ subsystem registers this as unhandled multiple times,
could it permanently disable the IRQ line?

[ ... ]
> +static int qaif_platform_pcmops_suspend(struct snd_soc_component *compon=
ent)
> +{
> +	struct qaif_drv_data *drvdata =3D snd_soc_component_get_drvdata(compone=
nt);
> +	struct regmap *map =3D drvdata->audio_qaif_map;
> +
> +	regcache_cache_only(map, true);
> +	regcache_mark_dirty(map);
> +	return 0;
> +}

[Severity: High]
Could this lead to an interrupt storm during suspend?

If a system suspend is initiated, qaif_platform_pcmops_suspend() sets the
regmap to cache_only mode without calling disable_irq(). If an active
hardware IRQ fires before the kernel reaches the suspend_device_irqs() phas=
e,
asoc_platform_qaif_irq() will attempt to read the volatile IRQSTAT register.

Since the regmap is in cache_only mode, it will return an error, causing
the handler to return IRQ_NONE without clearing the interrupt, leading to
an endless loop.

> +
> +static int qaif_platform_pcmops_resume(struct snd_soc_component *compone=
nt)
> +{
> +	struct qaif_drv_data *drvdata =3D snd_soc_component_get_drvdata(compone=
nt);
> +	struct regmap *map =3D drvdata->audio_qaif_map;
> +
> +	regcache_cache_only(map, false);
> +	return regcache_sync(map);
> +}

[Severity: High]
Does regcache_sync() safely execute here without clocks enabled?

It looks like regcache_sync() attempts to flush dirty register values
to the hardware over MMIO. If the audio clocks were disabled upon PCM close
and have not been re-enabled yet, this might cause a bus fault or
Data Abort during system resume.

[ ... ]
> +static int qaif_parse_smmu_sid(struct platform_device *pdev,
> +			       struct qaif_drv_data *drvdata)
> +{
> +	struct device_node *np =3D pdev->dev.of_node;
> +	int ret;
> +	u32 sid;
> +
> +	ret =3D of_property_read_u32_index(np, "iommus", 1, &sid);

[Severity: High]
Does this incorrectly assume the format of the iommus property?

Manually reading index 1 of the iommus property bypasses the standard
of_parse_phandle_with_args() API. This could break probing on perfectly
valid hardware setups, such as systems without an SMMU or systems where
the SMMU has a different number of iommu-cells.

> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to read SMMU SID from iommus property: %d\=
n", ret);
> +		return ret;
> +	}
> +
> +	drvdata->smmu_csid_bits =3D sid & 0x1;
> +	dev_dbg(&pdev->dev, "sid=3D0x%x csid=3D0x%x\n", sid, drvdata->smmu_csid=
_bits);
> +	return 0;
> +}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701105757.2779=
738-1-harendra.gautam@oss.qualcomm.com?part=3D9
