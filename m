Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31624F3901
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413319; cv=none; b=iiCD9tQbsrUSg8Xmba7Qj3oKrpjkPhICYhCigBQOvsMvK7SSzZyjkj8b4+fuPofTkVe77Ozz0VQMzzupmJSxJ93EXdSqBbCLd1LHgYzsD7KBGRu/82Cgg3JThbVSTiTbgEGghe2CPWso88/8fufrKivShGC4YOkv4SLl2zoEsSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413319; c=relaxed/simple;
	bh=Fq+5jceyyVaq8QVIyCdtKEb90686LrUtOCvSPahEGWg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=G6vLJrNyfzDsptZriIh7mAnkoY8gfcY9qjTmZ2UAcg0SL/HwfpOwdxAIGFl61IRV3nE3AGeCK7RYmC4j3t2GOr2xOsGs97JFuPWn+h7u8XysR4Dx1qwD18qt+UGJJ7q4aonXhgX42+sgYoqfdJWEe/y1SnySYnN4xF7CWJqeRvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEPbnPt/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LEPbnPt/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0EFD1F000C4;
	Mon, 19 Oct 2026 12:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792413308;
	bh=UbtDzCrjAqO18C+KHWlKV4EuwZ31DUsewXoIUV65JYE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LEPbnPt/vD9K9F+P+K5nlydLWEEwBwN3ApDjzkb0j/t29UJnBKRJmJOGp7+3CQPli
	 1oJyOGZCSxPj8E2upNOSE0hw52vBzdADaUXyjv+Pi+IL3CluJrlut4Jj3VITBhj6jD
	 hoM5pdjPYA5SRtoYbSuH2LPy6TWrMP0U6kAP5Cu/wLaWbgULUeFD0O0V9Dj7IiIwMY
	 0IKaVIx9ZyvTkmpwU/T2ypNFl6rAu/bt8ze1dKBbIXwry1mQIX5NZqFV8CJyVAnGmy
	 vNAf3sTz6YRILDCPanfXzDbaJ4fN6iZ3Wp46dTSdz+/v8U4MV6er167zVBo4i6zmgD
	 LMiQ7zIVHev7w==
Message-ID: <sashiko-outbox-177072@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] ASoC: cdns: Add Cadence I2S-MC controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019122048.1107179-5-joakim.zhang@cixtech.com>
References: <20261019122048.1107179-1-joakim.zhang@cixtech.com>
 <20261019122048.1107179-5-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 12:35:07 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] ASoC: cdns: shared clk_i2s reparented in cdns_i2s_mc_hw_params()=
 while active
- [Medium] ASoC: cdns: clock and runtime PM leak in cdns_i2s_mc_probe() and=
 on remove
- [Medium] ASoC: cdns: devm_pm_runtime_enable() ordered before IRQ in cdns_=
i2s_mc_probe()
--

commit b995dbd0c500d9df940a91311e64f2712a2548e6
Author: Joakim Zhang <joakim.zhang@cixtech.com>

ASoC: cdns: Add Cadence I2S-MC controller driver

This commit adds ASoC driver support for the Cadence I2S-MC multi-channel
controller found in the CIX SKY1 audio subsystem. It exposes playback and
capture DAIs using dmaengine PCM, manages audio reference clock parenting,
and handles runtime and system power management.

> diff --git a/sound/soc/cdns/cdns-i2s-mc.c b/sound/soc/cdns/cdns-i2s-mc.c
> new file mode 100644
> index 0000000000000..defbb93adfe76
> --- /dev/null
> +++ b/sound/soc/cdns/cdns-i2s-mc.c
> @@ -0,0 +1,1128 @@

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
> +	} else {
> +		dev_err(i2s_mc_priv->dev, "Invalid sample rate\n");
> +		return -EINVAL;
> +	}

[Severity: Medium]
Can switching the parent of i2s_mc_priv->clk_i2s here corrupt an already
active stream on the other DAI?

The driver exposes two separate DAIs in cdns_i2s_mc_dai[] (i2s-mc-aif1 for
playback and i2s-mc-aif2 for capture), which can be opened and configured
independently. Both DAIs share the single functional clock
i2s_mc_priv->clk_i2s.

If one DAI is running at a multiple of 8 kHz (using clks[AUDIO_CLK0]) and
userspace calls snd_pcm_hw_params() -> cdns_i2s_mc_hw_params() on the second
DAI with a multiple of 11.025 kHz (using clks[AUDIO_CLK2]), clk_set_parent()
will change the parent of clk_i2s underneath the active stream. That changes
i2s_clk_rate while the first stream is active, invalidating its programmed
I2S_SRR divider (I2S_SRR_TSAMPLE_RATE or I2S_SRR_RSAMPLE_RATE) and
potentially violating I2S_CLK_RATIO_MIN_MASTER or I2S_CLK_RATIO_MIN_SLAVE.

Should cdns_i2s_mc_hw_params() check whether the other stream is already
configured with an incompatible clock parent, or constrain the two DAIs to
the same rate family when both are active?

[ ... ]

> +static int cdns_i2s_mc_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	pm_runtime_get_noresume(&pdev->dev);
> +	pm_runtime_set_active(&pdev->dev);
> +	ret =3D devm_pm_runtime_enable(&pdev->dev);
> +	if (ret) {
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return dev_err_probe(&pdev->dev, ret, "Failed to enable runtime PM\n");
> +	}
> +
> +	ret =3D cdns_i2s_mc_clks_enable(i2s_mc_priv);
> +	if (ret) {
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return dev_err_probe(&pdev->dev, ret, "Failed to enable clocks\n");
> +	}
> +
> +	cdns_i2s_mc_rst(i2s_mc_priv);
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		ret =3D irq;
> +		goto err_disable_clks;
> +	}
> +	i2s_mc_priv->irq =3D irq;
> +
> +	ret =3D devm_request_irq(&pdev->dev, irq, cdns_i2s_mc_isr, 0,
> +			       dev_name(&pdev->dev), i2s_mc_priv);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
> +		goto err_disable_clks;
> +	}

[Severity: Medium]
Is the devres registration order between devm_pm_runtime_enable() and
devm_request_irq() safe during teardown?

In cdns_i2s_mc_probe(), devm_pm_runtime_enable() is registered before
i2s_mc_priv->irq is assigned and before devm_request_irq() is called.
Because devres unwinds in reverse order, on driver unbind or if
devm_snd_soc_register_component() fails, devm_irq_release() calls free_irq()
before pm_runtime_disable_action() disables runtime PM.

Since cdns_i2s_mc_runtime_suspend() calls disable_irq(i2s_mc_priv->irq) and
cdns_i2s_mc_runtime_resume() calls enable_irq(i2s_mc_priv->irq), a runtime
PM transition occurring before runtime PM is disabled can call enable_irq()
or disable_irq() on an already-freed IRQ. It also leaves the IRQ disabled
when devm_irq_release() frees it.

Should platform_get_irq() and devm_request_irq() be moved before
devm_pm_runtime_enable()?

> +
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
> +
> +	return 0;
> +
> +err_disable_clks:
> +	cdns_i2s_mc_clks_disable(i2s_mc_priv);
> +	pm_runtime_put_noidle(&pdev->dev);
> +	return ret;
> +}

[Severity: Medium]
Does cdns_i2s_mc_probe() leak the prepare/enable counts on clk_hst and
clk_i2s when devm_snd_soc_register_component() fails or when the driver is
unbound?

In cdns_i2s_mc_probe(), clk_hst and clk_i2s are enabled via
cdns_i2s_mc_clks_enable(), and the driver relies on pm_runtime_put_sync()
running cdns_i2s_mc_runtime_suspend() to disable them. There is no devm
action or .remove callback in cdns_i2s_mc_driver to disable the clocks.

When CONFIG_PM is disabled (where pm_runtime_put_sync() is a no-op and the
clocks stay powered) or when runtime suspend is prevented (for example via
sysfs power/control), if devm_snd_soc_register_component() fails,
cdns_i2s_mc_probe() returns without calling cdns_i2s_mc_clks_disable().
The same leak occurs on driver unbind because devm_pm_runtime_enable() only
calls pm_runtime_disable() and does not invoke cdns_i2s_mc_runtime_suspend()
when the device is still runtime-active.

Also, on the error paths after pm_runtime_set_active(&pdev->dev) (when
devm_pm_runtime_enable(), cdns_i2s_mc_clks_enable(), platform_get_irq(), or
devm_request_irq() fails), pm_runtime_set_suspended(&pdev->dev) is not
called, leaving the runtime PM status marked active while the clocks are
disabled.

[ ... ]

> +static struct platform_driver cdns_i2s_mc_driver =3D {
> +	.probe =3D cdns_i2s_mc_probe,
> +	.driver =3D {
> +		.name =3D DRV_NAME,
> +		.pm =3D pm_ptr(&cdns_i2s_mc_pm_ops),
> +		.of_match_table =3D cdns_i2s_mc_of_match,
> +	},
> +};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019122048.1107=
179-1-joakim.zhang@cixtech.com?part=3D4
