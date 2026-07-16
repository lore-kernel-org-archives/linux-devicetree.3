Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE97C3385B9
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 15:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784215485; cv=none; b=tqOX1DWixnXcIQ1JjVzOlJY0B0h+PVshPtMU0UfxaJNt2RIyHkipleZajpB43lqmm3644SUszYkR0Ehd0zDPXGnOeKSLR4msNQ8NQ/wYipKVbrEOZ4IHGpW7RMFUPJ/57GbTG8MrVy59u/toYu5dKGoejOUktTA9ERxJeBcQovE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784215485; c=relaxed/simple;
	bh=UQeLihb1h++U4w2pnSJPMjEjKX2YkiH+AwCMPslTrl4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u+/ATGBcwqQwCsO5wii1L0wrH1rJ91zqonUR2aeuiPSwt7f2IYCLYYKJBnXUNEETagLQotZn6oHOlod/Ae1laEayZ6T+nN7jLTwgv72oCIeANzOdpNby6/nKFGfAXdShxxiufY6WUL6hyQqBKy0VghulBdIZ3bEcPALl+UIubkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CaV5Xx/D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CaV5Xx/D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBAF61F000E9;
	Thu, 16 Jul 2026 15:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784215482;
	bh=U2trcA6L3CTjGQWJ6mgCr1miHu8mbNzhU2EhWWWwyOM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CaV5Xx/DbxEqC99W7S7ZMQWY1N8WUdnPWrig+3PtktIfO6Fg65alouQTPIftCxc7r
	 vGezfBHXS65JPbzK9AWjOTuipQ87aPeRqMbVVEArQu17T4qJlXdd9EpUcWaAfMlS+s
	 T94bUNB7Jax280wTeOVqiekmO52OD5dKZhqrglPYThc2Z+u6aMnglcHT0208XM0fFl
	 e3AhSZySLdo/a4XPDNz7g23vFjsYTt9J6m9vRj8N1w4IQcSs3M1yQsA3ThhT1KYo7k
	 ZvJMOulfrp8g4Z3U98aKUkRPoDoIuhQnEnFbAjP1X8hAF9fQThQgz8LG7CbhkoAoqr
	 GaRHY2jf9AqCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] phy: mediatek: Add support for PCI-Express Gen4
 S-PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, conor+dt@kernel.org, robh@kernel.org, vkoul@kernel.org
In-Reply-To: <20260716151333.77254-3-angelogioacchino.delregno@collabora.com>
References: <20260716151333.77254-1-angelogioacchino.delregno@collabora.com>
 <20260716151333.77254-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 15:24:41 +0000
Message-Id: <20260716152441.EBAF61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] The 4-bit bitfields in `struct mtk_pcie_sphy_imp_sel` will silentl=
y truncate 5-bit TX impedance calibration values.
- [High] Probe fails when CONFIG_NVMEM is disabled due to unhandled -EOPNOT=
SUPP.
- [Medium] Unconditional read of lane 1 calibration data needlessly disable=
s calibration entirely for 1-lane PHYs.
- [Medium] Valid calibration data containing the value '0' incorrectly abor=
ts the entire calibration process.
- [Medium] PHY provider is registered before Runtime PM is enabled, creatin=
g a probe race condition.
- [Low] Expected missing calibration data and probe deferrals trigger uncon=
ditional dev_err() logs.
- [Low] Missing `#include <linux/pm_runtime.h>` while using `devm_pm_runtim=
e_enable()`.
--

--- Patch [2]: [PATCH 2/2] phy: mediatek: Add support for PCI-Express Gen4 =
S-PHY ---
commit 7cbdba90e32bbdc889bb04306231fd5de6141303
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

phy: mediatek: Add support for PCI-Express Gen4 S-PHY

Add support for the PCI-Express Gen4 S-PHY found in the latest
MediaTek SoCs, including MT8196, MT8894 and similar.

> diff --git a/drivers/phy/mediatek/phy-mtk-pcie-sphy.c b/drivers/phy/media=
tek/phy-mtk-pcie-sphy.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/phy/mediatek/phy-mtk-pcie-sphy.c
> @@ -0,0 +1,560 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022 MediaTek Inc.
> + * Copyright (c) 2026 Collabora Ltd.
> + *                    AngeloGioacchino Del Regno <angelogioacchino.delre=
gno@collabora.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/module.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>

[Severity: Low]
Does this need linux/pm_runtime.h included since devm_pm_runtime_enable()
is used later in the file?

[ ... ]

> +/**
> + * struct mtk_pcie_sphy_imp_sel - Impedance Selection parameters
> + * @pmos: Impedance selection for P-Channel MOSFET
> + * @nmos: Impedance selection for N-Channel MOSFET
> + */
> +struct mtk_pcie_sphy_imp_sel {
> +	u8 pmos : 4;
> +	u8 nmos : 4;
> +};

[Severity: High]
Can this truncate calibration values? The eFuse data read for tx-lanes-pmos
and tx-lanes-nmos uses FIELD_MAX(RG_XTP_LN_TX_IMPSEL_PMOS), which is
GENMASK(4, 0), allowing 5-bit values up to 31. Will values greater than 15
be silently truncated here?

[ ... ]

> +static int mtk_pcie_sphy_get_one_cal_para(struct device *dev, const char=
 *name, u8 max_val)
> +{
> +	u16 buf;
> +	u8 tmp;
> +	int ret;
> +
> +	/*
> +	 * All of the calibrations are always max 8 bits long, but some may
> +	 * be split between two different 8-bits cells: handle this corner
> +	 * case by retrying reading as u16.
> +	 */
> +	ret =3D nvmem_cell_read_u8(dev, name, &tmp);
> +	if (ret =3D=3D 0)
> +		buf =3D tmp;
> +	else
> +		ret =3D nvmem_cell_read_u16(dev, name, &buf);
> +
> +	if (ret) {
> +		dev_err(dev, "Cannot get calibration data for %s: %d\n", name, ret);
> +		return ret;
> +	};

[Severity: Low]
Does this unconditionally log an error for expected missing cells (-ENOENT)
or during probe deferral (-EPROBE_DEFER)?

> +
> +	if (buf =3D=3D 0) {
> +		dev_warn(dev, "No calibration for %s. Using defaults\n", name);
> +		return -ENOENT;
> +	}

[Severity: Medium]
Is 0 an invalid calibration value?

Later code checks if the calibration version is <=3D 4, which implies versi=
on
0 could exist. If a valid cell contains 0, will this mistakenly abort the
entire calibration process?

[ ... ]

> +static int mtk_pcie_sphy_get_calibration_data(struct mtk_pcie_sphy *pcie=
_sphy)
> +{

[ ... ]

> +	ret =3D mtk_pcie_sphy_get_one_cal_para(dev, "tx-ln0-rswn",
> +					     FIELD_MAX(RG_XTP_LN_TX_RSWN_IMPSEL));
> +	if (ret < 0)
> +		goto end;
> +	cal->tx_rswn_impsel[0] =3D ret;
> +
> +	ret =3D mtk_pcie_sphy_get_one_cal_para(dev, "tx-ln1-rswn",
> +					     FIELD_MAX(RG_XTP_LN_TX_RSWN_IMPSEL));
> +	if (ret < 0)
> +		goto end;
> +	cal->tx_rswn_impsel[1] =3D ret;

[Severity: Medium]
Will this break calibration on 1-lane PHYs?

If num_lanes is 1, the device tree might naturally omit lane 1 data. Would
the read for tx-ln1-rswn then return -ENOENT and cause all valid lane 0
calibration to be discarded?

[ ... ]

> +end:
> +	if (ret < 0) {
> +		/*
> +		 * If any of the calibration values is missing, or if there is
> +		 * no calibration at all in the eFuses, this is not a problem,
> +		 * as the PHY doesn't require one to actually work.
> +		 */
> +		if (ret =3D=3D -ENOENT) {
> +			cal->supported =3D false;
> +			return 0;
> +		}
> +		return ret;
> +	};

[Severity: High]
If the kernel is compiled without CONFIG_NVMEM, nvmem_cell_read_u8 returns
-EOPNOTSUPP. Does this cause the entire PHY probe to fail on systems without
NVMEM, even though calibration is optional?

[ ... ]

> +static int mtk_pcie_sphy_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	if (IS_ERR(provider))
> +		return dev_err_probe(dev, PTR_ERR(provider),
> +				     "Could not register PCI-Express S-PHY\n");
> +
> +	ret =3D devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}

[Severity: Medium]
Could registering the PHY provider before enabling Runtime PM lead to a race
condition?

If a consumer driver probes concurrently and immediately calls phy_init(),
could it try to interact with the device before devm_pm_runtime_enable() has
completed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716151333.7725=
4-1-angelogioacchino.delregno@collabora.com?part=3D2
