Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC2A390200
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782650128; cv=none; b=TxuqsUocunSLwmnEobmKyl7N6YE6j2x+8PmF34/UyMQbG6FhmxcdbjNFDxMHefcPfFiMTihA3qQPjvgnHQ0/RfHzFG0PL5Gr7NnReQqc4V5xpbAU+hjinMfDLsaQgKo55L51j1HaAAEUjFDWthoyRAONDgKiC/4q/D0fG8O9F1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782650128; c=relaxed/simple;
	bh=49NvDIcC/x3KSwI6tNZPCo+7enIgzAQ5ClHFuKbQwD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WE5v2FayegKSjGftBJtIcueDdj4eAtGPvRc+OvVITTKUVwD1PapXTwinxf7Le3jpFZxq6vtLjOIe9IjMsi5T+VFqkVFyCVtY9GVQnXNsA/XbqtIefFu6wJkSTvl4w0ILb3MtqdTObapmKYI/vLxeYh+cwZqgvnKyx+08cgb8WZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oeZo7v+s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/GVa15J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oeZo7v+s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L/GVa15J"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SAxVkW3795005
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SpT8oDlZHMAEx/WC+Fkg7HmX
	1PAaNDKpCSqFtKiCbec=; b=oeZo7v+sFCPhdND1lMHvgm4ftK69/n+6Qjb3Q7qw
	G23mDtwNoBzwQ8lSwVBfBNdyDPv5jaYRHKeiEJsVTV9v73RLR8Q903+FPDY2e7Il
	tC7vXhMZZfFHSUkbXMxgE07dgfjlMnPOU8LhJ80qZX8W4xdR+Mpq9+B4hj9ISIaI
	p53WoqpiW0DagymB6arHOAUJjwtU3RjXkzc+9/3emye0RscqSkA+QZs1YcO7uMNO
	f72Ebf8p+pvNY8TL0Vk5EZfJ2vHn+N0AwSvM5DqiRtx2cAZjmkCVLhrf2WYre501
	9MpGp24EYw5kuDT9Jon9muFvoCW30S1HCGWVWQgQbiwtag==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f279cjtdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:35:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-921ed86ddeaso533275385a.3
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 05:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782650125; x=1783254925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SpT8oDlZHMAEx/WC+Fkg7HmX1PAaNDKpCSqFtKiCbec=;
        b=L/GVa15Jaul4UcbFNYM3Uhc20ZjHI5gtkta1gU192LUhrBCixQfLFke0dn1b12jDjB
         QSNaBb7TVOMiewaTcek/CNuvUy4Vn4qAhMpUTDSWqD7pbgBXSQs94sgOaYMSlRATEcyM
         LKVCBX+1QVjw5kNCfq3bEDcL8kuFLPHeuEt29NLUkHRaoo/zMDl7EDUNNmT3KUc/5D9h
         QZhBvHbX9+n+OpRgx+eNH5PCmrOFFWiW5/NCuMAUEZBbIV/SmnEyoUwX+tMnPUDowSeQ
         tXiB7mMxc0sn2Kcw0UT767wh5wa+P4+KeCIAP5uj9YjXrvYf4S0kCEz0poz3U/wlr9V+
         +3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782650125; x=1783254925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SpT8oDlZHMAEx/WC+Fkg7HmX1PAaNDKpCSqFtKiCbec=;
        b=H0hOHgvt4GR6WPczy5E0tjlFIt49YzveygEMtC9+gggkKPA5xIfolfKZeN5lHr0tlt
         lw4kZovqSTwLH9SWr6q5oJEE2G4WT1FwEEAqKt9D77hw7R0wFZkfz6guBC0mFzWQ0VES
         kGWtotNU5oU5tTNUW8TA0uwxdx16x1Y3uVxyPKt1zxQh0b/NJV3GQ8e2yAc9V4JBystM
         x/RE/50axdcUJchuFgy/bNluWowUA4Fxc8rwf99AYivvzY+82QjOJbwnHy9hti5dybMO
         ezI2Js+qdfhtih8uURGe8mppyxA4CK4m8N6Wmw5caORKtd/eiQJNOj4g7iExOGR/7SKt
         O/vw==
X-Forwarded-Encrypted: i=1; AFNElJ+ky00H3WV729WgIX2jNv/dOTXh9lsESpZHFQNc7GS4rT6ef0BXNSQ+a8pbfKBoQHwSOsFYVB60Iy28@vger.kernel.org
X-Gm-Message-State: AOJu0YxPeIqz239SFK1Pi8wISb83F/bvW7kLEqWGkZGuWAU0/wuPB9tn
	YJypbcfHWLnoD3UCspxF9TAsgYUeczXBtV/RPOHp+eBDIxA1F9CjHlqW7Hg+ZwHEuxpXZn4623g
	cayWWSUTI5+3ZgAr93vllMUZgeIO0JwxX1qKSY83PNAqPHOXV+HIJ2mL/TBzkSQPV
X-Gm-Gg: AfdE7ckZ9d8jTOsCoCRgJFM3hUg3tcJXRX/CfOT19xJtB6udH0CahyzXKIBk93i7CFV
	FiyKbfktAnMvZhGYQaiH10A/LJ5IGrNX7aLG+pW837bZ22i30o+oTonsPcSkvHr9ajNH56dV6C7
	zPlayZ7GByvT5UQGdzICHjN8oYzY1+JdWIMGXXV8vpzxynXm9qpo1D0k+foZvYxVhqbjogIsI/c
	zxsGIyYq4U7qz2hRM5YCP1WOm5/tGSKnXXHsR4lmEyY9zlpNYouByhLgsGyYpppuCMIRHVeZ1Nv
	56Zke9lvcDJll8viemMMrfFYiX/AHN/VqGIgpQfmWRoeg/P9XY/toMZNb9uoLRnDxao8RYDlGOR
	t3AA6O02KhMZ6aIcivwt5/QQEw4wJ/A2OLgOWaqLbJwbbEM5VIdmWVby4RbtycOnTOUvvt0VxqG
	vtiJ3PqAK7W5bacxeVt6vpavJ+
X-Received: by 2002:a05:620a:2951:b0:915:c858:7d1c with SMTP id af79cd13be357-9293b85ae97mr1996432485a.14.1782650124627;
        Sun, 28 Jun 2026 05:35:24 -0700 (PDT)
X-Received: by 2002:a05:620a:2951:b0:915:c858:7d1c with SMTP id af79cd13be357-9293b85ae97mr1996427085a.14.1782650124202;
        Sun, 28 Jun 2026 05:35:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999b156f23sm64732571fa.27.2026.06.28.05.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 05:35:21 -0700 (PDT)
Date: Sun, 28 Jun 2026 15:35:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arpit.saini@oss.qualcomm.com, mohit.dsor@oss.qualcomm.com
Subject: Re: [PATCH 1/5] arm64: dts: qcom: shikra: Add MDSS display subsystem
Message-ID: <hwn2kjauk3xt35cwmv3ludr3sxrwklf4n65p2tziox6m7req5o@lldl2cztbqi4>
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <20260627-shikra-dt-changes-v1-1-449a402673d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627-shikra-dt-changes-v1-1-449a402673d0@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=evzvCIpX c=1 sm=1 tr=0 ts=6a41150d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=c2b1m3NVJlNk683j4LYA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDExMCBTYWx0ZWRfX3LCxo3GW251H
 NsnwvnfR+YXYWAZ1FULz1Z8yo6O33lhfWHeZgSjTdp5VaPjfcHHteOa17lABJ42tBmw/B9ihYFU
 30Y/Gy8YS+8ghTkaat/6hFacdGMxrjY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDExMCBTYWx0ZWRfX2qHRYc9H8d4/
 VSbAOjVDXZrK3R6CUVAPvz6eEaGDxlv55x18/KJ0KTWZVVhrRUH86Dfk34UJ/eGXHT/QgYXHZKL
 H850i8dVDfpL1zXLh/4CaSeja8JzzMJ0T2eKqvroQB/U3hcg8d8zd7wYSpM6AUCXjq01NykE/UP
 72UXuKy4csehD6r2gJWe5EL4zuexXw02LKs7DTzdFMq1mQSIpjutWUwl5Wo9ZoTPckAg+jmPOdT
 GL2ha518zMoCAp8G3iqMSm/UKrqVLOCO5xZai8Z9vIYzpX48gOklgepTpISftRpvgGkgOIm4CAU
 Umci0qy59TEltmN3esr7ychdNMWhuQgg2DVdqsjaSE6nq7GrcJbPqfG4t7SFIKyXPeTeXmDjSs8
 wTapt2ea9q39EvqEz70x2I7mHCdUQd4vrOfF27qEJ9SyH5jiyI31CkMdHWry/n552fGkpE6cj1b
 SEBrw5uBDkvYcDWqUJw==
X-Proofpoint-GUID: SuGHwa3jwmrMYpEIMva7iDk82PAc10pa
X-Proofpoint-ORIG-GUID: SuGHwa3jwmrMYpEIMva7iDk82PAc10pa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280110

On Sat, Jun 27, 2026 at 03:31:35PM +0530, Nabige Aala wrote:
> Add the SoC-level display subsystem nodes for Shikra: MDSS wrapper,
> DPU display controller, DSI host controller, and 14nm DSI PHY.
> 
> Shikra uses DPU 6.5 hardware (same as QCM2290). Platform-specific
> compatible strings are used as the primary match with QCM2290 fallbacks
> to reuse the existing driver support.
> 
> The dispcc clock inputs for the DSI byte and pixel PLLs are wired
> from mdss_dsi0_phy.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 203 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 201 insertions(+), 2 deletions(-)
> 
> +
> +				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +				clock-names = "bus",
> +					      "iface",
> +					      "core",
> +					      "lut",
> +					      "vsync";
> +
> +				operating-points-v2 = <&mdp_opp_table>;
> +				power-domains = <&rpmpd QCM2290_VDDCX>;

Don't blindly copy bits and pieces from other platforms. No, its' not
QCM2290.

> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +

[...]

> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
> +				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
> +							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
> +
> +				operating-points-v2 = <&dsi_opp_table>;
> +				power-domains = <&rpmpd QCM2290_VDDCX>;

The same.

> +				phys = <&mdss_dsi0_phy>;
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				status = "disabled";
> +

-- 
With best wishes
Dmitry
