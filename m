Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C955F3191BD
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 13:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785417709; cv=none; b=nkAmOJORAT9K2oYDoSiom2xFSjuLUhzy9W/n/AYmAcrfpn9Hjnflrs01GfcLxl6MvLh9/hwjXDzmGfqox7buAoEr3iqmzQ+lqkuBAF3IwunYfgQWGIVRWSjzMB4DndW/wZZ37c6nwJPxuhLhhj7/akhqIi74TBZi/xscFFiKOkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785417709; c=relaxed/simple;
	bh=6eCDQHwycFwNQiCAeJevwHKMid/TdPTTKlTIdQ942Ao=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=EKMRccYsy6101xzUw/6F6htrIGeB2K1k1g2rPZx3OFja+S4yvNtxT+q4sf9UyZ7OzzvdylXdSe8jZ1PnKuJUySxOQN78y7T8XS98LUbN3rIDjJ2Gsnkc//Qv2LfltynQSUOQyniw3Bt8aDJw4ZrKYdjeq5MlbkqcHpxZCabILSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AHJb74Lc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GBe7nC3Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AHJb74Lc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GBe7nC3Y"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDDLAH1062938
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 13:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SwPjqS2iwwL9J0qfM9lE1UqUVbWkjqsis0Cpn2cwx8A=; b=AHJb74Lcc8VyvrZI
	eKVjevHMwh2OH9yXs0MNVA3mtFMhD+PT6+Ak9jwDECoWc1v9UpgaHUGg2ifaDur4
	4EWxabJeGWKoCMfNwmpl0ftCtbxXTMsjCGRAM0PlBSeLel41nHmyLTaRIlA4bJh/
	gUdPqgehZE8K8m5y9ay3giq7slSzRsZyexRQuknHNXbGRZVE4bNHuFtbyy4amMz0
	t8JgYPkuFzzTG4mMkfqtaQY/Y42JRrdJreWcA7X35PO/c4kafYalxbVhbClEZvz1
	7UWkD+esK7MB739svrCmMY9jg0jla7+5dSqgOtBacc8tJ9BjJmh4w164DJE0nYAP
	TOfVeg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6yfr4fr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 13:21:46 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e0234967aso1765019b3a.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 06:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785417705; x=1786022505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SwPjqS2iwwL9J0qfM9lE1UqUVbWkjqsis0Cpn2cwx8A=;
        b=GBe7nC3YI7UVrONwT49BKSWlODDDozpWdfpFCBdxRMIx8iJ38EFNWTALxJbsXTH+wP
         xCtBiusMpqIvvAd4ZQP4zeoUwlTAC3auZP7c6teLF8z0VlhYm4xCQJ0qgi4dRqINOMZ3
         v2HGHm9SmvZAs9d0hhLtV4Yazj6QzrOCKauJKynX6LRimH6Fqud45DJyTLcOFiXYG4jr
         CgXjkqSZlEbjs6ZozQwc472onViBiApLjuEjMJoB681oulcH2YB8VkresQbRvNyiaaC+
         MG4MhRBmwiuxJ7guR/8e1DYu0P1S6ZPZEBQJ3BSC328zHnKbwd+mmVE424O4GBpOYIc4
         W6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785417705; x=1786022505;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SwPjqS2iwwL9J0qfM9lE1UqUVbWkjqsis0Cpn2cwx8A=;
        b=Q0Wx+ccJ+m6oIDF5auxnjS5Eq2vS7DNV6Ytix3wa42tWX1qlD8mgCDJNOdXDKKgr8l
         f7Wbc5BdhcDHnI3IgwKjZ2vgrFrFK41n6Yqdg7JTbNvTiFGDj4vCyAa1HxTouaaUS6WY
         0FwR/UH3zhcEH23owZKd88pC8vStstyfzuzNkD3mV9KYntuZuNYUnfORP2ulJLeXc5Gi
         x+HFtkRpZRmpyLybF39KBxpOwyCa9OukxEUn0WoMk+qKgv4q0Ge7WKEVvsCzqk/j+EB8
         kzNlom9ldaQfczmeRHXErmS0/4NKymN49oj/DNftdqKfax9TJomwWlbms/o//CNXv3vi
         AD8w==
X-Forwarded-Encrypted: i=1; AHgh+RoA5hBcZ6wcwGS143gbV+kT1F0s2s29m5+OKNRRqpyl6F9714dk759IitO5bLUT/QCMYrGB7t/tt/Wq@vger.kernel.org
X-Gm-Message-State: AOJu0YyZJpfCSamiCYnaxjgaxo2IJmokcNSHRwMSOOwbLaZz6H+ALsyP
	tK9pwvNC8E+wnoRJfPI7UKDlmgZskO02QO7Fk1NoYG1Hr4JqtDIVbzX7e+ZtC5v89uO0xbksWUq
	V46DsZi2FLNKb3K9jiIR6ewZcUGI0U86ocP/YMbCxOYQPuzcKAoD1fEZpvfONzEpj
X-Gm-Gg: AR+sD12JzRCKugXc+axjA5WFB8HwnRUhCdXAK2Sandd3bOfWDgwYm8rRTbUeFe+hUW4
	QLtg0EsXrizyJ3vagyFLxNARYkqo/dZxc7l8hF1YbX9qabfNM7Nsi6COQJNz3oaKBtrU6gd/xn/
	ocqME2YuS4EKHV+t/fhq1AJsGFafWCpM0/OZS9S8Ff1NA0BZqUV+IOErMyLrZM+Af+LnXOXMhq5
	XPhbO4BAGzKTpj9KvqLUbyMn31Cidwlma9oSPO8R2Uxh24FOPav7XwkgW5ZdxxvbhuuOOg3iPOf
	iyGcMJXekk1mw1qiu0r/j+3OIbmNZUqOi7Ch0GYcIfdBOFJ612GBIhWNGCI//q1JQp30hE2LZ6s
	KtgUvT7ajjsLJjlgmIQimaf7mE/oFkKKOGAbRjXh1OkNNcIhPo5tvYfXI13JhS/WU
X-Received: by 2002:a05:6a00:3cd4:b0:845:e9e8:6458 with SMTP id d2e1a72fcca58-84ebc2256aemr2747427b3a.20.1785417705405;
        Thu, 30 Jul 2026 06:21:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:3cd4:b0:845:e9e8:6458 with SMTP id d2e1a72fcca58-84ebc2256aemr2747394b3a.20.1785417704774;
        Thu, 30 Jul 2026 06:21:44 -0700 (PDT)
Received: from [10.133.33.36] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02fa474sm3085471b3a.30.2026.07.30.06.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 06:21:43 -0700 (PDT)
Message-ID: <95fc42ef-2399-4448-9e75-a3709673004f@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 21:21:40 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jie Luo <jie.luo@oss.qualcomm.com>
Subject: Re: [PATCH 06/12] clk: qcom: ipq-cmn-pll: Add PON reference clock
 support
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
 <20260724-qcom_ipq5210_cmnpll-v1-6-a8b8679d215f@oss.qualcomm.com>
 <20260724151116.0950B1F000E9@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260724151116.0950B1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwMSBTYWx0ZWRfX30r30EdPrEYV
 Jl+JuGN7t2jodhSBlhSPrZSxlYGvTt9YFrt9+vpOMHb+Rx4rbRcOWdIwWxV4zpa/UfIHpGy4fVn
 COwcS7wtPydV42iQnHpRJF28JqzMxLjlAftrVY7aWKwFvHKOigoGhnBYQFQWgXT++MDRcxwqHHQ
 WxL75cROWfwPHBQfBFHlgakanoKjK/TOYl2MF+hhZGPqU5yRNMJPKFd4MIqzVX5JHNEA1zyDDgn
 Z/nvOJJNPZ1RV9fEs9qCZjAu+S3M+hvpqc9nQVAgAPOK2PTXHD1THe9XekiTKhGI4BzaAJ76Y3A
 983h+fjfN0BFK3g+11y4+14EHyky2DkcIp+OO9kQW2rqSMipMzTdMVkOfNRNK+JH7QjipilOJs1
 xzYmocnAv9GAXHs4YBEcnMWI+Aa7aX6PQlAW6zBdhedtZ/G9OZO/ZXZp3bZSejPKf8VrGXUzlKW
 xEqW2xl4L87r5q2syLg==
X-Proofpoint-GUID: 7Dv5_7Mz9LE03AxKnKL_dbRZmq4ybn1I
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwMSBTYWx0ZWRfX3hvHv1et1fzY
 vF5gB53EKYYKJDNqzTnULr/KKQU+EzmXN+7pFmi2iXeS/Qu2qdHjK3wbrkh3caAoXY+1AuDk6S1
 sA2mFskhk9qHPCOwiRebyTArmZWXex0=
X-Authority-Analysis: v=2.4 cv=Tv3WQjXh c=1 sm=1 tr=0 ts=6a6b4fea cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1Y55TzUOTM1hpNItK5kA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 7Dv5_7Mz9LE03AxKnKL_dbRZmq4ybn1I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300101



On 7/24/2026 11:11 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] 64-bit divisor passed to DIV_ROUND_CLOSEST_ULL causes 32-bit truncation and potential divide-by-zero panics.
> - [Medium] Non-atomic register updates when switching to PON mode can cause transient invalid clock states.
> - [Medium] `clk_pon_refclk_determine_rate()` returns 0 on invalid rate requests instead of an error code.
> - [Medium] Missing PLL analog soft reset when entering UNIPHY fixed mode.
> - [Medium] UNIPHY mode is incorrectly excluded from rate rounding for near-match requests.
> - [Medium] Missing error check on regmap_read in clk_pon_refclk_recalc_rate leads to use of uninitialized variable.
> --
> 
> --- Patch [6]: [PATCH 06/12] clk: qcom: ipq-cmn-pll: Add PON reference clock support ---
> commit 66c5c5bce6266424eec1b5f6855bb022b40a0322
> Author: Luo Jie <jie.luo@oss.qualcomm.com>
> 
> clk: qcom: ipq-cmn-pll: Add PON reference clock support
> 
> This commit adds support for the PON reference clock to the IPQ CMN PLL driver.
> The clock supports UNIPHY and PON modes, with configurable dividers.
> 
>> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
>> index 020ad12ca1f2b..1ae32052b5634 100644
>> --- a/drivers/clk/qcom/ipq-cmn-pll.c
>> +++ b/drivers/clk/qcom/ipq-cmn-pll.c
> 
> [ ... ]
> 
>> @@ -540,6 +545,155 @@ static struct clk_hw *ipq_cmn_pll_ppe_register(struct platform_device *pdev,
>>  	return &ppe_clk->hw;
>>  }
>>  
>> +/*
>> + * PON (Passive Optical Network) reference clock operations.
>> + * The PON refclk is derived from CMN PLL rate / 2, then divided by
>> + * a configurable 8-bit divider (1-255).
>> + */
> 
> [ ... ]
> 
>> +static unsigned long clk_pon_refclk_recalc_rate(struct clk_hw *hw,
>> +						unsigned long parent_rate)
>> +{
>> +	struct clk_cmn_pll *pon_clk = to_clk_cmn_pll(hw);
>> +	u32 val, div;
>> +
>> +	regmap_read(pon_clk->regmap, CMN_PLL_PON_CONFIG, &val);
>> +
>> +	/* Check if in UNIPHY mode (bit 9 = 0) - fixed 31.25 MHz */
>> +	if (!(val & CMN_PLL_PON_MODE_SEL))
> 
> [Severity: Medium]
> Could this use uninitialized memory if the underlying MMIO read fails?
> 
> The return value of regmap_read() is a standard negative error code on failure.
> Since it is not checked, val may be left uninitialized if the read fails,
> causing garbage clock rates to be returned to the framework.
> 

Good catch. Will check ret in the next version.

>> +		return 31250000UL;
>> +
>> +	/* PON mode: calculate from divider */
>> +	div = FIELD_GET(CMN_PLL_PON_DIV_CTRL, val);
>> +	if (WARN_ON_ONCE(!div))
>> +		return 0;
>> +
>> +	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2ULL * div);
>> +}
>> +
>> +static int clk_pon_refclk_determine_rate(struct clk_hw *hw,
>> +					 struct clk_rate_request *req)
>> +{
>> +	unsigned long div;
>> +
>> +	if (WARN_ON_ONCE(!req->rate))
>> +		return 0;
> 
> [Severity: Medium]
> Should this return a negative error code (like -EINVAL) instead of 0?
> 
> Returning 0 tells the Common Clock Framework that the rate request was
> successfully determined and adapted, which will cause it to proceed to call
> set_rate() with rate = 0.
> 

Will change this to return -EINVAL.

>> +
>> +	/* UNIPHY fixed mode */
>> +	if (req->rate == 31250000UL)
>> +		return 0;
> 
> [Severity: Medium]
> Does this exact match prevent near-match rounding to UNIPHY mode?
> 
> If a consumer requests 31249999 Hz, it seems it would bypass this exact match
> and fall back to calculating a PON mode divider. This might yield a worse
> rate, even though the hardware inherently supports exactly 31.25 MHz.

Good catch — Will update clk_pon_refclk_determine_rate() to compute both
the fixed UNIPHY-mode rate (31.25 MHz) and the closest achievable PON-
mode rate for the requested divider, then selects whichever one is
closer to the requested rate.


> 
>> +
>> +	div = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2ULL * req->rate);
> 
> [Severity: High]
> Can this cause a divide-by-zero panic on 32-bit platforms?
> 
> DIV_ROUND_CLOSEST_ULL() internally uses do_div(), which fundamentally
> requires a 32-bit divisor. When the requested rate is large enough,
> 2ULL * req->rate can exceed 32 bits. On 32-bit platforms, do_div() silently
> truncates the 64-bit divisor to 32 bits, which could result in a divisor of 0.
> 

Will switch to use DIV64_U64_ROUND_CLOSEST() instead.

>> +
>> +	/* Clamp to valid range (1-255) */
>> +	div = clamp_t(unsigned long, div, 1, 255);
>> +
>> +	req->rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2ULL * div);
>> +	return 0;
>> +}
>> +
>> +static int clk_pon_refclk_set_rate(struct clk_hw *hw, unsigned long rate,
>> +				   unsigned long parent_rate)
>> +{
>> +	struct clk_cmn_pll *pon_clk = to_clk_cmn_pll(hw);
>> +	unsigned long div;
>> +	int ret;
>> +
>> +	if (rate == 0)
>> +		return -EINVAL;
>> +
>> +	/* UNIPHY fixed mode (31.25 MHz) */
>> +	if (rate == 31250000UL)
>> +		return regmap_clear_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
>> +					 CMN_PLL_PON_MODE_SEL);
> 
> [Severity: Medium]
> Is it intentional to bypass the analog soft reset here?
> 
> The soft reset is performed at the end of the function for PON mode. If
> entering UNIPHY mode also requires a soft reset to reliably latch or
> stabilize the new clock output, the hardware might be left in an
> inconsistent state.
> 

This is intentional — the analog soft reset will be removed from all
derived clock output paths entirely, not just for UNIPHY mode. Keeping
it risks disturbing other already-stable clocks that share the same PLL.

>> +
>> +	div = DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2ULL * rate);
> 
> [Severity: High]
> Can this cause a divide-by-zero panic on 32-bit platforms?
> 
> Similar to the determine_rate callback, the 64-bit expression 2ULL * rate
> is passed to a macro that expects a 32-bit divisor.
>

>> +	if (div == 0 || div > 255)
>> +		return -EINVAL;
>> +
>> +	/* Switch to PON mode */
>> +	ret = regmap_set_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
>> +			      CMN_PLL_PON_MODE_SEL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_update_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
>> +				 CMN_PLL_PON_DIV_CTRL,
>> +				 FIELD_PREP(CMN_PLL_PON_DIV_CTRL, div));
> 
> [Severity: Medium]
> Can this sequential update cause transient invalid clock states?
> 
> There is a brief window where the mode bit is set to PON mode, but the
> divider has not yet been updated. If the previous divider was 0 or
> inappropriate, it might expose downstream hardware to an invalid
> frequency or glitch.
> 

This is intentional and acceptable by design — the clock rate is
configured before the connected PON/UNIPHY is brought out of reset and
reconfigured.

>> +	if (ret)
>> +		return ret;
>> +
>> +	return clk_cmn_pll_ana_soft_reset(pon_clk->regmap);
>> +}
> 

