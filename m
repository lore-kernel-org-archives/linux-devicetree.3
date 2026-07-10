Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BABF3DB324;
	Fri, 10 Jul 2026 09:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783675903; cv=pass; b=dPtptxtcY94hQheMkIpPVPIVfuQ3HAuj2nBf8BwMDJS2+vU2UA3yKKkfv/Mf4KhkEKnpbkC54zmVuwFiwZJd6OnPY3mbPDmDGIFwd7zdXjaAOQOSXpnG4d/hmrNseeTnZ9lNNEgnGKhwOIgYyPhyq7R6xdRsox0Uwes2Ui2qOmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783675903; c=relaxed/simple;
	bh=IWAWBHwxitbGfLOCOwg1bzMX96ht2MOcw78UTqm16ro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oq+Q7dQesEcMyIvBa445zjGmSBeLquNABoMrgBwSrNOeQzCwU7AivPFlqM/L5Z6L1Ddk5BnnmmUbHxideWOdqLQXnDZTXQj94TtNnopVJtIYx8fJzCEooE8yXC9ZKfWGgSl2mh+HBQkrNJUuyUmL7DN0SVa4vOzpmB6Dx5sttPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=ahNmAI09; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b="ahNmAI09"
ARC-Seal: i=1; a=rsa-sha256; t=1783675885; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kQYGnz8xkPetW4YKr9IErhJ5l+W3a+y/UxlQ+hkuzeSShRdvQyOyQJ11zr430cKlJ72jKyAk3mrsQff41oO01thWLV6G9nDJJ0w0eIR+OenFJCozkw+vSJOjd7iYs/2ZxArBDKrQDsQ1I8zop0jZRDVfslNIL46wtrekHWJUIIA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783675885; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SG9a1uXpctEu1u2ijc1xCGpdPingSIOEITU/luaBHbU=; 
	b=BVGRFgbxYB7CmMugfq5wwSDCRlJpnG0IEFcb6DMaA2/BvPK6dR5FHLE5V1EUnlhUEeBtMXUvlk/tlNs5CjdEXSiRB8F6lmI/uA2N/VdDwqSi4p3Mnmz/qcovbQYLDzGJ5oyxXEp5xm6sud6hSdckik54p0C3B1wHMdxs5hPdQ28=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783675885;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=SG9a1uXpctEu1u2ijc1xCGpdPingSIOEITU/luaBHbU=;
	b=ahNmAI09cPALLrGZ5Khf6YGUbCDTIyGsNHjeAt359xEwaxCzMwhB1sD6KBmoGWT2
	LAqVymqgUh6w0WLqVRPNmNh0ISjra+upU2VucwTKmVwezBhAfCvii76L+5qBoZk/FI/
	MTelm4VM6bEL2KOgVDBbihks2MomNCU2jSXkvri0=
Received: by mx.zohomail.com with SMTPS id 1783675884007171.96348233620495;
	Fri, 10 Jul 2026 02:31:24 -0700 (PDT)
Message-ID: <21e79fd6-6c72-481c-a7a1-18af94b9cb9a@collabora.com>
Date: Fri, 10 Jul 2026 11:31:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] phy: rockchip: phy-rockchip-inno-csidphy: add
 clock lane phase tuning
To: Gerald Loacker <gerald.loacker@wolfvision.net>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260630-feature-mipi-csi-dphy-4k60-v3-0-176792ab71fa@wolfvision.net>
 <20260630-feature-mipi-csi-dphy-4k60-v3-3-176792ab71fa@wolfvision.net>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260630-feature-mipi-csi-dphy-4k60-v3-3-176792ab71fa@wolfvision.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Gerald,

Thanks for your patch.

On 6/30/26 09:48, Gerald Loacker wrote:
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
> ---
>  drivers/phy/rockchip/phy-rockchip-inno-csidphy.c | 25 ++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> index 5281f8dea0ad3..3a15840e86cad 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> @@ -69,6 +69,10 @@
>  #define RK1808_CSIDPHY_CLK_CALIB_EN		0x168
>  #define RK3568_CSIDPHY_CLK_CALIB_EN		0x168
>  
> +#define CSIDPHY_LANE_CLK_3_PHASE		0x38
> +#define CSIDPHY_CLK_PHASE_MASK			GENMASK(6, 4)
> +#define CSIDPHY_CLK_PHASE_DEFAULT		3

This default value definition is unused right now, but...

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

...you can make sure that clk_phase has a valid value in any case (apply
default value defined above if DT does not define it or defines
something invalid) and write the register unconditionally.

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
> +		if (phase >= BIT(3)) {

if (phase > 7)

> +			dev_err(dev,
> +				"rockchip,clk-lane-phase %u out of range [0,7]\n",
> +				phase);
> +			return -EINVAL;

Seems a bit harsh. What would you think about printing a warning and
applying the default value?

> +		}
> +		priv->clk_phase = phase;
> +	}

Maybe

	ret = device_property_read_u32(dev, "rockchip,clk-lane-phase",
				       &priv->clk_phase);
	if (ret < 0 || priv->clk_phase > 7) {
		dev_info(dev,
			 "found %s value for rockchip,clk-lane-phase,"
			 "assuming default value",
			 ret < 0 ? "no" : "invalid");
		priv->clk_phase = CSIDPHY_CLK_PHASE_DEFAULT;
	}

would do the trick too?

Best regards,
Michael

> +
>  	priv->grf = syscon_regmap_lookup_by_phandle(dev->of_node,
>  						    "rockchip,grf");
>  	if (IS_ERR(priv->grf)) {
> 

