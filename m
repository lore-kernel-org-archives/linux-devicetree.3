Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AA933557D
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 04:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789879861; cv=none; b=E8WqmLxhWmQx+xkefCrbpEiNI1bDeOU2VocqzPXJsKFFYHZJ/BZ+uafenKRRqCDdGDmddidZQhNcqGE5SebIiX85LfXMGRR+j0xmGaCC1p3pTwuwK45jfuD/mlqbdOGbooJjhGzrl5mDyRBBt0cl9HN5lXtTwY0Xi5S5nBeL/xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789879861; c=relaxed/simple;
	bh=uX2rty1SWxMORGgldgYzns9KGT5JHl48c69XGGwBtbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E7upWUJzk/mXfHR+a5nWHXgjaRrU7nGDqbMCZiE44eZCHkog0SXz2q2n9AsYXa8khVyDbayM7QicL/lIsZi59eDulHe213jQwzd5fUf74GFw59faYmvYIcNpKyy+i/KIqStWrBHvL8IWPNcbXXDn0Tzxo2sSPUdzdx13T8tPrZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o8czKT3S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LY+344hT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o8czKT3S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LY+344hT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K1mSxl431974
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 04:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/Jqtxw1u5HbOVkIJ3+H/45I2
	xGGsAsB0Rio8YvSqcOA=; b=o8czKT3SrCpavWK+igNw88xF2Agpe0oSpALZcUm+
	JJ7UOsgESfHY1Gx/ZbGvcQdOe39xRBpIYWtXf+XwS8sflfbWknG1wMleXkCHRmx0
	/tWocKhg0bgVqE5Wjioba+JLaCpcrKzmhZ0SttU7/A4y+muI7c/SI3PYcnL6IBso
	/vk7BX3wP05BLgnnhNEABGRZDZ4nMcPcG/hLqWyUYLBUZp52HHn2xhPaKi3MzJDS
	lxRAv0YUg9w9zElmJEzFNxGZ5Z7C7GiZYyG18dsd/MmhRKNG9naMIYBeiVev0snw
	VWYj/4u1Kf2tQ79lBgNGrr9AY+4W+qkJ9t58hJuE04mg8Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs826dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 04:50:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso1498156a12.0
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 21:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789879858; x=1790484658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Jqtxw1u5HbOVkIJ3+H/45I2xGGsAsB0Rio8YvSqcOA=;
        b=LY+344hT+ml51yJU5OOcl6RbLhh5s8dDfhK/5nSckbAm/4BhN5s+kY/PNCu//OqpJE
         eFDtyCauxVvz1T/r/1IdVrcxqpTi6z6AauJpYxiKDa3LR2gY26Dr8t/3sgVsHXk+a4gd
         yHrTWU+NPyz1Mx+8oFgweMtG3FbbCJa1gTnBgNNFA/662WyzsFSd7LHBbsyt8XRa2H8h
         Hyxpd9QQGwpq17B/jTKsXYZHeg5W/Yss7wCmGb8ectNjKuuiCj7/B1nz4CqMdWdIQaic
         oJN/tacA0PQ58O6l7xJ0IQvCgfeGqdRrDynB87pID49sB8rM1GAuZ6fDX5oxTsd9RCr1
         8qSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789879858; x=1790484658;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Jqtxw1u5HbOVkIJ3+H/45I2xGGsAsB0Rio8YvSqcOA=;
        b=qLE9/aHPHqEnd1tbqT9J6C07+DyGw/en4enGWsOY37inMGvc09mlQ9N3zhsqoagfjt
         nT5nbARyy90K4hkxxnSsvDpUl2cPxcEDRrUd18YPXoWTKOI3Cnc7ld5VEIuAHnqvZCCu
         mKIanUJWi+MDb2p4hcBr8vGVvAsc64RsRUW4kH4MU005fW+CqnJ8itM09Tyl1B0KxsQ8
         KhpooGzhBFm0SZsV6zdQq7LKnVmtTWipEvltIAZsdXRz1li0TUOIgbtbsvONfioBgqRe
         ebtbATEE5irAKsbswH7l5WA7BZbI7ziQHve+nX6GArh4PvzcMjQy0hS193xp8Orm5wwA
         Phuw==
X-Forwarded-Encrypted: i=1; AKwUvBw3jg7d4j++ioREMeJAC4JMwrncdTIoUg7xbhj8VADWwyeuAcaNQiPkTo0UnD2MxMOrtFQZVBUJCbyC@vger.kernel.org
X-Gm-Message-State: AFuF++k13eNr3MSXao/3AricbSbHjPFxIC4jIqIRZ7hY1TD8G4izGE32
	QlSirCVzgOWRCOg8/ET51y4a0LZgnqozOEBjcBMbv3dMVeyie90m+gBmL+yVLIvYfyhwfTZTApR
	EV/JaU4/SvxwZd3OM6yCQTrcyl0Fxe/jZNHwUCsVihjDSzxgBNTsa4b5Zpp7YrEME
X-Gm-Gg: AYBFou0gntB2ImplVwqDzWr689FN5dSKZ1hmYmsD5JMbm/noDzg7fNAFAlIHIQYOGDB
	i23HFRcCYpQw6JiKcZh2ntXLEWMv0eYtB8HFQL7xO+NVZY3jB4Em6S6EdhAbahcgNEHH0ZTIIqt
	GARtuLZq707lrvg1igZn86nvOmKc9mf5B8ceqkUXmDWzgYbgF1JjlgIwP+5dqqx+namJqi/7MFW
	NQbjIl0nYF7ziRLqIcMesNpiSncDBpHkyFcFXPWbROno6i+glBZgsFL4fzJTqr3Njcz6KnlbpY4
	FYruLl77cE7+FxPx61rKpm6FT7KUBhXseKOmQCN7sbSxKXGdEEnAhYQ82vFkrpQYEBCAf59X0qW
	OPT6vpep2rv317egDk8s9xYovSbSkDKV0CVyoi2pyxbk=
X-Received: by 2002:a17:902:d2cc:b0:2dd:ad73:c982 with SMTP id d9443c01a7336-2ddb1ba0faamr110279135ad.26.1789879857744;
        Sat, 19 Sep 2026 21:50:57 -0700 (PDT)
X-Received: by 2002:a17:902:d2cc:b0:2dd:ad73:c982 with SMTP id d9443c01a7336-2ddb1ba0faamr110278855ad.26.1789879857302;
        Sat, 19 Sep 2026 21:50:57 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e3f17288dsm3479740eec.29.2026.09.19.21.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:50:56 -0700 (PDT)
Date: Sun, 20 Sep 2026 12:50:51 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: nord: Add support for ADSP and
 CDSPs
Message-ID: <aq9mK6VpRB75x5FW@QCOM-aGQu4IUr3Y>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
 <20260904081619.593602-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904081619.593602-2-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Rgus3Yox9H3U7YHX_NGZRRFgye_PjHDG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDA2NiBTYWx0ZWRfX2hLx9NQJcaQj
 5I+szY/uKP9BBauP4zBwVXN/EeRK1lG5NFpUt4IGJUxkE/OTLWsDzUY1QstET1FbzbPMX2K8G52
 5fzDoEig3ajXSP+O/ql0ysOsBViPeqs=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6aaf6632 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=TtsBWXHFPUpw1A1ZD-MA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDA2NiBTYWx0ZWRfX78l3vwcNlcYI
 610dRSy2zeQeNRfxcweAjc3oZBp36SnwOgF2dZTHtXE6a9aCtLiwLrHNmMbxsSaOR/muUCs6gn/
 dlYAG+lKMUWTz2za6Id9EvvPpq2t/y6Gn4JcX4LyFjhem8HAcdoBA1XwEJLy1ATkxSL15YDgKJc
 oZadItMnkzHN3mY+t7+hGh+3tpf0uQv5flkf+1ZFH+Y+Aop1k+JFB6y4S1vCUiYVIEWWrHvMRWn
 VB0saOCJ0p6LWxIbXqKKMhTg9/UKa46DMq2xE+fsQiLxdvEunGyGcvzsA1Iw5R85Gv9LV2VJokQ
 lu6ueg/2cpQdgj+Z6hq/KEFFGTKSpg+wF1Sc+vFXDq5uOC+ws2TtGn82mPWs+f0PvS1+7qTPnTK
 zXSfSFIx3VSC9RbayNlq5xTv559aNYV3pcTkBS+cg40+iMlPnlPcWEH39PTkJROihrq2moV89iK
 j7b2ckLaabYWCPxY99Q==
X-Proofpoint-GUID: Rgus3Yox9H3U7YHX_NGZRRFgye_PjHDG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200066

On Fri, Sep 04, 2026 at 04:16:14PM +0800, Shawn Guo wrote:
> Add device tree nodes to support ADSP (HPASS DSP) and CDSPs remoteproc
> on Nord SoC.
> 
> This includes:
> - SMEM memory reservation used by the inter-processor communication
>   infrastructure
> - IPCC mailbox controller for inter-processor signalling
> - AOSS QMP node for load state power management
> - SMP2P nodes providing stop control and fault/crash interrupt signals
> - Remoteproc nodes with a GLINK edge and FastRPC compute contexts for
>   userspace offload
> 
> The embedded variant specific power domains, XO clock, and interconnect
> paths are filled in nord-embedded.dtsi.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi |  63 ++
>  arch/arm64/boot/dts/qcom/nord-ipcc.h        | 144 ++++
>  arch/arm64/boot/dts/qcom/nord.dtsi          | 884 ++++++++++++++++++++
>  3 files changed, 1091 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/nord-ipcc.h

[...]

> @@ -1518,6 +1639,103 @@ tcsr: syscon@1f60000 {
>  			reg = <0x0 0x01f60000 0x0 0xa0000>;
>  		};
>  
> +		remoteproc_adsp: remoteproc@4c00000 {
> +			compatible = "qcom,nord-adsp-pas";
> +			reg = <0x0 0x04c00000 0x0 0x10000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 159 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 7 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog",
> +					  "fatal",
> +					  "ready",
> +					  "handover",
> +					  "stop-ack",
> +					  "shutdown-ack";
> +
> +			memory-region = <&hpass_dsp0_mem>,
> +					<&hpass_dsp0_dtb_mem>;
> +
> +			qcom,qmp = <&aoss_qmp>;
> +
> +			qcom,smem-states = <&smp2p_adsp_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			status = "disabled";
> +
> +			glink-edge {
> +				interrupts-extended = <&ipcc0 IPCC_MPROC_ADSP0
> +							      IPCC_MPROC_SIGNAL_GLINK_QMP
> +							      IRQ_TYPE_EDGE_RISING>;
> +				mboxes = <&ipcc0 IPCC_MPROC_ADSP0
> +						 IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +				qcom,remote-pid = <2>;
> +				label = "adsp";
> +
> +				fastrpc {
> +					compatible = "qcom,nord-fastrpc",
> +						     "qcom,kaanapali-fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "adsp";

With commit 9981fbe599e8 ("misc: fastrpc: Allocate entire reserved memory
for Audio PD in probe") landed in linux-next, we are getting repeated
error messages.

  qcom,fastrpc-cb 4c00000.remoteproc:glink-edge:fastrpc:compute-cb@6: remote heap memory region is not added

Adding memory-region fixes the problem.

  memory-region = <&hpass_rpc_remote_heap_mem>;

Will send v3 for that.

Shawn

> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@3 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <3>;
> +						iommus = <&apps_smmu_0 0x09e3 0x0000>,
> +							 <&apps_smmu_0 0x0a43 0x0020>,
> +							 <&apps_smmu_0 0x0a63 0x0020>,
> +							 <&apps_smmu_0 0x0a83 0x0000>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@4 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <4>;
> +						iommus = <&apps_smmu_0 0x09e4 0x0000>,
> +							 <&apps_smmu_0 0x0a44 0x0020>,
> +							 <&apps_smmu_0 0x0a64 0x0020>,
> +							 <&apps_smmu_0 0x0a84 0x0000>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@5 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <5>;
> +						iommus = <&apps_smmu_0 0x09e5 0x0000>,
> +							 <&apps_smmu_0 0x0a45 0x0020>,
> +							 <&apps_smmu_0 0x0a65 0x0020>,
> +							 <&apps_smmu_0 0x0a85 0x0000>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@6 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <6>;
> +						iommus = <&apps_smmu_0 0x09e6 0x0000>,
> +							 <&apps_smmu_0 0x0a46 0x0020>,
> +							 <&apps_smmu_0 0x0a66 0x0020>,
> +							 <&apps_smmu_0 0x0a86 0x0000>;
> +						dma-coherent;
> +					};
> +				};
> +			};
> +		};
