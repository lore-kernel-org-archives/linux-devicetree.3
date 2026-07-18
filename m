Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CB02571C0
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 03:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784345597; cv=none; b=D+dWx3y1UWRT5N3GFmcTpI38oBhUY9l6mt6UMcpQ0jLok79TxMqNi3PPqPrLrL+E0sFTpbhULfeFasOYhii9LaPSpoCUsKqqZ6mkCn8dFkikErFm+9tLc4IRgfFHPYm29jPNy34AOHicMjbY1qTZFCkwVDrJcv/RRFi05cNqVRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784345597; c=relaxed/simple;
	bh=kaqjCteR81ythu/pDBmenR0kkU7QwNiyr7zQkyHZO5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sixMzGOpyVFFz3ezXSuBQOcZ5ha9ivr1/f1prxkja5P7QKfTPUxqkN4LWINYHWqbYiqJ4CRN4Y4iAF8VnfJ0mpP6PaG4UCNFIj9Pxj0FeQ+oes7bRAv2eHDk5wSmw15Rfqvim9R1rMQP7nqh5FgIphtgTPVFkTMXsmfp8hi/Jps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x/v2vumU; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x/v2vumU"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954c9f380bso6759735e9.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 20:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784345593; x=1784950393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0oED1FrZVUrTl2AQuQZdpXVSq6u4FM7QrMIHjereqjI=;
        b=x/v2vumUECza+CIPo6DFjjOti2B2HT6z+eXDvbYCiQ6XkMANUTU7M+7xW2r6xvqnsL
         l29RQV9tM7MxPWtqv50lyR56VYsZfcJ91+veCVJLXb8a9He7ZVuELhki/HhmDfoDvdth
         BzG+CmcR/LkDZyL5aDZJQ6rwympAY5UdZfM0m9BOonYVh5OB+bdzZKhc1UvFK8jDGyXr
         Wu+w2eOj88PxADuBdpaL1I7By1abKfaECRmQiPQMxzw7QK/e44TOmT4a8SgR6zsT6f83
         XCYzylbb1/7tUFv8vRq7o/SWCGyHIS9jYWE5s5PKH91XAQ5ga8qnL0umd3taBhnJcbkA
         F2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784345593; x=1784950393;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0oED1FrZVUrTl2AQuQZdpXVSq6u4FM7QrMIHjereqjI=;
        b=Fk/69Sb4528A3Rcc+tOWS/kMwRrZmN18ihP/x/TAIaCid5X/JvbgmYDCNe1Mq5Mm08
         Se2cJdXjrjg/NuVQh4Wza94hVkdEPW8wsCnzGh/ZWtFv8WHbzonVj0A4+MuXDCtdq5ew
         zeUzhwaLNkVAzC6CIPjuyYNNFiZRXIGyB6jnDuyUimqqDO07t/HlwAu8U9768adOtcnt
         EEA3axGPtjfb7j0jNZ013voDt/puKEQevXitZztuE/0oVYGUO9/enbDYMfKIB0L7YokV
         mxCBrOd3Wx+QtfgOHuWzEjDTIEjHkZoA9puLvV9hKkbB/mX42gDMwSNO/u1g9RzC902L
         hBYw==
X-Forwarded-Encrypted: i=1; AHgh+RpPDQtpXrvEIjJBLVM+s+gmt6dAFjF2v83kQLFwMdDhKuAXLSGz58F5pY46fE1Vpo3OxTaz1JLjiPz7@vger.kernel.org
X-Gm-Message-State: AOJu0YzAIFGVE55KanQsXGpHdsE+tcr8AGYW+Sxwfxbh36vJ0NQRLB6q
	yGupFccfyQmxttzjYUbEjPRKtHEM2Xp8Uw24jOc8bj1wcwbMwN5rcQra9e13plSepAw=
X-Gm-Gg: AfdE7clkem64G6volEITVf4PDbMuQlfBbv3AN+eRKtKR2PLzWvx+AyVfDSn0BVPIEov
	QpbCPAh980SoPtWqvv3dFMhYSBmLIdA0lyezc3S6bZhetQoIVuTEOscZbzo77TFO7QtTjFuJvc6
	sty4mLjYuaT0YikVCvSDs0wwkVQmfxTSe2R0KaKQzrX5iZLFl8EfZW2JOKyr4rylwXbFTenyG+0
	eAOHf7KkDBoGxDYWzRsYrcN1/6/zLnp/tMRMrXMrAqWjoSKrQbHXnGLBreMyO067wwJ8+yj1qsh
	BUq2ES+ULeCSmJA7Y6QNCr4/bkg1ps0n2p3tafhmjChxpv0Ucj+ZLICuifi0Vy4Nh4pzNQppb+Q
	haYUMzZHKuFrS69e+Ib9oxpjJaJwVTSN0mMcsa7ezjCOs7eflhqGqiZ+2Ym7ghRKBRtYgc8WW9P
	a+FD4yaIgZE6xH+0QN0r2yWLc=
X-Received: by 2002:a05:600c:3512:b0:493:cfe8:5b36 with SMTP id 5b1f17b1804b1-4954a3eec4bmr60734855e9.8.1784345593339;
        Fri, 17 Jul 2026 20:33:13 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.77.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2e8529sm91284285e9.11.2026.07.17.20.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 20:33:12 -0700 (PDT)
Message-ID: <e8e9c2c8-b0a5-446b-860c-a693f33a03c5@linaro.org>
Date: Sat, 18 Jul 2026 04:33:11 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org,
 olteanv@gmail.com, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org
References: <20260718-x1e-csi2-phy-v10-0-5720a7888953@linaro.org>
 <20260718-x1e-csi2-phy-v10-2-5720a7888953@linaro.org>
 <20260718025109.EED601F000E9@smtp.kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260718025109.EED601F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/07/2026 03:51, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Incorrect translation of logical to physical lanes causes register offset errors and bitwise truncation.
> - [High] Integer truncation in division leads to potential division-by-zero panic in settle count calculation.
> - [Low] Hardware version register read does not mask upper bits, potentially corrupting the version struct.
> --
> 
> --- Patch [2]: [PATCH v10 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver ---
> commit 3a4ef513bbeefe5185b0f08d343f98883cbe66ca
> Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
> 
> This commit adds a new MIPI CSI2 driver in DPHY mode initially. It supports
> devices like "qcom,x1e80100-csi2-phy" and imports CAMSS CSI PHY init sequences.
> 
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> index 0000000000000..5ac0d041b36b7
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
> Is it possible for the hardware register to return garbage or reserved bits in
> the upper bytes here? Since this first read is assigned directly without
> masking (e.g., tmp & 0xFF), any upper garbage bits would remain in hw_version
> and wouldn't be cleared by the subsequent bitwise OR operations.

This is not credible.

>> +
>> +	tmp = readl_relaxed(csi2phy->base +
>> +			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 13));
>> +	csi2phy->hw_version |= (tmp << 8) & 0xFF00;
> 
> [ ... ]
> 
>> +static u8 phy_qcom_mipi_csi2_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
>> +{
>> +	u32 t_hs_prepare_max_ps;
>> +	u32 timer_period_ps;
>> +	u32 t_hs_settle_ps;
>> +	u8 settle_cnt;
>> +	u32 ui_ps;
>> +
>> +	if (link_freq <= 0)
>> +		return 0;
>> +
>> +	ui_ps = div_u64(PSEC_PER_SEC, link_freq);
> 
> [Severity: High]
> Does this code silently truncate link_freq?
> 
> The div_u64() macro expects a u32 divisor, but link_freq is an s64. This will
> implicitly truncate the 64-bit link_freq value to 32 bits.
> 
> If link_freq happens to be an exact multiple of 2^32, the truncated divisor
> becomes exactly 0, which would cause a division-by-zero panic. Frequencies
> exceeding 4.29 GHz would also be silently corrupted.
> 
> Could this be updated to use div64_u64() or similar to avoid truncation?

This is a pretty outlandish level of defensive coding. Nope, not doing it.

> 
>> +	ui_ps /= 2;
>> +	t_hs_prepare_max_ps = 85000 + 6 * ui_ps;
> 
> [ ... ]
> 
>> +static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
>> +					   struct mipi_csi2phy_stream_cfg *cfg)
>> +{
>> +	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
>> +	struct mipi_csi2phy_lanes_cfg *lane_cfg = &cfg->lane_cfg;
>> +	u8 settle_cnt;
>> +	u8 val;
>> +	int i;
>> +
>> +	settle_cnt = phy_qcom_mipi_csi2_settle_cnt_calc(cfg->link_freq, csi2phy->timer_clk_rate);
>> +	if (!settle_cnt)
>> +		return -EINVAL;
>> +
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
> Can this bitmask overflow the u8 val?
> 
> If the device tree uses physical indices (e.g., 4 or 6) for pos, pos * 2
> becomes 8 or 12. Since val is a u8, using BIT(8) or BIT(12) will overflow
> and silently truncate to 0, failing to enable the corresponding hardware lane.
> 

Actually no - the current yaml has a range of data-lanes = <0 1 2 3> => 
3 * 2 == 6

>> +
>> +	writel(val, csi2phy->base +
>> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 5));
>> +
>> +	/* Lane configuration for polarity @ CSIPHY-base + CTRL9 */
>> +	for (i = 0; i < cfg->num_data_lanes; i++) {
>> +		if (lane_cfg->data[i].pol) {
>> +			u8 pos = lane_cfg->data[i].pos;
>> +
>> +			writel(BIT(2), csi2phy->base + CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(pos));
> 
> [Severity: High]
> Does this correctly map logical to physical lanes?
> 
> The CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(pos) macro computes 0x200 * pos + 0x24.
> However, D-PHY data lane blocks are spaced at offsets 0, 0x400, 0x800, and
> 0xC00.
> 
> If pos is a logical index like 1, this would access offset 0x200 (which is a
> C-PHY lane) instead of the intended 0x400.

True.

Baby don't be sad, cause 1/4 ain't bad.
> 
>> +		}
>> +	}
>> +
>> +	if (lane_cfg->clk.pol)
>> +		writel(BIT(2), csi2phy->base + CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(lane_cfg->clk.pos));
> 

