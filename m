Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BF936B054
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790146923; cv=none; b=Z7rPXYmSN5/UOpcNsTVk969OUPkH5ingRwJfEQ9OI8sDiGYZXjKZhznUUSiKypOJ/2IjQHtk/fiuNvA0vrLbK3IzTXhS4zcWM0iZBAyVUUfMY735d+j1+P4HtMO+v9GFzJDGJw5JyPJwldujqnrqozmrZHwUAszcEFdMak3WjCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790146923; c=relaxed/simple;
	bh=VeMHisRWEL/NTh8Dwb7MF7ZBIToUHjMX+fOcHea9mAQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AAttls0SHhcwzeXG4FH0DLv0zHaCN21f+HmIu4WXuRdIJ0vjMtc18Wv9VxJdaa7V/M59hy6BM5SUvJ4YkEBNDH7MUD/iTiUZS38s8OZzGXUt17npV1d82IPNdZ3aRoRw0XA2NuLhJr7C4jLLhNnykSYHlDsY8Gj9F8Dj0pprab8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OqiVAMSs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OqiVAMSs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 813801F00893;
	Wed, 23 Sep 2026 07:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790146921;
	bh=Ljq+W+2k0lgDqe4+aJQ0a9rhcgEZzmVu9wM8mvpHvqg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OqiVAMSs+9B1esWhtKa69PP2ljajiUQjxwtvFiatQyMkFrVz7sn/vSP/OOXwe8DDF
	 pa54g542ht3uW4CoiH4dk6t3rIDxAlyYHavkCEclp8hfZ/y3ztFAUOzjkz4OT5riw2
	 eqJ9CfYrBBSi4kVjP9xdUwmniLUDxBaGgbDtAMiwZoe+qi0qBBRwYU4rJfI94asVqw
	 bv5kOI6jYl4q/i38C7Ppks1fZBFcOd2F7dKuqKTuv3/EFY9yxhr3uit6Uf3MfZKJyN
	 GjRD6PtFpNwt+myuclwoUuso6ve/Xg7+YC4J4ERNj4wsurs3BQ650wyOwJ1BpeGCHN
	 +SwQZqE3shARQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 04/10] ASoC: qcom: Add QAIF CPU DAI ops, regmap, DT
 parsing and platform init
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260923-b4-qaif-shikra-audio-v7-4-d5b6f056568e@oss.qualcomm.com>
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
 <20260923-b4-qaif-shikra-audio-v7-4-d5b6f056568e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 07:02:01 +0000
Message-Id: <20260923070201.813801F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] soc: qcom: qaif: stream clocks left enabled during system suspend
--

commit 9b2ed711801920b93b0556d83c037043032dc672
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Subject: ASoC: qcom: Add QAIF CPU DAI ops, regmap, DT parsing and platform =
init

This commit adds the QAIF CPU DAI driver to support Qualcomm audio interface
paths. It implements CIF and AIF DAI operations, MMIO regmap setup, DT
parsing, clock management, and platform registration.

> diff --git a/sound/soc/qcom/qaif-cpu.c b/sound/soc/qcom/qaif-cpu.c
> new file mode 100644
> index 0000000000000..e1868dc95cf4f
> --- /dev/null
> +++ b/sound/soc/qcom/qaif-cpu.c
[ ... ]
> +static int qaif_aif_cpu_daiops_startup(struct snd_pcm_substream *substre=
am,
> +				       struct snd_soc_dai *dai)
> +{
> +	struct qaif_drv_data *drvdata =3D snd_soc_dai_get_drvdata(dai);
> +	const struct qaif_variant *v =3D drvdata->variant;
> +	int idx, ret;
> +
> +	idx =3D v->get_dma_idx(dai->driver->id);
> +	if (idx < 0) {
> +		dev_err(dai->dev, "Invalid DMA index: %d\n", idx);
> +		return -EINVAL;
> +	}
> +
> +	ret =3D clk_prepare_enable(drvdata->aud_dma_clk);
> +	if (ret) {
> +		dev_err(dai->dev, "error enabling aud_dma clk: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D clk_prepare_enable(drvdata->aud_dma_mem_clk);
> +	if (ret) {
> +		dev_err(dai->dev, "error enabling aud_dma_mem clk: %d\n", ret);
> +		clk_disable_unprepare(drvdata->aud_dma_clk);
> +		return ret;
> +	}
> +
> +	ret =3D clk_prepare_enable(drvdata->mi2s_bit_clk[idx]);
> +	if (ret) {
> +		dev_err(dai->dev, "error enabling mi2s bit clk: %d\n", ret);
> +		clk_disable_unprepare(drvdata->aud_dma_mem_clk);
> +		clk_disable_unprepare(drvdata->aud_dma_clk);
> +	}
> +	return ret;
> +}
[ ... ]
> +static int qaif_aif_cpu_daiops_trigger(struct snd_pcm_substream *substre=
am,
> +				       int cmd, struct snd_soc_dai *dai)
> +{
[ ... ]
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
> +		if (ret)
> +			dev_err(dai->dev, "error clearing AIF enable bit: %d\n", ret);
> +		return ret;
[ ... ]
> +static int asoc_qcom_qaif_runtime_suspend(struct device *dev)
> +{
> +	struct qaif_drv_data *drvdata =3D dev_get_drvdata(dev);
> +
> +	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);

[Severity: Medium]
Will this leave stream-specific clocks enabled during system suspend if an
audio stream is active?

When an audio stream is active, qaif_aif_cpu_daiops_startup() explicitly
prepares and enables aud_dma_clk, aud_dma_mem_clk, and mi2s_bit_clk.

If a user initiates system suspend while the stream is active, ASoC issues
SNDRV_PCM_TRIGGER_SUSPEND to halt the stream but does not call
qaif_aif_cpu_daiops_shutdown(). The qaif_aif_cpu_daiops_trigger() callback
handles the suspend trigger but does not disable these stream-specific cloc=
ks.

Furthermore, pm_runtime_force_suspend() calls asoc_qcom_qaif_runtime_suspen=
d(),
which only disables the bulk clocks (drvdata->clks).

Could this result in the stream-specific AP clock votes remaining asserted,
potentially blocking the system power manager (RPM/RPMh) from entering deep
sleep (S3)?

> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-b4-qaif-sh=
ikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com?part=3D4
