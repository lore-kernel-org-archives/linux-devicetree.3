Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F53495535
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 12:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341922; cv=none; b=cAb4+PrChVXD2T2BZiSkCa/znOBu2t4oI3gmN/nEGzDhcCAm0silrAho4fnG+LrSCGB7pmuj8x6q6pLa8XzFiTq8XuCpaAKblVxJaA226rIniwAjhkgYHzUoqQAuNyCdIEQW30pTGR1ZD/HN+zzsSdZAzezz0ydCvhL0LL6jcs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341922; c=relaxed/simple;
	bh=0JPIOM3bKv+VlgOT5jfNWR3yS4XhT3HggZFHDmH/dys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EfRwn0k7S1JzicrOW/QNbyn2mtT0itqXeR7KCmBhQbuVUpGqPn2GCME/Yc0Uzdn7aED+y7pnag/Woy0d8u9SHG6a4GZ03w47gCQI+PQW27R2Wodu/hHRdDkH0qsMiMKQXu8Ir4t5i3HjoRfO0CoU89gmT5puGORSA0tbVSnpw1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRz+/f4d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SAKQLwWp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DRz+/f4d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SAKQLwWp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxPKA174990
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 12:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=at2wG9fgDCzLJho8qAuNMi5f
	Pc/Fr7X6A05iUjg+Iuw=; b=DRz+/f4dZLxPlpoBorbK7Nb3wRrQ6wdJT7KcR9a1
	dkz9h+YfFn6qn3SxncWX1EG9PlHlDG4LP6cBk6Ofp8IarWrsPGvDlXFnwNFu+jc2
	HQrKHsH3coewPY0vc9ea7kiGhHhxouemHq3z0kgIVz6T+ZW2Tl9oIzDzILEyoJrl
	Uof8yqWrm6vla9q07m/xB6hywIXX8U3z07uwOVTUARrg9Fyw6GI25LQHK6EyaESy
	r/1d7UK6pU5LVGrksug1Yc8AeVvFm6HSuZKs9LDYnPi+mpoRtJ46lw62FTBW1hOV
	BFbpYNWtqZBXVrM1RSARWbYjwubcAtSwk3+Q7laHiAL1WA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxs96v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:45:10 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bbecd250b7so736421e0c.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341910; x=1783946710; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=at2wG9fgDCzLJho8qAuNMi5fPc/Fr7X6A05iUjg+Iuw=;
        b=SAKQLwWp2DyhygaK3PygNvCaFsm7vFnIvlqhKPu4jxQ01Du+/khADiQ7HCWQqKbX46
         wq/VIVmrAbhLzBeWGN2Tva7rlW2t8Jxkq3Zg5b8FC5/IPrfCysx2Wgm/NxViMqYAjepx
         ir3pR/Ac1yQDcEPvOXWGqS/JqBFSs4oPSmZfnaKm0X/T8dSHJNr23krEZ+GQtUHUeXk+
         nC+3sfpEuHKT0KGyqSmerCJqJwwz5CXphN1iVwwqoAoVcLRo+LJ4GgkX+6pF7iIFIE8W
         xgiLUA5hvsyuTe0pXQtHMaJas27aR+qts6RTYkHiAgZUflsfh8dcc1IxBAdUHvogROJ5
         xbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341910; x=1783946710;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=at2wG9fgDCzLJho8qAuNMi5fPc/Fr7X6A05iUjg+Iuw=;
        b=MtnnYwPvEBm1N1FM0ivkGdYQioyeHKwZSlyLmk+O5tjcZ7T76XQ14iIfKCjQxGKRZX
         AyIf8ckGA8U45HdGtAr64ryPtYFzZdhXOETHjCcmtwvuTxsHjfMtPTXQZE5Jhv2+ZNpY
         vP4aDX+P2mXHMspi6MrThTYqAdicVJySlr7xX2ZjKInlLoSs1cOJQmo2RE4f9fhuu/ZQ
         Lp0NlR/ZoGXUTMpw+xr4AuQ5A8ZSpydKfih36a2Rv0SvniG5J2F2DE9xF+Nth2tG1iE/
         PhwmgaFeH04zQO5iriOZKDlke/eg30SSBXRVKSGebJ9y1ABHCqLvlTufwCYEnkETo1JY
         kKsQ==
X-Forwarded-Encrypted: i=1; AHgh+RrcUKjzV1tPtCfmsZf4P29CHhXJasI9ltHjjPu3EN0hozNsD9xhV6KJ/bZFdqaSfks2PDBytxMAy1jW@vger.kernel.org
X-Gm-Message-State: AOJu0YwWk32fJTLchiE31xCAyI3mvFn0ooQoXG7WwgtwTQfzetGZNHoD
	WpeEyLzD6ANVaDBkkRLPruN5l93pYHdg6jOZFIV/t04I1/EhM52MsIQvWjAVoMMnxQR9Puzjpix
	XLk38V+BJFaI9JI2lB1LYp9qkBkCtTntaxrXRWMA49pCKXGhKct+WPUEMqMe82p77
X-Gm-Gg: AfdE7cnwFEvn/Wiyb7xcrfV6KZVMsxKGr4TOFb+V6kDLmB06nom99YiL1BmYaD/azRb
	U05tMokOoWvbRq9HwJzZ14DVKhhicg0Lxa7TVsqT986wn/m0L3S88Uja1FOEjknHIDMzCwAy3Xa
	kdRWecrBQWIJG393DYSHGf6lx9/3WirXw5y6B1a8dooKM/7jLp5TBDp1r53RzEThoSWJO3nhFGC
	KamvFifvhA6fivMgpL9RflBReVt0y6lYxR8ADjp/1juCDG0kDpy/AHEMDXtPiVlJXS/feMo1DRf
	jw7BV1Jl6Kc4YV2ldPa7eCHfwRRmj56MgDKeKY6Royl2TxoRjBmzvLhq2OYi8KJ72hS8LyTIEWK
	b8qI9WwfJAwbrSq2o2O3q1DvFYZhoaLipgm74q/VEdkvXjA08DKQzq0+Jv2Wexv2VyWhlv4OTfT
	qz7bZzWRktcnsra95cP917jpZ1
X-Received: by 2002:a05:6122:16a8:b0:5bd:cb34:1b70 with SMTP id 71dfb90a1353d-5be89740b71mr170285e0c.1.1783341909870;
        Mon, 06 Jul 2026 05:45:09 -0700 (PDT)
X-Received: by 2002:a05:6122:16a8:b0:5bd:cb34:1b70 with SMTP id 71dfb90a1353d-5be89740b71mr170272e0c.1.1783341909306;
        Mon, 06 Jul 2026 05:45:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bbbbbsm2839229e87.43.2026.07.06.05.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:08 -0700 (PDT)
Date: Mon, 6 Jul 2026 15:45:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: sm8250: Add JPEG encoder node
Message-ID: <h2fskxtlb6wusoz7o5pw34ii5n2il4jltcrogmt36676ioq5nd@klwft4s3mzgk>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-5-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706071113.383215-5-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: JepqoRpJo2kRI0leIzgjBDBUv3NBc3pl
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4ba356 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=kM9LC2GvXd1nFKSqAPcA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX5itaEFsHiV04
 dBtmt7lnz5W9O/YRdYPfRnKzpy1yoRn4Pn9V8/sk+6jMh2jRrGLQ5YBJODgJQsxwPlsasrW9VpI
 lrRMBFOZjfen5fAfkKqQuSmlvSFIPKo=
X-Proofpoint-GUID: JepqoRpJo2kRI0leIzgjBDBUv3NBc3pl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX6TfnJXNXaMz7
 gYlx4qg4K858k1HpFWEjwYRMTMbQ5jrqYXgvCNaVaMQBMMGqHUu+WLSHvMaGB/nVVayyyxu9dxe
 sgIhTTFiXKQ4ctKqQjgS1KinqNz6DXslNEMi/T6NV2jfEIzd/lhkY0FJUS5AI0oN0Gk9leH9H0X
 tZkDlshoWRDZDNQ38MU+BDPa7j79uDiQTsb5Ci/l0j2J3N7o/SDkfcEXd6VuQRH6II7k3kB6T/x
 BXncm11rEGiAYewfldXqRXJGwSH/H13HWQOe0uNm69A8aKXSwJeNnLIw/XMwcVSBIHjWQt8SYyz
 x89//1LWjna6V5BYJXg95nmdXhRbIyb0JvEHVZM1aIfCTHowI6SAACOOVTJBXZ5gsIJJ8qyyWfa
 FxoRaqfCJVtPeS3GAiiOnFTWvq6AitUeBE43cDF7RaRJB+F57dvRObhhpF8jsVb+WT11j/n8vas
 qiXPmK1/gAOy7lCV/BA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129

On Mon, Jul 06, 2026 at 10:11:12AM +0300, Atanas Filipov wrote:
> Add the JPEG encoder hardware node to the SM8250 device tree so the
> qcom-jpeg V4L2 encoder driver can bind and operate on this platform.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 81 ++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 7076720413ab..a089b706f60c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -12,6 +12,7 @@
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
> +#include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,sm8250.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>  #include <dt-bindings/phy/phy-qcom-qmp.h>
> @@ -4471,6 +4472,10 @@ cci1_i2c1: i2c-bus@1 {
>  
>  		camss: camss@ac6a000 {
>  			compatible = "qcom,sm8250-camss";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
>  			status = "disabled";
>  
>  			reg = <0 0x0ac6a000 0 0x2000>,
> @@ -4649,6 +4654,82 @@ port@5 {
>  					reg = <5>;
>  				};
>  			};
> +
> +			jpeg-encoder@ac53000 {
> +				compatible = "qcom,sm8250-jenc";
> +
> +				reg = <0 0x0ac53000 0 0x1000>;

0x0 instead of just 0

> +
> +				interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +
> +				clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +					 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +					 <&camcc CAM_CC_CORE_AHB_CLK>,
> +					 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +					 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +					 <&camcc CAM_CC_JPEG_CLK>;
> +
> +				clock-names = "hf_axi",
> +					      "sf_axi",
> +					      "core_ahb",
> +					      "cpas_ahb",
> +					      "cnoc_axi",
> +					      "jpeg";

What are the clock _inputs_ on the JPEG core side?

> +
> +				interconnects = <&gem_noc MASTER_AMPSS_M0
> +						 QCOM_ICC_TAG_ACTIVE_ONLY

Put tags on the previous line (even if it is longer than 80 chars).

> +						 &config_noc SLAVE_CAMERA_CFG
> +						 QCOM_ICC_TAG_ACTIVE_ONLY>,
> +						<&mmss_noc MASTER_CAMNOC_HF
> +						 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI_CH0
> +						 QCOM_ICC_TAG_ALWAYS>,
> +						<&mmss_noc MASTER_CAMNOC_SF
> +						 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI_CH0
> +						 QCOM_ICC_TAG_ALWAYS>;
> +				interconnect-names = "cpu-cfg",
> +						     "hf-mnoc",
> +						     "sf-mnoc";
> +
> +				iommus = <&apps_smmu 0x2040 0x400>;
> +
> +				operating-points-v2 = <&jpeg_opp_table>;
> +
> +				jpeg_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-100000000 {
> +						opp-hz = /bits/ 64 <400000000>,
> +							 /bits/ 64 <100000000>;
> +						required-opps = <&rpmhpd_opp_min_svs>;

Inside the DT example i saw bandwidth votes. Why are they gone from the
DT?

> +					};
> +
> +					opp-200000000 {
> +						opp-hz = /bits/ 64 <400000000>,
> +							 /bits/ 64 <200000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-400000000 {
> +						opp-hz = /bits/ 64 <400000000>,
> +							 /bits/ 64 <400000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-480000000 {
> +						opp-hz = /bits/ 64 <400000000>,
> +							 /bits/ 64 <480000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-600000000 {
> +						opp-hz = /bits/ 64 <400000000>,
> +							 /bits/ 64 <600000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
>  		};
>  
>  		camcc: clock-controller@ad00000 {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
