Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B212B3B14DB
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 05:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790574502; cv=none; b=gQSXKCxg0gjT2z9u4MDLNTlWTqMT7cLA7OXyyPZNcQwF8radHsF7Jb8X68RLbV2CqCv48qRgCLyIcXPcjUtQWcGVUTJRh0LnUuHokpRUFC8kN0SDuCeWHD1taUpdcUN69a/lv5I2M5fYoEJESngC27hLGIf8/3S+fhRpYoYJvWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790574502; c=relaxed/simple;
	bh=URO90371yYQ781tTSlJ3uwsfhH3NSzhlAtAvYX7emww=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P+FGLKoPDEQpam3vStTD33JrE90dlId8tLkh/iGdvggbm4wmRWiaYlIql1Lnd2ioX5Efl6NIXgho1aWyPJL4Z9b3Q/wfFvM4HLG/5jVLNe94R7a4sNd1h2Q0m8BZp5k4CDiomPREfHSNJAnEEjQG7Bw3V1byiFF4e5FODHgWIgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XROjPr7j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XROjPr7j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BDAA1F000FF;
	Mon, 28 Sep 2026 05:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790574498;
	bh=bENdhANP64xzfhl1CCLmd5H+4jrBCwE8lhX/39qxgck=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XROjPr7jK5b3sIosdYPfQEfCTAquOEJaY4WFuY8DKyGy2zxmgCvg/44MvZGnOVXbc
	 Oqq8FOk5BF/B6ETyRexFqmcPjMl2v+BJjExSecqjAzRGIIpL1WHmIw/FzkRCfkdy+Q
	 ur3JBsiuQQCeoPCuqlIQc0LxX1v9KFF+MSYN7FXkriYVpuNUOyEGWCBvgDdL++bwMp
	 L/dtp5lKjq/YHI6pfyZhD7xoSDmCI8PG/1yI88eIBnxGihhD7NR2iqI6/Oe794sT5w
	 vj33PJh7a1KM0eTDPCScSeq74uYAYOXdU51cibTH1YCSLdApdEbr//5/TrtDYyxjYb
	 A3VcoMr9QFd7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] ASoC: cdns: Add Cadence I2S-MC controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260928053613.2158446-5-joakim.zhang@cixtech.com>
References: <20260928053613.2158446-1-joakim.zhang@cixtech.com>
 <20260928053613.2158446-5-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 05:48:18 +0000
Message-Id: <20260928054818.6BDAA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] ASoC: cdns: inverted clock provider/consumer configuration
- [High] ASoC: cdns: unprotected clock reparenting disrupts concurrent stre=
ams
- [High] ASoC: cdns: PM usage counter and clock leaks in probe error paths =
and unbind
- [High] ASoC: cdns: synchronizing unit resets bypassed by incomplete regma=
p mask
- [High] ASoC: cdns: unsafe read-modify-write on interrupt status register
- [High] ASoC: cdns: inconsistent DATA_WS_DEL alignment logic across formats
- [Medium] ASoC: cdns: unbalanced disable_irq() corrupts global IRQ descrip=
tor
--

commit 45344ef2691191bb925ca3e036d7808018f75305
Author: Joakim Zhang <joakim.zhang@cixtech.com>

ASoC: cdns: Add Cadence I2S-MC controller driver

Add support for the Cadence I2S-MC multi-channel controller found in
the CIX SKY1 audio subsystem. The driver registers the dmaengine PCM
helper, selects the audio reference clock parent and implements runtime
PM and system suspend/resume.

> diff --git a/sound/soc/cdns/cdns-i2s-mc.c b/sound/soc/cdns/cdns-i2s-mc.c
> new file mode 100644
> --- /dev/null
> +++ b/sound/soc/cdns/cdns-i2s-mc.c
[ ... ]
> +static irqreturn_t cdns_i2s_mc_isr(int irq, void *devid)
> +{
> +	struct cdns_i2s_mc_priv *i2s_mc_priv =3D (struct cdns_i2s_mc_priv *)dev=
id;
> +	struct device *dev =3D i2s_mc_priv->dev;
> +	u32 stat;
> +
> +	if (regmap_read(i2s_mc_priv->regmap, I2S_INTR_STAT, &stat))
> +		return IRQ_NONE;
> +
> +	stat &=3D I2S_INTR_STAT_TDATA_UNDERR | I2S_INTR_STAT_RDATA_OVERR;
> +	if (!stat)
> +		return IRQ_NONE;
> +
> +	/* Clear the status */
> +	regmap_update_bits(i2s_mc_priv->regmap, I2S_INTR_STAT, stat, 0);

[Severity: High]
Does this read-modify-write cycle correctly handle write-1-to-clear=20
semantics? Using regmap_update_bits() reads the register, writes 0 to the
handled bits, and writes the preserved 1s to unhandled bits. If the
register is write-1-to-clear, this could fail to clear handled interrupts
and erroneously clear newly arrived interrupts without handling them. Could
a direct regmap_write() be used here instead?

> +
> +	/* Transmitter status */
> +	if (stat & I2S_INTR_STAT_TDATA_UNDERR)
> +		dev_dbg(dev, "isr: tx data underrun\n");
[ ... ]
> +static int cdns_i2s_mc_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int=
 fmt)
> +{
[ ... ]
> +		/* DAI hardware audio formats */
> +		switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +		case SND_SOC_DAIFMT_I2S:
> +			dev_conf |=3D I2S_DEV_CONF_TRAN_I2S_ALIGN_LR;
> +			dev_conf &=3D ~(I2S_DEV_CONF_TRAN_APB_ALIGN_LR |
> +				      I2S_DEV_CONF_TRAN_DATA_WS_DEL |
> +				      I2S_DEV_CONF_TRAN_WS_DSP_MODE);
> +			break;
> +		case SND_SOC_DAIFMT_RIGHT_J:
> +			dev_conf |=3D I2S_DEV_CONF_TRAN_DATA_WS_DEL;
> +			dev_conf &=3D ~(I2S_DEV_CONF_TRAN_I2S_ALIGN_LR |
> +				      I2S_DEV_CONF_TRAN_APB_ALIGN_LR |
> +				      I2S_DEV_CONF_TRAN_WS_DSP_MODE);
> +			break;
> +		case SND_SOC_DAIFMT_LEFT_J:
> +			dev_conf |=3D I2S_DEV_CONF_TRAN_I2S_ALIGN_LR | I2S_DEV_CONF_TRAN_DATA=
_WS_DEL;
> +			dev_conf &=3D ~(I2S_DEV_CONF_TRAN_APB_ALIGN_LR |
> +				      I2S_DEV_CONF_TRAN_WS_DSP_MODE);
> +			break;
> +		case SND_SOC_DAIFMT_DSP_A:
> +			dev_conf |=3D I2S_DEV_CONF_TRAN_I2S_ALIGN_LR | I2S_DEV_CONF_TRAN_DATA=
_WS_DEL |
> +				    I2S_DEV_CONF_TRAN_WS_DSP_MODE;
> +			dev_conf &=3D ~I2S_DEV_CONF_TRAN_APB_ALIGN_LR;
> +			break;
> +		case SND_SOC_DAIFMT_DSP_B:
> +			dev_conf |=3D I2S_DEV_CONF_TRAN_I2S_ALIGN_LR | I2S_DEV_CONF_TRAN_WS_D=
SP_MODE;
> +			dev_conf &=3D ~(I2S_DEV_CONF_TRAN_APB_ALIGN_LR |
> +				      I2S_DEV_CONF_TRAN_DATA_WS_DEL);
> +			break;

[Severity: High]
Is this delay phase mapping contradictory? The I2S_DEV_CONF_TRAN_DATA_WS_DEL
bit is cleared for SND_SOC_DAIFMT_I2S (1-clock delay) but set for
SND_SOC_DAIFMT_DSP_A (also 1-clock delay). Conversely, it is set for
SND_SOC_DAIFMT_LEFT_J (0-clock delay) but cleared for
SND_SOC_DAIFMT_DSP_B (also 0-clock delay). This seems to result in
misaligned phase for at least two of the supported formats.

> +		default:
> +			return -EINVAL;
> +		}
> +
> +		/* DAI hardware clock masters */
> +		switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +		case SND_SOC_DAIFMT_CBC_CFC:
> +			ctrl &=3D ~I2S_CTRL_T_MS;
> +			break;

[Severity: High]
Does this invert the master/slave configuration? For SND_SOC_DAIFMT_CBC_CFC
(Codec Bit/Frame Clock Consumer), the CPU DAI must act as the clock
provider (Master), but this clears the I2S_CTRL_T_MS bit.

[ ... ]
> +	} else if (cpu_dai->id =3D=3D I2S_MC_AIF2) {
[ ... ]
> +		/* DAI hardware clock masters */
> +		switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +		case SND_SOC_DAIFMT_CBC_CFC:
> +			ctrl &=3D ~I2S_CTRL_R_MS;
> +			break;

[Severity: High]
Similarly, this clears the master bit for the receiver DAI when it should
be set for SND_SOC_DAIFMT_CBC_CFC.

[ ... ]
> +static int cdns_i2s_mc_hw_params(struct snd_pcm_substream *substream,
> +				 struct snd_pcm_hw_params *params,
> +				 struct snd_soc_dai *cpu_dai)
> +{
[ ... ]
> +	if (rate % 8000 =3D=3D 0) {
> +		/* Sampling rate is a multiple of 8KHz, select "audio-clk0" */
> +		clk_parent =3D i2s_mc_priv->clks[AUDIO_CLK0];
> +
> +		ret =3D clk_set_parent(i2s_mc_priv->clk_i2s, clk_parent);

[Severity: High]
Can this reparenting disrupt a concurrent audio stream? Since both playback
(I2S_MC_AIF1) and capture (I2S_MC_AIF2) share the single clk_i2s clock,
starting a new stream will dynamically reparent the bit clock while the
companion stream might be active, potentially causing data corruption.

[ ... ]
> +	regmap_read(i2s_mc_priv->regmap, I2S_CTRL, &ctrl);
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
> +		is_master_mode =3D ctrl & I2S_CTRL_T_MS;
> +	else
> +		is_master_mode =3D ctrl & I2S_CTRL_R_MS;
> +
> +	if (is_master_mode) {
> +		if (i2s_clk_rate < rate * 2 * slot_width * I2S_CLK_RATIO_MIN_MASTER) {

[Severity: High]
Because I2S_CTRL_T_MS and I2S_CTRL_R_MS are erroneously cleared for
CBC_CFC in cdns_i2s_mc_set_fmt(), does this validate the clock frequency
against the wrong constraints? The inverted logic cascades here, checking
the slave mode multipliers when it should be checking the master mode.

[ ... ]
> +static int cdns_i2s_mc_dai_probe(struct snd_soc_dai *cpu_dai)
> +{
> +	struct cdns_i2s_mc_priv *i2s_mc_priv =3D snd_soc_dai_get_drvdata(cpu_da=
i);
> +	u32 ctrl =3D 0, cid_ctrl =3D 0;
> +
> +	/*
> +	 * Transceiver disable
> +	 * Transceiver clock disable
> +	 * All interrupts masked
> +	 * Reset for transmitter synchronizing unit
> +	 * Reset for receiver synchronizing unit
> +	 */
> +	ctrl |=3D FIELD_PREP(I2S_CTRL_I2S_EN, 0);
> +	ctrl &=3D ~(I2S_CTRL_TSYNC_RST | I2S_CTRL_RSYNC_RST);
> +	cid_ctrl |=3D I2S_CID_CTRL_STROBE_TS | I2S_CID_CTRL_STROBE_RS;
> +	cid_ctrl &=3D ~I2S_CID_CTRL_INTREQ_MASK;
> +
> +	regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL, I2S_CTRL_I2S_EN, ctrl=
);

[Severity: High]
Does this mask inadvertently bypass the hardware reset sequence? The
I2S_CTRL_I2S_EN mask only covers bits 0-7 (GENMASK(7, 0)), completely
filtering out the I2S_CTRL_TSYNC_RST (bit 25) and I2S_CTRL_RSYNC_RST
(bit 26) modifications made to ctrl just above.

[ ... ]
> +static int cdns_i2s_mc_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	pm_runtime_get_noresume(&pdev->dev);
> +	pm_runtime_set_active(&pdev->dev);
> +	ret =3D devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to enable runtime PM\n");
> +
> +	ret =3D cdns_i2s_mc_clks_enable(i2s_mc_priv);
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret, "Failed to enable clocks\n");
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}
> +
> +	cdns_i2s_mc_rst(i2s_mc_priv);
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;

[Severity: High]
Does this error path leak the PM usage counter and leave the clocks enabled?
The pm_runtime_get_noresume() and cdns_i2s_mc_clks_enable() calls complete
successfully above, but this return does not clean them up.

> +	i2s_mc_priv->irq =3D irq;
> +
> +	ret =3D devm_request_irq(&pdev->dev, irq, cdns_i2s_mc_isr, 0,
> +			       dev_name(&pdev->dev), i2s_mc_priv);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}

[Severity: High]
Similar to the issue above, this drops the PM counter but appears to miss
calling cdns_i2s_mc_clks_disable(), which permanently leaks the enabled
clocks.

[ ... ]
> +static int cdns_i2s_mc_runtime_suspend(struct device *dev)
> +{
> +	struct cdns_i2s_mc_priv *i2s_mc_priv =3D dev_get_drvdata(dev);
> +
> +	/*
> +	 * Disable the IRQ before switching the regcache to cache-only, so an
> +	 * in-flight handler can never access the registers through a
> +	 * cache-only regmap. disable_irq() waits for the handler to finish.
> +	 */
> +	disable_irq(i2s_mc_priv->irq);

[Severity: Medium]
Could this lead to an unbalanced IRQ disable depth? If the probe sequence
fails later (e.g., at devm_snd_soc_register_component) or if the device
is unbound while suspended, devm will free the IRQ while it is still deeply
disabled. Freeing a disabled IRQ does not reverse the global descriptor's
disable depth counter, leaving it permanently disabled for future requester=
s.

[ ... ]
> +static struct platform_driver cdns_i2s_mc_driver =3D {
> +	.probe =3D cdns_i2s_mc_probe,
> +	.driver =3D {
> +		.name =3D DRV_NAME,
> +		.pm =3D pm_ptr(&cdns_i2s_mc_pm_ops),
> +		.of_match_table =3D cdns_i2s_mc_of_match,
> +	},
> +};

[Severity: High]
Is this missing a .remove callback? Without one, unbinding the module
will leave the clocks running permanently and leak hardware resources.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928053613.2158=
446-1-joakim.zhang@cixtech.com?part=3D4
