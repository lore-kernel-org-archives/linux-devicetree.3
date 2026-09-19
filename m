Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1FA424D41
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 10:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789812037; cv=none; b=IfqKK2fbFFiIaNfbcptKppsohvRy4k0N7VAVLBMEUQ1tUd/+B8rTm+D8/zjFkfWtTN69Z91zY2WdrvuR2yKOReoWQyNKNxcFgwLhSA9yhwhY1ohvBns10rTOJLK22onQNjW1E121d8DfGpDPUaN3a4hXT2qAkSXbS1HMa/W11Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789812037; c=relaxed/simple;
	bh=vgcz8UdHckMJq03zGcLken4Pm7AtO5iMAF0q2Z5mfSY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rVho3FxmA+kQD5tfUM+3d2aA1D3JT1fmb9UcQefBuict2TFMj1dKelVf3DqpFROyudcSPjEO3oe17p3+71hu93UmeCyUPRUqJTZmTMYJgHIOaqH0ipqqkLaFT5fKWvDFBxCBWtRstZv/pp8oFMTyTa1PCym+Rxy9OfQRUIuR+M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AmOnOESo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AmOnOESo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815701F000FF;
	Sat, 19 Sep 2026 10:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789812028;
	bh=skp3VnRm7o84Wdv4Q5AL3I8OuWFK8NKLvWabIpqpY8Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AmOnOESoqt42HZSiY47Xjz4e331zuRw3celEvX1Tli6e6l4uBPrnUQr8vGPet3gmV
	 Ezu5tho2bYU0OyB8QYjoL7pxL6OoPLG+oMZSu3xT7SyXhhm3CTB3IWcz/H+1EIWOHU
	 Z4RYfc5H2shYM+cH17U11L+VBuxn3oNspLf/mRT26VT9r6faLfyF6pWuudFg5cwcps
	 VLUX9V7QyEdZzdMZg0WuuD+XSdEcYRq3Lum7tVbn/JVP+/0cMCSXi9cOjKFotSkmYi
	 xK18hM5yXBgT0L43YFEyf897X07r+/cHBeXiqYWdU2rQQrsYxwiUrwciP3KaypJaX0
	 XdJOv+iVWcmFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] mmc: sdhci-of-dwcmshc: Add support for StarFive
 JHB100
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260919092950.178617-3-changhuang.liang@starfivetech.com>
References: <20260919092950.178617-1-changhuang.liang@starfivetech.com>
 <20260919092950.178617-3-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 19 Sep 2026 10:00:28 +0000
Message-Id: <20260919100028.815701F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] mmc: sdhci-of-dwcmshc: memory corruption due to 36-bit DMA mask wi=
th fixed offset
- [Medium] mmc: sdhci-of-dwcmshc: power leak due to unconditional cclk_tx r=
e-enable
--

commit e46c590ca0a75d2a6f76120b26e10916c916ffa1
Author: Changhuang Liang <changhuang.liang@starfivetech.com>

mmc: sdhci-of-dwcmshc: Add support for StarFive JHB100

Add support for the DWCMSHC controller found on the StarFive JHB100 SoC.
This configures the higher DMA address bits [35:32] through the PER1 SYSCON
and implements a clock wrapper to disable/enable cclk_tx around clock chang=
es.

> diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci=
-of-dwcmshc.c
> index 1baa2379c9c39..021b03c173127 100644
> --- a/drivers/mmc/host/sdhci-of-dwcmshc.c
> +++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
[ ... ]
> @@ -2257,6 +2266,145 @@ static const struct dwcmshc_pltfm_data sdhci_dwcm=
shc_hpe_gsc_pdata =3D {
>  	.init =3D dwcmshc_hpe_gsc_init,
>  };
> =20
> +static int sdhci_jhb100_set_dma_mask(struct sdhci_host *host)
> +{
> +	struct mmc_host *mmc =3D host->mmc;
> +	struct device *dev =3D mmc_dev(mmc);
> +	int ret;
> +
> +	/*
> +	 * The StarFive JHB100's CMSHC controller only has 32-bit DMA
> +	 * capability by default, but the higher DMA address bits [35:32]
> +	 * can be configured through SYSCON, thus supporting up to 36-bit
> +	 * DMA capability.
> +	 */
> +	ret =3D dma_set_mask_and_coherent(dev, DMA_BIT_MASK(36));
[Severity: High]
Does this falsely advertise full 36-bit dynamic addressability to the DMA A=
PI?

Looking at dwcmshc_starfive_jhb100_init(), it hardcodes the upper 4 bits
(DWCMSHC_ARWADDR_DEFAULT =3D 4):

    ret =3D regmap_update_bits(syscon, reg_offset, DWCMSHC_ARWADDR,
                             DWCMSHC_ARWADDR_DEFAULT);

This proves the hardware only accesses a fixed 32-bit physical memory window
and cannot dynamically utilize the advertised 36-bit range.

If the kernel allocates a DMA buffer at any physical address outside the
0x400000000 - 0x4FFFFFFFF window, will the hardware blindly apply the hardc=
oded
SYSCON offset to the transaction, redirecting the DMA access and silently
corrupting memory inside the 0x400000000 window instead?

> +	if (ret)
> +		dev_err(dev, "Failed to set 36-bit DMA mask.\n");
> +
> +	return ret;
> +}
> +
> +static void sdhci_jhb100_set_clock(struct sdhci_host *host, unsigned int=
 clock)
> +{
> +	struct sdhci_pltfm_host *pltfm_host =3D sdhci_priv(host);
> +	struct dwcmshc_priv *dwc_priv =3D sdhci_pltfm_priv(pltfm_host);
> +	struct jhb100_priv *priv =3D dwc_priv->priv;
> +
> +	/* the cclk_tx clock is disabled before sdhci_set_clock() to eliminate =
glitches */
> +	if (priv->cclk_tx_on) {
> +		clk_disable_unprepare(priv->cclk_tx);
> +		priv->cclk_tx_on =3D false;
> +	}
> +
> +	fsleep(15);
> +
> +	sdhci_set_clock(host, clock);
> +
> +	if (clk_prepare_enable(priv->cclk_tx))
[Severity: Medium]
Will this unconditionally reactivate the clock regardless of whether the MMC
core requested a zero clock frequency?

When the MMC subsystem enters suspend or becomes idle, it requests the clock
to be disabled by calling host->ops->set_clock(host, 0).=20

The sdhci_jhb100_set_clock() wrapper processes this by passing clock =3D 0 =
to
sdhci_set_clock(), which returns early and turns off the core clocks.

However, the wrapper then unconditionally executes
clk_prepare_enable(priv->cclk_tx), ignoring the fact that the MMC core
requested a full clock shutdown.

Could this leave the cclk_tx clock enabled indefinitely during system runti=
me
suspend and deep sleep, potentially preventing the SoC clock controller from
powering down the associated PLL or power domain?

> +		dev_err(mmc_dev(host->mmc), "failed to re-enable cclk_tx\n");
> +	else
> +		priv->cclk_tx_on =3D true;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260919092950.1786=
17-1-changhuang.liang@starfivetech.com?part=3D2
