Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA8F3DA5A0
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 19:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778268455; cv=none; b=klKAojlRohZLIeHf72VHb9GBioTWcmZfvC1lTamOrCRCHPyMehE0EHE/ML1WLwBC/6HYe06ZJT0fJ3v8D+9/ehEH9pwpn9guXUz86nsBdnRhVqdB1fdb61GcZFeUmDaeBZe1BCeqVWAcjFXRBfUd2SABIjieThYPS4TQ1PTDunQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778268455; c=relaxed/simple;
	bh=vLFJYlz472BIEbCJJrK+f2v/oLfa/ZS2Gxm8V04XxgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOluoY6kttjvcOyoqeNXQGaT0wgBYCM+XQ0DV/wH+0SNA9qasRF8gOAPetlt9JYMWKdG6+U/6dYH8OcXwzAn01jXVKZGyENtIis6Lgx74Q8mFqZgH6/WprdweVcv84boHkQUwVXUA9Sc5Kz18q1n3izSdEl+s814uY2TpIgMVlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tpg9h12O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bEKCwq5z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tpg9h12O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bEKCwq5z"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648GTfkb145193
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 19:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yY55dO2IMk/92g6rGd8QRogQ
	Oy5+UeRlbKNLCfs3a9k=; b=Tpg9h12Ox8yR+fzY8akuJaF9alimLJl+7606HI/b
	iclAu58skbnVvjdJT2knGf0tvHSBvYJixU6Nix23LLkzkeGyKzY/XKHOD9nRwELk
	GPAO+D61c/jtFcG73tcbjTN3Fy9a9QWO8u2MVwr02/9Tw5RMw8y4DmaT/uCm88jS
	NHXUDm2HwxFM6zkueKz1y1aQuaSCR4kURy2dJ8P0Tbq2wjQNU7EDWMA+2NRC8A3R
	Uh+rlUnob0M2Tdm0RTHGPJ9dlqRjxXTzv88B1Jj1u5amDegGQubRvUCOYMYea/Cl
	13IZHeOgqERGxqGdOHgxe7Cz7u9Mb5FOHSlabzbp8qD0ig==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1kdc0kf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 19:27:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e575a50bcso29575301cf.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 12:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778268452; x=1778873252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yY55dO2IMk/92g6rGd8QRogQOy5+UeRlbKNLCfs3a9k=;
        b=bEKCwq5zL/UG9SXbAivmcvd6t8UxrKXsm1ZDc+DUwsfdIhtIWZa7aYbEcURENaoe/p
         6bx+6KZuGB4Ai2vCR74P2vrMhWuqeyB09gAspZOlnnABIVXG8WyELkU28T94TbvnpOwu
         dVqDVLWMKNC2/R9Yi/3NGjDF1QgZGWp6o5DnKVgiHGLy/TRJnCs7eJfWVNFHFRlWjrOK
         +uFN8I7yshQ9dwkksonvrQqScIIblOZ2eDBqzjp5spLDgLvjKExSghIvVsuFe/gPuY3+
         idFKO5MmaTL+CspDgCjNwqVuvdoZPyzMSX8LwcSxf0KgvdWXO2TfZcPgrz+V1Aq5XW6/
         cJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778268452; x=1778873252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yY55dO2IMk/92g6rGd8QRogQOy5+UeRlbKNLCfs3a9k=;
        b=NFTsQuWj1GYcq7cbLfiT4pTU76LGP76QeCigjXHh7hGrw5w/1oZ/YINqly4hpwmk+p
         iET+RnEPzhXGo1N7dp/HI4rFoJLzZgJXFQertoU+ybJ3z2w9hX1zGken/H6u4KGZkilM
         Zq0v/vYopXrybvkaHkwaXU8NxAdugo6UeNHupcPYpikJlVlvcrSCx+ef3I0Hma2wVTTR
         Q1PP2QxZDknT+Sy++pVDUA3vaHUYTUuBE+ykkEydydiVDEgc+HokMgCXpV7pml3RTlXo
         zx0JmwSK9hfXi5q3Ixl/McRAkoFA00ms3Hu0Zga+nlWKTCcO70jF9ysxwr0eGnILT4di
         fSdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8FNyT+bV3xVfCsC4LB7f+thDS3d8eL4zRm+IE5mZjwKLbABPOwLT7fQq7GNqbDbXauc4GeGQzqTLNc@vger.kernel.org
X-Gm-Message-State: AOJu0YzBTamTXfFW67nRCRmJFLtINyslDbjx8Vwww12Ct2LobtRJchMx
	C/23DFkpP9E+nkMC8k4c7EitskuuJ4pVDKXVktb3me669lAmfhmWnBZkt4erm5l3IWaceBUy/6D
	VudOp2TKqKyHrQcQGplsP5WxTAOoyR4v8k3HOJGS5L7TGnrEzrp9uwJW2TmH+fe7x
X-Gm-Gg: AeBDietFulKB+HPuZ1sOnzZsG2zMb3gRlgX/omI4CpKEYkvOCCP1mRryhMGngP/NTQO
	AfHZHPot2tl4XJ82OU6yDPJCuFy05JvGx+LpyWCMg0KmL71MGueSX4TzcqN3/Qp5NmDAsWvaZBY
	fnlntDD22gIARk6it4eaJxO0P/xP8kGGDA1scEA1dMX6O/RRvWvGYvMg/JNKokoX//+m/1C6bzE
	YftunyXLwmJ5nTWDE3Vk4s5QwceP9dYJn7xYiQQopMgHwv8E3MKp7IClmlvzr7gzl0KQopL4d8m
	d+5nTIrYL4XzYDB7pyKFJdiyd++RY8UPMWqDidis86Tol1yp+8ztN3RzSDv11DVNQtWBLXXWG3/
	kY6a82RU8+6aLi4WVgf9I0bfO0spYUMv6EtyJ5KeAGqT4E0YHsg3xp9fCQJlXg0dTlRQQsTKpg4
	0wiIIdCKvCHg253PzIJxMJ3KfNgVGCJH99tJQ=
X-Received: by 2002:a05:622a:4a17:b0:50f:b904:457 with SMTP id d75a77b69052e-51461e2dc75mr185973131cf.25.1778268451613;
        Fri, 08 May 2026 12:27:31 -0700 (PDT)
X-Received: by 2002:a05:622a:4a17:b0:50f:b904:457 with SMTP id d75a77b69052e-51461e2dc75mr185972601cf.25.1778268451066;
        Fri, 08 May 2026 12:27:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660ebsm756622e87.64.2026.05.08.12.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:27:28 -0700 (PDT)
Date: Fri, 8 May 2026 22:27:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 13/14] arm64: dts: qcom: glymur: Add iris video node
Message-ID: <b36tyrznuwwjiya4lt2ajqbyopnonvubedpofasmzknwjd2mrs@eenc4epvbokm>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-13-7fbb340c5dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509-glymur-v5-13-7fbb340c5dbd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MyBTYWx0ZWRfX+fbS9FCCA0g0
 IhmXme57QP/JW8+CHGDyGCHRQ11fIYZMfpX3rMdS7rjqwkyWMXrtbBbLSc29t77rlrCPqJ6HM04
 ZChjyhiWDFrmCayAWIWf3tYvTKWniZG0g/s6fxglGAwcR6tHTgpx/8h0VOcTaaBZYQST2xGuvt3
 fMuKaakfTeHA4g2nRJxBylXoKtdPaVLImhA4M0Uf0dtm39fzW7v3Fp9edtzsfKR7I8xWYIfVAu/
 ALkAndiuwZz1neYp9Fv7WoHw9W21b41DUq7nLIfv09hTg1vRp015peKoI761aPaBayXIiot/ahc
 vDOd+4rls7PrycLzwPu3JfSw8BNjQr3BBJpiNYrUCLXIoYNQBIIvl7UfPTBlvzkfIFX5GSpiMSs
 PcfP41tTc6GSzBpf9DctUltWVj9B7UxzztjqF0DKStwSxArEO+BF9fPKasz0qUUem93ZcO2C7R9
 NL35nBnLB79cewOaBcg==
X-Authority-Analysis: v=2.4 cv=RZOgzVtv c=1 sm=1 tr=0 ts=69fe3924 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=mqQgVc0qi76843LXJscA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 44WR8Xs5jszm3jDOuy3HDlq8RhcCL3xe
X-Proofpoint-ORIG-GUID: 44WR8Xs5jszm3jDOuy3HDlq8RhcCL3xe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080193

On Sat, May 09, 2026 at 12:30:02AM +0530, Vishnu Reddy wrote:
> Add iris video codec to glymur SoC, which comes with significantly
> different powering up sequence than previous platforms, thus different
> clocks and resets.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 118 +++++++++++++++++++++++++++++++++++
>  1 file changed, 118 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index f23cf81ddb77..c47443174f97 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -13,6 +13,7 @@
>  #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/media/qcom,glymur-iris.h>
>  #include <dt-bindings/phy/phy-qcom-qmp.h>
>  #include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
> @@ -4163,6 +4164,123 @@ usb_mp: usb@a400000 {
>  			status = "disabled";
>  		};
>  
> +		iris: video-codec@aa00000 {
> +			compatible = "qcom,glymur-iris";
> +			reg = <0x0 0xaa00000 0x0 0xf0000>;
> +
> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CLK>,
> +				 <&gcc GCC_VIDEO_AXI0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
> +				 <&gcc GCC_VIDEO_AXI1_CLK>,
> +				 <&videocc VIDEO_CC_MVS1_CLK>,
> +				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "vcodec0_core",
> +				      "iface1",

I first wrote the comment regarding resets. But the clocks seem to have
the same pattern. It's not just "iface1" clock. It's the clock for one
of the cores. And there is another clock for another core. Please make
that nicely named.

> +				      "core_freerun",
> +				      "vcodec0_core_freerun",
> +				      "iface2",
> +				      "vcodec1_core",
> +				      "vcodec1_core_freerun";
> +
> +			dma-coherent;
> +
> +			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "cpu-cfg",
> +					     "video-mem";
> +
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			iommus = <&apps_smmu 0x1940 0x0>,
> +				 <&apps_smmu 0x1943 0x0>,
> +				 <&apps_smmu 0x1944 0x0>,
> +				 <&apps_smmu 0x19e0 0x0>;
> +
> +			iommu-map = <IOMMU_FID_IRIS_FIRMWARE &apps_smmu 0x19e2 0x1>;
> +
> +			memory-region = <&video_mem>;
> +
> +			operating-points-v2 = <&iris_opp_table>;
> +
> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> +					<&videocc VIDEO_CC_MVS0_GDSC>,
> +					<&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_MMCX>,
> +					<&videocc VIDEO_CC_MVS1_GDSC>;
> +			power-domain-names = "venus",
> +					     "vcodec0",
> +					     "mxc",
> +					     "mmcx",
> +					     "vcodec1";
> +
> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
> +				 <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
> +				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
> +				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
> +			reset-names = "bus0",
> +				      "bus1",

The names of the resets suggest that there is single "common" reset and
then one reset per each core.

> +				      "core",
> +				      "vcodec0_core",
> +				      "bus2",
> +				      "vcodec1_core";

Are there two codecs? Or are there two cores? Your naming suggests the
former case.

> +
> +			/*
> +			 * IRIS firmware is signed by vendors, only
> +			 * enable on boards where the proper signed firmware
> +			 * is available.
> +			 */
> +			status = "disabled";
> +
> +			iris_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000 240000000 360000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-338000000 {
> +					opp-hz = /bits/ 64 <338000000 338000000 507000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-366000000 {
> +					opp-hz = /bits/ 64 <366000000 366000000 549000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-444000000 {
> +					opp-hz = /bits/ 64 <444000000 444000000 666000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_nom>;
> +				};
> +
> +				opp-533333334 {
> +					opp-hz = /bits/ 64 <533333334 533333334 800000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_turbo>;
> +				};
> +
> +				opp-655000000 {
> +					opp-hz = /bits/ 64 <655000000 655000000 982000000>;
> +					required-opps = <&rpmhpd_opp_nom>,
> +							<&rpmhpd_opp_turbo_l1>;
> +				};
> +			};
> +		};
> +
>  		mdss: display-subsystem@ae00000 {
>  			compatible = "qcom,glymur-mdss";
>  			reg = <0x0 0x0ae00000 0x0 0x1000>;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
