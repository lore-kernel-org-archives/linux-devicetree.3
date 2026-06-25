Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AF038655C
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 10:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782382380; cv=none; b=SpdDEHJQ6lF8LhsaF0B5pNEx1iY9NVFegP7Fl/7eUShr67GLsmXuQViAXtvmF6eXxsHsv/P9gkMdeuqcFWhWFjwKkZZlpdc+deNipvzRi0UNWcloiIhUro+CL0FN/eqyC0Ds55tB5rTN7VBkU0we9QLkuxiC4GtxmFz1BybsCaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782382380; c=relaxed/simple;
	bh=rC7OzT/7r6sK2n+kqX4bThpbDF6h0wHDsAiAxEuyj7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFDV8JPmQhQnKwGxcTPXaR8DG7v84skBc3cJaLlha4uJ1d+fQJ61flEiDKlj2ltP2HpMZgai6p7M1X3vlyZTgsqDP0e0/mn2z4CedwF9wcHthEFZL/JmoFVV1d0CaloIQFBp3GlhcNta+/TxAeqHRPZksVn0vibVmgo4vLgIPHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oz7nSyi4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ArcQTXFj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oz7nSyi4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ArcQTXFj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jtoV1470352
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 10:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UvuIOkwqpIZZcGAEaJzrEqnY
	WDJf24TnV8rXfR0nsSQ=; b=Oz7nSyi44+/br19nE0til3uNXHjsUb3OPCi7C97e
	FYzAP+QcuWpQM0cp2eC99/HhrQd7ChEVoMqtF56VT15cY2IHOVSqermOOcqOBZtV
	855iA1QGP0H+Y61OmgxQaWHPr5h/tMD81m7vMvKjwabhS2GkjqyY7r1ybbhMDhj0
	SwT8RMkq6KOaYIpQT8zchhi2u7ARtDMu2qqi0CH1v9QntDgr49XCvtP9g+R73Zla
	v4rVE3Z1rff6PCNKlZkpd/wXpqG9Aq1jfj7rrN+ghHwDi1WXIleHM4JbT6bZrTVj
	Fc4spVGa3XejkbMdIuvnGGezZyBwz9tH3dARAaim2LfNfg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0nv7jtwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 10:12:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9157f1be083so273792685a.3
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 03:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782382377; x=1782987177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UvuIOkwqpIZZcGAEaJzrEqnYWDJf24TnV8rXfR0nsSQ=;
        b=ArcQTXFjsFRxJZ7LnUysVWbq2O1tKFPAzj7+eVdXVxdSskJwqAvb8T6xpkFMvL6dqC
         +FLBptWkYQwCq+8PXCmWUxKlUa+SQiUkkyDJ/3/nqI1A0jKej3gUA3qp7f6FqW9H+16t
         EbhJ9XFCJXWSmHQ38VBT2AymlMLNhp47LBUNU9iFGJLgvFLFcJm7uzG+BzC51JgPbqV/
         Byw314subB3PMIPsOr+Tef8/Piw6mfwMpnkEGnJnXc0YmyXasyS0jW6TFP5e4Us9GExN
         LfrrqqeGqMwbq54jzMH42YS/rWaNj/Bvv+PAC4stThQFSs4tXZflG+yBcYNSs7qOJwTG
         8vZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782382377; x=1782987177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UvuIOkwqpIZZcGAEaJzrEqnYWDJf24TnV8rXfR0nsSQ=;
        b=a2cjTfLJqRERGHmcXvD5o/Jonu7fkndHqpnhLgrCYJnK2tn9ajCbpkWmvMvy0lEE3O
         YTL5IqWo2btKwORvfFORuWxXgCbrX26XZMGc+qeyIZwBLb+O9Wi29JlhN+puGmEsOKNb
         dJuqrnjPtrTGd8tgBk4SuI31zF16EjDEljY2Q8aqiPKvSGiWCn5qtB38LDGKV2DrmFiF
         7X+iEiCyjbo6ftJA7nZ4kQg1xxtMnF0J+xrxx5mIO2lAaH0So3vNTRbrSJmO06xjVWn8
         v67b9aNRugWxdzMflKTh7w/7zlb9znu9pTL94BLs3ksoCaaPQTgFzVSlcWzxz38DBBXW
         TvWw==
X-Forwarded-Encrypted: i=1; AFNElJ+QJy+7M5YWwFd3oCWz/DHw9opPvhpGB3jU0p4WHCOAT1N6Fs9kuX4gcVxQ19h9axxDrX/BgKq3QvjX@vger.kernel.org
X-Gm-Message-State: AOJu0YywMhku0gMr0wDFXAXSPzxX12EFeS83pcIYkVc/g3mTnqbTx0cB
	nOKy6P3P8rojj8rl8b4dXbKBGJdTYMMSQvKXqZjpF63UKrgtmJBnC5BGMWkBm/KMEWEX+kw518A
	fai++mcJ2QM/uVnaLjcojRT6A5byRdhDPRhYxC/o5BIhFvM9LbL836ZuDwzzc4r35
X-Gm-Gg: AfdE7cn4olOmbcEP2nIoB7KE0Uz16Sn2ty+IznHfvvhJeW1m5k6TJi1GYz7SVXPkDmn
	wxI+I2ZZB9zO7lHR+Oh0Ik3NqvxbdCQxbhytO6cpQgc+WywywLKuj9tEQngSzBL8AFqomFqE90u
	EqggfGW6Fng1yg8Bhbc2fKCWWXQIq5rcT633cR2dtMua+4CYG166lCqx62RqwXa4SCC9So9oayp
	UDHaE/DPU4S7vTwG6NqUKwK2epw9I3pA8gRFF8NuPfBQ7KEmOIA7FyaraBoca2x+dF90bjLeC29
	mBaERhzIgT3EAxHNo6FMnM+FT+1Sxc23VQUmN4H93iKH2LRyeHAJpPNqfgLOZ9DWg2obqA6L8oO
	S5zJD42BAmXSPKeYbrcQ64A==
X-Received: by 2002:a05:620a:4409:b0:920:946c:45eb with SMTP id af79cd13be357-9293b474a63mr236589785a.3.1782382377263;
        Thu, 25 Jun 2026 03:12:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4409:b0:920:946c:45eb with SMTP id af79cd13be357-9293b474a63mr236583785a.3.1782382376630;
        Thu, 25 Jun 2026 03:12:56 -0700 (PDT)
Received: from oss.qualcomm.com ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01d51sm12028149f8f.15.2026.06.25.03.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:12:55 -0700 (PDT)
Date: Thu, 25 Jun 2026 13:12:53 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add PCIe PHY and controller
 nodes
Message-ID: <rnwgxeuz6t6cpbcrmcggqtzsfjnur6kmkttgymp6cbglzjva5v@q4cyoq62p3yp>
References: <20260610-eliza_dt-v1-1-7bb72b75fc5b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-eliza_dt-v1-1-7bb72b75fc5b@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA4NyBTYWx0ZWRfXwoXaLPMcGxR1
 bYWWJvoUjF7thBn9ojLAtJ4CbhJsDP8kgbEH0ZN3Yfvk68hRB1Ow2clIWRxr1IF6LJBcQmC826V
 JYP3+RzYGrhzgCqtKh16LCovpZtwoNo=
X-Authority-Analysis: v=2.4 cv=RJiD2Yi+ c=1 sm=1 tr=0 ts=6a3cff2a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zf5SUlF_nZDS2Cpi-W4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: nnOiixl26fRzxJuoNs1f-H-ke3s35Y_z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA4NyBTYWx0ZWRfXw4FErw0gunTK
 yQa6uQCkpEgS0sE+CJtavEzvbfi94LrKyLZvQNrS9SWUg9f4IkgnJoy/quAHu9kk+FY0fXg+FC6
 /ScEp2HGOCua/VX4oaUiiPDjGwlQZVmjqQ2nsrvBg9ve3NNMmZ+R5H7H4wkE4sX8yTFonjYXWGF
 wlTFqwIZXGVJRfBDzbfoeDpLA1ztTG4fvt7Y+7YxUXLFs1LIzqiEyOoLPPiMP4Q0zGisAZiKdU7
 ioRBDRj0VtA7ybjE+swfDpsDnEEFd1LXMj+S/Gw8FaHjSHCxbxkhGdNYFdu307qhSRR4IClE68f
 M7RFKa6HE4e3Co1Pv+SDcPsUJMNXtimHpkwpuGmocaKtIg8cgNcW8KpVa/tC6oiU2o6M0qEVO1M
 m1pkqdJcHzy1v5LzHUrhGa/Qn7yStli+kus+/9jg3ADYCtcc1dpppePX29fx7u1O5lcfZ9Qll+b
 U1uRBgIAQm2+pyZ6r0A==
X-Proofpoint-GUID: nnOiixl26fRzxJuoNs1f-H-ke3s35Y_z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250087

On 26-06-10 17:40:09, Krishna Chaitanya Chundru wrote:
> Eliza supports two PCIe instances: one 8GT/s x1 (PCIe0) and one 8GT/s x2
> (PCIe1). Add PCIe controller and PHY nodes for both instances, and update
> the GCC clock references to use the newly added PHY nodes instead of
> placeholder zeros.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
> This patch depends on https://lore.kernel.org/all/20260608-eliza-v3-0-9bdeb7434b28@oss.qualcomm.com/
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 359 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 357 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
> index 7e97361a5dc5..2a51da62270d 100644
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
> @@ -610,8 +610,8 @@ gcc: clock-controller@100000 {
>  
>  			clocks = <&bi_tcxo_div2>,
>  				 <&sleep_clk>,
> -				 <0>,
> -				 <0>,
> +				 <&pcie0_phy>,
> +				 <&pcie1_phy>,
>  				 <&ufs_mem_phy 0>,
>  				 <&ufs_mem_phy 1>,
>  				 <&ufs_mem_phy 2>,
> @@ -716,6 +716,361 @@ mmss_noc: interconnect@1780000 {
>  			#interconnect-cells = <2>;
>  		};
>  
> +		pcie0: pcie@1c00000 {
> +			device_type = "pci";
> +			compatible = "qcom,eliza-pcie", "qcom,pcie-sm8550";
> +			reg = <0 0x01c00000 0 0x3000>,
> +			      <0 0x40000000 0 0xf1d>,
> +			      <0 0x40000f20 0 0xa8>,
> +			      <0 0x40001000 0 0x1000>,
> +			      <0 0x40100000 0 0x100000>,
> +			      <0 0x01c03000 0 0x1000>;
> +			reg-names = "parf",
> +				    "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "config",
> +				    "mhi";
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			ranges = <0x01000000 0 0x00000000 0 0x40200000 0 0x100000>,
> +				 <0x02000000 0 0x40300000 0 0x40300000 0 0x3d00000>;
> +
> +			interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 537 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 540 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 653 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "msi0",
> +					  "msi1",
> +					  "msi2",
> +					  "msi3",
> +					  "msi4",
> +					  "msi5",
> +					  "msi6",
> +					  "msi7",
> +					  "global";
> +
> +			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
> +				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
> +				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
> +				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
> +				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
> +				 <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
> +				 <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
> +				 <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
> +			clock-names = "aux",
> +				      "cfg",
> +				      "bus_master",
> +				      "bus_slave",
> +				      "slave_q2a",
> +				      "ddrss_sf_tbu",
> +				      "noc_aggr",
> +				      "cnoc_sf_axi";
> +
> +			resets = <&gcc GCC_PCIE_0_BCR>,
> +				 <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
> +			reset-names = "pci",
> +				      "link_down";
> +
> +			interconnects = <&pcie_noc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &cnoc_main SLAVE_PCIE_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "pcie-mem",
> +					     "cpu-pcie";
> +
> +			power-domains = <&gcc GCC_PCIE_0_GDSC>;
> +
> +			operating-points-v2 = <&pcie0_opp_table>;
> +
> +			iommu-map = <0 &apps_smmu 0x1480 0x1>,
> +				    <0x100 &apps_smmu 0x1481 0x1>;
> +
> +			interrupt-map = <0 0 0 1 &intc 0 0 0 564 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &intc 0 0 0 565 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &intc 0 0 0 566 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &intc 0 0 0 567 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-map-mask = <0 0 0 0x7>;
> +			#interrupt-cells = <1>;
> +
> +			linux,pci-domain = <0>;
> +			num-lanes = <1>;
> +			bus-range = <0 0xff>;
> +
> +			dma-coherent;
> +

No pinctrl states?

> +
> +		pcie1: pcie@1c08000 {
> +			device_type = "pci";
> +			compatible = "qcom,eliza-pcie", "qcom,pcie-sm8550";
> +			reg = <0 0x01c08000 0 0x3000>,
> +			      <0 0x44000000 0 0xf1d>,
> +			      <0 0x44000f20 0 0xa8>,
> +			      <0 0x44001000 0 0x1000>,
> +			      <0 0x44100000 0 0x100000>,
> +			      <0 0x01c0b000 0 0x1000>;
> +			reg-names = "parf",
> +				    "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "config",
> +				    "mhi";
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			ranges = <0x01000000 0 0x00000000 0 0x44200000 0 0x100000>,
> +				 <0x02000000 0 0x44300000 0 0x44300000 0 0x3d00000>;
> +
> +			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "msi0",
> +					  "msi1",
> +					  "msi2",
> +					  "msi3",
> +					  "msi4",
> +					  "msi5",
> +					  "msi6",
> +					  "msi7",
> +					  "global";
> +
> +			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
> +				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
> +				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
> +				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
> +				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
> +				 <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
> +				 <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
> +				 <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
> +			clock-names = "aux",
> +				      "cfg",
> +				      "bus_master",
> +				      "bus_slave",
> +				      "slave_q2a",
> +				      "ddrss_sf_tbu",
> +				      "noc_aggr",
> +				      "cnoc_sf_axi";
> +
> +			resets = <&gcc GCC_PCIE_1_BCR>,
> +				 <&gcc GCC_PCIE_1_LINK_DOWN_BCR>;
> +			reset-names = "pci",
> +				      "link_down";
> +
> +			interconnects = <&pcie_noc MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &cnoc_main SLAVE_PCIE_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "pcie-mem",
> +					     "cpu-pcie";
> +
> +			power-domains = <&gcc GCC_PCIE_1_GDSC>;
> +
> +			operating-points-v2 = <&pcie1_opp_table>;
> +
> +			iommu-map = <0 &apps_smmu 0x1400 0x1>,
> +				    <0x100 &apps_smmu 0x1401 0x1>;
> +
> +			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-map-mask = <0 0 0 0x7>;
> +			#interrupt-cells = <1>;
> +
> +			linux,pci-domain = <1>;
> +			num-lanes = <2>;
> +			bus-range = <0 0xff>;
> +
> +			dma-coherent;

No pinctrl states?
