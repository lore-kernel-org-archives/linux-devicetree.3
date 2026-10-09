Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255FB498912
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 09:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538700; cv=none; b=IUqWCSUp4DBMdCrR/Wq3qHP6ZztqfGiKIHIk1fcT3uCVhStn361Vknhywj0pWR2noTn5HzizYWnnB/pkw6J1efw3q/5yABcTZK4vi2RZwyi4sZaybXpPt6dKCFagn0NcqXsyWNdZ9tV4MKC2nrP5gjGmnYHA4plSXife+MZFj54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538700; c=relaxed/simple;
	bh=itruyT/fGJGEIn5Ecst2J/RDCN93PgKsEF8gnAFa9/4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=CwxHAYocqE6UNUywlil+z0p6OO5Jj7+IXR2CIFSqps1D1FvlIbmilamS0UaGLRlj4tACfloTlyrjWLoft4RT7lQPcz5zzNYNcVUMLs6OBUSDtKs7lyCUKWyd3VPcxIvURupUZGu0feXpBExHJXtU91rchWqRZ3HeeY6gYYpxqLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GwGWGrjz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GwGWGrjz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E8781F00893;
	Fri,  9 Oct 2026 09:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791538688;
	bh=UMsxqJWpmu1EbI8Ltk/8kWko5g71yWy1G1LyxtbAksU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GwGWGrjzTUpGiKnV8BTGkHFhyLFGtXD78nuuufDI/Kr5ttZOxMaILf4Dfr0PBUBF6
	 NFEnG61O5oVYEpirghNploBfB7N9e/ZUvOhZkazyUWkcxeIjekBNEth3gN2ivJGPlv
	 8T6ilvzoWSxuz2g6Er/xsz4DJxMLW2h1tF5uPJ4S8+vEYFe3pCuxCWGqPikDxLz+Ip
	 +fWb+VLdkkzUtGL36hIBUd9Ta5vTSqmfM3vS6Q84yK2bTIzKhWVcD9FJOT5fa+opWK
	 gVLiOrfq89GCDPVYcB45c66CwvPCsSIq5x8fXhrFOO5xI/cmU32Pyhan1b4tWpxzdU
	 JlqD7OHKIsosg==
Message-ID: <sashiko-outbox-165178@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] ASoC: cdns: Add Cadence I2S-MC controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009092552.2377960-5-joakim.zhang@cixtech.com>
References: <20261009092552.2377960-1-joakim.zhang@cixtech.com>
 <20261009092552.2377960-5-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 09:38:08 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] sound: cdns: clock refcount leak on late probe error and driver un=
bind
- [High] sound: cdns: inverted clock master/slave mode evaluation in hw_par=
ams
- [High] sound: cdns: inverted BCLK data delay for I2S and Left-Justified f=
ormats
- [High] sound: cdns: read-modify-write race on volatile interrupt status r=
egister
- [Medium] sound: cdns: synchronizing unit resets dropped due to incomplete=
 regmap mask
- [Medium] sound: cdns: unprotected shared clock parent modification across=
 DAIs
- [Medium] cdns: premature FIFO reset deassertion over APB bus
--

commit ba70a70c0f6376ecabc6aa01d7c62b130cb6e3a9
Author: Joakim Zhang <joakim.zhang@cixtech.com>

ASoC: cdns: Add Cadence I2S-MC controller driver

Add support for the Cadence I2S-MC multi-channel controller found in
the CIX SKY1 audio subsystem.

> diff --git a/sound/soc/cdns/cdns-i2s-mc.c b/sound/soc/cdns/cdns-i2s-mc.c
> new file mode 100644
> index 0000000000000..e9a0880a06167
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
Does this read-modify-write cycle introduce a hardware race condition on the
volatile interrupt status register?

The I2S_INTR_STAT register is asynchronously updated by the hardware to flag
events. When regmap_update_bits() performs its read-modify-write cycle, any
new hardware interrupts that assert between the read and the write could
be inadvertently cleared without being handled (if W1C) or overwritten with
0 and lost (if W0C or R/W).

Would it be safer to use a direct regmap_write() here?

[ ... ]

> +static int cdns_i2s_mc_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int=
 fmt)
> +{
> +	struct cdns_i2s_mc_priv *i2s_mc_priv =3D snd_soc_dai_get_drvdata(cpu_da=
i);
> +	struct device *dev =3D i2s_mc_priv->dev;
> +	u32 ctrl =3D 0, dev_conf =3D 0;

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

[Severity: High]
Are the BCLK data delays inverted for I2S and Left-Justified formats?

Standard I2S requires a 1 BCLK delay for the data relative to the WS signal,
while Left-Justified requires a 0 BCLK delay.

The I2S_DEV_CONF_TRAN_DATA_WS_DEL bit seems to configure this 1 BCLK delay
(as it is explicitly set for DSP_A and cleared for DSP_B).

However, this code clears this bit for SND_SOC_DAIFMT_I2S (removing the
required delay) and sets it for SND_SOC_DAIFMT_LEFT_J (adding an incorrect
delay), which might cause 1-bit audio misalignment.

[ ... ]

> +static int cdns_i2s_mc_prepare(struct snd_pcm_substream *substream,
> +			       struct snd_soc_dai *cpu_dai)
> +{
> +	struct cdns_i2s_mc_priv *i2s_mc_priv =3D snd_soc_dai_get_drvdata(cpu_da=
i);
> +	u32 ctrl =3D 0, fifo =3D 0;

[ ... ]

> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
> +		/* Transmitter clock enable */
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL,
> +				   I2S_CID_CTRL_STROBE_TS, 0);
> +
> +		/*
> +		 * Transmitter FIFO reset
> +		 * When '0', transmit FIFO pointers are reset to zero. Threshold level=
 for
> +		 * this FIFO is unchanged. This bit is automatically set to '1' after =
one
> +		 * clock cycle if TX FIFO reset has been acknowledged.
> +		 * Deassert then assert this bit here, since I2S_CTRL register is not
> +		 * volatile, would not read from hardware any longer. If not, it would
> +		 * clear tx fifo every time when write this register.
> +		 */
> +		ctrl &=3D ~I2S_CTRL_TFIFO_RST;
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL,
> +				   I2S_CTRL_TFIFO_RST, ctrl);
> +		ctrl |=3D I2S_CTRL_TFIFO_RST;
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL,
> +				   I2S_CTRL_TFIFO_RST, ctrl);

[ ... ]

> +	} else {
> +		/* Receiver clock enable */
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL,
> +				   I2S_CID_CTRL_STROBE_RS, 0);
> +
> +		/*
> +		 * Receiver FIFO reset
> +		 * When '0', receive FIFO pointers are reset to zero. Threshold level =
for
> +		 * this FIFO is unchanged. This bit is automatically set to '1' after =
one
> +		 * clock cycle if RX FIFO reset has been acknowledged.
> +		 * Deassert then assert this bit here, since I2S_CTRL register is not
> +		 * volatile, would not read from hardware any longer. If not, it would
> +		 * clear rx fifo every time when write this register.
> +		 */
> +		ctrl &=3D ~I2S_CTRL_RFIFO_RST;
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL,
> +				   I2S_CTRL_RFIFO_RST, ctrl);
> +		ctrl |=3D I2S_CTRL_RFIFO_RST;
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL,
> +				   I2S_CTRL_RFIFO_RST, ctrl);

[Severity: Medium]
Will these back-to-back writes deassert the FIFO resets too quickly?

The hardware requires the reset bit to be held for at least 1 I2S functional
clock cycle before it auto-acknowledges and sets it to 1. Since these writes
go over the fast APB bus, they might deassert the reset in tens of nanoseco=
nds,
and the slower clock domain crossing synchronizer could miss this pulse,
aborting the reset.

Should there be a delay here, or could the cache be manipulated exclusively
using regcache_cache_only() instead?

[ ... ]

> +static int cdns_i2s_mc_hw_params(struct snd_pcm_substream *substream,
> +				 struct snd_pcm_hw_params *params,
> +				 struct snd_soc_dai *cpu_dai)
> +{
> +	struct cdns_i2s_mc_priv *i2s_mc_priv =3D snd_soc_dai_get_drvdata(cpu_da=
i);
> +	struct device *dev =3D i2s_mc_priv->dev;
> +	u32 rate, sample_rate =3D 0;
> +	u32 slots, slot_width, resolution, ctrl;
> +	unsigned long i2s_clk_rate;
> +	u8 pin_tx_num, pin_rx_num;
> +	struct clk *clk_parent;
> +	bool is_master_mode;
> +	int ret;
> +
> +	rate =3D params_rate(params);
> +	slot_width =3D i2s_mc_priv->devtype_data->data_width;
> +	dev_dbg(dev, "rate =3D %d, slot_width =3D %d\n", rate, slot_width);
> +
> +	/* switch clk mux to select the appropriate clk parent */
> +	if (rate % 8000 =3D=3D 0) {
> +		/* Sampling rate is a multiple of 8KHz, select "audio-clk0" */
> +		clk_parent =3D i2s_mc_priv->clks[AUDIO_CLK0];
> +
> +		ret =3D clk_set_parent(i2s_mc_priv->clk_i2s, clk_parent);
> +	} else if (rate % 11025 =3D=3D 0) {
> +		/* Sampling rate is a multiple of 11.025KHz, select "audio-clk2" */
> +		clk_parent =3D i2s_mc_priv->clks[AUDIO_CLK2];
> +
> +		ret =3D clk_set_parent(i2s_mc_priv->clk_i2s, clk_parent);

[Severity: Medium]
Does this unconditionally change the shared clock parent without protecting
against active streams on the other DAI?

Since there are two independent DAIs (I2S_MC_AIF1 and I2S_MC_AIF2), starting
a new stream on one DAI with a different sample rate will silently change
the parent of the shared clk_i2s clock.

Could this break the clock rate and corrupt the audio of a concurrently
running stream on the other DAI?

> +	} else {
> +		dev_err(i2s_mc_priv->dev, "Invalid sample rate\n");
> +		return -EINVAL;
> +	}
> +	if (ret) {
> +		dev_err(i2s_mc_priv->dev, "Failed to set i2s clock parent\n");
> +		return ret;
> +	}
> +
> +	i2s_clk_rate =3D clk_get_rate(i2s_mc_priv->clk_i2s);
> +	dev_dbg(dev, "i2s clk rate =3D %lu\n", i2s_clk_rate);
> +
> +	regmap_read(i2s_mc_priv->regmap, I2S_CTRL, &ctrl);
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
> +		is_master_mode =3D ctrl & I2S_CTRL_T_MS;
> +	else
> +		is_master_mode =3D ctrl & I2S_CTRL_R_MS;
> +
> +	if (is_master_mode) {

[Severity: High]
Is the clock master/slave mode evaluation inverted here?

In cdns_i2s_mc_set_fmt(), I2S_CTRL_T_MS is cleared when the CPU is master
(SND_SOC_DAIFMT_CBC_CFC) and set when the CPU is slave (SND_SOC_DAIFMT_CBP_=
CFP).

However, the logic here evaluates is_master_mode as true when the CPU is
a slave, and false when the CPU is a master.

This causes the driver to incorrectly calculate and program the clock divid=
er
when acting as a slave, and skip computing the divider entirely when acting
as a master.

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

[Severity: Medium]
Will this restrictive mask prevent the synchronizing unit resets from reach=
ing
the hardware?

The driver clears I2S_CTRL_TSYNC_RST and I2S_CTRL_RSYNC_RST (bits 25 and 26)
in the ctrl variable, but issues the write using only I2S_CTRL_I2S_EN
(bits 0-7) as the mask. The intended hardware modifications to bits 25 and =
26
will be silently masked out.

[ ... ]

> +static int cdns_i2s_mc_probe(struct platform_device *pdev)
> +{
> +	struct cdns_i2s_mc_priv *i2s_mc_priv;

[ ... ]

> +	/*
> +	 * Let pm_runtime_put_sync() disable the clocks, and take regcache effe=
ct.
> +	 * If CONFIG_PM is not enabled, the clock will stay powered.
> +	 */
> +	pm_runtime_put_sync(&pdev->dev);
> +
> +	ret =3D devm_snd_soc_register_component(&pdev->dev, &cdns_i2s_mc_compon=
ent,
> +					      cdns_i2s_mc_dai, ARRAY_SIZE(cdns_i2s_mc_dai));
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to register soc componen=
t\n");

[Severity: High]
Does returning directly here bypass the err_disable_clks cleanup path?

The clocks clk_hst and clk_i2s are manually enabled earlier in this function
via cdns_i2s_mc_clks_enable(). Returning directly on failure will leak the
clock prepare/enable reference counts.

Should this jump to err_disable_clks instead?

[ ... ]

> +static const struct of_device_id cdns_i2s_mc_of_match[] =3D {
> +	{ .compatible =3D "cix,sky1-i2s-mc", .data =3D &sky1_devtype_data },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, cdns_i2s_mc_of_match);
> +
> +static struct platform_driver cdns_i2s_mc_driver =3D {
> +	.probe =3D cdns_i2s_mc_probe,
> +	.driver =3D {
> +		.name =3D DRV_NAME,
> +		.pm =3D pm_ptr(&cdns_i2s_mc_pm_ops),
> +		.of_match_table =3D cdns_i2s_mc_of_match,
> +	},
> +};

[Severity: High]
Does this driver lack a .remove callback to clean up the clocks?

Because the clocks are manually enabled in probe and there is no devm action
registered to disable them, the clock references will be permanently leaked
when the module is unbound or removed.

Could this leave the hardware clocks physically powered if CONFIG_PM is
disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009092552.2377=
960-1-joakim.zhang@cixtech.com?part=3D4
