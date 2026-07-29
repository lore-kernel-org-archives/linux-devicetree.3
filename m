Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9944C486E49
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330952; cv=none; b=Ow3ze3C0rUzUSudGfH6bpuGdElzlBO2e321lcnP/a4jiBxuwUiSLkvP/Hdb0G4J7WdAyI8IX17kPSrrge1PGnzz6U3emFmQdy0ExoZ1PLznGIbAEwEKV9DYLl4gqt6tnaRUpZPllnk130mRou7JJ5xoqWqkmceZicUgQXb8aZLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330952; c=relaxed/simple;
	bh=nyAse5/UJpPEzPnHBsekh7k3RbahKU4gt6HZXzUrR1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TO+t2nc3t3BOa57lSYIBiKN9vRGyyKOPfnhAWJ3HTe0yIQSnmeGJ3Z+Qy+/LR9QAUIv6rKylxswXLgoBkBOj8eHZpfxtTnuh8sfy32mxWuaX8EKw1wtj/ZtPyrDwWjfFtOsuxmIpweL3kMYPMpAPCEFNmFjgtPsBlw5x/jYNXHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZHLcFSv3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O7e6OBR3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZHLcFSv3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O7e6OBR3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TD88oP2088383
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	piyeing5sm3Jpk687UCAPCcfeTDfpVNKUnrDk/15p1k=; b=ZHLcFSv3juzbArsA
	6t7SE8BFI6TpbyTrvw/ByZsHM6w4xJtgx2FZBQoV5lAB7xyASms1FOoKEUSLIB71
	gyl5Bqtjr/TnyZIjvT23S4KyzzjM1L+gza051JAcAHINzOcUPciugapyuaMjmcBR
	pYa3DIRa7VC8JajmET3HnNpmKCjiYEzbKrHcZRx6MOWFXoOfDeFACi/CK1cPMJFD
	3aSYHSqGV2i8ixBMM70xiOHF17IM11HUXa77q/GXvHIIqZcJKa7T5bEUKqJPEHXU
	jvTDuGtAHSStpUtM+kglvcHqyfnVDRv5loc0INK/+Dl3/q1uL6EaoSPAT7E3k70h
	5Wsu+Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqhe98706-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:15:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfc52ddc55so12646695ad.3
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 06:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785330950; x=1785935750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=piyeing5sm3Jpk687UCAPCcfeTDfpVNKUnrDk/15p1k=;
        b=O7e6OBR3gXGqd2I7OTFNTm7NgOp1Oz6LHhFevrCdXUQy+rFxewLu6IzzitWzg9Iu8a
         30jK1meIMioLO4AZqIS4NVLLgvJHxYiizRbPz4p5wmOTaZ7D5Qi6HEdMnFb9vrh7Zf6Y
         VYg/SsD4SWveBgM8sY1mTY+Ma1c7BuTG54GmEeOK97HAV8aQHZkTPavPIYzBlurk+Z74
         nLYLjvpoSP4H4A7d1lPrqtNAWe4EUPr+fTdLfvw7rDvRbLyBwbnTPu8BKCOsbRTmyWtm
         yC56WgDOCsWmStoFHAJYYZT443Vr2l4Nqu79MxVc2iWTNU9h8fLWm98Ngst+qKb2iW9+
         3xSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785330950; x=1785935750;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=piyeing5sm3Jpk687UCAPCcfeTDfpVNKUnrDk/15p1k=;
        b=evxE35i3rzqBuTmXJHegwRcXrC6A/+bh/tz+snz6UjqOYGQK74EMzGgwXlvXMCqLU3
         Wn4ZnmIElXFt0iYafAw5YR585IprHGiPnjcJHr1Vf1bSiP3M0lm7LQDhzPDw3v32iT0X
         2MQ8sitFRzNxR5Bigewm88fjhCC7lVYQRNkeGvJZ0ZoSIqXGwJqHzGcECdSazBEhmm6C
         9Cfm+a1a/cmrer0ynGvVHQmL11E9llGLhcEFFgIbBR7RenuNoN8cInjlXAXESGq+hqBx
         MHEgVVepS/w9BZJg/NUNAgZvxMdduLHYn4Ok2pMUtBDHYpIhVFNi8CojKvCCKEDco87E
         E0dA==
X-Forwarded-Encrypted: i=1; AHgh+RoRfqUQVad7hG8YjKJBUHxHIqVzec4kqmBMFjNsut8CubLfjMsJUbR+Esl1driQzVjqIC5+YaTXCmwr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0ICtAHqBr+gLRHacg26y9Ie2II0USsQh6IWCEPoCLU3Xa5UTE
	+AnzxTSDSPDIDDYXjOXoiAhlwojsC4Aqph4h+cE8rglNtNfKn8Wh6KFYVgpwu3XZmJSeDhjg2jc
	FqTuMzBhrlAWu6fJ0Qx/EQK2dpNqq/4VUOG2PdwFjFxFxdjr7YisSE79JOZtjmjJHRqfan5AfbQ
	U=
X-Gm-Gg: AR+sD12oIMIjnlZn6J8vARNWAxrOfclM5wcz/ht/IjSrD0kFYnVRZ/LBliFTYVYlmmA
	VsGpFIBm/JunSg8CMvio2BwaFrADwOa77wImlvXqXkJsi0ezFf9/SeffUzdGx/mnI9WPL1N7rCt
	eBuWeOBfF/NbYnfKGU+6T0XtKNPd/uipdfzLS75IIiOUNOo5oNB2oj2bteifccDO9OC1h2kr+xC
	sZi+yhavEZVvUjsIlgKAMfXCF9Jtw2ugAPZS1RnDmXj3Ouh0YueYQ2Xh77+fa9tTvZHdd74hHbL
	jRPzDCdJ/oiNM7C+2sbDjKhu4GdzKCm4t1TUG+HaDqdnBra3KCu1TXM4r1YppyMnfREXG6rRe/h
	lXrX+jz9djv/tgacbGHZO135K4dUSN70j2P31j1Cv2E/Q3oJ5j5q0rrm1YY0UvZAr
X-Received: by 2002:a17:902:c40d:b0:2ca:281:27fd with SMTP id d9443c01a7336-2d015c878efmr81077005ad.25.1785330950006;
        Wed, 29 Jul 2026 06:15:50 -0700 (PDT)
X-Received: by 2002:a17:902:c40d:b0:2ca:281:27fd with SMTP id d9443c01a7336-2d015c878efmr81076515ad.25.1785330949475;
        Wed, 29 Jul 2026 06:15:49 -0700 (PDT)
Received: from [10.133.33.36] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0228417adsm11343225ad.0.2026.07.29.06.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 06:15:48 -0700 (PDT)
Message-ID: <a9439f32-ee36-4c66-b96e-082b40e9b9c7@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 21:15:42 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] clk: qcom: ipq-cmn-pll: Add NSS clock support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
 <20260724-qcom_ipq5210_cmnpll-v1-4-a8b8679d215f@oss.qualcomm.com>
 <a907cba4-c276-4355-986c-44f6e39c310a@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <a907cba4-c276-4355-986c-44f6e39c310a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwOSBTYWx0ZWRfX9e1diq09IY50
 h8Ad6tkC+My4Iaai83tl3QY43hmpR7Zb5Wh1PcnCJpCspGqoWgJy7GIi8+gr0g+ImVB6mTpPp7L
 R8oJNTZPYLHVtfrMKeAR+gRUX1LN7nA3vphYT2y0EKt9fVQb+hdD2aqlz8P5SrHzInXR/VDTnML
 LUsRoXyNZ9lbUrY93oz7lFeKI7SSXJmMFwKSpO592tKPvgafHv6TJTQNE4rOqMaQ4/XDDW6mvqT
 GovtjUo9b+ll+80DAFK7HYyNUBGIYgUKUj3385Qqkh+TinErmJIxebubQXM5qAuJWaMANxUJFAM
 OrRyCvYVRwJoHxujeJiXWccuFJkNVKYZ6E9J9KZIHnKiyhhPL32W8FjGFkDKWiqFkfSSrvmjlT/
 kaQSCwCvouh79S4Gq6vRcxGE34Mdl1mRuoR/7zEz/BgxgCsSaDun+IhurGMl11ct0TcoEdWjGIw
 gkpeZAhvhnIgCbcS+GA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwOSBTYWx0ZWRfX16qRlXMvR0AF
 kCT7jj7S1tTJoo+iG5QHZ6UmMLXAEF6/x0yqAE9+QhGFBt2N/y/RxBP3NWboh5ZuwiABvHYJMx+
 +g+C8Q8p1bpgAQqGdL/cCltVIC908Ws=
X-Proofpoint-ORIG-GUID: -njJvORHTBzQIVWdHgHa2SdqaSyhhI6f
X-Proofpoint-GUID: -njJvORHTBzQIVWdHgHa2SdqaSyhhI6f
X-Authority-Analysis: v=2.4 cv=EsriaycA c=1 sm=1 tr=0 ts=6a69fd06 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=mo-5zohwMfGRhBBTFyAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_05,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290109



On 7/28/2026 5:29 PM, Konrad Dybcio wrote:
> On 7/24/26 5:00 PM, Luo Jie wrote:
>> The NSS (network subsystem) clock is derived from the CMN PLL output
>> divided by 2 and then further divided by a configurable 6-bit divider
>> with a valid range of 8-63.
>>
>> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
>> ---
> 
> This looks very similar to clk-regmap-divider.c (or at least to
> the generic clk-divider.c implementation).
> 

You're right — this can be converted to use clk_regmap_div_ops directly.

The NSS and PPE clocks both compute rate = parent_rate / (2 * div),
where div is read/written straight from a register field with no other
transform. The only thing blocking reuse of clk_regmap_div_ops is that
implicit 2 *, which none of the existing CLK_DIVIDER_* flags express.

I'll add a new flag CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET, to clk-
divider.c/clk-provider.h to express that relationship, pass a flags
field through struct clk_regmap_div (clk-regmap-divider.c/.h) so qcom
clock drivers can opt into it, and register both NSS and PPE as plain
clk_regmap_div instances with .ops = &clk_regmap_div_ops instead of
hand-rolling recalc_rate/set_rate.

> [...]
> 
>>  	/* Register the fixed rate output clocks. */
>>  	for (i = 0; i < num_clks; i++) {
>> -		struct clk_parent_data pdata = { .hw = cmn_pll_hw };
>> +		if (fixed_clk[i].rate) {
>> +			struct clk_parent_data pdata = { .hw = cmn_pll_hw };
>> +
>> +			hw = devm_clk_hw_register_fixed_rate_parent_data(dev,
>> +									 fixed_clk[i].name,
>> +									 &pdata, 0,
>> +									 fixed_clk[i].rate);
>> +		} else if (!strcmp(fixed_clk[i].name, "nss")) {
>> +			hw = ipq_cmn_pll_nss_register(pdev, cmn_pll->regmap,
>> +						      cmn_pll_hw);
> 
> Huge "no", this must be a compile-time constant and not rely on
> some funky detection.
> 
> Konrad

Thanks. Will replace the rate/enable_bit/strcmp(name, ...) runtime
inference with an explicit enum cmn_pll_clk_type field, set directly by
each entry's construction macro (CLK_PLL_OUTPUT/CLK_PLL_GATE/
CLK_PLL_NSS/CLK_PLL_PPE/CLK_PLL_PON/CLK_PLL_EPHY_RAW), and dispatch via
switch in ipq_cmn_pll_register_clks().

