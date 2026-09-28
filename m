Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F3F3B1035
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 05:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790574472; cv=none; b=Ec+zHlf6Nv+v3pO5TwFOULmticEiuDzzaT0IybLkrgw6sPvt+1UwRjxNyB4rcuvSEuU/QhzQA31vjzJ6y1DRA7g6Nq9ng5G3kg8QwT8jPSYpox9EqaIa4YfGxvUBJdyV5zQ2hz/qdfITbwDBoYZtYMtGlFdz6g+xLlBaumVCtsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790574472; c=relaxed/simple;
	bh=CC/krtWayHo0bBrcV0NXfYiJKk9PPnQvwQ840AVecNs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eSYhRALPeRtpN6XAcqbF2ZoAb84prcPgxfBDY2ltfSSVOaMN3d72EJwQqxwCkNANMZU6B1+ja8ZoQTv+KS3JJg3S80A1SksRmeVgk55Q6lmysHa4jHGQKOi110bBBIbmuPKL66+SdiAWoYxOUKJkVrsWAI9fXeFf6d2FRA0dUEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SmYrs3sd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SmYrs3sd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 736711F000FF;
	Mon, 28 Sep 2026 05:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790574466;
	bh=ssEDeAgZFI9UtsGcnHKDu0M9MJ4pQZu6PHoJPsAsreY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SmYrs3sdN+AUykBXDR5vUmJSZa3hygOxLCIy+oUtXUpW3Bd/B/2/wDOgqrw9b1UbL
	 QKd0Uc+AVX6SICv1jkp4ZvDTF+WdFQ5iziIZt1VUaGGZPMburNyjvf/+sIPJwN1TE3
	 tG+APWdKPdiMrjMUSkL2jNK1mghRIWkYDV5kLdF2AKTCjb4dx6V0NFWdi+K54/eciA
	 SKKfNFPgM1T9WpuA2KjT5PJy45gOrH17z/SJRv+S8Dr5Nc4Wu5uzNyW+PGdvE8guek
	 ZDC9aCNYpJprC18jm7CLaS06s/PxytS+SlMrL5dmzgT69aarhAQCZ2aQcYSdQc+EiN
	 I+TakFWOfiKUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] ASoC: cdns: Add Cadence I2S-SC controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260928053613.2158446-3-joakim.zhang@cixtech.com>
References: <20260928053613.2158446-1-joakim.zhang@cixtech.com>
 <20260928053613.2158446-3-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 05:47:45 +0000
Message-Id: <20260928054746.736711F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] sound/soc/cdns: resource leak in probe error paths
- [High] sound/soc/cdns: missing remove callback causes clock leak and unba=
lanced IRQ
- [High] sound/soc/cdns: race condition in ISR dropping interrupts via regm=
ap_update_bits
- [High] sound/soc/cdns: inverted ALSA DAI master/slave format mapping
--

commit 56f3604b0b0ce570297b51aeb442be0b9378dd2b
Author: Joakim Zhang <joakim.zhang@cixtech.com>

ASoC: cdns: Add Cadence I2S-SC controller driver

This commit introduces the driver for the Cadence I2S-SC controller found in
the CIX SKY1 audio subsystem. It supports full-duplex stereo playback and
capture in standard I2S, left/right-justified, and DSP modes, as well as TDM
operation.

> diff --git a/sound/soc/cdns/cdns-i2s-sc.c b/sound/soc/cdns/cdns-i2s-sc.c
> new file mode 100644
> index 0000000000000..99ba7e34a06f1
> --- /dev/null
> +++ b/sound/soc/cdns/cdns-i2s-sc.c

[ ... ]

> @@ -412,18 +412,18 @@ static irqreturn_t cdns_i2s_sc_isr(int irq, void *d=
evid)
>  	if (regmap_read(i2s_sc_priv->regmap, I2S_STAT, &stat))
>  		return IRQ_NONE;
> =20
>  	stat &=3D I2S_STAT_TDATA_UNDERR | I2S_STAT_RDATA_OVERR;
>  	if (!stat)
>  		return IRQ_NONE;
> =20
>  	/* Clear the status */
>  	regmap_update_bits(i2s_sc_priv->regmap, I2S_STAT, stat, 0);

[Severity: High]
Does this create a race condition that can drop concurrent interrupts?

In cdns_i2s_sc_isr(), regmap_update_bits() performs a read-modify-write on a
volatile interrupt status register. If a new interrupt arrives between the
read and the write, writing back the modified value will incorrectly clear
the newly arrived interrupt or fail to clear the handled ones, depending on
whether the register is W0C or W1C.

Should this use regmap_write() directly to avoid losing hardware interrupts?

[ ... ]

> @@ -495,19 +495,19 @@ static int cdns_i2s_sc_set_fmt(struct snd_soc_dai *=
cpu_dai, unsigned int fmt)
>  		return -EINVAL;
>  	}
> =20
>  	/* DAI hardware clock masters */
>  	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
>  	case SND_SOC_DAIFMT_CBC_CFC:
>  		ctrl &=3D ~I2S_CTRL_MS_CFG;
>  		i2s_sc_priv->is_master_mode =3D false;
>  		break;
>  	case SND_SOC_DAIFMT_CBP_CFP:
>  		ctrl |=3D I2S_CTRL_MS_CFG;
>  		i2s_sc_priv->is_master_mode =3D true;
>  		break;

[Severity: High]
Does this code invert the ALSA DAI master/slave format mapping?

When the machine driver requests SND_SOC_DAIFMT_CBC_CFC (Codec Clock
Consumer, meaning CPU is Master), the driver clears I2S_CTRL_MS_CFG and sets
is_master_mode =3D false, configuring the CPU DAI as a slave.

Conversely, when requested to be a slave (SND_SOC_DAIFMT_CBP_CFP), it
configures the CPU DAI as a master. Does this prevent correct audio
playback and capture?

[ ... ]

> @@ -950,20 +950,20 @@ static int cdns_i2s_sc_probe(struct platform_device=
 *pdev)
>  	ret =3D cdns_i2s_sc_clks_enable(i2s_sc_priv);
>  	if (ret) {
>  		dev_err_probe(&pdev->dev, ret, "Failed to enable clocks\n");
>  		pm_runtime_put_noidle(&pdev->dev);
>  		return ret;
>  	}
> =20
>  	cdns_i2s_sc_rst(i2s_sc_priv);
> =20
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq < 0)
>  		return irq;

[Severity: High]
Does this error path leak manually enabled clocks and the PM runtime usage
counter?

If platform_get_irq() fails, the function returns directly without dropping
the PM runtime reference (pm_runtime_put_noidle()) or disabling the clocks
(cdns_i2s_sc_clks_disable()). This prevents the device from entering low
power states and prevents clock gating if this error path is taken.

>  	i2s_sc_priv->irq =3D irq;
> =20
>  	ret =3D devm_request_irq(&pdev->dev, irq, cdns_i2s_sc_isr, 0,
>  			       dev_name(&pdev->dev), i2s_sc_priv);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
>  		pm_runtime_put_noidle(&pdev->dev);
>  		return ret;
>  	}

[Severity: High]
Does this error path fail to disable the clocks?

If devm_request_irq() fails, it correctly drops the PM runtime reference by
calling pm_runtime_put_noidle(), but it fails to call
cdns_i2s_sc_clks_disable(). This leaves the clocks permanently enabled on
this error path.

[ ... ]

> @@ -1146,13 +1146,13 @@ static const struct of_device_id cdns_i2s_sc_of_m=
atch[] =3D {
>  MODULE_DEVICE_TABLE(of, cdns_i2s_sc_of_match);
> =20
>  static struct platform_driver cdns_i2s_sc_driver =3D {
>  	.probe =3D cdns_i2s_sc_probe,
>  	.driver =3D {
>  		.name =3D DRV_NAME,
>  		.pm =3D pm_ptr(&cdns_i2s_sc_pm_ops),
>  		.of_match_table =3D cdns_i2s_sc_of_match,
>  	},
>  };

[Severity: High]
Is this missing a .remove callback to symmetrically tear down manually
enabled clocks and IRQ states?

In cdns_i2s_sc_driver, there is no .remove callback. If the driver is
unbound via sysfs or module removal, the driver core resumes the device (if
suspended) before unbind, but the manually enabled clocks are never
disabled.

Additionally, this could leave the hardware IRQ disabled permanently if
unbound while runtime-suspended, which triggers a kernel warning on
free_irq() and prevents the IRQ from being reused. Should a .remove callback
be added to properly release these resources?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928053613.2158=
446-1-joakim.zhang@cixtech.com?part=3D2
