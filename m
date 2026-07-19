Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9509224BBEB
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 13:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784468736; cv=none; b=ocvQn2/H5yWqfWicyanNFbvWUAH2eJXj0HoYskEMZ4ZR97iJeW6sOz8Ss6MNGnXo3gWbrZSYwLAFx28BWV6Xkw9X2O/8WumviXRPspVxc48cw4Wja2PhU/iPXa/09fUAfdyQvHT/J6CtfLgGkw73pz8gRWSKNM/sqGMK8ebE1bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784468736; c=relaxed/simple;
	bh=d9dE3M1R+jlDzEuypie7rRoq0o09DnUhVu8NnHFMbl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GjyDOSo/SHAVVyuN/fRETeydVT7LL/T0ANvVl4GRu8JBO2/k6Ji68Jfht4AdyqZ90w2uiAAbx7zm1qbI16SqskB1z//muwGN8ykL9YCMts5h6pz8qy8OmM8KdTMSb3TLYcdXg4I9hXiaJoTSHO0b/bBMYNu7Cybziyf4O4b4Qfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j7y9sb1d; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j7y9sb1d"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49550ec592cso4377765e9.0
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 06:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784468732; x=1785073532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S8oezzhPlACWhvhdZH/Jait1ZXvVzzjG4ACItSTIAt0=;
        b=j7y9sb1dx0t0FDI0ttTnolE/9JsWJVXV6LGRyIsDrQ8c7rNQBVho5u+WQ0WvDOZsRV
         RYQvSb4ErGDhh1DxN4tpTAuif3qp+6YnmJCqc2RcNgrd9JVim2LdRm64SFIn+bdL3fQL
         JLSyRa6/bQV7W6lnVO4WSKq56fFz6fDN92awGrEzLReEI6p6vZXHu/BhbyOf2om9fB3a
         CpoOzyOhk5E0K24L7JFvPsWGUW+uceKXPOLEIf+wyQZfD2mjqMhirNWAxYrP2E6zK+R/
         Ld1feJ53c4OrRsg8WR7Jmmc28vGW1Hvys01b4NgPgSZVa43xK4bSl2iu7Hbiub7O/8aF
         9oJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784468732; x=1785073532;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S8oezzhPlACWhvhdZH/Jait1ZXvVzzjG4ACItSTIAt0=;
        b=loEJ5qWyHabLMjT0yfsUE4zeUTp4F/rhS4OPOlW7FQcScGxoDy2lyTkYXCYrbDVNmE
         Lq+RJ8+S6a7NwD7UphU3j27cUayiRiZiOdW2rPnfxYhpHrq90MbpyQswCZRzopfrM5ml
         7ITvy8RS6lmcrZQub5zl01nLnkFjq503TakUPBGUw4aEZqOHVWQwMVtWC+i/aQsQEfnL
         QwMxB5jsdwTM0bX4kDkn/2X3U2sYgs9iJG88qZfhfnVQb8LgKi/8MHtolkuIJjWbWMQZ
         oZTBK6NuOpJ4vMEqQFopuTFfrWYePGBPozo3SPWmlBhdAeRPYMiIjr0JT614OeWIownH
         beww==
X-Forwarded-Encrypted: i=1; AHgh+Rqt7LLvy7qrUdPqlAejIYkiJZhq0DqZG6lDBlhl3TkbI4iteK1qWG2yLFz31rLnX5+J4reBqZv/kbxx@vger.kernel.org
X-Gm-Message-State: AOJu0YwjhjAXlCX/TmlpCPpe+Yy9jtk4Ymm899ElAD+NYMJT6EYWafxk
	Il7wrIanfBI9uG3MgnILhL+biAoN566ygeRtZKq2MBoyuAXClrqsnBEUUaQWD129x5M=
X-Gm-Gg: AfdE7ckAtaSIUWVGTHOTQTMiyudBsfNLsTucd36UGWc8zOTOe8XXdLalFd5jiAC0fDh
	UWfik4v01OsT6PV3+ci3imeb+edVvCmVe6xeSmY64EKQm7DsoWjGcNbU/rGLmJ1Z3/y2FcOwTlv
	AZN3kaj4ZaMXUAc+KP5wo1CM9P8h9Vqou5k51wWDyKVhOW1mCBgWjbzIkcF2EMc2NuyJzn5oERj
	bow9GlWqkdWvhuPOtSY8tux9/9XNN0rkiIrBwok9y8/vtVe1j0ce0uzyAZ3eXwC4Tm2UWYdUjaV
	HFbHFVp9x6Cdn30gJV0tRsbVvL76wDsnlJKmwIzLimdvKFnzmka3bJb0imJSpjJP/EfeeWxxge4
	OmVpJJLOgu8IeQlFITsfaZQ8H2so3eh4Ecu74ZLOMHW+w3sdK9B58U/GXb7LlzUxoKY/vWlfyw9
	mf8Mqzn0kErRkE
X-Received: by 2002:a05:600c:c178:b0:495:5d6d:9cc1 with SMTP id 5b1f17b1804b1-4955d6d9f9bmr10727905e9.0.1784468730934;
        Sun, 19 Jul 2026 06:45:30 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.79.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954995b78dsm134249105e9.0.2026.07.19.06.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 06:45:29 -0700 (PDT)
Message-ID: <add20096-6b98-460c-8d4c-5e497cfa857e@linaro.org>
Date: Sun, 19 Jul 2026 14:45:27 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, conor+dt@kernel.org,
 neil.armstrong@linaro.org, vkoul@kernel.org, media-ci@linuxtv.org,
 olteanv@gmail.com, devicetree@vger.kernel.org, robh@kernel.org
References: <20260719-x1e-csi2-phy-v11-0-9d0a1ed0632d@linaro.org>
 <20260719-x1e-csi2-phy-v11-2-9d0a1ed0632d@linaro.org>
 <20260719124126.397901F000E9@smtp.kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260719124126.397901F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/07/2026 13:41, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] Insufficient validation of the `data-lanes` property allows values up to 7, leading to integer truncation and out-of-bounds MMIO writes into common PHY registers.
> - [Medium] The driver statically configures lanes based on the device tree instead of respecting dynamic `dphy_cfg->lanes` requests, violating the MIPI D-PHY API contract.
> - [Medium] Setting lane polarity unconditionally overwrites the entire `CTRL9` register instead of performing a read-modify-write.
> - [Low] Unmasked assignment of the first byte in `hw_version` may corrupt the final value with undefined upper bits.
> --
> 
> --- Patch [2]: [PATCH v11 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver ---
> commit cff02f6508398df4f254c675b3580c3c848e17c2
> Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Subject: phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
> 
> This commit adds a new MIPI CSI2 PHY driver in DPHY mode for Qualcomm
> hardware. It ports logic from existing camss drivers to initialize and
> configure data and clock lanes based on device tree properties.
> 
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> --- /dev/null
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> 
> [ ... ]
> 
>> +static void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2phy)
>> +{
>> +	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
>> +	u32 tmp;
>> +
>> +	writel(CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID, csi2phy->base +
>> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
>> +
>> +	tmp = readl_relaxed(csi2phy->base +
>> +			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 12));
>> +	csi2phy->hw_version = tmp;
> 
> [Severity: Low]
> Does this assignment to csi2phy->hw_version need a mask like & 0xFF?
> 
> If the hardware register returns non-zero garbage values in the upper 24
> bits, those bits might remain in hw_version and corrupt the final value
> when the subsequent shifted bytes are OR'ed in.
> 
> [ ... ]

No not validating for "hardware returns garbage" that's a rabbit hole we 
don't go down. The bits out of registers are trusted as correct.
> 
>> +static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
>> +					   struct mipi_csi2phy_stream_cfg *cfg)
>> +{
>> +	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
>> +	struct mipi_csi2phy_lanes_cfg *lane_cfg = &cfg->lane_cfg;
>> +	u8 settle_cnt;
>> +	u8 val;
>> +	int i;
> 
> [ ... ]
> 
>> +	/*
>> +	 * CSI_COMMON_CTRL5 is a physical lane power-up bitmap:
>> +	 * - Bits [0,2,4,6] → D-PHY data lanes(LN0, LN2, LN4, LN6)
>> +	 * - Bits [1,3,5] → C-PHY trio lanes(LN1, LN3, LN5)
>> +	 * - Bit [7] → D-PHY clock lane(LNCK) dedicated clock enable
>> +	 */
>> +	val = BIT(lane_cfg->clk.pos);
>> +	for (i = 0; i < cfg->num_data_lanes; i++)
>> +		val |= BIT(lane_cfg->data[i].pos * 2);
> 
> [Severity: High]
> Could this cause an integer truncation?
> 
> Because the val variable is defined as a u8, shifting by 8 or more will
> silently truncate to 0. If a lane position is >= 4, lane_cfg->data[i].pos * 2
> becomes >= 8, which means the driver might fail to power up the lane.

Will validate data_lanes[i] against >= MAX_DATA_LANES
> 
>> +	writel(val, csi2phy->base +
>> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 5));
>> +
>> +	/* Lane configuration for polarity @ CSIPHY-base + CTRL9 */
>> +	for (i = 0; i < cfg->num_data_lanes; i++) {
>> +		if (lane_cfg->data[i].pol) {
>> +			u8 pos = lane_cfg->data[i].pos;
>> +
>> +			writel(BIT(2), csi2phy->base + CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(pos * 2));
> 
> [Severity: High]
> Can this result in an out-of-bounds memory write?
> 
> If pos is >= 4, pos * 2 is >= 8. The CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n macro
> will compute an offset that overflows the physical lane register space and
> aliases directly into the common PHY register block, potentially clobbering
> common registers.


Will validate data_lanes[i] against >= MAX_DATA_LANES

> [Severity: Medium]
> Is it safe to use an absolute writel() here instead of a read-modify-write?
> 
> Writing BIT(2) directly clears any hardware defaults or reserved bits that
> might be present in the rest of the register. This also creates asymmetric
> handling since the register is left untouched if polarity is false.

Overwriting the register is deliberate at this point

>> +		}
>> +	}
>> +
>> +	if (lane_cfg->clk.pol)
>> +		writel(BIT(2), csi2phy->base + CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(lane_cfg->clk.pos));
> 
> [Severity: Medium]
> Similarly, could this absolute write clobber the clock lane CTRL9 register?

Overwriting the register is deliberate at this point


>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> --- /dev/null
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> 
> [ ... ]
> 
>> +static int phy_qcom_mipi_csi2_configure(struct phy *phy,
>> +					union phy_configure_opts *opts)
>> +{
>> +	struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
>> +	struct phy_configure_opts_mipi_dphy *dphy_cfg = &opts->mipi_dphy;
>> +	struct mipi_csi2phy_stream_cfg *stream_cfg = &csi2phy->stream_cfg;
>> +	int ret;
>> +
>> +	ret = phy_mipi_dphy_config_validate(dphy_cfg);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (dphy_cfg->lanes < 1 || dphy_cfg->lanes > CSI2_MAX_DATA_LANES)
>> +		return -EINVAL;
>> +
>> +	stream_cfg->link_freq = dphy_cfg->hs_clk_rate;
>> +
>> +	return 0;
>> +}
> 
> [Severity: Medium]
> Should the dynamically requested dphy_cfg->lanes value be saved into the
> active configuration here?
> 
> The value is validated but discarded, meaning the driver will always
> statically power up the maximum number of lanes configured in the device
> tree instead of respecting dynamic requests from the consumer. Does this
> violate the MIPI D-PHY API contract for dynamic lane configuration?

We use a fixed configuration right now. Future work may allow for 
dynamic lane configuration - requires way more work defining registers 
and bits plus logic to configure based on requested input.


> [ ... ]
> 
>> +static int phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *csi2phy)
>> +{
>> +	struct mipi_csi2phy_stream_cfg *stream_cfg = &csi2phy->stream_cfg;
> 
> [ ... ]
> 
>> +	csi2phy->stream_cfg.lane_cfg.clk.pos = CSI2_DEFAULT_CLK_LANE;
>> +	csi2phy->stream_cfg.lane_cfg.clk.pol = lane_polarities[0];
>> +
>> +	for (i = 0; i < csi2phy->stream_cfg.num_data_lanes; i++) {
>> +		if (data_lanes[i] > CSI2_MAX_LANE_NUM) {
> 
> [Severity: High]
> Is CSI2_MAX_LANE_NUM (7) too large for this bounds check?
> 
> As noted in phy_qcom_mipi_csi2_lanes_enable(), allowing lane numbers >= 4
> results in pos * 2 being >= 8 later on, which causes both truncation in the
> u8 bitmask and out-of-bounds writes into the common PHY register region.

No data-lanes is constrained and will be validated in the next pass.

>> +			dev_err(dev, "Invalid lane %d\n", data_lanes[i]);
>> +			ret = -EINVAL;
>> +			goto out_put;
>> +		}
>> +		csi2phy->stream_cfg.lane_cfg.data[i].pos = data_lanes[i];
>> +		csi2phy->stream_cfg.lane_cfg.data[i].pol = lane_polarities[i + 1];
>> +	}
> 

