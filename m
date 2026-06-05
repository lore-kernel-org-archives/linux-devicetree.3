Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0351D4D2EC1
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 11:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780657341; cv=none; b=uP/6ufUrSsaMdz6tPhTYK73vcU6g/blvrtWjrXLoHYmNyklcNXXHXADHZXh/9FBBLsRdldE9pFZftk5sKNkNJFpaOB8rTRV7PYVXFkXmHSBC0qjYT6mR/PMlFcXG+8hdSGznVH8abUph9dUtM5Res9NrKFeas+C6LoK080ckBzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780657341; c=relaxed/simple;
	bh=nl02YEq7sZPA5oj8nsu45AmKEX0aB5pdRyBs7RbQgsU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GP3Wo5mHkOrlERu0nPq9KnNZoycO46wbRN6tm5We0oNXt5vucJmP03XyPy6G1hTvULXv2h/heMC0f4aXT7RYzB2wsJPTxnFR10JYlMNVhesJHQESInZKowznRqc7Pjl8fI7bAnkCASwD6eEtHE/VS9X9Cb73WgECdkb+ixP/968=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6Zgm66D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6Zgm66D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B4501F00893;
	Fri,  5 Jun 2026 11:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780657339;
	bh=YQaoIUExIMzdrJm/CtspNpPzxZEcZFl9sw7EXzzTcXM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U6Zgm66DcKUaBa7vQnESQkrJsmV24Bt2/Q78zxPCa4Qp4gG81EB2/GxSKp4PofHGv
	 EOif3t1zklMZITcqxlnJuuzwI38IZXBOIru6gr2hGUcyfzkPviiiGEKpwG3+rSRyxU
	 tYej5aDqmpMNMDltAknvOqcWdK9YrsmB91miTpzTfeg1KHzUx3MFtyzb34+Y7RGdCd
	 teFakwbBouqmu1pV7wO6vsNxZNfrZnfXCmFhT5uP4ik68fVqbFpma2vV0CIRAZD6fU
	 rcnQtAuUz4TtLuPoagKgyBoSm/XkX540Jc9YaNBXyPPQHFluIU/Pa5fNh1GNIQNqBi
	 mQtt3SCR5nm0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/13] ASoC: qcom: Add Shikra QAIF support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260605103739.3557573-14-harendra.gautam@oss.qualcomm.com>
References: <20260605103739.3557573-14-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 11:02:18 +0000
Message-Id: <20260605110219.5B4501F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Core clocks are disabled in `remove()` before devres unregisters t=
he ALSA component and IRQ handler, creating a race condition for bus crashe=
s.
- [Low] DAI mapping arrays are missing the `static` keyword, polluting the =
global namespace.
- [Low] Latent build breakage risk due to `module_platform_driver()` within=
 a variant file linked into a generic module.
- [Low] Using `of_match_ptr()` with an unconditionally defined match table =
triggers compiler warnings when `CONFIG_OF` is disabled.

Pre-existing issues:
- [High] Unprotected increment and decrement of the global reference counte=
r `qaif_init_ref_cnt`.
--

commit 977cd466322e3f1bab9395ba1c325fb256edb595
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add Shikra QAIF support

This commit adds the Shikra variant data for the Qualcomm Audio Interface
driver. It provides the register layout, DMA-to-DAI mappings, clocks, and
DAI descriptors required to enable playback or capture on Shikra platforms.
The new file is built as part of the snd-soc-qcom-qaif module.

[ ... ]

> diff --git a/sound/soc/qcom/qaif-shikra.c b/sound/soc/qcom/qaif-shikra.c
> new file mode 100644
> index 0000000000000..e835645030879
> --- /dev/null
> +++ b/sound/soc/qcom/qaif-shikra.c
> @@ -0,0 +1,585 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * qaif-shikra.c -- ALSA SoC CPU-Platform DAI driver for QTi QAIF
> + */
> +
> +#include <linux/module.h>
> +#include <sound/pcm.h>
> +#include <sound/soc.h>
> +#include <linux/pm.h>
> +#include "qaif.h"
> +
> +struct qaif_dmaidx_dai_map shikra_aif_dma_dai_map[] =3D {
> +		{ QAIF_MI2S_TDM_AIF0 },
> +		{ QAIF_MI2S_TDM_AIF1 },
> +		{ QAIF_MI2S_TDM_AIF2 },
> +		{ QAIF_MI2S_TDM_AIF3 }
> +};
> +
> +struct qaif_dmaidx_dai_map shikra_cif_rx_dma_dai_map[] =3D {
> +		{ QAIF_CDC_DMA_RX0 },
> +		{ QAIF_CDC_DMA_RX1 },
> +		{ QAIF_CDC_DMA_RX2 },
> +		{ QAIF_CDC_DMA_RX3 }
> +};
> +
> +struct qaif_dmaidx_dai_map shikra_cif_tx_dma_dai_map[] =3D {
> +		{ QAIF_CDC_DMA_TX0 },
> +		{ QAIF_CDC_DMA_TX1 },
> +		{ QAIF_CDC_DMA_TX2 },
> +		{ QAIF_CDC_DMA_TX3 }
> +};
> +
> +struct qaif_dmaidx_dai_map shikra_cif_va_dma_dai_map[] =3D {
> +		{ QAIF_CDC_DMA_VA_TX0 },
> +		{ QAIF_CDC_DMA_VA_TX1 },
> +		{ QAIF_CDC_DMA_VA_TX2 },
> +		{ QAIF_CDC_DMA_VA_TX3 }
> +};

[Severity: Low]
Are these mapping arrays intended to be globally visible?

Since they appear to only be used locally in shikra_qaif_get_dma_idx(),
could they be marked static to prevent namespace pollution and avoid
sparse warnings?

[ ... ]

> +static int shikra_qaif_exit(struct platform_device *pdev)
> +{
> +	struct qaif_drv_data *drvdata =3D platform_get_drvdata(pdev);
> +
> +	if (!drvdata || !drvdata->clks)
> +		return -EINVAL;
> +
> +	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
> +	return 0;
> +}

[Severity: High]
Does disabling core clocks here create a race condition during teardown?

If shikra_qaif_exit() disables clocks directly from the remove() callback,
devm-managed resources like the QAIF IRQ handler and ALSA component will
still be active since devres cleanup happens after remove() completes.

If an IRQ fires or userspace accesses ALSA during this window, could
accessing the unclocked regmap trigger a synchronous external abort?

[ ... ]

> +static struct platform_driver shikra_qaif_cpu_platform_driver =3D {
> +	.driver =3D {
> +		.name =3D "shikra-qaif-cpu",
> +		.of_match_table =3D of_match_ptr(shikra_qaif_cpu_device_id),

[Severity: Low]
Could using of_match_ptr() here cause a compiler warning when CONFIG_OF is
disabled?

The shikra_qaif_cpu_device_id array is compiled unconditionally, so if
of_match_ptr() evaluates to NULL on non-OF builds, the array would be
left unreferenced.

> +		.pm =3D &shikra_qaif_pm_ops,
> +	},
> +	.probe =3D asoc_qcom_qaif_cpu_platform_probe,
> +	.remove =3D asoc_qcom_qaif_cpu_platform_remove,
> +	.shutdown =3D asoc_qcom_qaif_cpu_platform_shutdown,
> +};
> +module_platform_driver(shikra_qaif_cpu_platform_driver);

[Severity: Low]
Does using module_platform_driver() in a variant file cause issues for the
generic module?

Since snd-soc-qcom-qaif.ko links multiple object files, tying the module's
init and cleanup symbols directly to the Shikra variant might cause a multi=
ple
definition build failure if another variant file is added later that also
calls module_platform_driver().

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem in the
linked qaif-platform.c driver. When qaif_platform_pcmops_open() increments
the counter:

qaif_platform_pcmops_open()
    drvdata->qaif_init_ref_cnt++;

Since different DAIs map to different ALSA PCM streams, their open and
close callbacks can execute concurrently. Does this non-atomic increment
allow two concurrent opens to both read the counter as 0, race on the
hardware initialization, and corrupt the refcount?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605103739.3557=
573-1-harendra.gautam@oss.qualcomm.com?part=3D13
