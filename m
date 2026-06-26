Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA72A1A9FBD
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 04:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782447374; cv=none; b=MEpn3VmbjSy1qikRQB0yBwez4BS1lU1xNh18f4CWaptXT4eAat4rdxbGNENG4g426UKcIbYsohfGZMPK3AmBfYwPN2D2qsgbvGsw0uYDeUINE8ggP94KV/3nP10lCjKd1ynsWQ0QboVijQ4iLYcgidOAmx9Vp/n49Vvwlym8oW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782447374; c=relaxed/simple;
	bh=OQD90EC7EDD38ZCfttN2/3l4QfewgOuFoCIfNBhcrY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S5Jkzot934vrPmlzM8YB1MWk+IPuz8085kLt3cpRO2ozSQKQXPtibOQdbWoubScmPujLGlcIIz7rpztaonwGsQbee+ch41OQx08nNIIqRMErnf9uN5IIGW5225KQ45OXg+jjPak1RhhcbADrLZk6nqbOhjz/uhS5fY4LrxeampI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F34UUDRq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XPTXAmDG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F34UUDRq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XPTXAmDG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2idUb076391
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 04:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FMmwNrakZAtbh+fQgTSdnTVL0aJTHyvxqYcj7OIP4/4=; b=F34UUDRqDwqUfW93
	paaaOwdBKdlAv6eQ/8g1FnjCc4yj/EDGNofKTa620Qc8eG6W3VAUjL3XRnh1F6dJ
	OTTFFIh5NprBayp9j0WgkDcksr1fKGzqsorrG5/adM0ZvBLS8roppkBDnStJ7Xvm
	5wBkqxtmUE9YSa0rUT0wMa72fhOSJciDh7BVQSH02gEsXNGONyv4Gh4YBkuU4AkG
	3uAkEzOk+hBNvHCENDqoFByzprElpMFNNU4Ef1O5REpz1/LDzWtFPZxs4wZYx+do
	hAqYOdDjwzRdTlrdypIMb2drLhrdZqkzczUUWzB4W3FxIUWNHyJ8NYIRqKcvc5pq
	qaIlxg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1eew8t5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 04:16:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bccca5620so815933eec.1
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 21:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782447370; x=1783052170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FMmwNrakZAtbh+fQgTSdnTVL0aJTHyvxqYcj7OIP4/4=;
        b=XPTXAmDGR5+nkDUpKBFMnU44tj5QIeL7052JLDqLoLVALQW71pkni82mpMbGwmhg+S
         d+GHX+p7lcrRmcOmaikSLaoiMYuwxymujg+jViAdSycVxOb42dzl0e7hyMloWM2b38GE
         01Eo+J1vqVzIFFrNo/sYFXNypTamW95ot/M/cxwhBL/75TcHLT6/73MpMuNTEdRJNHe6
         LsgwteClfQuGvKpbaYTt6rnaOwuaTazCa4gjPHsC2qu90wzTgCPgcAWQc3oTViDLiwwR
         8SK2tsHp6pz6ci7VoqApoQVOqtMW8E4aLhjyWYURG4CPXLySNn9dxRe5Kj79FC7OxCBL
         KN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782447370; x=1783052170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FMmwNrakZAtbh+fQgTSdnTVL0aJTHyvxqYcj7OIP4/4=;
        b=hxuEtIaYrriCZauVAq5mPdy2ABfxuwc5ZiLgNELKL7OLRRzX9+WO/E8HWV0jx0r1wP
         oiD4DX7I0C/RGKkP16UMa7l/wXXH6j2K9mLaLPGLCTQrINk0KhPKwBd0BCVhhTMsMhlU
         rsAG9gOv/cXHuiXktHOaSYhaGRakVq4t+3L8XMbLpM9aUpo6FR5IfpnhNr2FJORABp9L
         7VPoRj3npPbaYHPWzrg2h9nD9dGug4bUUGfzyr0UzNskXZ1Of8PH1gi8PnzbtiyktnFS
         o2JBzNqApgkUJMxPR3RaXZjgCKyyanVbTsUJtE0lgr0iIG4iVYib4iCDX9xrcZH9NibC
         Cpuw==
X-Forwarded-Encrypted: i=1; AHgh+RoSRC0Ivhk02H/uVqfuwHFG8JxYoDrqxTP8WVc+AHMNb9UqOdi04sPPf2QOmV8DXinq7rVXqLEcU4eL@vger.kernel.org
X-Gm-Message-State: AOJu0YwNz3ykMO0QcBjYrzyOO6cIkraF3Z1fZeZeTzpv3nhToG5qka6f
	Cukpg+GFeWSkt4RtZEIX96dL9SjfEOo2QeiVTjrgAaK/ZyKMxO/FWuEK28o3J+Ej+fAV9vZVOYu
	1zuiimwCAuZ9ZTb/Kif8MJ3RCCQLcDqzrOLl9CCV1dic/yzQ0HecoMO/KeJHSX3K5
X-Gm-Gg: AfdE7clS8Bd8ecI5MlEMvx3wh4v6uKYOFL1bxyTP+dUO3S6C8NH1KK8FWGdmSdKGF6u
	IgHnL8JbA5WlfLwwXJaXw2OwuZB88xguFdf1DOh6YFCpuFpQj1DlT/fZDaA3QYmubmqvhpktlFy
	JqryFVqubhQr2HtPntmpGqT+ePHLrQrHJw1EIlDz5LTpzNXSaasehnattc9i7J35+Ev5E5Eb+ij
	P7GTW9PYYC+1A9zHVm2kYrA3YpR+fO4LObFIE8S74OgaIi91ZeIggRA6GmIVNnXNqtgUCDMYXj7
	/23Ox79bGnEeRZnAIr3eDugYdkKNkgEdEcRtCDaLJo78JnqCpAz8SJpPM4dCDAvWoRGvivIWr+5
	iowQn89XMmlIuA09BPOvM1/PK2mZ54gibxmbJwde4Pto=
X-Received: by 2002:a05:693c:88c7:20b0:30c:9f31:b619 with SMTP id 5a478bee46e88-30c9f31c303mr424896eec.12.1782447369599;
        Thu, 25 Jun 2026 21:16:09 -0700 (PDT)
X-Received: by 2002:a05:693c:88c7:20b0:30c:9f31:b619 with SMTP id 5a478bee46e88-30c9f31c303mr424875eec.12.1782447369035;
        Thu, 25 Jun 2026 21:16:09 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4c691dsm13065050eec.5.2026.06.25.21.16.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 21:16:08 -0700 (PDT)
Message-ID: <a8a2c394-666c-4294-9eb1-911564a32fc7@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 09:46:03 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add PCIe PHY and controller
 nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260610-eliza_dt-v1-1-7bb72b75fc5b@oss.qualcomm.com>
 <rnwgxeuz6t6cpbcrmcggqtzsfjnur6kmkttgymp6cbglzjva5v@q4cyoq62p3yp>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <rnwgxeuz6t6cpbcrmcggqtzsfjnur6kmkttgymp6cbglzjva5v@q4cyoq62p3yp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDAzMCBTYWx0ZWRfX3A6lxNTqlyp9
 jeSjh9SBbQlCElLKEGhRLbpGSoQRLN5ijpCMVMLWOY2xIi0Mb9T571HktKSo+5RG7D4vVDARRGC
 wWfsziWDSLZcLgenk1ueMs+Yfv8aiA0=
X-Proofpoint-GUID: E6y2KsLRaaAmWmXxFak84cYVNXqFdjkb
X-Proofpoint-ORIG-GUID: E6y2KsLRaaAmWmXxFak84cYVNXqFdjkb
X-Authority-Analysis: v=2.4 cv=P7UKQCAu c=1 sm=1 tr=0 ts=6a3dfd0a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SQ51kRXigZCXnAXuiy8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDAzMCBTYWx0ZWRfXwBHt3TrqW/yU
 Cio8AodpSRHHa6hVff24mNRB3LxUyhXQyWjBi1tUsYRTGqMkWdE2MXs+QW5VZnQNCGm4uDrJMkK
 EZqCsUM7Ef89OkPFrC1OtPxVgzcXCd4FLAzjG+6AA/65JyYND51TpE6OAUGSf96AqaRFm0JUbSs
 T6AQ/0qjTGWAxVSxaOHvvn7AFNLIKp/uMmKGgSHHHEARPvO26XPGx9TXwH2TdowL3q7YfsBCroo
 Bvf2+iQPpsyZsBT7PcWAibjF5XvdXxbBvyCQLwiInPnoFdHdupiMKTX3Ril0WJmgTBAeZrAvbhf
 bQOg5DrUJeXVQWwLXPd3eldV/XQqVOxeXiJv6WsBqOXH1YoZsMSu9evkdIIGWfhD+BF5BEhKJyv
 YwwOwKf/Yg49S6LsK9TNLigGgbJLAZ8SvVPzjvILm+EJbQZf41T4fmVuvsrvHPRZu8zv7TLBsFd
 uTAQ8ohfdc8+w/3PtFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260030



On 6/25/2026 3:42 PM, Abel Vesa wrote:
> On 26-06-10 17:40:09, Krishna Chaitanya Chundru wrote:
>> Eliza supports two PCIe instances: one 8GT/s x1 (PCIe0) and one 8GT/s x2
>> (PCIe1). Add PCIe controller and PHY nodes for both instances, and update
>> the GCC clock references to use the newly added PHY nodes instead of
>> placeholder zeros.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>> This patch depends on https://lore.kernel.org/all/20260608-eliza-v3-0-9bdeb7434b28@oss.qualcomm.com/
>> ---
>>  arch/arm64/boot/dts/qcom/eliza.dtsi | 359 +++++++++++++++++++++++++++++++++++-
>>  1 file changed, 357 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
>> index 7e97361a5dc5..2a51da62270d 100644
>> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
>> @@ -610,8 +610,8 @@ gcc: clock-controller@100000 {
>>  
>>  			clocks = <&bi_tcxo_div2>,
>>  				 <&sleep_clk>,
>> -				 <0>,
>> -				 <0>,
>> +				 <&pcie0_phy>,
>> +				 <&pcie1_phy>,
>>  				 <&ufs_mem_phy 0>,
>>  				 <&ufs_mem_phy 1>,
>>  				 <&ufs_mem_phy 2>,
>> @@ -716,6 +716,361 @@ mmss_noc: interconnect@1780000 {
>>  			#interconnect-cells = <2>;
>>  		};
>>  
>> +		pcie0: pcie@1c00000 {
>> +			device_type = "pci";
>> +			compatible = "qcom,eliza-pcie", "qcom,pcie-sm8550";
>> +			reg = <0 0x01c00000 0 0x3000>,
>> +			      <0 0x40000000 0 0xf1d>,
>> +			      <0 0x40000f20 0 0xa8>,
>> +			      <0 0x40001000 0 0x1000>,
>> +			      <0 0x40100000 0 0x100000>,
>> +			      <0 0x01c03000 0 0x1000>;
>> +			reg-names = "parf",
>> +				    "dbi",
>> +				    "elbi",
>> +				    "atu",
>> +				    "config",
>> +				    "mhi";
>> +			#address-cells = <3>;
>> +			#size-cells = <2>;
>> +			ranges = <0x01000000 0 0x00000000 0 0x40200000 0 0x100000>,
>> +				 <0x02000000 0 0x40300000 0 0x40300000 0 0x3d00000>;
>> +
>> +			interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 537 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 540 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 653 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "msi0",
>> +					  "msi1",
>> +					  "msi2",
>> +					  "msi3",
>> +					  "msi4",
>> +					  "msi5",
>> +					  "msi6",
>> +					  "msi7",
>> +					  "global";
>> +
>> +			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
>> +				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
>> +				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
>> +				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
>> +				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
>> +				 <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
>> +				 <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
>> +				 <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
>> +			clock-names = "aux",
>> +				      "cfg",
>> +				      "bus_master",
>> +				      "bus_slave",
>> +				      "slave_q2a",
>> +				      "ddrss_sf_tbu",
>> +				      "noc_aggr",
>> +				      "cnoc_sf_axi";
>> +
>> +			resets = <&gcc GCC_PCIE_0_BCR>,
>> +				 <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
>> +			reset-names = "pci",
>> +				      "link_down";
>> +
>> +			interconnects = <&pcie_noc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +					 &cnoc_main SLAVE_PCIE_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
>> +			interconnect-names = "pcie-mem",
>> +					     "cpu-pcie";
>> +
>> +			power-domains = <&gcc GCC_PCIE_0_GDSC>;
>> +
>> +			operating-points-v2 = <&pcie0_opp_table>;
>> +
>> +			iommu-map = <0 &apps_smmu 0x1480 0x1>,
>> +				    <0x100 &apps_smmu 0x1481 0x1>;
>> +
>> +			interrupt-map = <0 0 0 1 &intc 0 0 0 564 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 2 &intc 0 0 0 565 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 3 &intc 0 0 0 566 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 4 &intc 0 0 0 567 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-map-mask = <0 0 0 0x7>;
>> +			#interrupt-cells = <1>;
>> +
>> +			linux,pci-domain = <0>;
>> +			num-lanes = <1>;
>> +			bus-range = <0 0xff>;
>> +
>> +			dma-coherent;
>> +
> No pinctrl states?
>
>> +
>> +		pcie1: pcie@1c08000 {
>> +			device_type = "pci";
>> +			compatible = "qcom,eliza-pcie", "qcom,pcie-sm8550";
>> +			reg = <0 0x01c08000 0 0x3000>,
>> +			      <0 0x44000000 0 0xf1d>,
>> +			      <0 0x44000f20 0 0xa8>,
>> +			      <0 0x44001000 0 0x1000>,
>> +			      <0 0x44100000 0 0x100000>,
>> +			      <0 0x01c0b000 0 0x1000>;
>> +			reg-names = "parf",
>> +				    "dbi",
>> +				    "elbi",
>> +				    "atu",
>> +				    "config",
>> +				    "mhi";
>> +			#address-cells = <3>;
>> +			#size-cells = <2>;
>> +			ranges = <0x01000000 0 0x00000000 0 0x44200000 0 0x100000>,
>> +				 <0x02000000 0 0x44300000 0 0x44300000 0 0x3d00000>;
>> +
>> +			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "msi0",
>> +					  "msi1",
>> +					  "msi2",
>> +					  "msi3",
>> +					  "msi4",
>> +					  "msi5",
>> +					  "msi6",
>> +					  "msi7",
>> +					  "global";
>> +
>> +			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
>> +				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
>> +				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
>> +				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
>> +				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
>> +				 <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
>> +				 <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
>> +				 <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
>> +			clock-names = "aux",
>> +				      "cfg",
>> +				      "bus_master",
>> +				      "bus_slave",
>> +				      "slave_q2a",
>> +				      "ddrss_sf_tbu",
>> +				      "noc_aggr",
>> +				      "cnoc_sf_axi";
>> +
>> +			resets = <&gcc GCC_PCIE_1_BCR>,
>> +				 <&gcc GCC_PCIE_1_LINK_DOWN_BCR>;
>> +			reset-names = "pci",
>> +				      "link_down";
>> +
>> +			interconnects = <&pcie_noc MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +					 &cnoc_main SLAVE_PCIE_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
>> +			interconnect-names = "pcie-mem",
>> +					     "cpu-pcie";
>> +
>> +			power-domains = <&gcc GCC_PCIE_1_GDSC>;
>> +
>> +			operating-points-v2 = <&pcie1_opp_table>;
>> +
>> +			iommu-map = <0 &apps_smmu 0x1400 0x1>,
>> +				    <0x100 &apps_smmu 0x1401 0x1>;
>> +
>> +			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-map-mask = <0 0 0 0x7>;
>> +			#interrupt-cells = <1>;
>> +
>> +			linux,pci-domain = <1>;
>> +			num-lanes = <2>;
>> +			bus-range = <0 0xff>;
>> +
>> +			dma-coherent;
> No pinctrl states?
As we are adding perst & wake gpio's in board specific file, it is better to
add the pincntrl also
there only.

- Krishna Chaitanya.
