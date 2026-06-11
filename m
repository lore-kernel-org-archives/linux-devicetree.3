Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD3530FC0F
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170853; cv=none; b=bvJIUbdCva2OwUt1AOb6zI8S4sXjQbWqEhnFNtIrpdr0mvrKdiUHO3Vc5bn3vvXx1IJNsKpbc/ud/vuhCnMbaxF+LT2P7YH8nbEpTij7QmgWUyaOUWntyp4NN2t0loJw1T/DIf6eeRvh4fWB8eTm5czCEwKNBdvsrsXMpQ0MZZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170853; c=relaxed/simple;
	bh=/tPLp0YnAEbzNEjlPFUBlDrqdFYNHeb+WcToziZLGSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nTljENscLbfhmsHdfT4mhldSGTvEZF4D8XX17Om8r3dZEZxxC8C+CzqskZltl1yj4UxtSyE5m5tsd0UbjWlSq2VmWTZTSlfsU3zNGDC7z5e40eYEvcnnS+/jcgdaaBonA46JF/LX1AwWCl3Fb8q5tA4P0ad4EdFA6KR25J2breo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BGMq06E3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HqORIbJc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BGMq06E3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HqORIbJc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GCpK3843608
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nKcvGnq/VpeslsAPlHl1255rnIM6NR1gO7P4RmE+qE4=; b=BGMq06E3/iit69Oc
	hkkdp21erXxDRMwzvyQJ0zUx60JcLRhrbh+Rch81CF/m+0Nu6/YVhp0RyrWF6ntZ
	lT+nSbCMrPurgIrKgfoSkNBLhXZad/QcYGp5C1lpCVZrpSBGupvOJsIeXibGGlAP
	OP2vKfLkkf/3MiZl/RKZTuFrET/EUYUANxn2FhRkYpnM4lk9eOOv07mELtLoErHm
	So1E/2tkPeP5y+fmNxbaJy+h9cMA6IWAaI5gZyrxBs2gTbHiilt/hHkyZZurzSXW
	2nYjgwzPVotWRwW5SIpzgTthMDQnl4Fw6UMuvW8e365KnDhwinsQg98QKoh2QWVa
	WXFLhA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe702r01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:40:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51759082206so23101681cf.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 02:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781170849; x=1781775649; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nKcvGnq/VpeslsAPlHl1255rnIM6NR1gO7P4RmE+qE4=;
        b=HqORIbJcn0cEwmHlh3fSD7V8tqwKCLjVmk/XdORU/uuh5Gm0y+Khk3/EuzLqLfTTSp
         Alo+aDB3copLMBIP/KxiCdx5IaugUzLAV1izrGu2NlZZdPohKjCH5tegmc0nxWkeAkxe
         XKY+2Sgo+o45z4SQXdDr0SatrPFle8Y2qzThM+c3PWT3QXmfG+2rmj3QW2ifFtY4tGi7
         DV2eXe0TwSPetj/9FxW56BJs07Rj6jwCOTcaFvcqW2TKx8IOpkHrilcddBoRuIDYiYav
         WgTpcwdfmyYO0VcO2GvKkDhu0Prb5qx+oIZlrv0/rhPwCk4b8NiQAGOedbKpmCejZ8hN
         4qUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781170849; x=1781775649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKcvGnq/VpeslsAPlHl1255rnIM6NR1gO7P4RmE+qE4=;
        b=QAUdVbHVMAn+ceTb/q2bJcXKfwi0IuKFPXngW90UBioSZLJRq/d/ffVAXmATGCv8FU
         5DXhFLCb4uxMwNzlPJ7z+x37Q1fhHjzOhlcYcfcH4cV8jmB4yRHX4YMc2vw4XQLzcmBC
         1KJTL14D+HtePsIWOaXbE4CZzKFVkrsSXNYDr2tlULZuZ4t04n5GYyTqlNw34zf6QT/k
         nAcBWCuzNNchsQrpqqBHcTVohZTaaDnRnV9mdNE9xTITtZo+7whtsTAm61+hIvBssr38
         tqFdgCQDkfpJZKL/bwD/BOH0yUtZxtlxSswFeTvJxgvd9OjFPbRm2poj0iOb1YPgEjJ9
         7IEw==
X-Forwarded-Encrypted: i=1; AFNElJ9tT7SYLH/Zdh91u6PaGuG+AbhjPVE+Leh/9ZZ/Gg31LDnvx4lWIgDopg5lAHq8X1CzM3DlM27f8m+f@vger.kernel.org
X-Gm-Message-State: AOJu0YwPa8Vw4iKb8ZtNOPI0XgGCobmal7c3fx9d2TxbZjtI00yAvauK
	RL6wDJ/PgWPRGUJRKgP318clkTTVY98mHE1X0/QeWMRPWsaa7KJwtOhd2wF+xbsH5GiXq6/wFhD
	tYllWiGsBSIZPv4rtgYpa6Ae+ooouTK1h51L/eEZ5+XTKXW62YJrTHwx617P/dzSC
X-Gm-Gg: Acq92OG9L1x4vxOkxIUSw27Yzv7a2OlXdhnT1dHEFEmuHiwzUWMR6QhE9w0LaW4DxDQ
	R/umaqjGlCD8qzQlr/RfFVpeSatT5heglU67/rJSr+WswR/7K8ih+rXAEHzTQ97itR+2xF3cyrS
	HL3mqWxL2teI6cX6+yLELagBWdh5Ji6Rt3d/symcY4JNP0Syk3NtdpFriqKT5RzODKUvZ2XkYKY
	iaLt+uZOlBmABwHpIOVa4iI1NViBZsZ0B92uldtF1tPJRsvfomRNJ7WkffMNZAWInFcj1naog+D
	7zdqTKUVrn5c55vtxNoutfWbsasVk4yX1WfObvIEkjNJ7Z8BaCLRUlq7kB+Kw8WeVCZYhbP6ZpG
	5rO+slVAUuYrckwJOD7rIWHJaz77y1QNQulakQwWpcX8M8m8PM8LlziDs
X-Received: by 2002:a05:622a:4d86:b0:509:39b5:a977 with SMTP id d75a77b69052e-517ee225ff3mr19651181cf.5.1781170849385;
        Thu, 11 Jun 2026 02:40:49 -0700 (PDT)
X-Received: by 2002:a05:622a:4d86:b0:509:39b5:a977 with SMTP id d75a77b69052e-517ee225ff3mr19650901cf.5.1781170848859;
        Thu, 11 Jun 2026 02:40:48 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f1478csm41082666b.8.2026.06.11.02.40.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 02:40:47 -0700 (PDT)
Message-ID: <b86e9f5f-a7ec-489e-829e-6e07c62841a3@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 11:40:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] clk: qcom: smd-rpm: Add missing RF_CLK1/RF_CLK2
 clocks support on Agatti
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
 <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dsig42haUNhAfrW8SBHZYL9kYmzuoAi1
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2a82a2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=NxhCX_73iKeGXg_BdwEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA5NiBTYWx0ZWRfX1kM2/sXskkVh
 /ohDFLJEUE7TskpiGyJ9HR7dzHBSvI502D1RVy29+cwd7H3RsWiuTzc0Mpm6vJNABGp9KC2UIKJ
 Wpc6/zIHo2dUagJCA2Cn7FRxLqYYO+t5m/RBkV8i6iHajwcXRDzdSQ+lK63ur3rjyI/TCbf+Fuk
 BGWi5wYjTbQs88rtFdDimQ/EUYk7AhZn5BT9BDEjV0sGUDxdAeXAUNqe86PxPRKYSUnpqIQgcJX
 TAN6el3L3uApu94XhD1AvYhxIY2NOOJRcijlYG+dsK0aAweIbvgZd+1kZBYeYONnqvHQetiryXn
 BKBOfYnK1l3UsztY069gJYmtfx4Nxh3nwN0BivTi6d7iVlzE7/n5v4u7L+sMXH6s11apAuRAxZ8
 022oHIKAOPVQcKyfNPjaqJdQjtCLm+3A5vDpwg3nMni0BElzA+Y10oQrV7F2QmOZpPKddRb+Gr5
 SVtbuj8LQLcibbeYjGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA5NiBTYWx0ZWRfXx/4HfcW4QxjL
 juUPFwWpC3S1K1yaA4w8WBTlB0ZyWcQlNDkavyKGmjx+osU27K8BrDIT7289rLSH3RkxSeh0QHA
 CHlNC15NT9/jlt0TuUivUR9/tcJqJUA=
X-Proofpoint-ORIG-GUID: dsig42haUNhAfrW8SBHZYL9kYmzuoAi1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110096

On 6/8/26 2:21 PM, Imran Shaik wrote:
> Add support for missing RF_CLK1/RF_CLK2 clocks on Qualcomm Agatti (QCM2290)
> SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 103db984a40b950bd33fba668a292be46af6326e..0b624ed4715c75042b92ec49c073b281533cace4 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -495,6 +495,7 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(rf_clk2, 5, 19200000);
>  DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(rf_clk3, 6, 19200000);
>  DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(ln_bb_clk, 8, 19200000);
>  
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(38m4_, rf_clk2, 5, 38400000);
>  DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(38m4_, rf_clk3, 6, 38400000);
>  
>  DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(cxo_d0, 1, 19200000);
> @@ -1262,6 +1263,10 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
>  	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_branch_qdss_a_clk,
>  	[RPM_SMD_LN_BB_CLK2] = &clk_smd_rpm_ln_bb_clk2,
>  	[RPM_SMD_LN_BB_CLK2_A] = &clk_smd_rpm_ln_bb_clk2_a,
> +	[RPM_SMD_RF_CLK1] = &clk_smd_rpm_rf_clk1,
> +	[RPM_SMD_RF_CLK1_A] = &clk_smd_rpm_rf_clk1_a,

Is RF_CLK1 19.2 MHz (with the other RFCLKs being 38.4) on purpose?

Konrad
