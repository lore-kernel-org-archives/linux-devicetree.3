Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6C93CF210
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 09:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538651; cv=none; b=NyhDcdmHwQJtiZELcf5smFmWFezzvvTOIRUj9t/VC2gQN+M+d2AAvZpExOuwXk9eLY9JsXVOgmasfXhjNCH6O9LAuKw+5NtO6Drmg4eHQhOz4cq3qzeWdS9w0CypFKK66iH0szJGtm7HNKjhJg1ki57hPqoPWYvfFZO2yIt4D9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538651; c=relaxed/simple;
	bh=oZjwJO3yC9n2Usa2dHLUSQOFLVIa+PK4DZoKQAJ8NW4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=N/oipyZSJHSjbF7BGbLGTUVcXPW/qtXRISPgenbuEok31Yyq/CIkjXTsjRB3jStZLKXvPyE2izqp+YRDWh1BJVSLSBWJKM8dawQMyrRi6toLiEEts/siQH1hUEvYAw5qvSO6nMVjGKeNP7QAOT2Jnvwaz0wFVHN7RF391f2/ZI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQwJZJn8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQwJZJn8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85DB1F00893;
	Fri,  9 Oct 2026 09:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791538637;
	bh=3YgWoJHaX6T/KP734RVtu+2CSRu4O0GXTQ7QksCuOHA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IQwJZJn8gfM4C7OdeIO0ZMS551rNiyieCGF9OLolYS1IYCtlOlQwFLgjrkkzz0HqJ
	 Lb46Adbxans+J8VgMomfrW5VK8tLSJvEPw7G8HAMBzHjaxRRk+lJjMjRDaq4rt4K/v
	 YsqN7JO7PLQahyHz/keYX0guj2fowweiDkaVg5nbVesMqZXhmKbTIkVHZb1fO7qkVM
	 40mAsyoEcKQ66aI4yWmzTG3UEVCP994EIVnMIBicnnMMGTIptGrR+gZM2CzUeHu5qF
	 N6UAULcqB5x3uDnG+c2ZQgC174/LvBlNvk066psROnXkJNjFvFtYEMjJ2zTRqVC4rP
	 xDoH41bfA+SZw==
Message-ID: <sashiko-outbox-165176@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] ASoC: cdns: Add Cadence I2S-SC controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261009092552.2377960-3-joakim.zhang@cixtech.com>
References: <20261009092552.2377960-1-joakim.zhang@cixtech.com>
 <20261009092552.2377960-3-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 09:37:16 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] asoc: inverted master/slave clock provider configuration in set_fmt
- [High] regmap: racy read-modify-write on volatile interrupt status regist=
er I2S_STAT
- [Medium] pm: missing devm action or .remove callback leaves clocks perman=
ently enabled
- [Low] kconfig: missing select REGMAP_MMIO causes build failure
--

commit c5bda621f50576e786b53bd1505239571117bd15
Author: Joakim Zhang <joakim.zhang@cixtech.com>
Subject: ASoC: cdns: Add Cadence I2S-SC controller driver

Add support for the Cadence I2S-SC controller found in the CIX SKY1
audio subsystem.

> diff --git a/sound/soc/cdns/Kconfig b/sound/soc/cdns/Kconfig
> new file mode 100644
> index 0000000000000..631e2e0764cb9
> --- /dev/null
> +++ b/sound/soc/cdns/Kconfig
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config SND_SOC_CDNS_I2S_SC
> +	tristate "Cadence I2S-SC controller support"
> +	depends on ARCH_CIX || COMPILE_TEST
> +	select SND_SOC_GENERIC_DMAENGINE_PCM

[Severity: Low]
Since this driver unconditionally calls devm_regmap_init_mmio() to manage i=
ts
registers, should this also select REGMAP_MMIO?

If it is built (e.g., via COMPILE_TEST) without another driver selecting it,
it could cause an undefined reference to __devm_regmap_init_mmio_clk during
the link stage.

> diff --git a/sound/soc/cdns/cdns-i2s-sc.c b/sound/soc/cdns/cdns-i2s-sc.c
> new file mode 100644
> index 0000000000000..160a0ec573d72
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
> +	if (regmap_read(i2s_sc_priv->regmap, I2S_STAT, &stat))
> +		return IRQ_NONE;
> +
> +	stat &=3D I2S_STAT_TDATA_UNDERR | I2S_STAT_RDATA_OVERR;
> +	if (!stat)
> +		return IRQ_NONE;
> +
> +	/* Clear the status */
> +	regmap_update_bits(i2s_sc_priv->regmap, I2S_STAT, stat, 0);

[Severity: High]
Is it safe to use regmap_update_bits() here to clear the interrupt status?

I2S_STAT is correctly marked as a volatile register in the regmap
configuration, but regmap_update_bits() performs a non-atomic physical
read-modify-write cycle.

If the hardware uses Write-1-to-Clear (W1C) or Write-0-to-Clear (W0C)
semantics, this read-modify-write might accidentally clear unhandled events
or permanently drop new interrupts asserted between the read and write.

Could we use a direct regmap_write() here instead?

[ ... ]
> +static int cdns_i2s_sc_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int=
 fmt)
> +{
[ ... ]
> +	/* DAI hardware clock masters */
> +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +	case SND_SOC_DAIFMT_CBC_CFC:
> +		ctrl &=3D ~I2S_CTRL_MS_CFG;
> +		i2s_sc_priv->is_master_mode =3D false;
> +		break;
> +	case SND_SOC_DAIFMT_CBP_CFP:
> +		ctrl |=3D I2S_CTRL_MS_CFG;
> +		i2s_sc_priv->is_master_mode =3D true;
> +		break;

[Severity: High]
Are these clock provider configurations inverted?

In the ASoC framework, SND_SOC_DAIFMT_CBC_CFC means the Codec is the
Bitclock/Frame Consumer, which makes the CPU DAI (this controller) the
Provider (Master).

SND_SOC_DAIFMT_CBP_CFP means the Codec is the Provider, so the CPU DAI must
be the Consumer (Slave).

The driver logic seems to do the exact opposite. Will this cause bus
contention by actively driving clocks when the codec is already doing so?

[ ... ]
> +static int cdns_i2s_sc_probe(struct platform_device *pdev)
> +{
[ ... ]
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

[Severity: Medium]
If devm_snd_soc_register_component() fails here, the probe function returns
directly, bypassing the err_disable_clks label.

Does this leak the clocks if CONFIG_PM is disabled (since
pm_runtime_put_sync() would be a no-op)?

[ ... ]
> +static struct platform_driver cdns_i2s_sc_driver =3D {
> +	.probe =3D cdns_i2s_sc_probe,
> +	.driver =3D {
> +		.name =3D DRV_NAME,
> +		.pm =3D pm_ptr(&cdns_i2s_sc_pm_ops),
> +		.of_match_table =3D cdns_i2s_sc_of_match,
> +	},
> +};

[Severity: Medium]
I noticed there is no .remove callback or devm_add_action_or_reset() cleanup
for the hardware clocks enabled during probe.

During driver unbind, the driver core calls pm_runtime_get_sync() (waking t=
he
device and enabling clocks if they were suspended) followed by
pm_runtime_disable().

Without a .remove callback to force suspend or manually disable them, does
this leave the clocks permanently enabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009092552.2377=
960-1-joakim.zhang@cixtech.com?part=3D2
