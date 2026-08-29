Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A677735F19D
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 16:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788021729; cv=none; b=faPZ1+EhpNYJebqNXNTnyV26+65BaCmLjfeYp1x8gL2PvPvQQvLq3f2QNrcmoVchXsqi12w9io4sIE45YXQbUwR6Wrwi8IZ99G6cTwXiygV2oYcbWxCw4yf4m13iu7Y1pV+sxjOLJ/whZ8x1Ykw4BjOT+bTVT0pDU3OV6vXJqSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788021729; c=relaxed/simple;
	bh=pPBIr68TwRqD8tO4XHKIhU+k8mwy4F9JSlUAQ3OMwYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GtWU+OBQvLw5DCaDQzDxzpEy2g9GEdP4cJjtusEs1dP58qwKt1G0N8SVF4GufYxHqTEzv4XXE4+PWkYXEfaOcD1h/sE7eIE48L2Qnd3eLmoNibEhKUhkk0GMEHuoqVrdwayAOuRUgml2M3ZafJpjdqHjQsRo3fzXXSRv5MTcEQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGQmFd/c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gF5kfdIE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGQmFd/c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gF5kfdIE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TE31oh2159069
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 16:42:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lIXFuvY2+Ky3mMi2oni0IoCYc52BLAeik+B2WqFBEYI=; b=OGQmFd/c9qJtJPNp
	ldSP6EBSQi3HSK9pbjnXSsTtpcM4nFs/2xgvU0o/Kc2WzzBePHfNOf+Gc0g3If8q
	G58WGrCE4M8/kETzOQvRFyIRWd84r1GQwX9K6oWiY6op2OjmipusdL+kBhHLhCpP
	lpreYo40QQsndOBsTykyD6fzN4catr8CcUCxXWEp93tQuHNgoXk07zj+C41Vdi7v
	olEqum4FavDJk3qwcHN6duUfBt/+C7JeoRYuoCjqsS5y4sT77yitxhFrnTBv384B
	UGkaSLUst4+0YdA4wfGx5WHzkrhAm6C/E+7MsHTkx7ZTGUba2oo2VFdDH+8H9Bjb
	I/fuoQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqgyhd0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 16:42:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so3696287a91.0
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 09:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788021725; x=1788626525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lIXFuvY2+Ky3mMi2oni0IoCYc52BLAeik+B2WqFBEYI=;
        b=gF5kfdIEdjONH4dNlt0izSsLYCJ1vVP4qoB1+/upzf9kZs4h+BJJ6ajlwBndxQSzhh
         yJMjERcvu5J1hvTiSYz1UORppvtWdF8fDCwBO61AcgvcKVNbkDwmVAFotzO2jTGd5p1N
         Q5zSNhGm1FUpAkS3xyBXF5YHpGxRsHGWyDW4YajO0LFutR3Yi+qx4T8jQsRT0dIneYpT
         80tRcFBCf8mmKXqOzek/LBjg0EJZdWTLDBwdzUzxJd57oQEzggvw6WGiWAf6zj30G9/U
         /+zUctV91SH5Sx98TxQK+M79xTYoeHGIWgbHfO52qCKp62Xh50Qj+IKfyfMqJTvjMYdx
         tABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788021725; x=1788626525;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lIXFuvY2+Ky3mMi2oni0IoCYc52BLAeik+B2WqFBEYI=;
        b=iySvemh98ly4FvVUv1T4E+3TqJwZh9gv1Q46cFERORTb+IkD4yP4Q6I9Ye8KgBY/lB
         7AxfM8N0tHvWFyK1z7b8rzinPoL+kgVCfGmbEZoL9TpxfHx4gfAb+d4Y1smD5WLsoqqp
         Eil9cHQEyHtTdDiEYmJVsls9+XFEDg6vHh4z970/JlJm8R65k8BnQTVxtlQTl0cPTk16
         lUifNW/x1e2VfUprmD5tN6sbfSzX8IdLRdZJvOPIDhiVPq+qSoyuOZxKxkFpXHOnUcmb
         8ji7L9XZYwP0OfYCcUoL0XAu1M7ZzZZs/GgSiNKlD5bWAOucVe9T/FPJSxskiuu/9OZ1
         bOHg==
X-Forwarded-Encrypted: i=1; AKwUvBzhsrx3Mn4uwWCUilnLUILZdGW02RWL4CDzwuozvGlSnko9da+rsXHMOqY8p43qJu7UTPX/MU4TPCmx@vger.kernel.org
X-Gm-Message-State: AFuF++kuU66KSzsalAcveDWgkun7XIMw6PZBaDA/wh5mYfA8HrGdiFEX
	2fYZR0wwoQE/E089BIMMpnC0SEWLo88aOI/dwaS/cJ/yX2HF8GvECU0SEYx/I9ajPw4G3p/8Fik
	6awzSYF995PP8jymxpUH+u16iHy2DUAhVp0KeYzA1BIYc8z8ikUS59HK97OpTootz
X-Gm-Gg: AYBFou1DYMtAcTN+nH0dtJokvtyFrjzCFZMgHZTBdoN0HiYUTbsERf2T5bdA+LzIf8b
	HX+NDlv+ThSPdDqT9PbM902l9BCKWr5hHSKKM6jGHpQ73cLd6W0aHP7ZXBQrQTatgUmtVB6agUp
	M/hzs/oB3JrnBO17btCS0NnrUPhlAgJn5JKW/Ge5KLPYZ7iZw52LRO3ReJ+fEMTBu8M51sNOCol
	voxo/S25Ki3JAiO2XjFS7G3vIun8vy3mfQTzMlH5kFEm6isMVsnwGA7jR0JzTJFLv5mZikZFJlR
	jCnKO/0+rL65jo8s83MY2v5erHE4x9/xmdKr52aidghgEhiogeeY47+Oml/WB6ru0t4De7TpJrR
	HUAAHTixvH0kZ0ns0cWpY330iOYzS8SoMD6xifVmgCDrWdh0lGL1vHIjAIxkn846pPYI=
X-Received: by 2002:a17:90b:48c5:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-3989be9ac97mr11639504a91.17.1788021725470;
        Sat, 29 Aug 2026 09:42:05 -0700 (PDT)
X-Received: by 2002:a17:90b:48c5:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-3989be9ac97mr11639439a91.17.1788021724980;
        Sat, 29 Aug 2026 09:42:04 -0700 (PDT)
Received: from [192.168.1.5] ([122.177.241.61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-398c3a10e6esm334612a91.13.2026.08.29.09.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Aug 2026 09:42:04 -0700 (PDT)
Message-ID: <7d7c5d8f-a5e3-450e-95c8-c6b4e8ae8cf6@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 22:11:57 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] arm64: dts: qcom: ipq8074: Flatten usb controller
 nodes
To: george.moussalem@outlook.com
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
 <20260825-ipq-flatten-usb-v1-8-5c1f3170bbe9@outlook.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260825-ipq-flatten-usb-v1-8-5c1f3170bbe9@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE0NCBTYWx0ZWRfX9qb2WZrof1y8
 ndh/YWA4bjd2QQWmQNonvXYnMuYemmp5G2O8D1Ck06WMHYatu+HiwDfU+ut7k5vCnrC3zF35lxK
 RUXssk28jgVybWPvDG+GsxAm+lQvxAE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE0NCBTYWx0ZWRfX5cBO8+1bcu6t
 g4HtosLSVWec+s8WFxg5CfQ+LOoyOTEPLb1rGTyB2QxY8V2jEhF500/qUMJrPSbvvQS8LAaeSRI
 Ep/5kgaN0HuazB6qMENZoBC/GO0fq5mVrUhrc97Hn/9RxYRh/2P871Asfh6n2hX7GUDY3dt/nMl
 g7kwF2luwsMtreVFNyMDq4ZHGTmHuMyyppAc1TCUeazdTHSDP1eAtZP/kqPBAibDCRrxoFhCqW8
 5wV8IdihrQI4JtbK7qXncOwnbBqrahwqPCRWxn0eZRlSThOytgRLI4LjCEaYTqVXQA0SziQfawp
 zeLvqpn5D/uFqPGlHblfrp87bisG6k2RKoHZJkWNDhxBlyGSkHAWg1sHoqfcYTwrzJ4YWq7zi/4
 54pHFquqkD3GqrBqNBedr7v0lrUfGGkDPFsNngtMkO9GAGGUd5DZwYIb9MIRU4bk+JJ36FW5r2o
 zjWW38wyuWrX3kbi3oA==
X-Proofpoint-ORIG-GUID: MbV0zENF4Ue6tvE1J7wWs8jEPn7_68et
X-Authority-Analysis: v=2.4 cv=R5Ez39RX c=1 sm=1 tr=0 ts=6a930bde cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=PZ14JaS8AzYbITig/tPzRA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=UqCG9HQmAAAA:8 a=cNerkBHK4LsFKABZlZAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: MbV0zENF4Ue6tvE1J7wWs8jEPn7_68et
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290144



On 8/25/2026 4:12 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Flatten usb controller nodes and update to using latest bindings and
> flattened driver approach.
> 
> In addition, fix indentation of properties in both nodes.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>   arch/arm64/boot/dts/qcom/ipq8074.dtsi | 112 ++++++++++++++++------------------
>   1 file changed, 52 insertions(+), 60 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> index 75a5ae30d966..d4a86b3815f2 100644
> --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> @@ -625,104 +625,96 @@ qpic_nand: nand-controller@79b0000 {
>   			status = "disabled";
>   		};
>   
> -		usb_0: usb@8af8800 {
> -			compatible = "qcom,ipq8074-dwc3", "qcom,dwc3";
> -			reg = <0x08af8800 0x400>;
> -			#address-cells = <1>;
> -			#size-cells = <1>;
> -			ranges;
> +		usb_0: usb@8a00000 {
> +			compatible = "qcom,ipq8074-dwc3", "qcom,snps-dwc3";
> +			reg = <0x08a00000 0xfc100>;
>   
>   			clocks = <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,
> -				<&gcc GCC_USB0_MASTER_CLK>,
> -				<&gcc GCC_USB0_SLEEP_CLK>,
> -				<&gcc GCC_USB0_MOCK_UTMI_CLK>;
> +				 <&gcc GCC_USB0_MASTER_CLK>,
> +				 <&gcc GCC_USB0_SLEEP_CLK>,
> +				 <&gcc GCC_USB0_MOCK_UTMI_CLK>;
>   			clock-names = "cfg_noc",
> -				"core",
> -				"sleep",
> -				"mock_utmi";
> +				      "core",
> +				      "sleep",
> +				      "mock_utmi";
>   
>   			assigned-clocks = <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,
>   					  <&gcc GCC_USB0_MASTER_CLK>,
>   					  <&gcc GCC_USB0_MOCK_UTMI_CLK>;
>   			assigned-clock-rates = <133330000>,
> -						<133330000>,
> -						<19200000>;
> +					       <133330000>,
> +					       <19200000>;
>   
> -			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> +			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "pwr_event",
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
>   					  "qusb2_phy",
>   					  "ss_phy_irq";
>   
>   			power-domains = <&gcc USB0_GDSC>;
>   
> +			phys = <&qusb_phy_0>, <&ssphy_0>;
> +			phy-names = "usb2-phy", "usb3-phy";
> +
> +			snps,parkmode-disable-ss-quirk;
> +			snps,is-utmi-l1-suspend;
> +			snps,hird-threshold = /bits/ 8 <0x0>;
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_u3_susphy_quirk;
> +			dr_mode = "host";
> +

I see this controller is DRD capable. Move this property to platform DTS 
if dr_mode is needed as host.

>   			resets = <&gcc GCC_USB0_BCR>;
> -			status = "disabled";
>   

[...]

> +		usb_1: usb@8c00000 {
> +			compatible = "qcom,ipq8074-dwc3", "qcom,snps-dwc3";
> +			reg = <0x08c00000 0xfc100>;
>   
>   			clocks = <&gcc GCC_SYS_NOC_USB1_AXI_CLK>,
> -				<&gcc GCC_USB1_MASTER_CLK>,
> -				<&gcc GCC_USB1_SLEEP_CLK>,
> -				<&gcc GCC_USB1_MOCK_UTMI_CLK>;
> +				 <&gcc GCC_USB1_MASTER_CLK>,
> +				 <&gcc GCC_USB1_SLEEP_CLK>,
> +				 <&gcc GCC_USB1_MOCK_UTMI_CLK>;
>   			clock-names = "cfg_noc",
> -				"core",
> -				"sleep",
> -				"mock_utmi";
> +				      "core",
> +				      "sleep",
> +				      "mock_utmi";
>   
>   			assigned-clocks = <&gcc GCC_SYS_NOC_USB1_AXI_CLK>,
>   					  <&gcc GCC_USB1_MASTER_CLK>,
>   					  <&gcc GCC_USB1_MOCK_UTMI_CLK>;
>   			assigned-clock-rates = <133330000>,
> -						<133330000>,
> -						<19200000>;
> +					       <133330000>,
> +					       <19200000>;
>   
> -			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
> +			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "pwr_event",
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
>   					  "qusb2_phy",
>   					  "ss_phy_irq";
>   
>   			power-domains = <&gcc USB1_GDSC>;
>   
> +			phys = <&qusb_phy_1>, <&ssphy_1>;
> +			phy-names = "usb2-phy", "usb3-phy";
> +
> +			snps,parkmode-disable-ss-quirk;
> +			snps,is-utmi-l1-suspend;
> +			snps,hird-threshold = /bits/ 8 <0x0>;
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_u3_susphy_quirk;
> +			dr_mode = "host";
> +

Same comment as above.

Regards,
Krishna,
