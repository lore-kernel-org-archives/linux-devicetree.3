Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A20F4968F9
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 12:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908978; cv=none; b=pYifE7tAhuxjK9aLf6HNhStgo3F4L6EP+BrLHcZ48462+cOyZJS4oMWEAW2LN623NS46dSid0xw5+iFq8m6+406Q5t5jfaYX4s0pe/DVqrqeveYMhJhZF3Orcuqoco53FG1A65VNEjzb3me9wdYhTQYSULn/SEUsl0GZRv2F2NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908978; c=relaxed/simple;
	bh=v5n9hldjraRE6JheV9CEf2fzm78npHwKLo9KlipNyXc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=foTqi0285OvVPaQhDMTIPbISEVWCpKjsDyKMmak+BxhYuVe4ShSlq4gUL24b+CsxTCaF8PiFXAIh5nFnphoEyWhbbUYESZOUDwTr1CyHPjhcsLhneM6FA6vj6cK78Xu68CeykXOuMiF1PD3+nrcfaAkJhLeplP1vftCmWJP3Lkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XJfKcoTZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XJfKcoTZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E7B1F000E9;
	Wed,  1 Jul 2026 12:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782908976;
	bh=iUpFgLeb06YeTcU+DB6rOQqDIVRGSbEfP+/YlJuD05A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XJfKcoTZzBb192FAEr9Z2W203f1uirEyWwoZ/tFs15BUFc0z14IXalCCaf1H4w77u
	 SGh5wAbhl2Zx7NKL/c7LfYlgpTG8VSh3XqP2ZTFoXa4M2nAqplbukTBAf5lTDyzJ1L
	 wCfhpb9MAXpQIAqX11uzLdQddDE9pMeN3XFR/o78Wt8kZn6V/j3dxRxe1UVrPVh+5v
	 WvWTLbsNfKabbQJnikcc/NT3bPS0cmr8fbb3WzUVeApzA+xaV6vYKen/fld1axZmVn
	 hUMQ6OcyYD5/JlcS8TlO/S1IBiI/paZnSO2xOqjN4Lylyl3Yho+u0XzqJDANaxzdh4
	 3SWlpbS2RkWuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] phy: mediatek: Add support for MT8196 MIPI DSI PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: olteanv@gmail.com, neil.armstrong@linaro.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260701121943.19430-3-angelogioacchino.delregno@collabora.com>
References: <20260701121943.19430-1-angelogioacchino.delregno@collabora.com>
 <20260701121943.19430-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 12:29:35 +0000
Message-Id: <20260701122936.58E7B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Calling usleep_range() inside a clk_ops->enable callback will trig=
ger a 'scheduling while atomic' BUG.
- [Medium] The PLL rate is clamped to a maximum of 1.6 GHz, rendering the n=
ew high-speed voltage logic for rates >=3D 2.0 GHz completely unreachable.
--

commit af99b6688956e76bb38344e38d2af3b56056ec47
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

phy: mediatek: Add support for MT8196 MIPI DSI PHY

Add support for the MIPI DSI PHY found in the MediaTek MT8196 SoC
and its variants. This initial driver only adds support for basic
functionality that is necessary to drive MIPI DSI displays as a D-PHY.

> diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8196.c b/drivers/phy=
/mediatek/phy-mtk-mipi-dsi-mt8196.c
> new file mode 100644
> index 0000000000000..273f236fa7e9e
> --- /dev/null
> +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8196.c

[ ... ]

> +static int mtk_mipi_tx_pll_enable(struct clk_hw *hw)
> +{
> +	struct mtk_mipi_tx *mipi_tx =3D mtk_mipi_tx_from_clk_hw(hw);
> +	void __iomem *base =3D mipi_tx->regs;
> +	u32 voltage =3D RG_DSI_PRD_REF_MINI;
> +	u32 pres =3D MIPITX_PRESERVED_MINI;
> +	unsigned long long pcw_calc;
> +	unsigned int txdiv, txdiv0;
> +	u32 pcw;
> +
> +	dev_dbg(mipi_tx->dev, "enable: %u bps\n", mipi_tx->data_rate);
> +
> +	if (mipi_tx->data_rate >=3D 2000000000) {
> +		/* Select higher signaling voltage for fast data rates */

[Severity: Medium]
Will this condition ever be met?

Further down in this patch, mtk_mipi_tx_pll_determine_rate() unconditionally
clamps the requested rate to a maximum of 1.6 GHz.

Since the framework passes this clamped rate to the set_rate callback, won't
this high-speed logic for 2.0 GHz become unreachable dead code?

> +		voltage =3D RG_DSI_PRD_REF_DEF;
> +		pres =3D MIPITX_PRESERVED_DEF;
> +		txdiv =3D 1;
> +		txdiv0 =3D 0;
> +	} else if (mipi_tx->data_rate >=3D 1000000000) {

[ ... ]

> +	mtk_phy_update_field(base + MIPITX_VOLTAGE_SEL, RG_DSI_PRD_REF_SEL, vol=
tage);
> +	writel(pres, base + MIPITX_PRESERVED);
> +
> +	mtk_phy_set_bits(base + MIPITX_PLL_PWR, AD_DSI_PLL_SDM_PWR_ON);
> +	mtk_phy_clear_bits(base + MIPITX_PLL_CON1, RG_DSI_PLL_EN);
> +	usleep_range(30, 60);

[Severity: High]
Is it safe to sleep here?

The Common Clock Framework invokes clk_ops->enable callbacks with the
enable_lock spinlock held and local interrupts disabled.

Because mtk_mipi_tx_pll_enable() is registered as the .enable callback,
won't calling usleep_range() here in an atomic context trigger a
scheduling while atomic BUG?

Should this use udelay() instead, or could this logic be moved to the
.prepare callback where sleeping is permitted?

> +
> +	mtk_phy_clear_bits(base + MIPITX_PLL_PWR, AD_DSI_PLL_SDM_ISO_EN);
> +	writel(pcw, base + MIPITX_PLL_CON0);
> +	mtk_phy_update_field(base + MIPITX_PLL_CON1, RG_DSI_PLL_POSDIV, txdiv0);
> +	usleep_range(30, 60);
> +
> +	mtk_phy_set_bits(base + MIPITX_PLL_CON1, RG_DSI_PLL_EN);
> +	usleep_range(30, 60);
> +
> +	return 0;
> +}

[ ... ]

> +static int mtk_mipi_tx_pll_determine_rate(struct clk_hw *hw,
> +					  struct clk_rate_request *req)
> +{
> +	req->rate =3D clamp_val(req->rate, 125000000, 1600000000);

[Severity: Medium]
Is this maximum rate intentional for the MT8196?

This limits the rate to 1.6 GHz, which prevents the 2.0 GHz signaling
voltage logic in mtk_mipi_tx_pll_enable() from ever executing.

> +
> +	return 0;
> +}
> +
> +static const struct clk_ops mtk_mipi_tx_pll_ops =3D {
> +	.enable =3D mtk_mipi_tx_pll_enable,
> +	.disable =3D mtk_mipi_tx_pll_disable,
> +	.determine_rate =3D mtk_mipi_tx_pll_determine_rate,
> +	.set_rate =3D mtk_mipi_tx_pll_set_rate,
> +	.recalc_rate =3D mtk_mipi_tx_pll_recalc_rate,
> +};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701121943.1943=
0-1-angelogioacchino.delregno@collabora.com?part=3D2
