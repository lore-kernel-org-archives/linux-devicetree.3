Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E97224E016
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 11:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790076830; cv=none; b=ALexr5Ax460bdit0gS7MlLa1B7yfXks02wqTDsaNBm33ILVc5bWq2+gkOx3A7D7JZ9pWA2y855Lcxw/c9JS7jDFxvj7wpV5XHN3lYI8W7GHs5bm4ZN+1BHLBd1y6yDoNzotWnZ47oXZtsgi77v5fZvMhOk0FZ3KhJQTIQ/A7Yek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790076830; c=relaxed/simple;
	bh=zSX15oUUV7b+brXgbsJi5iQSKYCSqzUwQo1T5ntAQ/g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JwqYc+dSdQIOx7CWpJTHpAIXDnlPVoPSNKGthN9Y6laS+2n+NAuiq5KxJBqkjA6YT2et2Kcb0+gHvRAGhb47TkYr0cOsfnKpEYyU66JZeBhTSHunf4r1rmKCanCrL0xguE+fbyZaPQ1yEkWNpKTWYJxpd2/z65fwKaWb2Tx/Cj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xw1py6VG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xw1py6VG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 832A51F000FF;
	Tue, 22 Sep 2026 11:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790076828;
	bh=GK29pdDzeNj+qvUDjhGV32ypMlu7lmjLUadIDS9blL8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xw1py6VG4DTeEIy4mAeSErG/RWH0RI6WA/Ds4yi5+B+08dNiij0OjUDFO2rBsVnY3
	 qOPQvDFzIQ/UqsKfuL+liC4mzC3+NRaoLHExREDMNC0v/X+ocRQg7MqyR9JMpHoMB0
	 22mX2WsfO+NXYWALGHnNG5b0hBGHffbwRxrYahe1lb6IATue8n1M41cvcJOyr1J0j1
	 al507tJ/B1rLbqnobswKeBsl7TBxKvwJ520tLZv0RSrODgKYWj/2Q61/3USQvceLCd
	 nTDwMw2QP037ncWDbvYJEkFHppp5FrgfvyGyaIbMQjCZmGL4HCgbhK5vadDKhFJvql
	 BuIbAdchdfREw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] ASoC: cdns: Add Cadence I2S-MC controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260922112134.4167305-5-joakim.zhang@cixtech.com>
References: <20260922112134.4167305-1-joakim.zhang@cixtech.com>
 <20260922112134.4167305-5-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 11:33:48 +0000
Message-Id: <20260922113348.832A51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] irq: uninitialized stat usage due to IRQ enable before regcache sy=
nc
- [High] asoc: use-after-free/crash due to mismatched component devres unre=
gistration
- [High] irq: spurious interrupt hangs bus by accessing unclocked hardware
- [High] core: NULL pointer dereference on sysfs bind lacking match data
- [High] regmap: read-modify-write on volatile interrupt status register dr=
ops events
- [Medium] asoc: inverted I2S clock provider/consumer master mode logic
- [Medium] asoc: concurrent hw_params corrupts shared bit clock without sym=
metric_rates
- [Medium] clk: clocks leak on probe failure and remove when CONFIG_PM is d=
isabled
- [Medium] pm: double pm_runtime_disable() in remove breaks re-bind
- [Low] pm: dev_pm_ops is unconditionally assigned causing dead code
--

commit 7dc81b255425f184b4f1a1c886aa7997a156cb94
Author: Joakim Zhang <joakim.zhang@cixtech.com>
Date:   Tue Sep 22 11:21:34 2026 +0000

    ASoC: cdns: Add Cadence I2S-MC controller driver
   =20
    Add support for the Cadence I2S-MC multi-channel controller found in
    the CIX SKY1 audio subsystem.
   =20
    The controller moves up to 16 channels through a configurable set of
    its 8 data pins, each pin carrying two slots. Wired-out pins may sit
    at any pin index and are described by cix,pin-out-num, cix,pin-rx-mask
    and cix,pin-tx-mask.

> diff --git a/sound/soc/cdns/cdns-i2s-mc.c b/sound/soc/cdns/cdns-i2s-mc.c
> new file mode 100644
> index 0000000000000..f3415175554c4
> --- /dev/null
> +++ b/sound/soc/cdns/cdns-i2s-mc.c

[ ... ]

> @@ -279,15 +279,14 @@ static irqreturn_t cdns_i2s_mc_isr(int irq, void *d=
evid)
>  	struct device *dev =3D i2s_mc_priv->dev;
>  	u32 stat;
> =20
>  	regmap_read(i2s_mc_priv->regmap, I2S_INTR_STAT, &stat);
> =20
>  	stat &=3D I2S_INTR_STAT_TDATA_UNDERR | I2S_INTR_STAT_RDATA_OVERR;
>  	if (!stat)
>  		return IRQ_NONE;
> =20
>  	/* Clear the status */
>  	regmap_update_bits(i2s_mc_priv->regmap, I2S_INTR_STAT, stat, 0);

[Severity: High]
Does this read-modify-write on a volatile register risk dropping interrupts?

Because I2S_INTR_STAT is volatile, regmap_update_bits() forces a
read-modify-write cycle. If a new hardware interrupt asserts after the read=
 but
before the write, won't the write overwrite the register with stale data,
clearing the newly asserted bit before it can be handled?

[ ... ]

> @@ -396,15 +395,14 @@ static int cdns_i2s_mc_set_fmt(struct snd_soc_dai *=
cpu_dai, unsigned int fmt)
>  		/* DAI hardware clock masters */
>  		switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
>  		case SND_SOC_DAIFMT_CBC_CFC:
>  			ctrl &=3D ~I2S_CTRL_T_MS;
>  			break;
>  		case SND_SOC_DAIFMT_CBP_CFP:
>  			ctrl |=3D I2S_CTRL_T_MS;
>  			break;

[Severity: Medium]
Is the I2S clock provider logic inverted here?

In cdns_i2s_mc_set_fmt(), I2S_CTRL_T_MS is cleared when the CPU is the clock
provider (SND_SOC_DAIFMT_CBC_CFC).=20

However, in cdns_i2s_mc_hw_params(), the code appears to expect I2S_CTRL_T_=
MS
to be set for clock provider mode:

	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
		is_master_mode =3D ctrl & I2S_CTRL_T_MS;

	if (is_master_mode) {
        ...

Won't this inversion prevent the bit clock divider from being configured
correctly?

[ ... ]

> @@ -522,17 +520,16 @@ static int cdns_i2s_mc_hw_params(struct snd_pcm_sub=
stream *substream,
>  	/* switch clk mux to select the appropriate clk parent */
>  	if (rate % 8000 =3D=3D 0) {
>  		/* Sampling rate is a multiple of 8KHz, select "audio-clk0" */
>  		clk_parent =3D i2s_mc_priv->clks[AUDIO_CLK0];
> =20
>  		ret =3D clk_set_parent(i2s_mc_priv->clk_i2s, clk_parent);
>  	} else if (rate % 11025 =3D=3D 0) {

[Severity: Medium]
Could this corrupt the shared bit clock if asymmetric streams are opened?

Because AIF1 and AIF2 share the same hardware bit clock (clk_i2s) and
symmetric_rates =3D 1 is not set on the DAIs, ALSA allows playback and capt=
ure
streams to run at different sample rates concurrently.

If two such streams are opened, won't they blindly overwrite each other's c=
lock
parent here, causing audio distortion?

[ ... ]

> @@ -947,16 +944,15 @@ static int cdns_i2s_mc_probe(struct platform_device=
 *pdev)
>  	i2s_mc_priv =3D devm_kzalloc(&pdev->dev, sizeof(*i2s_mc_priv), GFP_KERN=
EL);
>  	if (!i2s_mc_priv)
>  		return -ENOMEM;
> =20
>  	platform_set_drvdata(pdev, i2s_mc_priv);
> =20
>  	base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
> =20
>  	i2s_mc_priv->dev =3D &pdev->dev;
>  	i2s_mc_priv->devtype_data =3D device_get_match_data(&pdev->dev);

[Severity: High]
Can device_get_match_data() return NULL here and cause a crash?

If the driver is bound via sysfs (e.g., echo cdns-i2s-mc > bind) rather than
via DeviceTree, device_get_match_data() will return NULL.

When cdns_i2s_mc_prepare() executes:

		fifo |=3D FIELD_PREP(I2S_TFIFO_CTRL_TAEMPTY_THRESHOLD,
				   i2s_mc_priv->devtype_data->tfifo_aempty_threshold) |

wouldn't this dereference the NULL pointer?

[ ... ]

> @@ -978,16 +974,15 @@ static int cdns_i2s_mc_probe(struct platform_device=
 *pdev)
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq < 0)
>  		return irq;
>  	i2s_mc_priv->irq =3D irq;
> =20
>  	ret =3D devm_request_irq(&pdev->dev, irq, cdns_i2s_mc_isr, 0,
>  			       dev_name(&pdev->dev), i2s_mc_priv);

[Severity: High]
Could an early interrupt cause a bus fault here?

The interrupt is requested and unmasked before the hardware clocks are enab=
led
via cdns_i2s_mc_clks_enable() a few lines down.

If the interrupt line asserts immediately (e.g., from state left over from a
kexec or warm reboot), the ISR will fire and attempt a regmap read on an
unclocked APB bus.=20

Would this result in a fatal asynchronous external abort?

[ ... ]

> @@ -1066,16 +1061,15 @@ static int cdns_i2s_mc_probe(struct platform_devi=
ce *pdev)
>  	/*
>  	 * Let pm_runtime_put_sync() disable the clocks, and take regcache effe=
ct.
>  	 * If CONFIG_PM is not enabled, the clock will stay powered.
>  	 */
>  	pm_runtime_put_sync(&pdev->dev);
> =20
>  	ret =3D devm_snd_soc_register_component(&pdev->dev, &cdns_i2s_mc_compon=
ent,
>  					      cdns_i2s_mc_dai, ARRAY_SIZE(cdns_i2s_mc_dai));
>  	if (ret) {
>  		dev_err_probe(&pdev->dev, ret, "Failed to register soc component\n");
>  		pm_runtime_disable(&pdev->dev);
>  		return ret;
>  	}

[Severity: Medium]
Does this leak clocks if CONFIG_PM is disabled?

The error path relies entirely on pm_runtime_put_sync() shutting down the
clocks. If runtime PM is compiled out, pm_runtime_put_sync() and
pm_runtime_force_suspend() act as no-ops, so cdns_i2s_mc_clks_disable() will
never be called.

[Severity: High]
Does this devres component registration create a use-after-free window duri=
ng
removal?

devm_snd_soc_register_component() delays component unregistration until aft=
er
the remove() function returns. However, cdns_i2s_mc_remove() manually forces
hardware suspend and disables runtime PM:

static void cdns_i2s_mc_remove(struct platform_device *pdev)
{
	if (!pm_runtime_status_suspended(&pdev->dev))
		pm_runtime_force_suspend(&pdev->dev);
	pm_runtime_disable(&pdev->dev);
}

Doesn't this leave a window where ALSA callbacks can still be executed by
userspace against completely suspended and unclocked hardware?

[ ... ]

> @@ -1079,15 +1073,14 @@ static int cdns_i2s_mc_probe(struct platform_devi=
ce *pdev)
>  	return 0;
>  }
> =20
>  static void cdns_i2s_mc_remove(struct platform_device *pdev)
>  {
>  	if (!pm_runtime_status_suspended(&pdev->dev))
>  		pm_runtime_force_suspend(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  }

[Severity: Medium]
Will this sequence break runtime PM if the driver is unbound and re-bound?

pm_runtime_force_suspend() already calls pm_runtime_disable() internally. By
calling pm_runtime_disable() a second time, the disable_depth counter is
incremented twice.

When the driver is later re-probed, pm_runtime_enable() will only decrement=
 it
by 1, leaving the device permanently disabled.

[ ... ]

> @@ -1035,16 +1028,15 @@ static int __maybe_unused cdns_i2s_mc_runtime_res=
ume(struct device *dev)
>  	int ret;
> =20
>  	ret =3D cdns_i2s_mc_clks_enable(i2s_mc_priv);
>  	if (ret) {
>  		dev_err(dev, "Failed to enable clocks:%d\n", ret);
>  		return ret;
>  	}
> =20
>  	cdns_i2s_mc_rst(i2s_mc_priv);
> =20
>  	enable_irq(i2s_mc_priv->irq);
> =20
>  	regcache_cache_only(i2s_mc_priv->regmap, false);

[Severity: High]
Could an early interrupt cause cdns_i2s_mc_isr() to use uninitialized memor=
y?

Here, enable_irq() is called before regcache_cache_only() disables cache-on=
ly
mode. If a pending interrupt fires immediately:

cdns_i2s_mc_isr() {
	u32 stat;

	regmap_read(i2s_mc_priv->regmap, I2S_INTR_STAT, &stat);

	stat &=3D I2S_INTR_STAT_TDATA_UNDERR | I2S_INTR_STAT_RDATA_OVERR;
...

The regmap_read() would fail with -EBUSY because the regmap is still blocki=
ng
reads, leaving stat uninitialized when it is evaluated.

[ ... ]

> @@ -1138,15 +1130,14 @@ static const struct of_device_id cdns_i2s_mc_of_m=
atch[] =3D {
>  	{ .compatible =3D "cix,sky1-i2s-mc", .data =3D &sky1_devtype_data},
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, cdns_i2s_mc_of_match);
> =20
>  static struct platform_driver cdns_i2s_mc_driver =3D {
>  	.probe =3D cdns_i2s_mc_probe,
>  	.remove =3D cdns_i2s_mc_remove,
>  	.driver =3D {
>  		.name =3D DRV_NAME,
>  		.pm =3D &cdns_i2s_mc_pm_ops,

[Severity: Low]
Will this assignment cause dead code when CONFIG_PM=3Dn?

Per the subsystem guidelines, unconditionally assigning &cdns_i2s_mc_pm_ops
defeats compiler dead-code elimination. Should this be wrapped with pm_ptr(=
) so
the callbacks are removed when power management is disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922112134.4167=
305-1-joakim.zhang@cixtech.com?part=3D4
