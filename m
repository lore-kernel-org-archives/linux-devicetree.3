Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E011B48034E
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778848757; cv=none; b=dug0Owcgmireg1zzAlvX/40DlkUwiV4DQdBX61MbTyt1k9YYWtKmpiNXU+LtXp+8dbGj5I4QEfq/K6p82IP5+uZC9uLPbFyl7faV9zX0znt3GETmrBD6SlLIGRqTLCCc/DsRXHpPIUmyjC+gKfE2BEsJ1VLNaDS53+LFeGERmuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778848757; c=relaxed/simple;
	bh=22fyjFgJ+C1v+V1xAOqUC0UsBP5Luq3yO1l3Ff3jUwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qUnKoX4CoKM6EoXxsSTZmHC8uDtm3DQzPw4x1Cjwwr+zoqlNPPUvcx0nJsijqdJSmI1gW5VJgN/Fxj9E2I1kIPS6rtlmEOKccadeaE0JEPxjzC8Kk6UIZYdTqsHspCkrSqamkUDHhPEru7dnTcwcBHUk6dvvvIdUIuTGd6ldZBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X3eJKL/1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RW1cyp7M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X3eJKL/1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RW1cyp7M"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB5cpU3219705
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rn7Imlm01EFKGNinkVWhVrB/
	5WJJcifljrfBA44NDlg=; b=X3eJKL/1rIOyUwoH3EijiDxyjUKXLVm39GavDGv1
	8HPlq/JC3gqcw6FwvUwep1y0GzxmN4dbBaF//rZ8fxRPf7gSmuGT9fHqpdbHXw2j
	txA2VyYMa4Y5MJBvMh6cl6FFXaHlfvt53Mbl5Hs5y/QRXEiU4Az/svAd5vW0+zc0
	gwf871XJKa/8qthR+Sq0kQ4+vsCsT0DGFJE137HbWyIuOsln+poWjUPJK6e2QbLp
	wWYGbi7Y9jFXyuZdk5Hr0mHT+GW7fXO6gzLO2xs4QtSyLuHIFrw6mFn7lGzOyo8S
	JwYMGbYPeqRumNP35v9kwckCkONmgwBzdyuOlwF5/ysNpg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s386h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:39:13 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95fc346e02dso1161297241.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 05:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778848753; x=1779453553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rn7Imlm01EFKGNinkVWhVrB/5WJJcifljrfBA44NDlg=;
        b=RW1cyp7M6eL4vtUotNRJe+drXkpE7259mYtNAz4k1yBT8vXRBZV/RLQloCd0Ynlgcz
         N9IGVGog1Ksh3NRwRoZdTN0V2IXKhUkfCECwpPIpU8RdBuMMYZsXoAFK+I4jzzA5F2YD
         BLIHqbmaQBWtcuBQ7EL8F8kQXMi78d8B495CeJHg1kpmyxj+oOlDqdVSlDVe/FVFuKVe
         gnjHwa20jtBu8kIfY2oMltczMupICKmwjZe6XyegyvSxgjl98eJnEJt+tLl3vIFQL33X
         SHLStOXC2WeZgppZQnlNb0VWHv8EWLSIVBSdmohCLkx5/CQCj/QpV+j3w2vNIYsOvW3k
         m6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778848753; x=1779453553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rn7Imlm01EFKGNinkVWhVrB/5WJJcifljrfBA44NDlg=;
        b=imd3yMrlsBIPIaFGVOhhYT9VcdswpZt7RP//NxHtreII2Q4An6f+qopb4jTevJdyxQ
         0V4G2Xx5H+bYfLmjJ6Y/obWd80aJzpBWyqENKaPCPid5aT1vfHQ8SN4tQ1V5VTcYIYQ1
         F+FxM8AMHKvK5IegOxpg0DcNIMRp0GLln3/euKVoUK+9PaxwbvwQjCnbKV5E7F+1hT2h
         w8J6vVr7StT3TGDHHvTTY3a2Dl2FkuURX71GG5CN23qh3drdrN6vcrSwrpX9Ze57QYfM
         RI6YrY6vdrqMbQr0LSmpRxU9oS2GMQkpu4d6iQw/Mfu4oWVzIAdnuoF7jO9gvmdVkwHO
         /6QQ==
X-Forwarded-Encrypted: i=1; AFNElJ+GVg6+S4pgA6e1zF5e6K8iZys13Y7RRRscNGD5zTk88wjtPtl1Nam7seXC67xHGFmA1D5Xt1DT4TGd@vger.kernel.org
X-Gm-Message-State: AOJu0YzFeELWFBdUP1pTgcJvUZOPOi1lc/PFdP5UITl1Yt/JnCK74LZ7
	pS8PwIfmsgTogArqBWmLzagCcZ3I4VC8+UFQaopz1u5GoW61FqGeBqTu+hovGTFxjwoYj5+1Tlh
	ngPqzHteVLfFLVQTJMOG0sjr5PUrg0BS1QfhHne9TipW468EhDceMOjcbMXmjt+do
X-Gm-Gg: Acq92OHR6fO3tgDL4UlKH4sI5SXHfAzAiA3y+fspgl7au9942EL47ZQYKMIVEa1DhtV
	umOh06pZce+I/donX23fFQ4/75dtuR37IK+4RnkadCTN+ZutFKohUzA6qdSnLU0KcctbYGkng2Z
	f3MleC5D61u+b53giUC0eeR8kN+M24L3fJW4atpXxrcAG1cbs0Cn8uTZ17mc5gceRuSsMpXdCne
	ohx+478g+VxWQyKCrDDsBFKieZG6EXxa44CrOqYyboZuF3fLp8Tip3NlK1/IIhGw7ExqVmahhSH
	TJCFO3Tcd6VAM8NmR5J7b9MZzVkyZYJoSsdZtnDHaPvu6q0YSE59t3JIG3fANMTsA1PXh+S/5Js
	K84aFvf1hGukswgYymZXuOHAI18cg0LNhCk8=
X-Received: by 2002:a05:6102:3f05:b0:62e:63e8:427b with SMTP id ada2fe7eead31-63a39a5f9e4mr2097462137.0.1778848752821;
        Fri, 15 May 2026 05:39:12 -0700 (PDT)
X-Received: by 2002:a05:6102:3f05:b0:62e:63e8:427b with SMTP id ada2fe7eead31-63a39a5f9e4mr2097443137.0.1778848752233;
        Fri, 15 May 2026 05:39:12 -0700 (PDT)
Received: from oss.qualcomm.com ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53ab671sm58719065e9.1.2026.05.15.05.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:39:11 -0700 (PDT)
Date: Fri, 15 May 2026 15:39:09 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: eliza: Add QUPv3, GPI DMA, SDHCI
 and LLCC nodes
Message-ID: <gzsmvuwe2tfgvkqz3k6h5f44xflaozcruvenn4vjhdmawgceof@bd7osrj2n7bo>
References: <20260513-eliza-dts-fix-debug-uart-and-more-support-v1-0-05814d24f4cf@oss.qualcomm.com>
 <20260513-eliza-dts-fix-debug-uart-and-more-support-v1-2-05814d24f4cf@oss.qualcomm.com>
 <934d6876-3c83-43de-b155-d435af4c3547@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <934d6876-3c83-43de-b155-d435af4c3547@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyOCBTYWx0ZWRfX0iPtH9IqQGlT
 t1/Y/yc+ryMMLXm4mHtVN8vOxoDaULEi9ax9RVk+jBkP+n//Pbh/8oqgB+7HvDP+tTGcqp4ZGtC
 SOnYvLCMh8uiO6p6VQlyr2bmAkDQoO/uYarjhhfqYaZWvmTwCCuyV7viQHMwutoVu5DL8Gr4+K3
 Gt1rcWJLnGjVzobrPQbRhu/ZBfJGYkKgGBqorTnr9jj0q3g6+gd3lOqEWT/vQQjBJC/T7PgIkoB
 SAXFEM7OyRbjlvhX/7msh8yek23eH0/Nrn+bpzfBjo52j+FAu2bK2cAVBdX9PstT0yNSaa0FGMZ
 VOxiqVXNSSHBnajeddvojtoQU7mqvkCshK3hUfIZh1o02smjrwm+z/8SBRDBp4iSJ9XivSOH6Qf
 amJ1I1l6K85EXFGKkSxZWMnYosMzVe9BdbadiMxLXFG3neZuACE4onCmNjpqlTtKnI6ZCnyB/K1
 FOys1ghr/Thnnxm5FjA==
X-Proofpoint-GUID: 9xf7l3FVZKDRgOQQp345aeRe1p50ACcY
X-Proofpoint-ORIG-GUID: 9xf7l3FVZKDRgOQQp345aeRe1p50ACcY
X-Authority-Analysis: v=2.4 cv=HJ7z0Itv c=1 sm=1 tr=0 ts=6a0713f1 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=MO9N5NShzSEYB1CzB2IA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150128

On 26-05-15 11:10:28, Konrad Dybcio wrote:
> On 5/13/26 2:33 PM, Abel Vesa wrote:
> > Describe the missing Eliza SoC nodes for the QUPv3 WRAP1 and WRAP2 serial
> > engines, add the matching GPI DMA controllers, the SDHCI controllers and
> > the LLCC system cache controller.
> > 
> > Also add the TLMM pinctrl states for the QUPv3 serial engines and the
> > SD card/eMMC interfaces, plus OPP tables for the SDHCI controllers.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +		gpi_dma1: dma-controller@a00000 {
> > +			compatible = "qcom,eliza-gpi-dma", "qcom,sm6350-gpi-dma";
> > +			reg = <0x0 0x00a00000 0x0 0x60000>;
> > +
> > +			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +			dma-channels = <12>;
> > +			dma-channel-mask = <0x3f>;
> > +			#dma-cells = <3>;
> > +
> > +			iommus = <&apps_smmu 0xb6 0x0>;
> > +			dma-coherent;
> > +
> > +			status = "disabled";
> 
> Let's keep the GPIs enabled

Will do.

> 
> [...]
> 
> > +		sdhc_1: mmc@f44000 {
> > +			compatible = "qcom,eliza-sdhci", "qcom,sdhci-msm-v5";
> > +			reg = <0x0 0x00f44000 0x0 0x1000>,
> > +			      <0x0 0x00f45000 0x0 0x1000>,
> > +			      <0x0 0x00f48000 0x0 0x8000>;
> > +			reg-names = "hc",
> > +				    "cqhci",
> > +				    "ice";
> 
> This should be a separate node

Will drop for now. Will be added later as a separate node.

> 
> > +
> > +			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "hc_irq",
> > +					  "pwr_irq";
> > +
> > +			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
> > +				 <&gcc GCC_SDCC1_APPS_CLK>,
> > +				 <&rpmhcc RPMH_CXO_CLK>;
> > +			clock-names = "iface",
> > +				      "core",
> > +				      "xo";
> > +
> > +			interconnects = <&aggre2_noc MASTER_SDCC_1 QCOM_ICC_TAG_ALWAYS
> > +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> > +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> > +					 &config_noc SLAVE_SDCC_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
> > +			interconnect-names = "sdhc-ddr",
> > +					     "cpu-sdhc";
> > +
> > +			power-domains = <&rpmhpd RPMHPD_CX>;
> > +			operating-points-v2 = <&sdhc1_opp_table>;
> > +
> > +			qcom,dll-config = <0x000f44ec>;
> > +			qcom,ddr-config = <0x80040868>;
> > +
> > +			iommus = <&apps_smmu 0x520 0x0>;
> > +			dma-coherent;
> > +
> > +			bus-width = <4>;
> 
> That's definitely 8

Yes.

> 
> > +			max-sd-hs-hz = <37500000>;
> 
> This should be fixed in Eliza

Will drop.

> 
> [...]
> 
> > +			max-sd-hs-hz = <37500000>;
> 
> ditto for sdcc2

Will drop.

> 
> > +
> > +			resets = <&gcc GCC_SDCC2_BCR>;
> > +
> > +			status = "disabled";
> > +
> > +			sdhc2_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +
> > +				opp-100000000 {
> > +					opp-hz = /bits/ 64 <100000000>;
> 
> The clock plan says 100, but the SDC doc says 50. What does
> downstream set here?

Downstream says 100 and 384 for sdhc1, and then 100 and 202 for sdhc2.

Thanks for reviewing!
