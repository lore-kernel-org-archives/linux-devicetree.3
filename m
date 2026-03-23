Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72253AA1A2
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 13:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272285; cv=none; b=IsMb6jVCaflrl+T1wJJslbb/8b2aROpNyvUjyY11IQqRC96dA79sjhc37cb7LCDXu6x49k5EMRab96xczu5RpKadSxFK1HZvuLioRVo0Jq3sBewDIoq1ypd04k0efrMiuARg+Swv+ti6SheK0NflewPaHVSpdl05yztfWaOtAH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272285; c=relaxed/simple;
	bh=rdA4dOaZ4Ub4mBnbxOg0dj78nWYZnXE18lEpqUxcXD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cxp6PzDAFA10M7RwRXi519j9hgkeoINZ9u8pZciqv4aNaDMzpYlGuh+/Jst1Zg4mcPGF7KNvyX3uEtCQehp6igOXHyneOTU4Hozr6smyekT2jtjlX55qT7gL7MezDiDug3BCKeKp24nJHRgDJcwkJN1a0guJ4eRnGz/wiqno3cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WNScoIbs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JJC8iC2F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WNScoIbs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JJC8iC2F"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N83oN11364149
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 13:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dagRmz5JVhI/c+NGsliK7/kenCLzmMMlVS151o3p/vk=; b=WNScoIbsXVEzsyZR
	V32o7ksBKn7xt9kf+JxShM+v9dBvkPusP9rLklXOrA5Q1Qyh7eWlWUwPKESKerpO
	UHJrOylNssiOctB8dX3EZMlnwCqm6c65AIjzTkh8YyfeKSRziJL98RwWytVL24tt
	LmIIVPYnaiaJJSEVY3tGPNkBCooXrpaiN+Nol9aX4p6K64Dx60h/mYjn2tOllcch
	mXPS4TDyaP/6NOLelWyXMWhODwuVEayrCdQ+NwsUoLzwXMq77c6Hlesa5BHQKhvg
	lJ6V5fl67Mw1jazp/vICD2o/H1IjD+tbklAJyWskrHe+1kHSXJjnQA/vDzDqkRuw
	UrTPbw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p793y1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 13:24:40 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-60274569cf9so507421137.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 06:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774272280; x=1774877080; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dagRmz5JVhI/c+NGsliK7/kenCLzmMMlVS151o3p/vk=;
        b=JJC8iC2Fr6m4n6azuHWORmAM9/6vbNKaXCbcTprvX8cMMHo9DgmgZmw7fXNTZqznwQ
         r4sWq9/svZ6GAeH0E6kE2a3gE5IPZcHej6+TCVsx9KIosLNEVGP6YXEJLSZIPusq4S/V
         h7fLeBSqBAd8cu91b2hqQByonj5NqKUGoEajO1RRhvvTEFV3bNdKrBbny46MxhmI07Uu
         PkOuRUKdder0wG9ggQF3LylNnZsmxR8AlqImVdR0qkGRfmWCLmewNcZxx8AzD9YKDvJe
         NISuKJlQ4GVQIpuDwsV/l1Xw4CW9vnqxg8UV09IEcJ4cxFTeS7pbRawpyCkHzq/0uK90
         8AEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272280; x=1774877080;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dagRmz5JVhI/c+NGsliK7/kenCLzmMMlVS151o3p/vk=;
        b=RnK6NMy/9np95T2X3ROuJb0g5zDTUxi0aJk+OJMJYifDTBGxC9kRUNufcBVulweAHw
         lZmplakJFuEkmvxjmZSgxHCS8G21VQLauiaz3H7s/Qgo6hk3nxH4ZFQ/nRZPZs86LD6H
         bObH0fGyVKT5jepQHAnWrKm6pQOWuOBBWbPYf9YupL3fxLI52XMYf9CVBIB1+iPL2pTU
         hqSqjcf5mR7152NgnMZcgmSTr7BU/pscjXpvIaKXJWbM12FzvQ4mFpkxensMISvGDjDN
         RKe72Xm/Ht5Edvw4Be0+NRxlYEDa2v8ztpOb3ujct9RRuJ/IbGKk2Wr/yQswJdk1+fA1
         HHgg==
X-Forwarded-Encrypted: i=1; AJvYcCU0WV1XjnXfXrlzaXtlWJZEcT2XS92jwZOateXXUaHz9PCfouOQZijThoXmi9bXQUCWWVWWXa9IZGTm@vger.kernel.org
X-Gm-Message-State: AOJu0YzhEDCSSpsLDT2Xlugcx294ZQZzXvKKRxDAyEZzE3fl9OhuhcwC
	5W+bHodh0S5IONj53jwkqfi5bmoe1iRoThZoxhqsRF8LiTVWht0Us6qjXMIUU01yapX1D4or+qL
	hU7j01qKKEDOp710H60+cpDv33scDxrU5b3evhLrOW4pRf00QclEDe665FmHiNaD9
X-Gm-Gg: ATEYQzxq9k5geLO9JJmqHWUcLES971QRxXz6GuNeCp4Gp5Hc9fa40mN5PdwctPBevsl
	Z3tQTZ4lYCyQ4RCGTSO8ixN/zFnx9Qbsvd//MxfCT9pMMcawT2jDSt/z59AJgXWqhyGH0tEE1/q
	h/2a4372mstfh/LaaqayvD4Zp7K7hp5kji5NjUjGFEVTkxQcV2vQhGtsbRnBzl2/rtaL8FIxvm5
	+kCduyf04u3RPk269+WzWvVZc+gooqVYGpiEIKdTAZo4M+Clad6+2R491MW5ym/IeSc+Cfnt9GX
	NPxo6NvPPaTO3xHC3DYCccdR9Len6QSIHhSHp5zBYLGMZ0nRQwuFbWO7YH1Il+9NLTJSj2+XMgR
	2f7X5VJFeTzBIOwOomZYLRNjr2uI6VJDJEVEv4vbOuKDiorVKI1rDKsUF3wTjuQPjtE5AuzMK3o
	SEyeQ=
X-Received: by 2002:a05:6102:1144:b0:5ff:c510:b7d5 with SMTP id ada2fe7eead31-602aea7e2acmr1885224137.1.1774272279663;
        Mon, 23 Mar 2026 06:24:39 -0700 (PDT)
X-Received: by 2002:a05:6102:1144:b0:5ff:c510:b7d5 with SMTP id ada2fe7eead31-602aea7e2acmr1885203137.1.1774272279083;
        Mon, 23 Mar 2026 06:24:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668cfdb4659sm3891169a12.13.2026.03.23.06.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 06:24:38 -0700 (PDT)
Message-ID: <76edd04d-7bd1-4b42-bea1-79f4b149c0bb@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:24:35 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] arm64: dts: qcom: qcm2290: Add CAMSS OPE node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, bod@kernel.org,
        vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        johannes.goede@oss.qualcomm.com, mchehab@kernel.org
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <20260323125824.211615-4-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323125824.211615-4-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c13f18 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=iocPoGn1HS3vtzwNltoA:9 a=vU4TAecgBzH0kKDF:21
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 1ENg2nSRCIX5JsVlXeAD9T32uFTCYCVI
X-Proofpoint-GUID: 1ENg2nSRCIX5JsVlXeAD9T32uFTCYCVI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMyBTYWx0ZWRfX14NT9SCHZWOY
 zD94PWpAnQrshyoREdyPp7Zm1FfBOYpp97fWtdnGPKbeygowKUUMEXf8TbQdlI23ukq1tXR4Cf+
 1KUEUWSpd2Uh59GIVPcPcxROogQutK3+KTAD/YecHuS1rCKV2kox9lNyPNySaS2MjNPY3UfdFHj
 54WHbhdKEmZza5v78mNr2X9zFNvcbWEnLC31dQuGbJTX784xJeLDlSjEOkNv+OVSqfhcWsqL4eX
 o1WhudGL8XXx6vKoHjjllLw40dkkqqIBMREQXq7MEPP7AB3SvExEpROwJ/2dXrNJhs+33bz8mP2
 yt6fyZn3bu4pZma083cMU4oLeITFvyIAy3FDGdDob6VqJ0dtMgsMBVZmU5DIyh+KUH/scn720eH
 oOUPKCSYFPCQz2QDZkWNar7+BFz9LpOJTDVHfeHjuvZuR/xB2rDxalePu+BpK0/zfYGg+1H7eZG
 1IAKw6ezyDEhZtFreUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230103

On 3/23/26 1:58 PM, Loic Poulain wrote:
> Add the Qualcomm CAMSS Offline Processing Engine (OPE) node for
> QCM2290. The OPE is a memory-to-memory image processing block used in
> offline imaging pipelines.
> 
> The node includes register regions, clocks, interconnects, IOMMU
> mappings, power domains, interrupts, and an associated OPP table.
> 
> At the moment we assign a fixed rate to GCC_CAMSS_AXI_CLK since this
> clock is shared across multiple CAMSS components and there is currently
> no support for dynamically scaling it.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 72 ++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
> index f9b46cf1c646..358ebfc99552 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -1935,6 +1935,78 @@ port@1 {
>  			};
>  		};
>  
> +		isp_ope: isp@5c42400 {

"camss_ope"? Label's don't need to be generic, but they need to be
meaningful - currently one could assume that there's a non-ISP OPE
as well (and I'm intentionally stretching it a bit to prove a point)



> +			compatible = "qcom,qcm2290-camss-ope";
> +
> +			reg = <0x0 0x5c42400 0x0 0x200>,
> +			      <0x0 0x5c46c00 0x0 0x190>,
> +			      <0x0 0x5c46d90 0x0 0xa00>,
> +			      <0x0 0x5c42800 0x0 0x4400>,
> +			      <0x0 0x5c42600 0x0 0x200>;
> +			reg-names = "top",
> +				    "bus_read",
> +				    "bus_write",
> +				    "pipeline",
> +				    "qos";

This is a completely arbitrary choice, but I think it's easier to compare
against the docs if the reg entries are sorted by the 'reg' (which isn't
always easy to do since that can very between SoCs but this module is not
very common)


> +
> +			clocks = <&gcc GCC_CAMSS_AXI_CLK>,
> +				 <&gcc GCC_CAMSS_OPE_CLK>,
> +				 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
> +				 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
> +			clock-names = "axi", "core", "iface", "nrt", "top";

Similarly, in the arbitrary choice of indices, I think putting "core"
first is "neat"

> +			assigned-clocks = <&gcc GCC_CAMSS_AXI_CLK>;
> +			assigned-clock-rates = <300000000>;

I really think we shouldn't be doing this here for a clock that covers
so much hw

[...]


> +
> +			interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
> +
> +			interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
> +					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
> +					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
> +					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
> +			interconnect-names = "config",
> +					     "data";
> +
> +			iommus = <&apps_smmu 0x820 0x0>,
> +				 <&apps_smmu 0x840 0x0>;
> +
> +			operating-points-v2 = <&ope_opp_table>;
> +			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,

Moving this under camss should let you remove the TOP_GDSC and TOP_AHB (and
perhaps some other) references

> +					<&rpmpd QCM2290_VDDCX>;
> +			power-domain-names = "camss",
> +					     "cx";> +
> +			ope_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-19200000 {
> +					opp-hz = /bits/ 64 <19200000>;
> +					required-opps = <&rpmpd_opp_min_svs>;
> +				};
> +
> +				opp-200000000 {
> +					opp-hz = /bits/ 64 <200000000>;
> +					required-opps = <&rpmpd_opp_svs>;
> +				};
> +
> +				opp-266600000 {
> +					opp-hz = /bits/ 64 <266600000>;
> +					required-opps = <&rpmpd_opp_svs_plus>;
> +				};
> +
> +				opp-465000000 {
> +					opp-hz = /bits/ 64 <465000000>;
> +					required-opps = <&rpmpd_opp_nom>;
> +				};
> +
> +				opp-580000000 {
> +					opp-hz = /bits/ 64 <580000000>;
> +					required-opps = <&rpmpd_opp_turbo>;
> +					turbo-mode;

Are we going to act on this property? Otherwise I think it's just a naming
collision with Qualcomm's TURBO (which may? have previously??? had some
special implications)

Konrad
