Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B2547CA9E
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 11:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790076972; cv=none; b=ZtVLgHB2rL3kSdYjF2TaYdU5TD1B2oymrjqX83aGj1YbAlUSc4Cja7uQPTbtOBDgd+9Z5KnTwKlips5SIK96QMEBrISlygRyurkF12ngF3vS3C2kQn8hThI7qxjAnOXOZiMSTi6v6bwFdCwMjjBHW0nV1PjL+R6lyutrhEAty2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790076972; c=relaxed/simple;
	bh=QhsCvn9UCiHIccXvftx21JD3yFq52SY0D3rmhwDA6gw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N/cfYtAhddvKaTxb/gviwioe+b+t+aQnj2qENHrvt02DVPf/KNym68fl/dWnIypMoNB5K+Ktz3YbyBGIC/kr9OPOWVUihWkYgRbOd+Qfmg8Ik37tmx7zJX2eNQTZxgvtGnkTMq25gnepcAnjczXXTlx/fTG/6ZNMuFkjM82jYHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uql1OJAM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uql1OJAM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6591F000FF;
	Tue, 22 Sep 2026 11:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790076964;
	bh=KqYu4BlaCHJYRygs6b981jmWAMG+/tcKtG7sfYpM/Wo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Uql1OJAM6EG/czEcAizyIJIHrNZHDTIkTdB8JOHbEKX1FOn0qg9NAnfF5q69nI3Yr
	 l6J2DHTryUxTV/qYTskEp0MuLcrMfTQBer8Izku+T9IMfSwMA/BNprigGbUw7+LwXq
	 y/1U/pTSqcAD/R+v7dG03dmsAO+KqBQ5FOxXa5euI1zKaYy0HRMH4e6xBdOjwg1eXt
	 Cf0WObHxfqikfZhLknoujcLe6o9rfXahm3/2KmKvxIxQTLbDRkGDVVjsK0Umqvozsd
	 5QObDCFWuKz1kRec5Qo57FSMuhlQbmshuUTNiMXzroDJOsKwUZi0DPK+5FJ1lQaYq9
	 86VUffeMTex9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] ASoC: cdns: Add Cadence I2S-SC controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260922112134.4167305-3-joakim.zhang@cixtech.com>
References: <20260922112134.4167305-1-joakim.zhang@cixtech.com>
 <20260922112134.4167305-3-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 11:36:04 +0000
Message-Id: <20260922113604.9F6591F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] driver: devres component unregistration races with manual PM disab=
le
- [High] irq: regcache_cache_only enabled before irq disable causes storm
- [High] driver: missing NULL check for device_get_match_data()
- [High] irq: interrupt enabled before clocks are initialized
- [High] ALSA: prepare modifies shared clock state without lock
- [Medium] clk: clocks leak if CONFIG_PM is disabled
- [Medium] irq: regmap_update_bits on volatile status register drops interr=
upts
- [Low] pm: unconditionally assigned dev_pm_ops causes dead code
--

commit 85f61640451174adf94c765b39619f4cf7a43543
Author: Joakim Zhang <joakim.zhang@cixtech.com>
Subject: ASoC: cdns: Add Cadence I2S-SC controller driver

Adds ALSA SoC support for the Cadence I2S-SC controller in CIX SKY1. Implem=
ents
standard I2S and TDM modes, sharing transceiver start/stop state. Registers=
 a
DMA engine PCM helper and handles PM operations.

> diff --git a/sound/soc/cdns/cdns-i2s-sc.c b/sound/soc/cdns/cdns-i2s-sc.c
> new file mode 100644
> index 0000000000000..54c819493e3e6
> --- /dev/null
> +++ b/sound/soc/cdns/cdns-i2s-sc.c

[ ... ]

> +static irqreturn_t cdns_i2s_sc_isr(int irq, void *devid)
> +{
> +	struct cdns_i2s_sc_priv *i2s_sc_priv =3D (struct cdns_i2s_sc_priv *)dev=
id;
> +	struct device *dev =3D i2s_sc_priv->dev;
> +	u32 stat;
> +
> +	regmap_read(i2s_sc_priv->regmap, I2S_STAT, &stat);
> +
> +	stat &=3D I2S_STAT_TDATA_UNDERR | I2S_STAT_RDATA_OVERR;

[Severity: High]
Does this code use uninitialized stack memory?

If regmap_read() fails with -EBUSY (e.g. if the cache is in cache-only mode=
),
it will leave stat uninitialized. The ISR then checks stat, and if the
uninitialized memory happens to match the interrupt bits, it will attempt to
handle it and return IRQ_HANDLED, potentially leading to an unrecoverable
interrupt storm if the hardware interrupt is never cleared.

> +	if (!stat)
> +		return IRQ_NONE;
> +
> +	/* Clear the status */
> +	regmap_update_bits(i2s_sc_priv->regmap, I2S_STAT, stat, 0);

[Severity: Medium]
Will this read-modify-write drop concurrent interrupts?

I2S_STAT is a volatile hardware status register. If the hardware asserts a
new interrupt bit after regmap_update_bits() reads the register but before =
it
writes it back, the modified value written back will contain a 0 for that n=
ew
bit. Depending on whether the register is write-0-to-clear or write-1-to-cl=
ear,
this can accidentally clear the newly asserted interrupt or untouched bits,
causing them to be lost.

> +
> +	/* Transmitter status */
> +	if (stat & I2S_STAT_TDATA_UNDERR)
> +		dev_dbg(dev, "isr: tx data underrun\n");
> +
> +	/* Receiver status */
> +	if (stat & I2S_STAT_RDATA_OVERR)
> +		dev_dbg(dev, "isr: rx data overrun\n");
> +
> +	return IRQ_HANDLED;
> +}

[ ... ]

> +static int cdns_i2s_sc_prepare(struct snd_pcm_substream *substream,
> +			       struct snd_soc_dai *cpu_dai)
> +{
> +	struct cdns_i2s_sc_priv *i2s_sc_priv =3D snd_soc_dai_get_drvdata(cpu_da=
i);
> +
> +	/* Transceiver clock enable */
> +	regmap_update_bits(i2s_sc_priv->regmap, I2S_CTRL, I2S_CTRL_I2S_STB, 0);

[Severity: High]
Can concurrent streams unexpectedly modify the shared transceiver clock sta=
te
here?

cdns_i2s_sc_prepare() modifies the shared I2S_CTRL_I2S_STB bit and resets
the FIFO without holding i2s_sc_priv->lock. ALSA permits concurrent prepare
on one stream (like Capture) and trigger(STOP) on another (like Playback).

If Playback runs trigger(STOP) concurrently, it takes the lock and can disa=
ble
the transceiver clock immediately after Capture prepare enabled it. Capture
prepare would then attempt to reset the FIFO with the clock disabled, viola=
ting
hardware constraints.

> +
> +	/*
> +	 * FIFO reset should meet two requirements
> +	 * 1) after i2s_stb clock on
> +	 * 2) before dma ready to receive trigger
> +	 */
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
> +		/*
> +		 * Transmitter FIFO reset
> +		 * When LOW, FIFO pointer is reset to zero. Threshold levels for
> +		 * FIFO are unchanged. This bit is automatically set to HIGH after
> +		 * one clock cycle.
> +		 * Deassert then assert this bit here, since I2S_CTRL register is not
> +		 * volatile, would not read from hardware any longer. If not, it would
> +		 * clear tx fifo every time when write this register.
> +		 */
> +		regmap_update_bits(i2s_sc_priv->regmap, I2S_CTRL, I2S_CTRL_FIFO_RST, 0=
);
> +		regmap_update_bits(i2s_sc_priv->regmap, I2S_CTRL,
> +				   I2S_CTRL_FIFO_RST, I2S_CTRL_FIFO_RST);
> +
> +		/* Transmitter FIFO threshold set */
> +		regmap_write(i2s_sc_priv->regmap, I2S_FIFO_AEMPTY,
> +			     i2s_sc_priv->devtype_data->tx_fifo_aempty_threshold);

[Severity: High]
Does this code trigger a NULL pointer dereference if the driver is bound
manually?

device_get_match_data() can return NULL if the driver is bound manually via
sysfs without a matching OF device node. Since i2s_sc_priv->devtype_data is=
n't
checked for NULL during probe, dereferencing it here to read FIFO threshold
values would cause an immediate kernel panic.

> +		regmap_write(i2s_sc_priv->regmap, I2S_FIFO_AFULL,
> +			     i2s_sc_priv->devtype_data->tx_fifo_afull_threshold);
> +	} else {

[ ... ]

> +static int cdns_i2s_sc_probe(struct platform_device *pdev)
> +{
> +	struct cdns_i2s_sc_priv *i2s_sc_priv;
> +	struct resource *res;
> +	void __iomem *base;
> +	int i, irq, ret;
> +
> +	i2s_sc_priv =3D devm_kzalloc(&pdev->dev, sizeof(*i2s_sc_priv), GFP_KERN=
EL);
> +	if (!i2s_sc_priv)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&i2s_sc_priv->lock);
> +
> +	platform_set_drvdata(pdev, i2s_sc_priv);
> +
> +	base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	i2s_sc_priv->dev =3D &pdev->dev;
> +	i2s_sc_priv->devtype_data =3D device_get_match_data(&pdev->dev);

[ ... ]

> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +	i2s_sc_priv->irq =3D irq;
> +
> +	ret =3D devm_request_irq(&pdev->dev, irq, cdns_i2s_sc_isr, 0,
> +			       dev_name(&pdev->dev), i2s_sc_priv);

[Severity: High]
Is it safe to request and enable the interrupt before the hardware clocks a=
re
initialized?

devm_request_irq() automatically unmasks the IRQ at the interrupt controlle=
r.
If a pending interrupt is asserted by the hardware (e.g. from a warm boot),=
 the
ISR will execute immediately. Since the device clocks haven't been enabled =
yet
via cdns_i2s_sc_clks_enable(), the ISR's MMIO reads via regmap will typical=
ly
cause a severe bus stall or external abort, panicking the kernel during boo=
t.

> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
> +		return ret;
> +	}
> +
> +	i2s_sc_priv->playback_dma_data.addr =3D res->start + I2S_FIFO_ADDRESS;

[ ... ]

> +	ret =3D cdns_i2s_sc_clks_enable(i2s_sc_priv);
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret, "Failed to enable clocks\n");
> +		pm_runtime_disable(&pdev->dev);
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}
> +
> +	cdns_i2s_sc_rst(i2s_sc_priv);
> +
> +	/*
> +	 * Let pm_runtime_put_sync() disable the clocks, and take regcache effe=
ct.
> +	 * If CONFIG_PM is not enabled, the clock will stay powered.
> +	 */
> +	pm_runtime_put_sync(&pdev->dev);

[Severity: Medium]
Will this cause a resource leak if CONFIG_PM is disabled?

The driver explicitly enables clocks via cdns_i2s_sc_clks_enable() earlier
in probe, and relies on pm_runtime_put_sync() here (and=20
pm_runtime_force_suspend() in remove()) to invoke the suspend callback and=
=20
disable the clocks.

If CONFIG_PM is disabled, both of these functions become no-ops. The suspend
callback is never invoked, leaving the clocks permanently enabled.

> +
> +	ret =3D devm_snd_soc_register_component(&pdev->dev, &cdns_i2s_sc_compon=
ent,
> +					      &cdns_i2s_sc_dai, 1);

[Severity: High]
Does registering the component with devres create a race condition with dri=
ver
removal?

The ALSA component is registered via devm_snd_soc_register_component(), mea=
ning
it will be unregistered automatically after cdns_i2s_sc_remove() returns.

However, cdns_i2s_sc_remove() manually forces suspend and disables PM:

    static void cdns_i2s_sc_remove(struct platform_device *pdev)
    {
        if (!pm_runtime_status_suspended(&pdev->dev))
            pm_runtime_force_suspend(&pdev->dev);
        pm_runtime_disable(&pdev->dev);
    }

When devres eventually unregisters the ALSA component, the core may invoke
teardown actions (e.g. trigger(STOP)) on the DAI. These will attempt to acc=
ess
the hardware or regmap while the device is in a powered-down, cache-only st=
ate,
potentially leading to bus hangs or panics.

> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret, "Failed to register soc component\n");
> +		pm_runtime_disable(&pdev->dev);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void cdns_i2s_sc_remove(struct platform_device *pdev)
> +{
> +	if (!pm_runtime_status_suspended(&pdev->dev))
> +		pm_runtime_force_suspend(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +}
> +
> +static int __maybe_unused cdns_i2s_sc_runtime_suspend(struct device *dev)
> +{
> +	struct cdns_i2s_sc_priv *i2s_sc_priv =3D dev_get_drvdata(dev);
> +
> +	regcache_cache_only(i2s_sc_priv->regmap, true);
> +	disable_irq(i2s_sc_priv->irq);

[Severity: High]
Does setting cache-only mode before disabling the IRQ open a race window?

If an interrupt fires after regcache_cache_only(..., true) but before
disable_irq() completes, the ISR will attempt to read the hardware via regm=
ap.
This read will fail with -EBUSY, leaving the stat variable uninitialized
and causing the interrupt storm issue mentioned earlier.

The same ordering race exists in cdns_i2s_sc_runtime_resume(), where
enable_irq() is called before cache-only mode is lifted.

> +	cdns_i2s_sc_clks_disable(i2s_sc_priv);
> +
> +	return 0;
> +}

[ ... ]

> +static struct platform_driver cdns_i2s_sc_driver =3D {
> +	.probe =3D cdns_i2s_sc_probe,
> +	.remove =3D cdns_i2s_sc_remove,
> +	.driver =3D {
> +		.name =3D DRV_NAME,
> +		.pm =3D &cdns_i2s_sc_pm_ops,

[Severity: Low]
Is this unconditional assignment of dev_pm_ops causing dead code?

Assigning &cdns_i2s_sc_pm_ops unconditionally forces the struct and its cal=
lbacks
to be linked into the kernel even when CONFIG_PM is disabled. Using pm_ptr()
here prevents this.

> +		.of_match_table =3D cdns_i2s_sc_of_match,
> +	},
> +};
> +module_platform_driver(cdns_i2s_sc_driver);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922112134.4167=
305-1-joakim.zhang@cixtech.com?part=3D2
