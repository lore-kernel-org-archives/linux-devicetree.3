Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B007749480D
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 11:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436774; cv=none; b=GCtMxpRdN7hrkEwCCUt4GF9ECfRvmpI1mvUBMrWifk49aBYwbeGP+Lbk1fHo/ibpgWMQfzaO0lDTmC9Qu44cmA/v6qXUkYC6dk1QeVzNj4+VK1BWMPdZSEZ5H6cfGwbJhMQDIzqT7CaoSN3ojDwCAn71c+oBsPWZxjUCQgxsh/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436774; c=relaxed/simple;
	bh=7QmXtZAxTs7eawrjZ02CXScDt87oRJ5G/NUCVI6qPuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dr4vfcPIKiK2kRAszgLJ0qYdFJMPlIcHI16gIgn3Bd8OPHtVMmUh09+Us0WgGASpJHFsauenHU2Qbhw6cdiFk5VukgkTXQPTCdbWTH0xcFKBuGzD3158/56VlyOsZT65D1AwKpAd/JxDSm7SeHKWTDj2oGYtIed01fOWsDtFXr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gxmLwF5f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eux9TEup; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gxmLwF5f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eux9TEup"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHApO440123
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 11:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G1Qym9kgY4rq9h5EI/XXBuMVMLgjEotX8kn67PH7ku0=; b=gxmLwF5fBmd8f75u
	sRW6IU9ZMIG0PRXHPGElLnWFEJo4TKNXOKYuluMo14b/JlCYJvZ8EGGpOza4K1X6
	sM25jcFk4HFwdTSdvxpaUVE/aj9of/m2Dyum9SXHIaYfjkLNqma7dB5fViCFfYZj
	h8oTky5qQ9OeDJqrxRi8kYf9L1p5P5Ys25YlnNtDTbcCAsxoQXK2DUVn7Q0seEOo
	BuIKAf0U/mxQu6sNp11ie2mgSrcPXoe3HwgK5YrtkszLW7bxTkanNEGXpgCNUElU
	1p3GhJtaSdaA0WnDfBOb6IOsDMbXHyzNMsmpKWcDBXgvGbd1olhWmDMDVCEty64T
	b28Krw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6p70f6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 11:59:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso54497585a.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 04:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788436771; x=1789041571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1Qym9kgY4rq9h5EI/XXBuMVMLgjEotX8kn67PH7ku0=;
        b=eux9TEupaydYJcau6OXsSY9Hjr9pURAILSGJ7okAOfMZFX3ApfbLc3UL/Yyy5aUUT2
         ftiZHxCHy3cqr0hZQaFNCgTfzT+BHjHc5QY3BXdqym3Ks0K/o2N1/bBYlo0OH4v7D027
         ssLYpW4Te+q9v4x1y72gVAV4aLLCRw2EbpQhO5yzz7B6t4czrkYkJd32f+RZ/WdS/c8n
         /Z/Yjeu8u0pEzp64UePDgXZq5NQMc/tZ4KhKlnJjxzXTTq5ifxUWs78vdnqLB36AwnOD
         vD3ey9U98wzJnbF6CRSbBZJumWQMZuuB5YZu28LaKXOC6EiliSbuAMI4qDZGJLnEJ85P
         X1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436771; x=1789041571;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1Qym9kgY4rq9h5EI/XXBuMVMLgjEotX8kn67PH7ku0=;
        b=Rav+/otiI3Stpblnj5mNvwy3WHoPeJDwztakhq+/g2/O6CZX8I+ev7RlgA7ZlBMpmw
         5odPQQ3hFZPhb7OvUTxYb9xn1nNuWFzyod+q6TosYqqxDEBuXGcmH4Cxg0xPGyn7fQVz
         nvfiJz5H52zmagVyfnAqs7n7nH/XG/q3Ww4Vbj3Pvih6C4puy2PEAh9heOg/sIR+QFfZ
         //VRQNZDTqMR0q9j1uew3a/PSMeJVffcLIM0hhSR15rFEBaKfGDJjB8BzD00o7ttGfyP
         O6xLZo1s+jqWz8W326RpVDPZrsrAi4w42f8+40X8LJ/mjyyD6FD26YzstSVdTh4qHVTD
         DxAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxzV2bmwpghSJvTZpx0HlRNtYuoji6SL2AsPKJK0bneAFGFaAbshE0JbCA8305Ckqh2EvsYLbnPQTG@vger.kernel.org
X-Gm-Message-State: AFuF++k7IJPUVPvrJkESzxCRLy0pq/6Jz+CefDuqCim2TXfhgTxkl1Ca
	xR2GEHDOnlVUXOzeLw123pnyCh30QX5Dy9Q1yGYDf7O/Kt1cPoneq3PB/eJADg7U7EurjG0VJsq
	RWRMnHPqJ1rXFBkqVN9cnWTZu9bIhktxlLFlOCP9+LPQOVLtLINz5O6g98UofgV/t
X-Gm-Gg: AYBFou1q4ALzv58lQ9WnXrqemAFUyiUbuHq06xF1izGVqEBgZxPWIrTImror3nFZh+c
	ZIZ4saYhjJCNH/zrqkmik0uXamq/Vj3cXaAIAKtdZsdmFYR6qiyrR+SCz0FWi2j4NOxOcrqGHzm
	GvgkgCVp/z/XxQ5+yXZIFfiqyMK7CxvL3pVpkEQEE86tJtR/G6fnmjZ0Eg2UuRo2AwrIrvCmNFV
	O3hXBYrfyyLW31qUIjjhvRTYAG0vUmHAS285BZ1P/aM/20gDEgCUlXhNBkAV+j8u3v7YSOf3Y75
	iaUDIB1316730MGV0UIrtWQmcj+tN8RjUYFkVuJsMlA2CaGRCmCMsbxA2HnfCnRfxhmKza9Yfvh
	fcWd26Qv+B99wuqj/q40fCA==
X-Received: by 2002:a05:620a:6492:b0:937:6f83:e80f with SMTP id af79cd13be357-93960cd1505mr798651385a.1.1788436770809;
        Thu, 03 Sep 2026 04:59:30 -0700 (PDT)
X-Received: by 2002:a05:620a:6492:b0:937:6f83:e80f with SMTP id af79cd13be357-93960cd1505mr798646085a.1.1788436770236;
        Thu, 03 Sep 2026 04:59:30 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f42307e6sm88905266b.55.2026.09.03.04.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:59:29 -0700 (PDT)
Message-ID: <e5509cfb-0b97-414a-98b2-c030758f9899@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:59:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/12] clk: qcom: ipq-cmn-pll: Add clock gate support
 for fixed clocks
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-9-21c3db378611@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-9-21c3db378611@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5vYKJVJ0JH5TOz9FtlOlbt2bUm21pNvF
X-Proofpoint-ORIG-GUID: 5vYKJVJ0JH5TOz9FtlOlbt2bUm21pNvF
X-Authority-Analysis: v=2.4 cv=OZyoyBTY c=1 sm=1 tr=0 ts=6a996123 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=lXqaDxtV36Dhfzo6gJMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfX0CGQPHPDaWYk
 AXJ+BkKZBIEsikJ1Lqim47vMRjiHPBpRELR3jbpwv15sqj623ZB25ZzfTgw8cXCtk8qMCdPF0rA
 GrK8hLKE7/MWLR7r2gSV1ApjipHUflU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfX5QxpGGf7pK7n
 UBAj3Is08BASlmojUUEG6cbWll816ClYkMIX0QvwR74aO17eYJilYEYAYwEzqI2uWMjDgorsyQ/
 YeJbCBjFiJZOZ4Db5vnEDRHsFxuyv6CAxI7C5Nyo+1BkkpBwv201euLIFslTjUpSFtm5uU8BOXp
 MdyOuhtX8RX7K5tHfCskvPaov3WPrPSQenCdxIQwaAPLI/ViGoV1iyHO4NnoRHNS7QRe4VJJYIm
 F7wLA/Y8APWxlqauf0efp2XUQ5Lj4bgxAcQ08FFEJjRPN3hbF2XZAs1LpksCpNQGKEu3Vtp5a3D
 UflxkqmdVVCXp5yySuej2jFrUqtA0L7jSKQ1MDvEu1v5K36sE5rdGxyuQPAvpR3mWAcEXoqzoxS
 dKRf0D06rtq6vJA5+7iNoB0mPKpYWKwlm7B6SVGoY0YPb8cSL1Xx7zoirzcWL80fKxe0NS7zQ67
 RvkErs5GMEaFmzXp+JA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030104

On 8/14/26 2:48 PM, Luo Jie wrote:
> Some CMN PLL output clocks require a hardware gate in addition to a
> fixed rate. The gate control bits reside in the register
> CMN_PLL_OUTPUT_RELATED_1 (0x79c). Each such clock is registered via a
> new struct clk_fixed_gate and clk_fixed_gate_ops, combining a fixed
> rate with enable/disable/is_enabled gate control through the shared
> regmap for CMN_PLL_OUTPUT_RELATED_1.

[...]

> +static int clk_fixed_gate_enable(struct clk_hw *hw)
> +{
> +	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
> +
> +	return regmap_set_bits(gate_clk->regmap, CMN_PLL_OUTPUT_RELATED_1,
> +			       BIT(gate_clk->enable_bit));
> +}
> +
> +static void clk_fixed_gate_disable(struct clk_hw *hw)
> +{
> +	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
> +
> +	regmap_clear_bits(gate_clk->regmap, CMN_PLL_OUTPUT_RELATED_1,
> +			  BIT(gate_clk->enable_bit));
> +}
> +
> +static int clk_fixed_gate_is_enabled(struct clk_hw *hw)
> +{
> +	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
> +
> +	return regmap_test_bits(gate_clk->regmap, CMN_PLL_OUTPUT_RELATED_1,
> +				BIT(gate_clk->enable_bit));
> +}

This is also all just clk_regmap / clk_branch

Konrad
