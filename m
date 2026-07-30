Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCA743303D
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 13:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785417403; cv=none; b=jJw3tQ6+qDTNjg1BAb6t5DtAwXmzZ1y/+Sb8e3UUgrsxtaVJPskZhMqKcyJFFFfw5JudruBOQmRLBr0dxadhBKTxcs16kIV7nlInnzE7rv7y7Mz8u3MpgsBlH3hZoKXs/EfZ8XJJgiaeD4autY6WcA2Glg+wgJBy3r+k1ThIZ1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785417403; c=relaxed/simple;
	bh=5eOyDQoJrw5YYOkzYcTNWz8jp8C5rN8jkUTDfGDLP7E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LxQkZOCJ/yo1KoPosFMSV70Z2//Q8wXe6bOIFaNXaorAeMzEbEvSk/WLkHSo3ZGnCV9LanjVe7dxx+Nj5vP0YGzzz2mA45aUTPzxhT4t5M5BnyQwvMi4w0M8Rm3+VARIOFW04m8xLbbD/S855u3S8ouKW+eCvfq1mIu25vzyc0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qbg/Rggq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j3PXqfeM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qbg/Rggq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j3PXqfeM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDDTGW920548
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 13:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l5v36SM2PBcL6vte5TmMFSwAC0hmYbuFw7H8GsnB79E=; b=Qbg/RggqO3fLJZ38
	aBQslvRZAPCc0LyGBdwv5bLYvBsSk2SYqx2BOt8kURmfMJO+08We7e77iv1j79SE
	d9bm3xXxS6360fzosXvC73O+bxcT+YtamrXPr2dFH8B345uIVLNCNc/9bAPF1LQN
	TC2QEdsvzFD0uerNGcAQt7hHjCLzxac4DouGvP9WNUqlmWFO7XKQM8/i87l4sfII
	JGz+BnIxHQ0HuWvcjAsz1frRHRFCDQzZnJQWr5fMuYDILddydb5uu8g14bdbkDZP
	0AjLCDCc0PDJMHgUXIh/NseCOQ1XoU2zlXgBVOWBGJ5HY5jxVuCSexTd5SmpuBMM
	kkGuxA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6s1r5q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 13:16:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so3357526a91.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 06:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785417400; x=1786022200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l5v36SM2PBcL6vte5TmMFSwAC0hmYbuFw7H8GsnB79E=;
        b=j3PXqfeMRtL3sFs+cq888tfvZOsXfofUWlUDm/mX1PwIu2a5vFF4CvHFLC6lu1RrqL
         mhbvY2Vl5XhD35VsQ2OAaJ/KIkDEzJK6M4cRzM9pgy0D7a7aOosx3qifcRVrRz5YGLP/
         AjYDBjzTGre4HWp5vJBzuZUQcRbK6U6fKe6TZ2Y1cELrg9USROEKGYwkjMzGfgl67qmP
         +Gq+3EomTxnJ33tBTT0DRYCzl62OAUjDnuadvPD0seE+oHf/pRgWLDYUyrzK0rjYdvn+
         clWQN7VJLZ7TS3oqg+tK4bOKz8PICKGI5w0+beTAaiKLI0s1Dh/Tv49tb/JLIgkKU2Qb
         UcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785417400; x=1786022200;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l5v36SM2PBcL6vte5TmMFSwAC0hmYbuFw7H8GsnB79E=;
        b=cjJhpq2qBWW64OvmEJqRB4xX4EkY7XGXeHOVEnF4u+kuqBWaR53GhVZSrfL2QfM0Ab
         MGoijebHjOZZUGmeddHrvCjPyaugYr3wwd3fd425Mnw/ZgHln5mmPo0gf3Fb2cbtQ8Y9
         BrxgMicqgraHmbppoKnTm7qNiEbmQwsqJoiIjwIBNx58WXQ8lORo+zNQAlm5V9sHx6N7
         d79iWIXo3z7mMFlsXy907BquOe+HCaCWU/ELsrgMmnRbOlIo73yCANJmm2BKC8TA2lyZ
         fREZXRxxvYekgXqhUpquDaBvPZcCgARPzcdFhexeLQdPHci2P+ONXaNq584vf+CtmJUc
         4cYA==
X-Forwarded-Encrypted: i=1; AHgh+Rrg9AQnJit3kTCkgXkQRKrmrGSdXT0xnp8/B2tFtovhCBkqB1fLI4duA9kZw0ST2BsZYD8n7N1w4R6Y@vger.kernel.org
X-Gm-Message-State: AOJu0YwLJfGrOgbFrqb+WWCaDouScC/94rrU9KIYmyAk9XwuK9uu1YXz
	UyU0sj5+okhWO713MP4Zhdzs+I2fjvzjd0ZW8AyMxTrx8ejAytQKLotfeYqL8AzDoe2XM/OZBNE
	ZL4+Gz0fBK9s6wQtq7PFLTFHwxsXcwijRx4JX6SvfRhfUZSPqZjaAHv6QD36FwZF/
X-Gm-Gg: AR+sD13lJ3/QA0CcyAp2j0AjQ70CXk6BZTWydarzz4Dyz7PbEv5U8emu78Bts1O6Z7/
	o5Gc/YMJHVEM7o3LAdsMTDpkux4NopQN2KDW6ISTRnGkIH3AsFWr/pkEBaDMxD0Y87TtHmZMOVE
	mJSTrleLRjR9EYXD2X6tRLrW833S3W3Z6NRPnaZcmgvmiAYWomG3UBdL4+e8i0W32x+geL6LS8x
	HnY7oXOlcW/e+Mv2qWX6yw123UzFu6EfKUTtUevedJFWLE2njP3+s6snPAKezEzPbwDpgg5G7y8
	IwWOuKpKbQISi4jvZMpSbZKaztTpt3NnCqJY40BNiyecXZZlfb9zh0yKqhF7BgEIUbGqeziJiS3
	Vz6Optdlre+ApuvvNxLMnGKhpAPVn9vIMYgq35yYNVlMAL+kNc0lQInVbF7gMWhKn
X-Received: by 2002:a17:90b:518e:b0:38e:6ab:32e0 with SMTP id 98e67ed59e1d1-38f9c076d30mr2061940a91.39.1785417399914;
        Thu, 30 Jul 2026 06:16:39 -0700 (PDT)
X-Received: by 2002:a17:90b:518e:b0:38e:6ab:32e0 with SMTP id 98e67ed59e1d1-38f9c076d30mr2061904a91.39.1785417399499;
        Thu, 30 Jul 2026 06:16:39 -0700 (PDT)
Received: from [10.133.33.36] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9b770e33sm1081996a91.15.2026.07.30.06.16.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 06:16:39 -0700 (PDT)
Message-ID: <367ecac8-80a8-49bd-94f2-6be37e81ee5c@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 21:16:35 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jie Luo <jie.luo@oss.qualcomm.com>
Subject: Re: [PATCH 04/12] clk: qcom: ipq-cmn-pll: Add NSS clock support
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
 <20260724-qcom_ipq5210_cmnpll-v1-4-a8b8679d215f@oss.qualcomm.com>
 <20260724151502.E83701F000E9@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260724151502.E83701F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yg83L-cPJYLVxFC9PynlFr2suDRDMj9B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwMCBTYWx0ZWRfX4QEamjk6Rl8A
 kab3R3lMT/0zri/qTSXO3t7aPHC70dxiodghsIiOKChWggNAOQ3BTVfI7LtF+Wna/NMMoF9X8Q6
 ZtdeK+X5MOhu21VpGJ7XCX61WmrPpxs=
X-Authority-Analysis: v=2.4 cv=EK42FVZC c=1 sm=1 tr=0 ts=6a6b4eb8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=QqhB9etXKecXXbLWvLgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: yg83L-cPJYLVxFC9PynlFr2suDRDMj9B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwMCBTYWx0ZWRfXxt6oa7mu4KkH
 3IXw0fNQhlmQ0HlDvAiiV1L18WMCJ/2ARgCy9fkx22XDECzgVHLCG95ixv4cnw5Rd6FB9GUTE8U
 Yc7D93DMyB8LinbkihET3srv0ztk2hkcqKl8lnGTyyJFQwf36Bf19Yaj2dsYpAOVceuiaDIGMPi
 vlkFZPW5gI2SzEommxPj1o7HVianjHTGMa8V5yStM+nByTpvskU66SlTq963J+exWC69tOJMOom
 fbU0a5dzyLvjWvNMwvq/0aKi7OCgqbUZ4PmIEBn4wGdl1o02qSeNj951SE2B39xo8ab4BLe2fnL
 6YTOb9rMkrBh+yfXImDeZRq5qTIb01m0leGsk20RfuF1ej0riNqiWS0X7Kw1U+PS+drIFRAZo1u
 hNAbkaqCMbWuAZSg0uUIZ9dTuxc65IYS6OdYT+ILgv+smmFrq2ulybZodVV4/ku4lY91yotJ2qf
 MugbVxbVNNhxSyGSbKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300100



On 7/24/2026 11:15 PM, sashiko-bot@kernel.org wrote:
> 
>> +static int clk_nss_ppe_determine_rate(struct clk_hw *hw,
>> +				      struct clk_rate_request *req)
>> +{
>> +	unsigned long div;
>> +
>> +	if (WARN_ON_ONCE(!req->rate))
>> +		return 0;
> 
> [Severity: Medium]
> When req->rate is 0, this returns 0 (success) without updating req->rate to a
> valid boundary or returning an error code like -EINVAL.
> 
> Can this regression violate the clock framework API contract by falsely
> indicating to consumers that 0 Hz is a supported configuration?
> 

"-EINVAL" should be returned in this case to properly reject the invalid
rate request.

>> +
>> +	div = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2ULL * req->rate);
>> +	div = clamp_t(unsigned long, div, CMN_PLL_NSS_PPE_DIV_MIN,
>> +		      CMN_PLL_NSS_PPE_DIV_MAX);
>> +
>> +	req->rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2ULL * div);
>> +	return 0;
>> +}
>> +
>> +static int clk_nss_set_rate(struct clk_hw *hw, unsigned long rate,
>> +			    unsigned long parent_rate)
>> +{
> 
> [ ... ]
> 
>> +	ret = regmap_update_bits(nss_clk->regmap, CMN_PLL_NSS_PPE_FREQ_CTRL,
>> +				 CMN_PLL_NSS_CLK_SEL,
>> +				 FIELD_PREP(CMN_PLL_NSS_CLK_SEL, div));
>> +	if (ret)
>> +		return ret;
>> +
>> +	return clk_cmn_pll_ana_soft_reset(nss_clk->regmap);
> 
> [Severity: Medium]
> Does updating the leaf NSS clock divider strictly require a hardware-level
> analog reset of the parent PLL block?
> 
> Calling clk_cmn_pll_ana_soft_reset() drops the global PLL lock by toggling
> CMN_ANA_EN_SW_RSTN:
> 
> clk_cmn_pll_ana_soft_reset() {
> 	...
> 	ret = regmap_clear_bits(regmap, CMN_PLL_POWER_ON_AND_RESET,
> 				CMN_ANA_EN_SW_RSTN);
> 	...
> }
> 
> Will this regression interrupt other derived clocks (e.g., PCIe, WLAN,
> SYS_CLK) and cause link drops or system instability whenever the NSS divider
> is dynamically updated?
> 
>> +}

I will remove clk_cmn_pll_ana_soft_reset() from all output clock paths,
as it is unnecessary and has been confirmed by the HW team to adversely
affect other derived clocks.

> 

