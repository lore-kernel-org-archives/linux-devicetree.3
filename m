Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26913AFAE0
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 06:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780552868; cv=none; b=VsDuPXBG1s+EgJ6ZBlrI/HU95wZ0zYst6hGzfkHmBy41X/lRR4owQoDeNGs1glQxnDquf9NrPuUvS8dRTukSDtOdRGvbVdKxZUFNBkml2bBmHB+jk01wlvZ13DJs70n3aM/4jYtk0GQOnzPV7c0FslB61BbWEFHLhBDQu6XmUmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780552868; c=relaxed/simple;
	bh=MvMbsSGoBafGYAqgnlT2r4yR/KgHACSna2mBXP8Ehb4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qnDvN0nh8/6yT5CIY7WE90CiGXJnlsOHve7HbAcIeUdryylQk8fiJEVM4aW7rrMmeOgSsX9ZNlj/P/MxLJil+AwV/pL1flqnTAGY36L7MdELgJifC+SS1Nzo22SmkptAX3BSrcFOlrLh5s2U41/o1o0GDIG98gpl5b/xRRk8lZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fr82q52W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ezDGFx2g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fr82q52W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ezDGFx2g"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6540ntF3313660
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 06:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Rxy84CQtSfLdf5SWlBRH0Dm+BYAxOch+/SAQBO+pwA=; b=fr82q52WQjC9rp8l
	y1YLPntQJ6LDvPOhZFNfgKMWw8M3pI6lLs3N04QggFm8IWzIrFG2h3HnB9xVOIqE
	XniqPWq6uuCW9kUm41E+4F8W6JtHuNZbfkBBZTU6q/aVrjBlRNfGk8P7LOBSLaV7
	RDX/CL4u4OFvzHfGVCVzbSqbvlAAF8A/tQHfIt9VMkB5JQNXz17Z1vX4uvWCURqJ
	69inmbiUJ2mIhcQDS6z0igVBFj7WZEFL03qybSwlsmR4EKfE0Lxd0nLuAe4DVQ58
	JUiOSYrzWy88teNRTDThSA4UrNIQaQg39Fdeyq30M0OsPihyaMDWdRhkZUWZyAQj
	6nIqvg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy5v0vwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:01:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c36f4b76so4275495ad.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 23:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780552865; x=1781157665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Rxy84CQtSfLdf5SWlBRH0Dm+BYAxOch+/SAQBO+pwA=;
        b=ezDGFx2gurJgPZlnOz6bi5hn081b/S2BBYY9/xKVB6MI9O3dgQhGkYSxWZG9lTrLE2
         clGKhaqfoM2fcK0rCJEK0DeLJQQp5bMepHPZDFAFwemAkHjYAJ0A6LmhodrSB5tsuz4p
         pfZ6Nt2mDcIsejhxETA2HJqcptozoBDEiTThrDXCltmfkh7GNWHoCPk1RFb/yzBFceG6
         FS3zOYLqYsMX4Mbv5tbsXMsBUjhTyr68m8joQbLJiWMG5aNAZ4XXnwhq/kM68zXllLUn
         G3eHGsWmPumcnpaouALJkF3XcPo1FdQiVFiT0H+6Lmrk/iN7yc62O1D1kF3kRxkkA/vM
         w/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780552865; x=1781157665;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Rxy84CQtSfLdf5SWlBRH0Dm+BYAxOch+/SAQBO+pwA=;
        b=FX6+TPgnCFA/EeA5BOW+b6BBCiITWDBuy+QZBE2Bsfp7sbxqWvf/rN/k3cIUfWwteu
         OhaEx/67+nXC8EzcXptWF3Ys5ROjpdiQ4/AvRc1zIqkCgTsV/YjGrA4eKVP+921SVDIk
         GPD34gAlGuPZKayDhPtedgK5JOw+8Zj2OwHMsnRA37eWZqcC/PVBsD9Pu5qhlCbyVYW4
         tLudtxXQjL0Zj02vJv9ciiVucNubUNH6MrxWVmKECwmGpZAJVP2Qqn6YjyfTicZTY27w
         HzlEf/2nJQcyLLxykfZNNReJJvpUwWdfhp+iT8Zjt1GEe6wRj7PAs3Nt4fqQwZpVEzhX
         cWKg==
X-Forwarded-Encrypted: i=1; AFNElJ9vfwBdmfb0GE9G2X9hCVZpfHv6LjpwxERIrUSGKGL8Gqe8yWFGk//kQl94Vz3k3toSqsTWjrt3TflT@vger.kernel.org
X-Gm-Message-State: AOJu0YxxVQV7awBHZYwVNJLTrvnvXeMFyhuA6nZGA0ivYQmYilN+i1D4
	Z5ttWBAB4vgjB54PySGanHndCLsogCjCCsO0ZF0UpZHM0A2oDlwEVS7F9UTs3sEKeYhCL16nn7J
	RiZoLQxrNe8ZxzN6PkpAsnwUttbS5lcePbWB0DEDzyj81ngrgUsKYifEI2KLajNCk
X-Gm-Gg: Acq92OEmp/tECJvy/DDsv/QVuqujpcB5lQolt6jGO+7K84xy5/3Ho3t23xxls9U/qKX
	Oc9VVo+jU3C1Nc4VjDWOrZ0bApHQv2vQ+mr8NPmVXrqwfJcavq0MNzYf2xpBDXR5EOUkvA7Eyo1
	BkYDmNBt4R9t1oInP9Xn31kmoik/+rQC1Pfyvm2I+fJ0U4dXv8VLCUx0SyroPnpXXXxLHPCx92W
	gBZiLob6v6Zi50V2le7jSrgl9E/Au3GpR9li0svi8gQAUkiARWpIex4D1X30iKUg6vzeK6SoWEP
	TnCi5v46n1z5lRaeVsejMRR/rmqvp3DRfvZzzDnXA+lOQ9o1HcnVr2MQhjS545Envwq2mhmgjv5
	rBddDvJ/HEj2fDMVen+KoSsex0Q21WaAN2tih+qPAe4BXzvLgby0y5oS89/oR06qE
X-Received: by 2002:a17:902:b58c:b0:2b9:e82f:bfef with SMTP id d9443c01a7336-2c163fa4e05mr46112415ad.21.1780552864481;
        Wed, 03 Jun 2026 23:01:04 -0700 (PDT)
X-Received: by 2002:a17:902:b58c:b0:2b9:e82f:bfef with SMTP id d9443c01a7336-2c163fa4e05mr46111905ad.21.1780552863956;
        Wed, 03 Jun 2026 23:01:03 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d395sm61450955ad.17.2026.06.03.23.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 23:01:02 -0700 (PDT)
Message-ID: <2e4ff886-af8d-b9cb-75f0-ad9bc081bf9b@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 11:30:56 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: milos: Add Iris VPU v2.0
To: Alexander Koskovich <akoskovich@pm.me>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260529-milos-iris-v2-0-7a763d7195ae@pm.me>
 <20260529-milos-iris-v2-3-7a763d7195ae@pm.me>
Content-Language: en-US
In-Reply-To: <20260529-milos-iris-v2-3-7a763d7195ae@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1NCBTYWx0ZWRfX0p25hZVrOeks
 GgryizOW0JAjdPD1aJNBR7eRAY1LF0JsZHNYqS2LdP7vWC+90iwzavIhCWWu6XLYYKMi+jdrCTN
 1/h/sEsZ8M+da6kKmOfaTPXjspA2RgCcY1BoDqm0IFombhXijuK7ZXbD76LkQrjU/466rPnuuZ0
 wsgbf+iizTpVaL/L09B0WKrchBQd0KJv97sALcrPmtlW8ah6XfUaQtDi9WZbS6o85dow4KDSWyS
 OYmV9JkGdA8d6gxfhHuKaA6+XQJmC3vtGNuztfeD6h2fl3bR5X+mb4hd83rcjYQfJdJu6SlUsZf
 yLoYexv39no+6pjXuGVIZTOJTFo/j226N/8qzVbLQ0ucu5j62v/Jrzrfmwmc7BkZ3c03Wcq98Xy
 1OOVtTi8NUOwLk8pSN7qUf/+a1/TFeJKQGhteSuREc5ZLeLv/Ekx0OJEqG5S227031K+gZGScDE
 28IE/XnDZguU6Scd8xA==
X-Proofpoint-ORIG-GUID: VjdDFoTteO_DUSoufUjp_m6M8AS5X8ZH
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a2114a1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=cPBJnOxHEKv7ehhu7hMA:9 a=T0nNOjck6VvS5lE6:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: VjdDFoTteO_DUSoufUjp_m6M8AS5X8ZH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040054


On 5/30/2026 2:28 AM, Alexander Koskovich wrote:
> Add devicetree nodes for the Iris codec (VPU 2.0) found on the Milos
> platform.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 85 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> index 4a64a98a434b..94a3c51d1d0f 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/clock/qcom,milos-dispcc.h>
>  #include <dt-bindings/clock/qcom,milos-gcc.h>
>  #include <dt-bindings/clock/qcom,milos-gpucc.h>
> +#include <dt-bindings/clock/qcom,milos-videocc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sm8650-tcsr.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
> @@ -1835,6 +1836,90 @@ usb_1_dwc3_hs: endpoint {
>  			};
>  		};
>  
> +		iris: video-codec@aa00000 {
> +			compatible = "qcom,milos-iris";
> +			reg = <0x0 0x0aa00000 0x0 0xf0000>;
> +
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> +					<&videocc VIDEO_CC_MVS0_GDSC>,
> +					<&rpmhpd RPMHPD_CX>,
> +					<&rpmhpd RPMHPD_MX>;
> +			power-domain-names = "venus",
> +					     "vcodec0",
> +					     "cx",
> +					     "mx";
> +
> +			operating-points-v2 = <&iris_opp_table>;
> +
> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "vcodec0_core";
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &cnoc_cfg SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "cpu-cfg",
> +					     "video-mem";
> +
> +			memory-region = <&video_mem>;
> +
> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
> +			reset-names = "bus",
> +				      "core";
> +
> +			iommus = <&apps_smmu 0x1960 0>,
> +				 <&apps_smmu 0x1967 0>;
> +
> +			dma-coherent;
> +
> +			/*
> +			 * IRIS firmware is signed by vendors, only enable on
> +			 * boards where the proper signed firmware is available.
> +			 */
> +			status = "disabled";
> +
> +			iris_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_svs>;

This doesn't seem to fully address Dikshita comment from v1 — I believe the
suggestion was to update for the mx rail only.

> +				};
> +
> +				opp-338000000 {
> +					opp-hz = /bits/ 64 <338000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-366000000 {
> +					opp-hz = /bits/ 64 <366000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-444000000 {
> +					opp-hz = /bits/ 64 <444000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-552000000 {
> +					opp-hz = /bits/ 64 <552000000>;
> +					required-opps = <&rpmhpd_opp_nom>,
> +							<&rpmhpd_opp_nom>;
> +				};
> +			};
> +		};
> +
>  		videocc: clock-controller@aaf0000 {
>  			compatible = "qcom,milos-videocc";
>  			reg = <0x0 0x0aaf0000 0x0 0x10000>;
>
