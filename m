Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2A042F707
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 13:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785416957; cv=none; b=jnOqV/CEKy1HutthPJLQsKh0IykZ//hBU9bV5Mzb1VB79e0l4b2U7g9TCFhktRXahDEWngFg80rLLGhHBuqx/hukS0BzDH4kwaorXgaarLrxOiX95i/lHWDMlBeOoi7Xsp/yuuudNNEihWXTY8207SNPY+avT0/tp2razJ3J8Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785416957; c=relaxed/simple;
	bh=GpgXBBrgTsPZYKnVmLmv1eLcstloi8OyBMAthHlNGjA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rKMh31luWbhaMwZQn6dteCJY8sEiePvL3XP66xdiawauPAy+sD/Q2FN089pBiCadryPXhz1NI6YY+G6cUGoLjCKqlU3fESPqnnz5k6o7BZt83uA4/mKEVr2JdBK3kJNe4QdHtHefeEiq8yNBjbntTnZHAbcBqbObe6GziSudAzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gxMPAmRl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jdd7k/iz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gxMPAmRl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jdd7k/iz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UBHTEe917853
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 13:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KXyVoK9DylIws6i/AdoP5jwmCImOFAT3GjuXpCd+LTY=; b=gxMPAmRlIG3dllfb
	4SxCb3CcnO9o4xFnWgK5i+aOu//3nJ9oBUwp19IBXkK18G48oTwTz+pZuCyaUYEx
	kIJnXYQGnqVJepAOMicCgw8XN38xaFC43wMt5kP0Brmuy2Sh1zHWx9bboHdfm+qb
	J/yQZJGPB3Oh8SkGJtC3cxY5qS56ME+kflNh7KlhgpO1p1WYfIt1ehl1naieHtTG
	fUncjQUAU4Pc0iQgI1tGq4NhcQNaKz0vsc166Rj0qesbahj/SAaJu+0LyPrGjiVZ
	NnTtwyIrw8sJ7wBwkgRhcn1SQJVFMnMRo8OKADFalYpTq/FrAryKhvIGxJrzXL4m
	iJwidw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr5m08e9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 13:09:14 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e13b57b2cso2982041b3a.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 06:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785416953; x=1786021753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KXyVoK9DylIws6i/AdoP5jwmCImOFAT3GjuXpCd+LTY=;
        b=Jdd7k/iztF+pgTtrQTAdWQMhswvH92n6buJgf2P8SoHAGq7ormUJMwwxiG1vYsPd4E
         kRAKlqepbocRXApZ5j4Xxzr8xAQsDAgGuK2N0nWDF8Uqz/LjPsdkPse7zcd36VSyw/KS
         1UzW43dCnrjTH0PCdTLlep5nH7MVKweXleO6wD647qi85VLovJj+peAZ6KOTOfhEuGwx
         apJ1nrJ2A4Pvs/DijoYqunVZkDvc65Gozcwjf+Ecg0kfQcw+S2D+opPzISrdSzluwXv2
         ov+6KRgPP7aaNPcUobggcM09qldR9W18XCpGgLndmom2ZmnVe0GG9L+W/mRv+edY+wyO
         GSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785416953; x=1786021753;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXyVoK9DylIws6i/AdoP5jwmCImOFAT3GjuXpCd+LTY=;
        b=orM8q/OG7zfU8W++Qg9lMXyVoR6vKrfm8CSMVPWcQkoPW/Rxp6D67n8YIsDAFI21Dd
         OPgh0SImfMUzb8PIPEqotiVv1ED/tmA0CvBEI/2gpnwOYHuTar3Y2l8aUI6JPAsfmSxZ
         l+SD2bEl6z9RjgCmhkupTA2kGQE3Pg80CphzgBGt/8DUry4TglBV8fV2XyiwzZAIW4af
         PDL8ba3uOdCHEl63yB3B7Q2VeibeGPFC2TZbyoBeh1EeH8ZA3xJPRKHxbeIxms87JWiY
         X6+kG8O1yOVeNkdfTHoImtx1MVLclM0FI+db7widtajPz38cWEEEa/O/nNIdTloYr+Xe
         QqWA==
X-Forwarded-Encrypted: i=1; AHgh+RrxW78Csp88rKlUvaOiY6R3LOpO9VbZ2vbxr28E6hynLfOZ9NRWkf/Uv2q5jxyT2/6RsLl84ZGja14a@vger.kernel.org
X-Gm-Message-State: AOJu0YzjVGS7fTgJemVuVJfthWV0ch9giGn/pSeucNBv52//3PntGBWR
	efKgrS1TpuwdQOoP6raEn5eKP5G8AcqsxX13SbXtk6D5Z39hZr6I99LdBzfed7sHiVyOiZdJthq
	JawBuZqbCn1PORPboACYSH6CHgDDdpNRWnWPCfgBb+jz47i2lgEB+oll2biVHVl6v65ysu2EyF2
	w=
X-Gm-Gg: AR+sD12Gw/Ma1v6nYUUrmo/s2Z4zZ6ZdHVnHqdF8fzl3mq+lJfGf/rEykPmKZ/Fganh
	GWhazDWCzp39QPmrd+FcQKP+4EERBF6RmWiAczNif9pUzte/zfuJvWFCulSCZ8+Ok/3ManVM78s
	5dhEA+a01JLp/r1ASnZLHSadMyXHk2L3G+AgHZ7A2Rx7eU2JXGPFdLbk5R1KEF+ze53gf5LsGjf
	2kh7cvEt2cVAxXiToT7nyKfMAXPUKxbeZ/WEgERGrQnQhYIxaBrON8uNdWLBD+w/l+sGxTFnPM8
	ZtZ4+ogzO3EOAG/CD+mN/cBsIm2Oe0SvdNAB5nF2rAUbNRugsNBOWSBShsVfoMY63MnxDmD9M9M
	KMV16XMPP6SqgD/TZccqU6X6LlWLnyXV3WDQRHZPHMWs+O1Cqr6ztW9mQljP9ToxT
X-Received: by 2002:a05:6a00:94d3:b0:848:2f73:8ffd with SMTP id d2e1a72fcca58-84ebc40a397mr2319863b3a.70.1785416953332;
        Thu, 30 Jul 2026 06:09:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:94d3:b0:848:2f73:8ffd with SMTP id d2e1a72fcca58-84ebc40a397mr2319832b3a.70.1785416952816;
        Thu, 30 Jul 2026 06:09:12 -0700 (PDT)
Received: from [10.133.33.36] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0373ad9sm3095740b3a.40.2026.07.30.06.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 06:09:12 -0700 (PDT)
Message-ID: <546a6c0e-889e-4f38-9ade-805529c1ae78@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 21:09:07 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jie Luo <jie.luo@oss.qualcomm.com>
Subject: Re: [PATCH 05/12] clk: qcom: ipq-cmn-pll: Add PPE clock support
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
 <20260724-qcom_ipq5210_cmnpll-v1-5-a8b8679d215f@oss.qualcomm.com>
 <20260724151928.CFC1A1F000E9@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260724151928.CFC1A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7O1rdN1002v4WyTfoSJKjFY45yoeLuBx
X-Proofpoint-ORIG-GUID: 7O1rdN1002v4WyTfoSJKjFY45yoeLuBx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA5OSBTYWx0ZWRfX3r1OlPw6WB2X
 EVPzzUoAAsXTxlHXQNbpW1DhlG6w0zFCnsrHAkldPhvvplKcO4+1f45A/LNXBnwIT/LMUWN7I9M
 qzdcJLtbtgOXbNlTao/zCTP6TED91kI=
X-Authority-Analysis: v=2.4 cv=esPvCIpX c=1 sm=1 tr=0 ts=6a6b4cfa cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9GuRNae2Cp1ORx1i7rcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA5OSBTYWx0ZWRfX7NkFLjowb/tH
 e0FI82M9dmyFS51feaYqspTaOm7VHxkHyd/d5qzWXm+AVZ7NW+GryURzYxRZs5kcR+XFdqatocx
 bwrdajHG6EU/Y+dC5hwMdLEWBdzRtf4XoJDob2h7me2k3Hgt2f8Ms3Zb+baxsdgeVLoXZdlr0Pf
 6G3myuwoSy8UCvZicEg8yx5vvZFIR9lxf5r399GbohTEJNUBbeXFG33eteJata8E0hFY/tFAfoT
 0tRrV6rpZHH2xmpPG0USOJEgpl26sW/KmOTgFyZLU/Nv2A+FuyiiLRYF05JxxePS31fg+IMzR8N
 0HV6WBV3OizR7cLoznFoe39mjoVe3GPzmkBhv9YjIgm2TsMLjccU4dc9eA9rUfSukTWkA0ns72Q
 dhEPBY3hDOuGQ35vIAftRiGZsVca1NC8x2aENo+p8RnySSdUzTCq2HnQ/vis/G8t7d+2RPdtoXI
 Suz91y9jmFGBoJNZu0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300099



On 7/24/2026 11:19 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Using DIV_ROUND_CLOSEST_ULL() with a 64-bit divisor causes a divide-by-zero kernel panic due to 32-bit truncation.
> --
> 
> --- Patch [5]: [PATCH 05/12] clk: qcom: ipq-cmn-pll: Add PPE clock support ---
> commit aed5f1938300824fb26726205b9e4ce2ebf415fa
> Author: Luo Jie <jie.luo@oss.qualcomm.com>
> 
> clk: qcom: ipq-cmn-pll: Add PPE clock support
> 
> This commit adds support for the PPE (packet process engine) clock,
> which is derived from the CMN PLL output. It uses a configurable 6-bit
> divider and shares a frequency control register with the NSS clock.
> 
>> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
>> index 3df326c22fbac..020ad12ca1f2b 100644
>> --- a/drivers/clk/qcom/ipq-cmn-pll.c
>> +++ b/drivers/clk/qcom/ipq-cmn-pll.c
> 
> [ ... ]
> 
>> @@ -462,6 +463,83 @@ static struct clk_hw *ipq_cmn_pll_nss_register(struct platform_device *pdev,
>>  	return &nss_clk->hw;
>>  }
>>  
>> +/*
>> + * PPE (Packet Process Engine) clock operations.
>> + * The PPE clock is derived from CMN PLL rate / 2, then divided by
>> + * a configurable 6-bit divider (8-63).
>> + */
> 
> [ ... ]
> 
>> +static int clk_ppe_set_rate(struct clk_hw *hw, unsigned long rate,
>> +			    unsigned long parent_rate)
>> +{
>> +	struct clk_cmn_pll *ppe_clk = to_clk_cmn_pll(hw);
>> +	unsigned long div;
>> +	int ret;
>> +
>> +	if (rate == 0)
>> +		return -EINVAL;
>> +
>> +	div = DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2ULL * rate);
> 
> [Severity: High]
> Does this code overflow the 32-bit divisor limit of DIV_ROUND_CLOSEST_ULL?
> 
> DIV_ROUND_CLOSEST_ULL relies on the kernel do_div() macro, which strictly
> truncates the divisor to 32 bits on all architectures. If a caller requests
> a large rate (e.g. 2,147,483,648 Hz), 2ULL * rate will have its lower 32
> bits as 0. Could this regression cause the divisor to truncate to 0 and
> trigger a direct divide-by-zero kernel panic?

Good catch, DIV_ROUND_CLOSEST_ULL internally calls do_div(), which
silently truncates the divisor to the lower 32 bits on all
architectures. If 2ULL * rate exceeds U32_MAX (e.g. for rates ≥ ~2.15
GHz), the truncated divisor could wrap to zero, triggering a divide-by-
zero kernel panic.

Replacing it with DIV64_U64_ROUND_CLOSEST() is the correct fix — it uses
div64_u64() under the hood, which handles a full 64-bit divisor safely.
I'll update it accordingly.

> 
>> +	if (div < CMN_PLL_NSS_PPE_DIV_MIN || div > CMN_PLL_NSS_PPE_DIV_MAX)
>> +		return -EINVAL;
>> +
> 
> [ ... ]
> 
>> +static const struct clk_ops clk_ppe_ops = {
>> +	.recalc_rate = clk_ppe_recalc_rate,
>> +	.determine_rate = clk_nss_ppe_determine_rate,
>> +	.set_rate = clk_ppe_set_rate,
>> +};
> 
> While clk_ppe_set_rate might be protected if the clock framework previously
> clamps the rate via determine_rate, this patch also points to the shared
> clk_nss_ppe_determine_rate. 
> 
> Can unconstrained rates passed into clk_nss_ppe_determine_rate from the
> clock framework (such as via debugfs or a malformed device tree) cause a
> similar truncation and kernel panic during rate calculation?

Yes, DIV64_U64_ROUND_CLOSEST() should be also used to cover this similar
truncation issue.

> 
>> +static struct clk_hw *ipq_cmn_pll_ppe_register(struct platform_device *pdev,
>> +					       struct regmap *regmap,
>> +					       struct clk_hw *cmn_pll_hw)
>> +{
> 
> [ ... ]
> 

