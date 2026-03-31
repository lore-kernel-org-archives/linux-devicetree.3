Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C87A2BE7BA
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948141; cv=none; b=llhkUDNI/7R2hmIEI+3QGkteX2Uo+F9JnqihP+PmJi8hdgLUSH8AycG4YARTBU9gzC7st0mslPV4DGGf74LmSpp6IDVe3ScuZhcOFvXThWxdL/Yye2pJysBBEs2DXlpWACYkoccFN8LRpW750t04VB/dcbT7i9boNUQeOaBo5Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948141; c=relaxed/simple;
	bh=jgQNOLo9vj7tU0NySkOBBoOQDkGpnBRpdjxHH8OoW6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gl1pxKLNmTRkwEl3cKtfuiVHQbT9FmNZoQRK62VgXLDru5rrnSKr/SVaJXuvoyB7iI/eB4/n3C95QkW3TM+e96d+XA8QMbkhQvhTUpigzyOYXW8T1spe9k0VKMSFpMyQ1MKx3D02DYACLOrBMhK0vYyzAxt1qHnmUAIBQzfW420=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OsvuzsF8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yx0pt7ff; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OsvuzsF8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yx0pt7ff"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V8B04j058382
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NXM54aCazj8y06x2yXFau5JJdIb37Kt4s7DObZf7M6A=; b=OsvuzsF8Sb4MFIuH
	AzU3ET+jNhej+rkpnEOSHWpZDMJ26HbZR3I+FBHpqKzsh2sXmg3AJZoPKtJrKuL/
	X8qAEb+u+RpmYI1nCPCrXYVzaunNSDhQ/6UTtZUOulm3877Z0/bw7W//QbgMNsBF
	3RdXcmja2FJog2YhiCfUjFTOL+L18P3zJ8MUpxm0SU/bVQiEIoMQhUIVBglxuOzc
	4JhxqR1K8BuV681rRscDsbiYAJy4AtKuqEc798s6bhka8Ht+SfvJ2TfJ3M1mFwns
	XwyRtmpMXW2lHko2sl7PyRUVK0MIvkCuh0b2bWaor/PFk1wRMK3MIhv3KzLmsU4T
	rqN72g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8ahkr8be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:08:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24611696eso20463875ad.3
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 02:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948137; x=1775552937; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NXM54aCazj8y06x2yXFau5JJdIb37Kt4s7DObZf7M6A=;
        b=Yx0pt7ff2vBOSqrlQBYuL0DbNiqHJF3DZUDfILbH3tItfv8Ht4CmM2iFiiwFCFpE92
         cfSGFgwdCcTNwzhBiRDwg4u0cChn2LwQvn83/JcI426L1qqsP48WoK4r0xDLFlce5d6F
         3gEq5ghPOLZTZYhLF9SWwuuGimujv+2kPuEBKDnvUGXS61wftTnLbeRjY0p1/LWkQDid
         5hXTn8OV21duubhw3vKc0Kn9OubDW/7DjoewiDRqX78sZ74NczoDam33WRghKQMPZ4VY
         3aG6bClXKj8u6wokXPu2Qz6Zgqn4b8CdLdc176dK+aiUYEKYQeUvPiSQKP/GatOp4mQi
         Nzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948137; x=1775552937;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXM54aCazj8y06x2yXFau5JJdIb37Kt4s7DObZf7M6A=;
        b=QSzea9XeNiJrnZMF9LBGdfTme1zTwR3mmSbsWwpJiq10aRlxLT2I419gxGTMGO2sFG
         d2U9QX9C74HOcjOXit9ryo31TLMsnUZW0AFmoIlYu5esgHLeKJsQbo+sRF6asA2mGgsi
         ALKctskConrZ0Eyd9aKXM0R/F4PSUT1NRItckftmoBey0tSDrSHHbbNgDAwZ4+xidAc/
         Dn9ADuDPPVdVmHz4jcaaViSg43jmQIBPQVCN94qIqyWRUgABi6lZ8Rtr9vPXhsiCYEa7
         /e5JxoKlSjWGJJGyLR4t/7o4OtoYBHi0Nfccl77VAOK1KGd3alJQmqAgvQHeudz7UyOC
         5w2A==
X-Forwarded-Encrypted: i=1; AJvYcCVoYM0pcD5YS/JQbqHH4XY3740usfL0YmLpVgijGQNKb8U3yo2CyNLQA8PnwpCzAM6o2yvx0aG5UUtT@vger.kernel.org
X-Gm-Message-State: AOJu0YyLwrJfyn3cQTSGIuT2FdybszXncVXHLR6rpDFj9xTgrzs8bqqn
	fDIjKVXEwpGIyWFvNKHD2K/S2ZnNCpP4sXk+ddEKun4AitEa09Gg718WFNnlUYZbVjVlqJ7wFG1
	t2/fyvDmI0YClAOc9hqj44Qtoq74FxJw22fwgnuHcvnv+NLHlef2rrP/0Tc2VhLLJixGtiiee
X-Gm-Gg: ATEYQzxSFb1NDy8ZEoL0b8Ypz2CQUhCP9DVDgIehyqQ05/WJ/5kMNkEoYLQSZvDi1xg
	UMW6AQHyS60/L4VN5wTDKiszRn92c1hKVBgpG17/RAbuAGYZIoPetPBZdRhR/WRFrcSy4pyGhue
	rmX56OZMSljWex+ggIM0NQD3KMRyn9iN0eAMtLstGj9Ce+eapnE4tyCJkTG2NibfmGniCRLaYVF
	OKf5sa9h7WeOjaLIvAxOQ+Y4KKNJ6l+K5vP3u5R2Olczk9jnIdrFhsxaloymnk7rmZ4m9Pv4xuX
	DgubZ2526xGDPIDY1zv8ORM6OsBHix56AMUTG9b8wLL7UzgbAdB2YZm8fFCuzyOGfYrLolT+qaI
	YAyHYY+TrhvTD0p1MG6yyCUmumKV3fzQeA6R69Pl7Yg9XlG6nEQ==
X-Received: by 2002:a17:902:cf0b:b0:2ae:450c:951e with SMTP id d9443c01a7336-2b0cdc2c13cmr155340605ad.17.1774948136961;
        Tue, 31 Mar 2026 02:08:56 -0700 (PDT)
X-Received: by 2002:a17:902:cf0b:b0:2ae:450c:951e with SMTP id d9443c01a7336-2b0cdc2c13cmr155340265ad.17.1774948136512;
        Tue, 31 Mar 2026 02:08:56 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24264292asm109581875ad.4.2026.03.31.02.08.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:08:56 -0700 (PDT)
Message-ID: <45d91247-3207-444f-946f-87eea56cfa58@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 14:38:50 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] clk: qcom: rpmh: Add support for Hawi RPMH clocks
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
 <20260330-clk-hawi-v1-4-c2a663e1d35b@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-4-c2a663e1d35b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NiBTYWx0ZWRfX4rSfxPqIv0PN
 8DT3qEHZ4nriZ2+S34nYG3UE4Y4PFTasDhPuQw6xg4rlOOmNx9VHCtqkhj3HdBpackVAThzkrbT
 f1kd/szwTmdicfQcwR3Yd+hx1+F7LcIeUNJlQoMG/z06v3m4y7asCWcpLel5P7D7mD3NtTtlV2S
 sC3RZ+w0fYyAYtl/69NOdgiA8Vyx7irgD4DUwymz+FyBMNkiG8xufEJEcPWJLz30rkmjttnnBn6
 xyii9/Eng+TqABO3G1XBoTHtVTdOpmSaZsMr8G0C3huwsfGWdcDhjYj8ylcSo1ugoS3HJQVauMN
 EiOfc7FNQmRi1V1NPet9axWdLTVa3nunytuSHPLqYphsFHwr6AMjBDqud+gqWNDt7pLqVvdyi/k
 w3cSzflukdp6+PBnnS4DkEIBf8efiX23ATXMCRBVtYCBreplxxoJziBxGvJdGP3+tOzumcw3mAP
 C7q5hdQuaDOyxqGLjRg==
X-Authority-Analysis: v=2.4 cv=K4wv3iWI c=1 sm=1 tr=0 ts=69cb8f2a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bRyZQm5hcxuZ6EYdzcoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 0lkFV0hLkvEcHwlsethK6dFRZB7ImD1V
X-Proofpoint-GUID: 0lkFV0hLkvEcHwlsethK6dFRZB7ImD1V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310086



On 3/31/2026 6:04 AM, Vivek Aknurwar wrote:
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 6a54481cc6ae..f9084c15467c 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -405,7 +405,9 @@ DEFINE_CLK_RPMH_VRM(clk5, _a2_e0, "C5A_E0", 2);
>  DEFINE_CLK_RPMH_VRM(clk6, _a2_e0, "C6A_E0", 2);
>  DEFINE_CLK_RPMH_VRM(clk7, _a2_e0, "C7A_E0", 2);
>  DEFINE_CLK_RPMH_VRM(clk8, _a2_e0, "C8A_E0", 2);
> +DEFINE_CLK_RPMH_VRM(clk9, _a2_e0, "C9A_E0", 2);
>  
> +DEFINE_CLK_RPMH_VRM(clk7, _a4_e0, "C7A_E0", 4);
>  DEFINE_CLK_RPMH_VRM(clk11, _a4_e0, "C11A_E0", 4);
>  
>  DEFINE_CLK_RPMH_BCM(ce, "CE0");
> @@ -965,6 +967,36 @@ static const struct clk_rpmh_desc clk_rpmh_eliza = {
>  	.num_clks = ARRAY_SIZE(eliza_rpmh_clocks),
>  };
>  
> +static struct clk_hw *hawi_rpmh_clocks[] = {
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> +	[RPMH_DIV_CLK1]		= &clk_rpmh_clk11_a4_e0.hw,
> +	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2_e0.hw,
> +	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_e0_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a4_e0.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a4_e0_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2_e0.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_e0_ao.hw,
> +	[RPMH_LN_BB_CLK4]	= &clk_rpmh_clk9_a2_e0.hw,
> +	[RPMH_LN_BB_CLK4_A]	= &clk_rpmh_clk9_a2_e0_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_clk1_a1_e0.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_clk1_a1_e0_ao.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_clk2_a1_e0.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_clk2_a1_e0_ao.hw,
> +	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a2_e0.hw,
> +	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a2_e0_ao.hw,
> +	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a2_e0.hw,
> +	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a2_e0_ao.hw,
> +	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a2_e0.hw,
> +	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a2_e0_ao.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
> +};
> +
> +static const struct clk_rpmh_desc clk_rpmh_hawi = {
> +	.clks = hawi_rpmh_clocks,
> +	.num_clks = ARRAY_SIZE(hawi_rpmh_clocks),
> +};
> +
>  static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
>  					 void *data)
>  {
> @@ -1056,6 +1088,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
>  static const struct of_device_id clk_rpmh_match_table[] = {
>  	{ .compatible = "qcom,eliza-rpmh-clk", .data = &clk_rpmh_eliza},
>  	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
> +	{ .compatible = "qcom,hawi-rpmh-clk", .data = &clk_rpmh_hawi},
>  	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

