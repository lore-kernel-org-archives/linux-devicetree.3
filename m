Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D5A175A80
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 15:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782486936; cv=none; b=uTknMFmbfkoSywl6FICpmbKMy7BmNV6Aaxsw/nApJi7xN9JThieZ1VLnwLvW9xatWXNXUtKerSHjgyxtYHWP5NK3rwJgvK1t+eAcljzBN8CP4DuI/9RRI/UKsX+i3DRgbRxzUPg5yc+SZGMSw4ikvr8JYmDxbWJ1To+TYT6BjZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782486936; c=relaxed/simple;
	bh=Bg2g5/O4ANAJpRdlTfb18RSa531+fBt1OIeK5gNau/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TodbjVpHNe4NKQaD4lB9J0tnKnRYwLo5tyAR2B/1UtqnwpzKr/pcfzoKJHjvz4KgifyYg+xoqgBuKebNF+OstHNKUPSS9nFOYmvsWkP7UWpG5Fop2YYTwsliVP5VrtHMGahJ2zWJNjoae/js77yKVUtV4TdLcSuivZOybbewKEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+2CbihK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jOY0+Vq0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P+2CbihK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jOY0+Vq0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QF42hV1469896
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 15:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GahfmZ+krNr3vOn7I9cIdit+
	K/oa9QGSrgxEmne3Kbo=; b=P+2CbihKtcxB6V4ky4cDUznq7m4Wt3WkUb7fhEXI
	FlCTA4GPQIdwGGGx73fyPGd4aiqlb8MsJ0ET8K2GNpJawsmYILuHm0lRLl6CH/Gd
	niI26hv4Fw6o2MiqPwStWU9bmXX+F0KBI5qzprVT/uNdcVQcGS/jOrY6DWkEpRJR
	2Dod/1DG02NawYlBVWVdkRky/lO4jUKODhk/aDJ/WDXsfWjqnOppnbkhgdUYcPHK
	RCigjEeyPmKvAwIULX20YtOpsgRF2EZNuN0DrLxgX1/yiU7SQxioDqIpf+AIKPVP
	qlNu2kvMs9iSWFUOQ8CbU8171vxNs6vJjSGLJzfgxcerwA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1eeqbb44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 15:15:29 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6751db2792dso576873137.3
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 08:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782486929; x=1783091729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GahfmZ+krNr3vOn7I9cIdit+K/oa9QGSrgxEmne3Kbo=;
        b=jOY0+Vq09C5yAoxrr3PlHoT+W2BnbuDH3ZX9z2vF2na6grH7iXQYd156A1ne8EMq/R
         ZzqkoueDfQU5l4xDhQdJ//Ha4U86RtOMksUsIFRnrSLSRWnqOg2SnKxJ5lUdQkUIxlDV
         eeVRawmIAY0dOJWpO5+KwFfp4RaH9NBktmnw9xLBB4FXAWh5J58LwiEteBb5DTfCKYVv
         U33YS6R4p1h61Z6nkn/gTGmCwb6rd6xWuhatUZEIDwezILz/vgMwqDHq1/iARjCqH3uw
         VUOhDSVN4NsECDRMl6Uxnm1Y/dpHKd8rTc8tqEcK4E/WxWrIIOLICfJElG8w0udpOWG/
         gjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782486929; x=1783091729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GahfmZ+krNr3vOn7I9cIdit+K/oa9QGSrgxEmne3Kbo=;
        b=FujWlTZSM5EsgSQOwb9zym8gi/qh4jGEZIS5V0/iNl1LWEZ8+kwmVm4yOycGIn+rI8
         vFTvbcjRuoRe3sBp4CNdYqjXMeunQ+fY0pN6fltdWtrfncppuFa8CDT+AiCjdM+dthQg
         agaQl8WqG88SxuE1YRxfrzG0D95cMa84vikpcy9CXy9SfxL6PHVvSgLbBkLkZ4/j6dZQ
         WKObff1StCQVSj/E9jcp6KT6yDM7p8sLT1+Yat1mEpz3zJyNvQ3EVT58XIY2bzSD+jpJ
         amuLtSrIZjNTfcoWAgOsZmyMcv+GAkSsh5MdHe3DXIbCGDg6kkk/XHwV7L02jAIek+TT
         HKEA==
X-Forwarded-Encrypted: i=1; AHgh+RqNU4XUTzHX4N6JZnOrK6PmkvgQJRQvroelii0ROOtzJ5oHgX5r+MmG8Vs34gdicCPo+8gy/TOSSpp5@vger.kernel.org
X-Gm-Message-State: AOJu0YxHx6s2y8Sbflut/1jet/HgKoj0LYS3MruipSYT9g1o0CIIjlzg
	vChpo64QLYPzePtA43p3SglktdZ9DT6WWpW1AKPAE+WMBx+Thn2XcDFhAaNFHFPe6bbg113qBd3
	2TELL6eNZqPc0J28TR1Q+ILim/QQmOwf4cJ4q9JpVRN3864cl5Q9VUjsCzt4Fpj0T
X-Gm-Gg: AfdE7cmsvn1uI0+ZUf/GJq8zoIYa4NUL4Fv3giUZP1jKEoG+pRgWgRDgtBq5uwvvDCE
	dMLdvgrnXUdk1f2IZn8RpvmE3KjfwUakhPLgRDYqmUWMy2d/Jqn83bGa8gb6L0NdoIcUFvlKVmB
	9fEHR8Gem5ndauPYm3fldCJgPiHmmcJIctcaaey58/93iucP3XT0wo7O2AVQRDTJOqCalCMX+dS
	REnxe1N5wmk8PTSUPrb0R2X9aYDFMNI8zbnz9YNd4xWpTsyFy6t5DtidVOirZemwmhwmqxNatf+
	gBSro5+T1wKzPvAxA9pPPJTXsvCEtpyW4ZfzERK9PFPWAydhF6gj4yHWuY6W10yqP/lXmEozDK2
	YOJn84/fnIAob2fqRx434fg==
X-Received: by 2002:a05:6102:801d:b0:62f:34db:9474 with SMTP id ada2fe7eead31-7343619b129mr3535746137.20.1782486928658;
        Fri, 26 Jun 2026 08:15:28 -0700 (PDT)
X-Received: by 2002:a05:6102:801d:b0:62f:34db:9474 with SMTP id ada2fe7eead31-7343619b129mr3535736137.20.1782486927926;
        Fri, 26 Jun 2026 08:15:27 -0700 (PDT)
Received: from oss.qualcomm.com ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49269009163sm93882315e9.11.2026.06.26.08.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 08:15:27 -0700 (PDT)
Date: Fri, 26 Jun 2026 18:15:24 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add PCIe PHY and controller
 nodes
Message-ID: <toeqm5cizcnlevonbhpui6277fffqgnio3vjsfwjbl2v2pa4gh@63xby7l2zjzr>
References: <20260610-eliza_dt-v1-1-7bb72b75fc5b@oss.qualcomm.com>
 <rnwgxeuz6t6cpbcrmcggqtzsfjnur6kmkttgymp6cbglzjva5v@q4cyoq62p3yp>
 <a8a2c394-666c-4294-9eb1-911564a32fc7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8a2c394-666c-4294-9eb1-911564a32fc7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEyNiBTYWx0ZWRfX+/dcBSRBFKZC
 WZbPCS0kgHav7Um/Ozgrcm4rU9j40KK9FDzKNfGpRHPlyBBhs0Jw/2PozwUz5EG8LGH1GqFtLGo
 VepTZAlD7EK9CAqdng2xpZrCdtQXYbVgGefF6eyFXeFTU79Iqm+yWiMbYjhBbrto0rZWwr+quF5
 hsC3Y9yz4SPV1/K+sDgdO764kNG7wzpGqkn+8BeykDNwG2vKsxmNBKHwtWk2ibIqVxBOGRrnUVE
 /5LGT2SMvpK5aGiDkaB6JhA2be2pLd0oJ38c5RZI6T9BhNMQF3lh9QW/wx9dOyxZ1JfLJLMyyfU
 VEg5fG4TPgfc8TUt9YoYepIt/6NWkIsG6Es1F0A8gZC0Uzta84TwC6xaS6MamOZOG9dzopTsvPV
 W68d1X9ePkeZLGpYa1K0MBRAXhxWt+tQ+nsJW3nFK+Tv2A3rBiIFGiBSGNqRQPxfVUfd0E+kl9j
 NeIOeM3jCkq4gZjDjNw==
X-Proofpoint-ORIG-GUID: H_5BHtgnDn-ro5lKKv3acsxwDEBfMnrG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEyNiBTYWx0ZWRfX7n5GZS99w8Xa
 AW2A9VRKyWNzSxIAPLjZgqNGyyhgM85ouK+FE72+fM4VJqaeorVl7bUHHy3/MKjsOgkraFPTdj4
 ugpMgwouxz3poFiDPylMtGMLDBZvotc=
X-Proofpoint-GUID: H_5BHtgnDn-ro5lKKv3acsxwDEBfMnrG
X-Authority-Analysis: v=2.4 cv=MLpQXsZl c=1 sm=1 tr=0 ts=6a3e9791 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DRydhnnv5MIbgefyc0MA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260126

On 26-06-26 09:46:03, Krishna Chaitanya Chundru wrote:
> 
> 
> On 6/25/2026 3:42 PM, Abel Vesa wrote:
> > On 26-06-10 17:40:09, Krishna Chaitanya Chundru wrote:
> >> Eliza supports two PCIe instances: one 8GT/s x1 (PCIe0) and one 8GT/s x2
> >> (PCIe1). Add PCIe controller and PHY nodes for both instances, and update
> >> the GCC clock references to use the newly added PHY nodes instead of
> >> placeholder zeros.
> >>
> >> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> >> ---
> >> This patch depends on https://lore.kernel.org/all/20260608-eliza-v3-0-9bdeb7434b28@oss.qualcomm.com/
> >> ---
> >>  arch/arm64/boot/dts/qcom/eliza.dtsi | 359 +++++++++++++++++++++++++++++++++++-
> >>  1 file changed, 357 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
> >> index 7e97361a5dc5..2a51da62270d 100644
> >> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
> >> @@ -610,8 +610,8 @@ gcc: clock-controller@100000 {
> >>  
> >>  			clocks = <&bi_tcxo_div2>,
> >>  				 <&sleep_clk>,
> >> -				 <0>,
> >> -				 <0>,
> >> +				 <&pcie0_phy>,
> >> +				 <&pcie1_phy>,
> >>  				 <&ufs_mem_phy 0>,
> >>  				 <&ufs_mem_phy 1>,
> >>  				 <&ufs_mem_phy 2>,
> >> @@ -716,6 +716,361 @@ mmss_noc: interconnect@1780000 {
> >>  			#interconnect-cells = <2>;
> >>  		};
> >>  
> >> +		pcie0: pcie@1c00000 {
> >> +			device_type = "pci";
> >> +			compatible = "qcom,eliza-pcie", "qcom,pcie-sm8550";
> >> +			reg = <0 0x01c00000 0 0x3000>,
> >> +			      <0 0x40000000 0 0xf1d>,
> >> +			      <0 0x40000f20 0 0xa8>,
> >> +			      <0 0x40001000 0 0x1000>,
> >> +			      <0 0x40100000 0 0x100000>,
> >> +			      <0 0x01c03000 0 0x1000>;
> >> +			reg-names = "parf",
> >> +				    "dbi",
> >> +				    "elbi",
> >> +				    "atu",
> >> +				    "config",
> >> +				    "mhi";
> >> +			#address-cells = <3>;
> >> +			#size-cells = <2>;
> >> +			ranges = <0x01000000 0 0x00000000 0 0x40200000 0 0x100000>,
> >> +				 <0x02000000 0 0x40300000 0 0x40300000 0 0x3d00000>;
> >> +
> >> +			interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 537 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 540 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 653 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
> >> +			interrupt-names = "msi0",
> >> +					  "msi1",
> >> +					  "msi2",
> >> +					  "msi3",
> >> +					  "msi4",
> >> +					  "msi5",
> >> +					  "msi6",
> >> +					  "msi7",
> >> +					  "global";
> >> +
> >> +			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
> >> +				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
> >> +				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
> >> +				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
> >> +				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
> >> +				 <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
> >> +				 <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
> >> +				 <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
> >> +			clock-names = "aux",
> >> +				      "cfg",
> >> +				      "bus_master",
> >> +				      "bus_slave",
> >> +				      "slave_q2a",
> >> +				      "ddrss_sf_tbu",
> >> +				      "noc_aggr",
> >> +				      "cnoc_sf_axi";
> >> +
> >> +			resets = <&gcc GCC_PCIE_0_BCR>,
> >> +				 <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
> >> +			reset-names = "pci",
> >> +				      "link_down";
> >> +
> >> +			interconnects = <&pcie_noc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
> >> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> >> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> >> +					 &cnoc_main SLAVE_PCIE_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
> >> +			interconnect-names = "pcie-mem",
> >> +					     "cpu-pcie";
> >> +
> >> +			power-domains = <&gcc GCC_PCIE_0_GDSC>;
> >> +
> >> +			operating-points-v2 = <&pcie0_opp_table>;
> >> +
> >> +			iommu-map = <0 &apps_smmu 0x1480 0x1>,
> >> +				    <0x100 &apps_smmu 0x1481 0x1>;
> >> +
> >> +			interrupt-map = <0 0 0 1 &intc 0 0 0 564 IRQ_TYPE_LEVEL_HIGH>,
> >> +					<0 0 0 2 &intc 0 0 0 565 IRQ_TYPE_LEVEL_HIGH>,
> >> +					<0 0 0 3 &intc 0 0 0 566 IRQ_TYPE_LEVEL_HIGH>,
> >> +					<0 0 0 4 &intc 0 0 0 567 IRQ_TYPE_LEVEL_HIGH>;
> >> +			interrupt-map-mask = <0 0 0 0x7>;
> >> +			#interrupt-cells = <1>;
> >> +
> >> +			linux,pci-domain = <0>;
> >> +			num-lanes = <1>;
> >> +			bus-range = <0 0xff>;
> >> +
> >> +			dma-coherent;
> >> +
> > No pinctrl states?
> >
> >> +
> >> +		pcie1: pcie@1c08000 {
> >> +			device_type = "pci";
> >> +			compatible = "qcom,eliza-pcie", "qcom,pcie-sm8550";
> >> +			reg = <0 0x01c08000 0 0x3000>,
> >> +			      <0 0x44000000 0 0xf1d>,
> >> +			      <0 0x44000f20 0 0xa8>,
> >> +			      <0 0x44001000 0 0x1000>,
> >> +			      <0 0x44100000 0 0x100000>,
> >> +			      <0 0x01c0b000 0 0x1000>;
> >> +			reg-names = "parf",
> >> +				    "dbi",
> >> +				    "elbi",
> >> +				    "atu",
> >> +				    "config",
> >> +				    "mhi";
> >> +			#address-cells = <3>;
> >> +			#size-cells = <2>;
> >> +			ranges = <0x01000000 0 0x00000000 0 0x44200000 0 0x100000>,
> >> +				 <0x02000000 0 0x44300000 0 0x44300000 0 0x3d00000>;
> >> +
> >> +			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> >> +			interrupt-names = "msi0",
> >> +					  "msi1",
> >> +					  "msi2",
> >> +					  "msi3",
> >> +					  "msi4",
> >> +					  "msi5",
> >> +					  "msi6",
> >> +					  "msi7",
> >> +					  "global";
> >> +
> >> +			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
> >> +				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
> >> +				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
> >> +				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
> >> +				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
> >> +				 <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
> >> +				 <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
> >> +				 <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
> >> +			clock-names = "aux",
> >> +				      "cfg",
> >> +				      "bus_master",
> >> +				      "bus_slave",
> >> +				      "slave_q2a",
> >> +				      "ddrss_sf_tbu",
> >> +				      "noc_aggr",
> >> +				      "cnoc_sf_axi";
> >> +
> >> +			resets = <&gcc GCC_PCIE_1_BCR>,
> >> +				 <&gcc GCC_PCIE_1_LINK_DOWN_BCR>;
> >> +			reset-names = "pci",
> >> +				      "link_down";
> >> +
> >> +			interconnects = <&pcie_noc MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
> >> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> >> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> >> +					 &cnoc_main SLAVE_PCIE_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
> >> +			interconnect-names = "pcie-mem",
> >> +					     "cpu-pcie";
> >> +
> >> +			power-domains = <&gcc GCC_PCIE_1_GDSC>;
> >> +
> >> +			operating-points-v2 = <&pcie1_opp_table>;
> >> +
> >> +			iommu-map = <0 &apps_smmu 0x1400 0x1>,
> >> +				    <0x100 &apps_smmu 0x1401 0x1>;
> >> +
> >> +			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
> >> +					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
> >> +					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
> >> +					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
> >> +			interrupt-map-mask = <0 0 0 0x7>;
> >> +			#interrupt-cells = <1>;
> >> +
> >> +			linux,pci-domain = <1>;
> >> +			num-lanes = <2>;
> >> +			bus-range = <0 0xff>;
> >> +
> >> +			dma-coherent;
> > No pinctrl states?
> As we are adding perst & wake gpio's in board specific file, it is better to
> add the pincntrl also
> there only.

I'll let Bjorn and Konrad reply, but most of the sm8*50.dtsi have
them. Though some of the newer platforms moved them in the board dts.
