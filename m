Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432161DDC35
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 21:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781472551; cv=none; b=TLmzQj5CMp+S+Hr/8cjhNZN4FPq3xybtyUib8tYRHK7ZGIdrb2NuYFmliDLIdXPVGRjZyxhCDiYpR/IHZNnDfzWLGAa/zyiUCbhnPXDtHBP9iSXnNxIbT+ZF4yqpPc35qqlsfLhqCrT/wZ9nsvB1cJOmTt4U9nNkIHG53gtMUZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781472551; c=relaxed/simple;
	bh=rkwnz+igJhLSHd1/g1zNsfmNlAjsiP1DTMIeA2PxKKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C2MSwQdEF6KQcyogpePuYnekq6XpKrqzkc1ufn9rwytWtLvUdAzYpq1uC+dsLtEJZTw4UwBJT0mxPtdgRzPkyowsi3S7FbSHqPrMk3+5NVUKP70k2aWwkyWF0yoHLXUdhXRL4cNL1UR91dBMbwXiXAjLTjZYE5wNOJ63H1D05ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X7xhvreo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jV13P/CP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X7xhvreo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jV13P/CP"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ELFAm32184416
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 21:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+UIZX+yrm8NpkbBZgExiV/8q
	eCkMTLOf0NOLfbd2dfw=; b=X7xhvreooleITjkkm9bYeNm+7FTuGg1nMlulEQDb
	u3sU1IQcssaqwvDdRO11Jpr/+QsbMvXwUeeNvtabtk19sxVwxxj6lVHZV0EskUIk
	tVnWGzKQroM65MZi2RgVy0gQhlGbdiK3cxJ8y177lADm1YlBQV/hsiiLt/SzewbH
	klWziuyh9Qj6fYTnhxPQ9xKefZL0w2oPl9CK5+BjA7J0fGP4d4m0sidaqbbqxGEb
	BUGwP+lF4upVIeoRsIKkyTjhfZpJkgJDkOEFTp9ZmQGtX4fvtKwLb8sm4EXTuCjI
	5JSAjzB/Kp0G5xxWKK7J4Mo1fWZKS6HRgxn8Qpe9BgJ80A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4erye14kj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 21:29:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915c8347cd5so585093285a.0
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 14:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781472547; x=1782077347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+UIZX+yrm8NpkbBZgExiV/8qeCkMTLOf0NOLfbd2dfw=;
        b=jV13P/CPn/ri2FIwsB3vWi3GGvWDnB9KdGRCrL0V3B1RYJClWAENqyjNd/UQp3IwAk
         zEZdbCk5+a6bqmN3P9wEqaVy6ylit0zWRhx6lfiC3jSGBYG+OBK81z8WiIofv7KYG4F2
         3hpP+2C2fHMcyyS8aLt5RF0AsrQwYYV4U6ibDVoBt61xQnyRcgByYltOzp45ztZZJ6S6
         eZ7MWij6ArfstJFsYAV8lxqxgsdGeF6Iw14E0VcKvc1q5aHjEAnqdWikO1Jzq/UAssH/
         x3wpI0cXRCen8cheqr2Q1OFGZNeywxHGjDl+dHxDGN4CL/dUrhHY9xktjkvk2gJ5I2Cz
         BmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781472547; x=1782077347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UIZX+yrm8NpkbBZgExiV/8qeCkMTLOf0NOLfbd2dfw=;
        b=peql2BYkONWfRNc/HflM5CKsyKiTy1lHsTZeLWPju2qPvTi1HfZf8RCKKEL65PLzM0
         oUJDBmp7s7QFOdhx1mKnXKZ0fu76hSlgPDMehiAzETFWkkWh828ESvrjh3s/c4A3Lr8X
         dVOL/dMwNAIXPr5fcz7Q349DHIRiuswndRYEXZteV6qHoXddVRkE4wp5K+W5MArzUP/3
         rsx+XRA7yIxkEnwExS35uK8Rq5e/93fyAlBqjgSlhn4iHz9EQkNWIVCevlQs5EuvKk1V
         cVRZOekxJtr9TeB7Mlnximj+bzkQ7s7YdW14J6aLW/gMAdajMyAj883PGpt+D/kJBn1o
         uoIg==
X-Forwarded-Encrypted: i=1; AFNElJ84xYk93k0wdQQ+1EeMNfu7vmMPrqN7rvqI4Dd+YvR1wtnyoOy7A5agEwxip8f2WuMqy4T1Qkjq4cWT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Yweb9fmZw9nBgI+pUauEXsbCH5y+X9FS7LOFzqP2dFjWV+P2
	GG1OG19qV1wNZ17nO/qZ1ncxFiNCOxaPtX6s4h7Uzo/BGjP7rbe505E9IAvu+nGQpEBAgCVTmND
	8YVkHRyMSSA1VEMYb6y8BNiXRD9jqDS9sQJ5D8zcnMhVkjlWX8rU0+ux1TR5UOjNa
X-Gm-Gg: Acq92OHPJ777YHBnfqbRiLi3LLK2FHyYs+WQn1KbeuOvxOtS7BLThb2ewFwx/MUdDHu
	7pz3Bx+aWAZzbM77bx5K8XXsXpzF8Rgg7Y2jlui4QzTuVNzuiR5f+Rv7o60sQUnKqo0YzQLm1VK
	oM5vmFji0/a7i6MQQ5LpdMf7StWgyc85q3Pby2iKQUNQoCJ1eSbRoM4sFSKYBCqRkIXjhj2OAle
	z58MCNw1kWVLzImCjhE6xefr6tVlfhlXOvdBhTawLbaKQ/reSlzz7kXWsdDppgVX80+oQxvEjU6
	WXhlWI/5yq5aWjVQNM5Oek9751FRXR5W6IbHMnT7C95nwAY24W8lEtwu+GbuBcQb/5xJzJfY0o6
	TdY2SVhz3M+JvUAMLjH7p9QPPMCQL6wFcGg5xTKBu8sSj+KR8FcOqA6W4TWzbEo/CDhd1nuXmR1
	1DTq2wlTltD35YhAln/SBDB/6ZZ7SIPGNpBWM=
X-Received: by 2002:a05:620a:25c7:b0:915:9fba:878b with SMTP id af79cd13be357-917eefc30ebmr1399470085a.9.1781472547489;
        Sun, 14 Jun 2026 14:29:07 -0700 (PDT)
X-Received: by 2002:a05:620a:25c7:b0:915:9fba:878b with SMTP id af79cd13be357-917eefc30ebmr1399466385a.9.1781472547075;
        Sun, 14 Jun 2026 14:29:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e16a0fasm2219335e87.20.2026.06.14.14.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 14:29:03 -0700 (PDT)
Date: Mon, 15 Jun 2026 00:28:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, bod@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: sm8550: Add JPEG encoder node
Message-ID: <t73gjl3mqcp64rddf7yaosmscdpaj5opiiatztd42fmjrxdpta@2fp5mpgn4icb>
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
 <20260612194417.1737009-3-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612194417.1737009-3-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-GUID: suMHIoMN8z0Fm9ljHt53d0otNjEjA5NJ
X-Authority-Analysis: v=2.4 cv=MNlQXsZl c=1 sm=1 tr=0 ts=6a2f1d24 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=57GF0HRpIeqOalGSDUwA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDIyOCBTYWx0ZWRfX14D3951JiMxC
 VCP6QSJk3bo/o58C12Lbt56gpj6mVW8As01jFrqLsTYzV5hKJwmBRoU1FO2EKshvU9c4ubQ2MAN
 YkmyzXuXynl63UW7FxIryPtIXxRfCtA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDIyOCBTYWx0ZWRfX2m1a6b6wN9Gg
 pEaUHHkK6Kdti0X0Z2l3KaerwQPcloWZT71tUa9OmwCB1D0q3YRMHd1GrWMbEyrGQAuh00zP0ot
 arN35/NQryd7lJhEjC4AuiyUWW6cqiVfLkyUMNtJjFP3ca5z52BcZrRtbPbmghs59K/L6cK5vCc
 aI8Ky8JSBDxoaFxcrWlUJ8EHkZVoVtxYl4ydOGXcz5suFLLVSsDLKxGnB6Vmt5VnjoixSuaspKe
 cWaq4SRyDSvEOU8ASpxLMYTOAt0ux8CiCIDIbWP+gf7x0iLqPgDdp0OkfUj69pcFK6I2RAPHQ/N
 xvRQHx7nfmyXByPSJhjA3i6xO32Nif441nEtN42uYiiXJRRbhA+YyD5rMdvWJiiaaSyzC3utGH0
 y/E5JVjkMecH+A9Np7AgbiPMauSbnyR9qdf4UQN/+Ell/6phFHoSi1ovjLudGaL6PLtGQ+Q/bGS
 xNomf3lL11yBA1HWX9g==
X-Proofpoint-ORIG-GUID: suMHIoMN8z0Fm9ljHt53d0otNjEjA5NJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_05,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140228

On Fri, Jun 12, 2026 at 10:44:15PM +0300, Atanas Filipov wrote:
> Add the missing JPEG encoder hardware node in SM8550 DTS so the
> new qcom-jpeg V4L2 encoder driver can bind and operate on this
> platform.
> 
> The node wires the resources expected by the binding and driver,
> including clocks, power domain, IOMMUs and interconnect paths.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 42 ++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 912525e9bca6..8090b8b1d7bd 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3677,6 +3677,48 @@ port@7 {
>  			};
>  		};
>  
> +		qcom_jpeg_enc: jpeg-encoder@ac4e000 {

To reiterate and reinforce what others wrote: this should be a subdevice
under the isp@ or camss@ node.

Then, drop the label, please.


> +			cell-index = <0>;

No cell-index.

> +			compatible = "qcom,sm8550-jenc";
> +
> +			reg = <0 0xac4e000 0 0x4000>;

0x0 instead of 0, pad address to 8 digits (0x0ac4e000).

> +			reg-names = "jpeg";

No need to name the only region.

> +
> +			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING 0>;
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_JPEG_CLK>;
> +
> +			clock-names = "gcc_hf_axi",
> +				      "gcc_sf_axi",
> +				      "core_ahb",
> +				      "cpas_ahb",
> +				      "camnoc_axi",
> +				      "jpeg";
> +
> +			iommus = <&apps_smmu 0x20C0 0x20>,
> +				 <&apps_smmu 0x20E0 0x20>;

lowercase the hex.

> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC 0
> +					 &config_noc SLAVE_CAMERA_CFG 0>,

Use tags instead of 0.

> +					<&mmss_noc MASTER_CAMNOC_HF 0
> +					 &mc_virt SLAVE_EBI1 0>,
> +					<&mmss_noc MASTER_CAMNOC_SF 0
> +					 &mc_virt SLAVE_EBI1 0>,
> +					<&mmss_noc MASTER_CAMNOC_ICP 0
> +					 &mc_virt SLAVE_EBI1 0>;
> +
> +			interconnect-names = "cam_ahb",
> +					     "cam_hf_0_mnoc",
> +					     "cam_sf_0_mnoc",
> +					     "cam_sf_icp_mnoc";

I know that camera settled on these names. Please use a better approach:
describe the source and the destination of the interconnect (see how
other devices name them).

> +		};
> +
>  		camcc: clock-controller@ade0000 {
>  			compatible = "qcom,sm8550-camcc";
>  			reg = <0 0x0ade0000 0 0x20000>;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
