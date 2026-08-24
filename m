Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C64E42EEDA
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787579467; cv=none; b=oDtf8kabuIaqux881GewtewpjvQcD7r1PXqs+ZLw5QnOqevqsceOtJNR//QLWmmh816VS3S7eN+lM0KlwZAJfcAcF9MEpKdsAm/toLZqiBS7GFwMbmYfHIIBRp1eTRRlN7jtI8OIkDnwHOfV53P5Sf80i0aLcJwhkjSioc2wtsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787579467; c=relaxed/simple;
	bh=0yljH0aVz/r4eBwqu9hC+iXHJEmlFQIrNrbxgGtz4Mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ib7attnwgEau+DnH0qfparkxcb086FZwsWk3Rdd61Yl7TJon1TQERUwHKMTBSCgQC8hJfHpfBmDOdf4M8H8jN13e6IUxkiu+gjw3v0Ao3yXFDkx1LwdZXm/838eFsO8kMtObTrWIl34ln/fHrZYQivmmprIj9lk28i/UxRKxHyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGIfGZjm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KB7iokSW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGIfGZjm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KB7iokSW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCvAJg2950701
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:51:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P933sj/R9/lngFoiKY5nO+tX
	09j8AxPBJ7WGQH/Z4O4=; b=OGIfGZjmHQNutyx/mP8rqbt05aaoBOJl0EcTQE7v
	fS8aTG7CNiJpOaRCbsRVFvo+4j83tyrm8r4XSU3PVB9f7HcsXyTsEvhsQAsdvKZa
	LK2WSdny5HkIq2aTcgw6Heh4bBApemv0j0zMR4YxPS9i/fxpQ9tWhWrOxWWZXerJ
	h0zH5C2Hq6qEWc2qRmZOA72yeyq5L4e1Ic0NK61E+i88dFUrAt9iiMHhUpQ+/7uw
	AnKY/q3RVFxNKpXL1vutgWjQ62FGwsSe0jDBFkkwBUxwyOFHynmZ5M4CAgklA+m3
	yUP80fgsjEGKsxhP/OL2V33UKGk2YPJKKnjqHkLUuratKA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8j7r1dud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:51:04 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73986bb438eso3543790137.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787579464; x=1788184264; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P933sj/R9/lngFoiKY5nO+tX09j8AxPBJ7WGQH/Z4O4=;
        b=KB7iokSWsXcPRNcwI3jBsDxeVXK8I9Nov9OUK/0IZ7/F510MWIXV7dMDQ3LqSiILus
         6jDVa6+gQn4osHGKzHWynqrWaP+Jcn5Nn2cQMMbgOmHesgtZVr/QDb7BkHOnY+2WG0NR
         hiqNBfumXeeQLLHdLma0wBXsVtPd1IEp7pdRfwT53bFwQrM3MsEBj61gMmcxsn59uc4S
         fGLDvwiP9afxpO92+IlKg8xys9s/spBdBV310dYtNtq99yio82rIIWAwRyHTBgV1fFOR
         m4a3yizh57CazlgNnit7bwL+dDn2x+/hPGjnZplYL+UPzE02a6Ntn7qRrQh47W4LP+3M
         sO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787579464; x=1788184264;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P933sj/R9/lngFoiKY5nO+tX09j8AxPBJ7WGQH/Z4O4=;
        b=hlDg0SLCPWmFcTgeOdlDMzWVcPLAjJiRPCKsnczlW1Q0KHEwME4R8AydIADk9B2WeS
         YPPYedsWqwWAVXYlDlMh8GrgknEmdIsSNqNlXBYnswEWDoUZ7DHgwhBGIlfXodWx/CLL
         oBug7X49ai0qXrQLCozGU50Pmk64vJNtvqsyYSYRbJn0ucpjy9Jpx3x5BedFZ5Hkrq9h
         CezYoOdaaL+csN9rRCsczfqex+WLy0UFg6IV4Ka47pGtzXv4u7VnNJtzZWRYBCDNUQRJ
         PfwKzLLUSdxymXnJg98wLI3TqAAZ/LtI7WUXu2PHWg9zSgBaIS0c2Xq9ClmyAlZskFnM
         z6jg==
X-Forwarded-Encrypted: i=1; AHgh+Rpj6D+FOW1400HBAYC0i2VudDWcPydu/PeXxJcQ3oVCOpLVlQE0Ha/0UtId/7KHsj0G+41G0eCqoj0X@vger.kernel.org
X-Gm-Message-State: AFuF++ltOSsdVo+ShiCsWOdI7T4mDEpb1erJ0BiV11aDLAxnMqHWlLJs
	PnJwfJ42/rY8RyMREu6jiT0LdGC2AEG1XJLBEfUPKE8DxrW54gEsSCno+45d7Y4ThXGdol73YzB
	07IW+XPPdKezoddrOX8mBhhNKQyuJQch5yOoppA3GZVCapY9BNN0fGlRDlAmwSCzT
X-Gm-Gg: AR+sD10Lx/UNPmIqeRt575eR68ETi1dJ8S0sGcziMHfX3IQMFeOXdHuy3pzEHiIAl6a
	1BU/NkBmXtjKrEzrQ0QrBJ2SZ+VAbU7nEhxMctvM8squP97H8DgMM3OVGJGc99AzrhDLLAYrMOl
	T/Ig+rcaxxz/YeGUXFPUw9PTnjQ0GSc8k0Dk6NRUclyo9OvndCJyrK92vRTov56k68sKDyElE2L
	mGH0eKVwTwe1xBnxN8lo7OSsLOl9ZrBPUuxCHtUOK0RVYHgEiL/vNLUQWMuCrWvuUkL1vbCFgmX
	WEZmcuzNalThiN8qLsdqp1hR9Y91ROc4Jhg6ZTgCZ/K3CWdlgrUXCRW5Q0YOv1OQURNZD8+7C1+
	83M24eKX+p5w0sR4=
X-Received: by 2002:a05:6102:5488:b0:77f:539a:ba0b with SMTP id ada2fe7eead31-77f539aecd9mr803666137.8.1787579464013;
        Mon, 24 Aug 2026 06:51:04 -0700 (PDT)
X-Received: by 2002:a05:6102:5488:b0:77f:539a:ba0b with SMTP id ada2fe7eead31-77f539aecd9mr803627137.8.1787579463387;
        Mon, 24 Aug 2026 06:51:03 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59dd550bcsm9563073a12.0.2026.08.24.06.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:51:01 -0700 (PDT)
Date: Mon, 24 Aug 2026 16:50:58 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, konradybcio@kernel.org,
        tglx@kernel.org, ulfh@kernel.org, bmasney@redhat.com, radu@rendec.net,
        lpieralisi@kernel.org, taniya.das@oss.qualcomm.com,
        danila@mainlining.org, davidwronek@gmail.com, mani@kernel.org,
        robimarko@gmail.com, linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 04/13] clk: qcom: Add Global Clock Controller (GCC)
 driver for SM7250
Message-ID: <5ybg37jlklgrkxseu24xytbom3v3rnzbwpudg7jftr6g3oqvo5@x4sfjci7v7m3>
References: <20260824130437.2771-1-sreeshankar0910@gmail.com>
 <20260824130437.2771-5-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824130437.2771-5-sreeshankar0910@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExNiBTYWx0ZWRfX7lGlYzf9jilV
 OnCUr57/WuoZ21ZQyLlJTELR0zk2st1ncZM8m52SzlUJ6k1ZLSmnPB1RS4S1Hx2M1zENptDe4jn
 AMBUkAF4wsjUJD/rQ8zj1SZoC+e71MPMKPwkDfKnzEe27SaAs3iV7JSnx2j42s01RTRA8o06KkA
 THFFBtHUOdi4L3oUiiZ9O1GQmP2DH3tUhVts3nw8FPp6n/2Vv138w5g3QmnUqoCv5In/Qt52efl
 er4V1YYCZhsfstY2vyB0UvXNDIfiZE+Y5tKjernVz4uKd0zsVX1CmAKZG5snxpPxI2lT7Tbw66S
 FV3Ekb+5uHXoctBY/KdyoL0UoROSe1Ghr3dQ4fNDOBU3L1nBP7jT2SUpuc3CFqttkkcAUZ2LxqL
 Di/7p0sI3dsM1WlHkAqH7V+IHUfl15pCm+DVu+E+zRhoLrEMT3rglH3tCAFzoSYhlfRfxhK0VGA
 wMm2jnwkfJtNnWOQKnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExNiBTYWx0ZWRfX8rUhPP55rDmD
 PP/EvnHCGHTYqGs9GI2GNZXSoOGSzpNSn+s+1iS33jxYLtKbfPmhoRvG0DknK8lORZgefMJ+8QL
 Eg00xYixaQ/3Utl6GJyGqGm6y9+61LM=
X-Proofpoint-GUID: 4cvW4NXEWH2HK2Ob6pxXUKifOBFdh2mK
X-Authority-Analysis: v=2.4 cv=IL8yzAvG c=1 sm=1 tr=0 ts=6a8c4c48 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=WOPXDmdO3qaVRrrDsJIA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: 4cvW4NXEWH2HK2Ob6pxXUKifOBFdh2mK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240116

On 26-08-24 13:04:28, Sreeshankar K wrote:
> Add support for the global clock controller found on SM7250
> based devices. This should allow most non-multimedia device
> drivers to probe and control their clocks.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> ---
>  drivers/clk/qcom/Kconfig      |    9 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/gcc-sm7250.c | 2275 +++++++++++++++++++++++++++++++++
>  3 files changed, 2285 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-sm7250.c

[...]

> diff --git a/drivers/clk/qcom/gcc-sm7250.c b/drivers/clk/qcom/gcc-sm7250.c
> new file mode 100644
> index 000000000..bf75c8ec1
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-sm7250.c
> @@ -0,0 +1,2275 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2026, Sreeshankar K <sreeshankar0910@gmail.com>
> + */
> +
> +

[...]

> +static struct clk_alpha_pll gpll0 = {
> +	.offset = 0x0,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> +	.clkr = {
> +		.enable_reg = 0x52010,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){

You missed my other comment from v4.

const here and everywhere else.

It is always a good practice to compare to other (older) drivers from
upstream.

> +			.name = "gpll0",
> +			.parent_data = &(const struct clk_parent_data){
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_fixed_lucid_ops,
> +		},
> +	},
> +};
> +

[...]
