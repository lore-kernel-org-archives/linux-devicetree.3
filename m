Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E6E39182D
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 19:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775502808; cv=none; b=ViIoxPZ8nrYq9CWYq3X6UE7OHiek/t3TFGtwc7Kvbysp6Bf2WisBx6jLmT61XiHlBLpIViqu+IGlgIAwyL5sf2VIKftuxLoRYBtuT4bcxmj7W5A7AEXBIypmWn1tUHPqgozAeZBqJMl0dJPcsAa6jRNEYdAe1PddIEgm2reyWwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775502808; c=relaxed/simple;
	bh=BhRk4eacNQ7wngLpxy25m0q3g+rOFYDtHTTJQHw1Eek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hoFHo+kI3YPCvixCuVgBo8NZ9ICPH30/fVQdPLSDXpR2Cgthkl5nW8G2UPe5+iN176g5hmkV3JrjeqS5mwdYJ/+G0RNvm+Cb0abF1LzuZ6K8M10UVD5zjctLh+t2SkLGmhCfuk/HqbIGAOXvXZxsr1p6FVSTNNxnGomXAfAAiqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lgs6yQR0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DYgpE0Cl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lgs6yQR0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DYgpE0Cl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636Ifktp2209384
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 19:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3rbYezlhiDGhlUghm6BR3Wu3
	+c2Zz6olfkM8PY799C4=; b=lgs6yQR0ZITvaCfJjuhEl6Z/+st2HD9tWGiF31mU
	yxXCDdNBHO+SgNC0WxIGawitmPeZpSU27H/Zso2OshHv6/O6e0LVMwJBvtgK8Xni
	2NDN86Q1DuUlc253KmaMyzki8XsZyY9t+KyJc3OtToL7jUksgi7oz2/MkS1fg2FU
	Kt1litaMBRPIs2tlhGkSQdkbwESNC3oL2FtjtuoDV4lTvPXyIc85aPAyeXXB9/LV
	sakqDCMGZgtT/m5oCc1368J/ldtePPPtMTC7hxNkhoVURt6lLa9/NcY4jwvriVvF
	AwX1jupBJLcsk2gDZDv6DCsQMpfdOTDBLp1khKHNXdB/fQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcck09cfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 19:13:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4987c698so118275931cf.0
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 12:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775502805; x=1776107605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3rbYezlhiDGhlUghm6BR3Wu3+c2Zz6olfkM8PY799C4=;
        b=DYgpE0Clw8Gmequ1ddJfpk7hURP0LuELXWe1NmyzYwbAZbGpJMao54GoU63Y471vgB
         PzcOzwsU6G4+AK0NkIJO0tcrjKk9nT/MwvMdOrPgr5ALdGbLZnE8Cis5Ghm4meXgHAdR
         cxzhbhwwz9yOtyVeomr4FB6m9gDKC2I92YsrOyGazRakhKlHnLH1PguTzpz7Oa6aygyW
         VlcMv7+kPdGwhMfazQ+bRq6d/6LadyQb4Omkj2iEAcVBIVpmUkg9pSoBloVshIJkVmtP
         p8+tcAbEN+Y6bDPunGiISqhpMqzLtXmCmq47gRalHP2evOkeX74kztIeGzHnxjkr3pgB
         rAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775502805; x=1776107605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3rbYezlhiDGhlUghm6BR3Wu3+c2Zz6olfkM8PY799C4=;
        b=fy9P4nN7z68H2ELR2y5k7apLr61mzZ2EnCj+NzwYiBvBR45AB0hJBtthHBFsU9hRkY
         vcT2L1+OcrPYwsmNlu0PfRZHoeukV5btwShO7VktYrjsmxHWvQbmRjOqCSEVUB1e7oS/
         l4Lxipv+3FIJKUp0bx3vZQIFEwM4q0dO5RHIHfTdKt5lGCJV2Aug4M8IYFztjQJFvlAf
         H28xyksc3D1bXqusC8Ez1tNqvthOkxmex0LG2vDBULViYI4d3Lc77TAKMmuclAfqTTWD
         KQL27TVtq8G9PVbaIXzWmwvULZmfj/p0l51ayDO4XMk6/W6jG5GaOEayVVQAvHy3f+t1
         rZwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBEMWTU5wCx6znP/IoYVJXm2QUCLAhVBlAHhY7yc30fZmFrioJBfPWZaEVEHDQ6Ol93cHfzTjJeq45@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9s8UzfQjcn+utM0cBmjYyT8lQjHx62IWwthDL1lMsOQ+xeUDP
	pjOy1qZR7l2Aay+Bc8ehMmFtliAQMDpJBhJY+HzzveLaUMNQ/4E81cWiCjXl4pr/n/2mLYvyeVu
	gj+2eab4P97M340D3QYLiZTl+7Gc/1TCzSVckPYzV2FT4vvqZBQRmkqNfg7tsqTry
X-Gm-Gg: AeBDiet1iPOGlOrsi/QNdGByrNwBJG7nN4qkNmJpugStZ6rmqHM20pzg887jVRzpiC/
	cw8bAXfmKapuv/xaJNK43BFO+t9aC8Il0kFWlDklyXjFa83kPhx3iePe9ebEV77n1sVl3cmqvVg
	5YG2bTXWI8dcjRIOgsawIjnUAzLarnsLpZ8O9QnC7FHVEglBsmJWjPd6j0lFHLI1zP9hmTgvNu0
	RjrD3aEe0XjABQ1utL/hGBM3kB7SPBzDGVUop/YSy8GqAJJvELSYOhUgLF7JBklz2nMi1yM083x
	OhO4ohhQ3IcavQBnYIArCrJ7Ymd8J8i4lwCvwGC9smHWd97R/WK2nEEBiJq0CTqnZF2PRpxn5uf
	t3Ri7vkcnuPLc109Nt8Kf671P//rpJ+KquGUVyQcmm/6hujI/Nk+Zq9wSvMj7r2mNQ8MD/7B0X/
	TbiCcTmDcqXBEI/5/4wjLWl9U9FJ2hUPwsvb8=
X-Received: by 2002:ac8:5909:0:b0:50b:8676:3cb7 with SMTP id d75a77b69052e-50d4fa360e7mr209813171cf.1.1775502804749;
        Mon, 06 Apr 2026 12:13:24 -0700 (PDT)
X-Received: by 2002:ac8:5909:0:b0:50b:8676:3cb7 with SMTP id d75a77b69052e-50d4fa360e7mr209812651cf.1.1775502804289;
        Mon, 06 Apr 2026 12:13:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccdefcsm3538304e87.68.2026.04.06.12.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 12:13:21 -0700 (PDT)
Date: Mon, 6 Apr 2026 22:13:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Add iface clock for ice
 sdhc
Message-ID: <ggkj63sjoeqedsahze423723qs6tvcgmlnxqn2usqipve2yktp@45aas5zypfzr>
References: <20260406-ice_emmc_clock_addition-v1-0-e7b237bf7a69@oss.qualcomm.com>
 <20260406-ice_emmc_clock_addition-v1-1-e7b237bf7a69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406-ice_emmc_clock_addition-v1-1-e7b237bf7a69@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dZqNHHXe c=1 sm=1 tr=0 ts=69d405d5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=iZwa8WBptBBy-baP3AMA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: lj7Xc84RlBR9ZinrZLPZSFP3ApSOHy73
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE4NyBTYWx0ZWRfX2QXhslRZTuO5
 6qKbsPitovGf7brRIW3hWnz2mBgGlb4OcRWutDqPrZN7nPZXvkdi8fwevEDG/4H8EQY9Lcn1SDp
 I70kHcnF4J6Ax8misniRfnKAMS4NP72PzmN4yVnEKyLXFzjE9chMnX0HUODX3OKV7J8qu6r1wyv
 PwuXIbf1ouROnMHml3VbrGmCB6sAeb2Snp/i9iPYB+V/48wePBtJeYVw/Gu1uTj3j5oau8S4nm2
 IVqXVzIK1I3Pbdqf43Ugc7vAVfJ3P2ixLlGPw6ZzvFIl5BqyCgVI0zWG6DuIgBXNE3C1vN9eyR4
 J1kLqMS8S42uDDk7uX2Jy9Bj8d9tMy9ODqNAJ2A11OanAqWRdn0PoyWC0jBtIWkvhR+eZxJvf/d
 8gkrURK6Cyap1v6rxdk/H+cwIa+KE/TxdikGZLuijd6xLZBYP+jHlGnIedz4pGBOzM/pAYWhApT
 bFou5vyd0xtHi2+7SLA==
X-Proofpoint-ORIG-GUID: lj7Xc84RlBR9ZinrZLPZSFP3ApSOHy73
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060187

On Mon, Apr 06, 2026 at 10:00:36PM +0530, Kuldeep Singh wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core'
> clock the 'iface' clock should also be turned on by the driver.
> 
> As bindings allow to specify 2 clocks, add iface clock now.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index dda4697a61b7..5e6b659e8719 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -1082,7 +1082,8 @@ sdhc_ice: crypto@7c8000 {
>  			compatible = "qcom,sc7280-inline-crypto-engine",
>  				     "qcom,inline-crypto-engine";
>  			reg = <0x0 0x007c8000 0x0 0x18000>;
> -			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>;
> +			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>, <&gcc GCC_SDCC1_AHB_CLK>;
> +			clock-names = "core", "iface";

Inside the schema the clocks have maxItems:1. Please update the schema:
Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml

>  		};
>  
>  		gpi_dma0: dma-controller@900000 {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
