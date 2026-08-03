Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9183B2FFE;
	Mon,  3 Aug 2026 11:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785755071; cv=pass; b=FzBppQn5JSXyu9CVYVZ3l2lULSTyQ0srA+QKLSF6frz6jEQf5KSuobAhXLY0gUV28MqvpnVbgSWkRhFvWvKi/nK27uP/Ggt+/OyNHOOYTtN6Na5Jzm1ZEa4uk3+CMF2kvGbch/VCevFS2nNL7r+/hzG1d+A0lvtJZq1DETRj2DE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785755071; c=relaxed/simple;
	bh=belPi1nnLRo7goLyBJojiVeLOYqXKi84+Xmell44/Ys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ETiHzHGG5MnnaQwWy298sS/0u5FhERvVMdmWWQ1pi61IilfPygbe3iTjWn58XCMFcoNQlyjIM7VT0iM0x36LIbm8Vahi7Wg0iXeHDFOrCg5Fti0ynglcnXLhFxMhE8w2qx6J/1IoqFmICbOTOOGn6PVjb2y/561+xdtP/0VoRQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=YmslsaxG; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b="YmslsaxG"
ARC-Seal: i=1; a=rsa-sha256; t=1785755053; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hQ0MpJ9A3P3+L5VntZJclLcy7Kg4rETAnyVcG02PM4ZKRrVXL4rNykvlj6OzZPNmIzaKpouofqSulkfv/pCciGwPBoQogvAIhYYDU4mFsbakFPtAXx8X57YZR8GDuYG8uBzy9GGOD9kX/6SBUh2kecXQDTnMO8y4As8xwv8HBRo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785755053; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vEjfuOOqjt4DKH+Agnkv8+PSzwehlSi9y606REMac8k=; 
	b=NN0GW/XzKfqszrKUbUDODRNhjmkKYzUOyB1MmRzDhmAQwU7nDT9RiGGccv/lgfr1fuocuK+GpfIX217hiEtoyLXUpyjuB7M6+/u2ZPsMS2BQtl6YWR9F08aykeOOrDl/M5syiQAufm+AbVqDHDRh+Moyt5+6MqJOWdejZhglgzE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785755053;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vEjfuOOqjt4DKH+Agnkv8+PSzwehlSi9y606REMac8k=;
	b=YmslsaxG4pGR0uRF+wFiDwdG+68+XDpe+xbWRA4G5/fEC/yC73+yew9Z3yc40h1r
	7fiV9ZV8CoN5NjdzRpZOupXOJ4zRUOr4w5BpzlxMnGvxFPQJfxPac1ySZ3QVXg/zasg
	peZnfCqRls+GmQbtS0GojJ4U75BGM13gKde5pvfU=
Received: by mx.zohomail.com with SMTPS id 1785755051075901.122732738344;
	Mon, 3 Aug 2026 04:04:11 -0700 (PDT)
Message-ID: <e4a4eef8-3c42-407b-a6b7-e2f9a32da29e@collabora.com>
Date: Mon, 3 Aug 2026 13:04:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] phy: rockchip: phy-rockchip-inno-csidphy: add
 clock lane phase tuning
To: Gerald Loacker <gerald.loacker@wolfvision.net>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260725-feature-mipi-csi-dphy-4k60-v4-0-5b2c4626d31e@wolfvision.net>
 <20260725-feature-mipi-csi-dphy-4k60-v4-3-5b2c4626d31e@wolfvision.net>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260725-feature-mipi-csi-dphy-4k60-v4-3-5b2c4626d31e@wolfvision.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Gerald,

On 7/25/26 18:56, Gerald Loacker wrote:
> At high data rates like 4K60 (2500 Mbps), such as when using an
> LT6911GXD bridge chip on an RK3588 board, fixed default timing parameters
> can cause signal integrity issues and clock-data recovery failures.
> The driver currently lacks a mechanism to adjust the clock lane sampling
> phase to compensate for board-specific trace variations.
> 
> Resolve this by parsing and applying the optional 'rockchip,clk-lane-phase'
> device tree property. This enables board-specific tuning of the clock
> lane sampling phase in ~40 ps steps (range 0-7) to optimize link
> stability. If the property is absent, the driver falls back to the
> hardware default.
> 
> Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Thanks and best regards,
Michael

> ---
>  drivers/phy/rockchip/phy-rockchip-inno-csidphy.c | 25 ++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> index 5281f8dea0ad3..d989f1649b0e4 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> @@ -69,6 +69,10 @@
>  #define RK1808_CSIDPHY_CLK_CALIB_EN		0x168
>  #define RK3568_CSIDPHY_CLK_CALIB_EN		0x168
>  
> +#define CSIDPHY_LANE_CLK_3_PHASE		0x38
> +#define CSIDPHY_CLK_PHASE_MASK			GENMASK(6, 4)
> +#define CSIDPHY_CLK_PHASE_DEFAULT		3
> +
>  #define RESETS_MAX				2
>  
>  /*
> @@ -151,6 +155,7 @@ struct rockchip_inno_csidphy {
>  	const struct dphy_drv_data *drv_data;
>  	struct phy_configure_opts_mipi_dphy config;
>  	u8 hsfreq;
> +	int clk_phase;
>  };
>  
>  static inline void write_grf_reg(struct rockchip_inno_csidphy *priv,
> @@ -304,6 +309,13 @@ static int rockchip_inno_csidphy_power_on(struct phy *phy)
>  		rockchip_inno_csidphy_ths_settle(priv, priv->hsfreq,
>  						 CSIDPHY_LANE_THS_SETTLE(i));
>  
> +	if (priv->clk_phase >= 0) {
> +		val = readl(priv->phy_base + CSIDPHY_LANE_CLK_3_PHASE);
> +		val &= ~CSIDPHY_CLK_PHASE_MASK;
> +		val |= FIELD_PREP(CSIDPHY_CLK_PHASE_MASK, priv->clk_phase);
> +		writel(val, priv->phy_base + CSIDPHY_LANE_CLK_3_PHASE);
> +	}
> +
>  	write_grf_reg(priv, GRF_DPHY_CSIPHY_CLKLANE_EN, 0x1);
>  	write_grf_reg(priv, GRF_DPHY_CSIPHY_DATALANE_EN,
>  		      GENMASK(priv->config.lanes - 1, 0));
> @@ -449,6 +461,7 @@ static int rockchip_inno_csidphy_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct phy_provider *phy_provider;
>  	struct phy *phy;
> +	u32 phase;
>  	int ret;
>  
>  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> @@ -464,6 +477,18 @@ static int rockchip_inno_csidphy_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> +	priv->clk_phase = -1;
> +	if (device_property_read_u32(dev, "rockchip,clk-lane-phase",
> +				     &phase) == 0) {
> +		if (phase > 7) {
> +			dev_warn(dev,
> +				 "invalid rockchip,clk-lane-phase %u, using default %u\n",
> +				 phase, CSIDPHY_CLK_PHASE_DEFAULT);
> +			phase = CSIDPHY_CLK_PHASE_DEFAULT;
> +		}
> +		priv->clk_phase = phase;
> +	}
> +
>  	priv->grf = syscon_regmap_lookup_by_phandle(dev->of_node,
>  						    "rockchip,grf");
>  	if (IS_ERR(priv->grf)) {
> 

