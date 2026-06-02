Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01943383985
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 22:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780438041; cv=none; b=a4GHgRLaEnzcTwV78sKP7ckdYpM+cWBto17u45ZqLky7Mb+sPIjHibny7ETTiZVNDnBUmVh49GWv99oaX9URhbGuHdfnSgAe5fyXr+zjjAwI2KSWxYbJq2YWKGbupWslDRQ+yvJ5Wf4yunQYZfOtjBVdWdgSLM49Qb3kKNqOQag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780438041; c=relaxed/simple;
	bh=6x9fMJ7t6HJunG2X30tVVOCMTH7Bh31dGiwtTPzjvGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F5jBgDYwzukIJHiiYcuVwgicJEXzKplsjoyyOqPSLuZtIHU3kqqX/n3ctuHBdOXFpq0Xg0YPJDEtR3uGPV+ZtsmrChXsj1FFec/rGOzioyxyh8/nx82SwqYrurUwF/PMsGND8m1MYVREzyIH/168U9UncYga2CLJuAVGTGiKREM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t5LcHcZS; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t5LcHcZS"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-396773734e8so4625611fa.3
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 15:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780438038; x=1781042838; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SRIMl3FmmdDZgXTjOCnwja2kX4Az8p1cvuxpefmzXA=;
        b=t5LcHcZSENbyyLkEdcs6i69kMQJUXbGtascfl+o5b0hklk1lowJhY/wzrsrQQFPPE9
         yfzUbLzOTem79ZLgDz22snf0bkyYDuCpwBEUn0O0YcXtivKq042OgRWDxbhpDdmLmzvo
         zPd9oBLvmPC9SeyBxj/Zu6dewc/fOcTFDXc1u79qXJS/d9GAPdT4UUPXCMxNTuRA2C8Y
         n57h+0lOCoRpoubZF65txza/LU/6ZwYY1IEAs/eOYrvB4prXzUEiGZbtf9duY/spKwjP
         v7+WQtvRU6sIo6EngzngmN9PBjXuQSqs051SheGPNeutSTto8giYLiP/10VqynW6ctKn
         V9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780438038; x=1781042838;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7SRIMl3FmmdDZgXTjOCnwja2kX4Az8p1cvuxpefmzXA=;
        b=B8wgQT10xVITD4W+M075UzAAU1oM3/DuSGobj5grM9khZjM0/l15Ou/z8adlqdcrjJ
         v+fY3nTmBc5XJamBhIulp9cfePISax0UmqIqV/E9FSo9gjFJ1PX3Ifn4X6rrUhXdqH9U
         RU/UKpygNqWZtULvbqSWybp77KH06p4yW4mFMUYAmZ/MuP+oe03Swo/LCD0v70f109fT
         /uvKegEX3a9AhjBQawxFKZC5OeDvXSQj+WOLdSz56eQjatyfAZjOAqDRsAADQGR6l0iZ
         BR0k51H5xwgnWqF3xeC5U/9fM9FtTrFutucEfiHizm+6YZOh0It/WoLc5q/nxnM4wBVk
         FvXQ==
X-Forwarded-Encrypted: i=1; AFNElJ9yph5soEev2y4h8LuVXlW/us8X959/0rgxG+SCnKp1e/5rGug27c9oxunrZYMiYv03AOZUdfUnCMBe@vger.kernel.org
X-Gm-Message-State: AOJu0YwhqwQrvO8VzbaHTY6+UajXb64JORy5lP8v82bJ4rzQxeQRcsaa
	YzDflF8r1L1au4rN2iCpk5pZ+S7m84dJ/ab057mf/89wuLlaovM8AkMYIlMz5v6yxqk=
X-Gm-Gg: Acq92OFwCpmfOsYXcmRlpKF2vwLQaC2olSCJAhGL+UqvzR6sSgR0IqbsB+PXl/YYqpf
	PF4ofJr0UUyJAAPvziRhnKwJNxUiTb8ZoI2XIziWIqZCkKHZaJGVBDi620hU5jyqToQGjPGSgss
	P4RGCNa/RAoD9OdpXaoA8WZZJXPmOSN4Ae+QRu5ww7jRhJ8dShFkoDL0q+oCV32Opg4QAPurREU
	guHx/Nl8+q3cKjOWGDXuLikNvdub1snhtFcNKwECyy9nzA+wme9126Jy/1y1LcohTaamAhFbyGm
	euiMD7X6oZtewM3h8aY9gdV6u5JID1YBM4Mi9o5ByDQSyukTD0XBsfst84fZcuajowXmRl9AK2s
	E/wxe47B7sV3FfkaRdO4U7xjsbOMBZpv8WQwYs0DTu3scFHwhhZ6HVuJTFdOIfBUWLjrQsvkgW3
	ouIzBUH6pmCM+TvEowJGuhSv84wVDa3K0q1JGOfZ9Or2Nu0f8y69gbO9eEsRv5+NcTaOGHWBwnV
	C78ZhRAbDKPfddu
X-Received: by 2002:a2e:bc2a:0:b0:396:975f:c384 with SMTP id 38308e7fff4ca-396ac314d06mr1902761fa.6.1780438038099;
        Tue, 02 Jun 2026 15:07:18 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abf66ea9sm3570671fa.2.2026.06.02.15.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 15:07:17 -0700 (PDT)
Message-ID: <54904b61-222d-4600-ad4c-c03a9952d337@linaro.org>
Date: Wed, 3 Jun 2026 01:07:16 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/23/26 05:48, Bryan O'Donoghue wrote:
> Add a new MIPI CSI2 driver in DPHY mode initially. The entire set of
> existing CAMSS CSI PHY init sequences are imported in order to save time
> and effort in later patches.
> 
> The following devices are supported in this drop:
> "qcom,x1e80100-csi2-phy"
> 
> In-line with other PHY drivers the process node is included in the name.
> Data-lane and clock lane positioning and polarity selection via newly
> amended struct phy_configure_opts_mipi_dphy{} is supported.
> 
> The Qualcomm 3PH class of PHYs can do both DPHY and CPHY mode. For now only
> DPHY is supported.
> 
> In porting some of the logic over from camss-csiphy*.c to here its also
> possible to rationalise some of the code.
> 
> In particular use of regulator_bulk and clk_bulk as well as dropping the
> seemingly useless and unused interrupt handler.
> 
> The PHY sequences and a lot of the logic that goes with them are well
> proven in CAMSS and mature so the main thing to watch out for here is how
> to get the right sequencing of regulators, clocks and register-writes.
> 
> The register init sequence table is imported verbatim from the existing
> CAMSS csiphy driver. A follow-up series will rework the table to extract
> the repetitive per-lane pattern into a loop.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

<>

> +static int phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *csi2phy)
> +{
> +	struct mipi_csi2phy_stream_cfg *stream_cfg = &csi2phy->stream_cfg;
> +	u32 lane_polarities[CSI2_MAX_DATA_LANES + 1];
> +	u32 data_lanes[CSI2_MAX_DATA_LANES];
> +	struct device *dev = csi2phy->dev;
> +	struct fwnode_handle *ep;
> +	int num_polarities;
> +	int num_data_lanes;
> +	u32 clock_lane;
> +	int i, ret;
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 1, 0,
> +					     FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (ep) {
> +		fwnode_handle_put(ep);
> +		dev_err(dev, "DPHY split mode is not supported\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> +	if (!ep) {
> +		dev_err(dev, "Missing port@0\n");
> +		return -ENODEV;
> +	}
> +
> +	num_data_lanes = fwnode_property_count_u32(ep, "data-lanes");
> +	if (num_data_lanes < 1 || num_data_lanes > CSI2_MAX_DATA_LANES) {
> +		ret = -EINVAL;
> +		dev_err(dev, "Invalid data-lanes count: %d\n", num_data_lanes);
> +		goto out_put;
> +	}
> +	stream_cfg->num_data_lanes = num_data_lanes;
> +
> +	ret = fwnode_property_read_u32_array(ep, "data-lanes", data_lanes,
> +					     stream_cfg->num_data_lanes);
> +	if (ret) {
> +		dev_err(dev, "Failed to read data-lanes: %d\n", ret);
> +		goto out_put;
> +	}
> +
> +	ret = fwnode_property_read_u32(ep, "clock-lanes", &clock_lane);
> +	if (ret) {
> +		clock_lane = CSI2_DEFAULT_CLK_LN;
> +		dev_info(dev, "Using default clock-lane %d\n",
> +			 CSI2_DEFAULT_CLK_LN);

Why CSI2_DEFAULT_CLK_LN is set to 7, what does it mean and how is it used?

Since "7" is a meaningless number in the context, I believe it's practically
not used at all, and if so, 'clock-lanes' property should be just removed.

> +	}

-- 
Best wishes,
Vladimir
