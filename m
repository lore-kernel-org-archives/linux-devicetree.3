Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F474F405D
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413438; cv=none; b=rVh4o3zoJPxLgKHNfIT/e8SkfeFFihG6zZUG8LRBpX/vyC7uMAc3TD9tyu2SsmL0Ch5B2AzCucQbpNUNqKYdgRZwL/K5dquQr0t9aPM+ZDo5c7H8NwbYGojIYWHskWXGxEuzIVpCFIQ3wsXyWAl7YYctjNRNI3J2033yWNDw4wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413438; c=relaxed/simple;
	bh=Uo1zt15oybd0/IKH3o7yFvssSXXjG5XvYhiAMsr9U0A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=SYollJTGzjM9xA5XbKTnER5WlnU75X7w1FD0S4BPks7Y9q60IznxzcyENQHKPstUvJ6m27T1P347cl/fA74AKYhzrSESXTeQ/oFeFSczUd+TBnqIXz61ZbfcEE7ohCGGC9vhALH42HHuT+uSAoNPsEoAk2s5fSgtNiMy6nJ0AbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d6Gpcrme; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d6Gpcrme"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 393571F000C4;
	Mon, 19 Oct 2026 12:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792413424;
	bh=KAeDBb8yBWuITips46VkttLGoOURplWMqihWEoHwXhs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d6Gpcrmeil40p0N+hwDHA4ku0kK/RLQhuJzeVjKOOUhiqpmZiIOkUq0aZjsV3Tp9p
	 GCLhe7847VidOJuwERZPdVjrFUfmDE8AhdOQoSQBCiP0zkjI/EtiYHHQqMR/q5vr5Z
	 5NvWFuoO696T+1wO0pij8c6faqmTUSHir2gMXoZWgsB0dW1Xh6SqZndmxbBSkjoz1/
	 z13gFKSJe6Xg9ghSuQtxZhUUJpqirE9e9AUISZkM2Z24bvRQR/UukAliJd7r326IfQ
	 Cbuqy4Xv8uwK3QbgTsy25RVQgTDh74u/yp2GKQtjsXx/b2co/oSqbwI8VooFVfMF6I
	 ehoENix3d50Dw==
Message-ID: <sashiko-outbox-177076@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] ASoC: cdns: Add Cadence I2S-SC controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019122048.1107179-3-joakim.zhang@cixtech.com>
References: <20261019122048.1107179-1-joakim.zhang@cixtech.com>
 <20261019122048.1107179-3-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 12:37:03 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] ASoC: cdns: unbalanced clock enable in cdns_i2s_sc_probe() and o=
n unbind
- [Medium] ASoC: cdns: wrong devres ordering for IRQ and PM in cdns_i2s_sc_=
probe()
- [Medium] ASoC: cdns: cdns_i2s_sc_set_tdm_slot() rejects slots =3D=3D 0 to=
 disable TDM
--

commit 2113a0aa999e1c1986bfd71dc4824e99103d3036
Author: Joakim Zhang <joakim.zhang@cixtech.com>

ASoC: cdns: Add Cadence I2S-SC controller driver

This patch adds an ASoC CPU DAI driver for the Cadence I2S-SC controller
found in the CIX SKY1 audio subsystem. It supports full-duplex stereo I2S,
left/right-justified, DSP, and TDM modes with up to 16 slots, along with
runtime and system power management.

> diff --git a/sound/soc/cdns/cdns-i2s-sc.c b/sound/soc/cdns/cdns-i2s-sc.c
> new file mode 100644
> index 0000000000000..160a0ec573d72
> --- /dev/null
> +++ b/sound/soc/cdns/cdns-i2s-sc.c
> @@ -0,0 +1,1166 @@

[ ... ]

> +static int cdns_i2s_sc_set_tdm_slot(struct snd_soc_dai *cpu_dai, unsigne=
d int tx_mask,
> +				    unsigned int rx_mask, int slots, int slot_width)
> +{
> +	struct cdns_i2s_sc_priv *i2s_sc_priv =3D snd_soc_dai_get_drvdata(cpu_da=
i);
> +	struct device *dev =3D i2s_sc_priv->dev;
> +
> +	dev_dbg(dev, "tx_mask =3D 0x%x, rx_mask =3D 0x%x, slots =3D %d, slot_wi=
dth =3D %d\n",
> +		tx_mask, rx_mask, slots, slot_width);
> +
> +	if (slots < 1 || slots > 16) {
> +		dev_err(i2s_sc_priv->dev, "TDM mode supports 1 to 16 slots\n");
> +		return -EINVAL;
> +	}
> +
> +	if (slot_width < 8 || slot_width > 32) {
> +		dev_err(i2s_sc_priv->dev, "TDM slot width must be 8 to 32 bits\n");
> +		return -EINVAL;
> +	}
> +
> +	if ((tx_mask >> slots) || (rx_mask >> slots)) {
> +		dev_err(i2s_sc_priv->dev, "TDM slot mask has bits outside the slots\n"=
);
> +		return -EINVAL;
> +	}
> +
> +	i2s_sc_priv->tdm_config.slots =3D slots;
> +	i2s_sc_priv->tdm_config.slot_width =3D slot_width;
> +	i2s_sc_priv->tdm_config.rx_mask =3D rx_mask;
> +	i2s_sc_priv->tdm_config.tx_mask =3D tx_mask;
> +
> +	i2s_sc_priv->is_tdm_mode =3D true;
> +
> +	return 0;
> +}

[Severity: Medium]
How can a machine driver or generic card helper disable TDM mode once
cdns_i2s_sc_set_tdm_slot() has set i2s_sc_priv->is_tdm_mode to true?

In sound/soc/soc-dai.c, snd_soc_dai_set_tdm_slot() documents that TDM mode
is disabled by passing 0 for slots (with tx_mask, rx_mask, and slot_width
ignored) and forwards that call directly to ops->set_tdm_slot():

sound/soc/soc-dai.c:snd_soc_dai_set_tdm_slot() {
    /*
     * TDM mode can be disabled by passing 0 for @slots. In this case @tx_m=
ask,
     * @rx_mask and @slot_width will be ignored.
     */
}

Here in cdns_i2s_sc_set_tdm_slot(), slots =3D=3D 0 is rejected with -EINVAL=
 by
the slots < 1 check, and nothing else resets i2s_sc_priv->is_tdm_mode to
false. Should slots =3D=3D 0 set i2s_sc_priv->is_tdm_mode =3D false and ret=
urn 0?

[ ... ]

> +static int cdns_i2s_sc_probe(struct platform_device *pdev)
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
> +	ret =3D cdns_i2s_sc_clks_enable(i2s_sc_priv);
> +	if (ret) {
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return dev_err_probe(&pdev->dev, ret, "Failed to enable clocks\n");
> +	}
> +
> +	cdns_i2s_sc_rst(i2s_sc_priv);
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		ret =3D irq;
> +		goto err_disable_clks;
> +	}
> +	i2s_sc_priv->irq =3D irq;
> +
> +	ret =3D devm_request_irq(&pdev->dev, irq, cdns_i2s_sc_isr, 0,
> +			       dev_name(&pdev->dev), i2s_sc_priv);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
> +		goto err_disable_clks;
> +	}

[Severity: Medium]
Can devres teardown invoke cdns_i2s_sc_runtime_suspend() or
cdns_i2s_sc_runtime_resume() after the IRQ has already been freed?

In cdns_i2s_sc_probe(), devm_pm_runtime_enable() is registered before
devm_request_irq(). Because devres unwinds in reverse registration order,
free_irq() runs while runtime PM is still enabled.

If a runtime PM transition runs during teardown before pm_runtime_disable()
executes (for example, when component removal closes an active stream),
cdns_i2s_sc_runtime_suspend() and cdns_i2s_sc_runtime_resume() will call
disable_irq(i2s_sc_priv->irq) or enable_irq(i2s_sc_priv->irq) on the
already-freed IRQ.

Should devm_request_irq() be registered before enabling runtime PM (or with
IRQF_NO_AUTOEN before enabling clocks and runtime PM)?

> +
> +	/*
> +	 * Let pm_runtime_put_sync() disable the clocks, and take regcache effe=
ct.
> +	 * If CONFIG_PM is not enabled, the clock will stay powered.
> +	 */
> +	pm_runtime_put_sync(&pdev->dev);
> +
> +	ret =3D devm_snd_soc_register_component(&pdev->dev, &cdns_i2s_sc_compon=
ent,
> +					      &cdns_i2s_sc_dai, 1);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to register soc componen=
t\n");
> +
> +	return 0;
> +
> +err_disable_clks:
> +	cdns_i2s_sc_clks_disable(i2s_sc_priv);
> +	pm_runtime_put_noidle(&pdev->dev);
> +	return ret;
> +}

[Severity: Medium]
Does this leak the prepare and enable references on clk_hst and clk_i2s
when CONFIG_PM is disabled or when the device is runtime-active at teardown?

In cdns_i2s_sc_probe(), clk_hst and clk_i2s are acquired with devm_clk_get()
and manually enabled via cdns_i2s_sc_clks_enable(). Then
pm_runtime_put_sync() is used to drop the runtime PM usage count.

When CONFIG_PM is disabled (or if runtime suspend is prevented via sysfs
power/control), pm_runtime_put_sync() does not run
cdns_i2s_sc_runtime_suspend(), so clk_hst and clk_i2s remain prepared and
enabled. If devm_snd_soc_register_component() then fails,
cdns_i2s_sc_probe() returns without calling cdns_i2s_sc_clks_disable().

Similarly, cdns_i2s_sc_driver has no .remove callback and registers no devm
action to disable the clocks, and devm_pm_runtime_enable() only calls
pm_runtime_disable() on unbind without suspending the device. Unbinding the
driver while CONFIG_PM is disabled or while the device is runtime-active
will leave clk_hst and clk_i2s enabled when devm_clk_get() releases them.

In addition, on the earlier error paths in cdns_i2s_sc_probe() (when
devm_pm_runtime_enable(), cdns_i2s_sc_clks_enable(), platform_get_irq(), or
devm_request_irq() fails), pm_runtime_set_active() is not undone with
pm_runtime_set_suspended().

[ ... ]

> +static struct platform_driver cdns_i2s_sc_driver =3D {
> +	.probe =3D cdns_i2s_sc_probe,
> +	.driver =3D {
> +		.name =3D DRV_NAME,
> +		.pm =3D pm_ptr(&cdns_i2s_sc_pm_ops),
> +		.of_match_table =3D cdns_i2s_sc_of_match,
> +	},
> +};
> +module_platform_driver(cdns_i2s_sc_driver);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019122048.1107=
179-1-joakim.zhang@cixtech.com?part=3D2
