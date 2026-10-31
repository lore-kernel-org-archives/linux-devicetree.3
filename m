Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793483293;
	b=QSFGWHsW1/n15jfoFpJq+NlIlb8Pv92OiJDr/M0lbXaX2A9w7dOxgN901rmxYmUiAfVa
	 /aMzMa5nhn7hVsvoOXVkSNFXW2YpSglBr7h2CGWQKuirqZCOyJ2Jjc77jFGvjZ28NvuC4
	 mRPWBZmHKo3q+0Mj5tFfGq3qTYRGsBowfkTh6axFsScKJCVlgpQoUYMnpYpMgcL0ztOQi
	 sB3WJv8JulWJo8dzWVpKcfbbFD2z2AGipNR3cpGMu1zo71gGfmYWctZPf7InzN5DGXuNs
	 09KmCfdKL5wbVE5qlIAkU/7MYo9eLNnLx/08NoJGi2CgSbcO4LhshX/Q0z/4eIb7Ppg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793483293;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4EItL5xvGpqO6UWOBBCZmsuFutwBGP9FjsFh6RXA9XA=;
	b=3AjBgxM9Zn7vw8g75ADBTD6uk/clXGbtqd7pbr/kKq1G8ZfZCVUurDCq6/g5ZtwIwDfS
	 l/MStTCxpf2sqCdDhjkgYHUvCAQya/+uURRpmkV++JRC6qSg+Wqh81RZ4J57rBpyIzpsT
	 6Kzxpcucmyz6ivzgyUKHzkiUAcWJwh1s+wSq17tGI/+LLKLAMcuJm/aMEk7qJhdi5aD4f
	 kkgIQPaYlLZXI0KpMr+8GnAA7rnWVnKcED7JgGqSUjReNJrjo2r7JDVBR6VKkTL6NPrkH
	 eSB7XAHOlb0lgIdtFxJ+Hf9+vm98LNb+Bry4IR+uImDim4TD9NkISKMvXsZrLFnBgzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YN5aJTzg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ff5nXpYw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2CE606A31A
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 21:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF2CE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YN5aJTzg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ff5nXpYw
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJFE3J2398595
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 21:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4EItL5xvGpqO6UWOBBCZmsuF
	utwBGP9FjsFh6RXA9XA=; b=YN5aJTzguTybW9G+mlI0XJtw+n6bdR+mgrsGe4kH
	a8Dyzz44XUjSs7EpHb6Uj13LvRztzPUNAERCSCVsjO4uQzUyrOoht1lktdmwIwJN
	IB23nBH8TUFg9jCQboo1dkPIHs1ouP3XJ5POq+XgPz1aMiVzUjJZ+Ix5Epq27NKv
	sKdmwHSFLUHcMEu+UbIgQsUykWcPsemrV1fICWURhTyLU9ULzLIQS0+hnvQ3Jocx
	VuhbN/GN4A9+yQpGPF1gvjP43XD/mhfDm0Wfp0x+PVMVgtS4JS90CW47Qhkil74N
	u96yuT7J7TiTdXdJNKdFseH5+s4+L7EdbKpP302HsMVCEQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93ej0a7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 21:48:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-943e8ff02d0so166970185a.2
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793483291; x=1794088091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4EItL5xvGpqO6UWOBBCZmsuFutwBGP9FjsFh6RXA9XA=;
        b=Ff5nXpYwnYEr6e5KbW+B3PvK0xjSoccwciobXjCTwS4s/CLEWZxQmka53A1cRWfGWj
         VfAL1LkIio4GihDsDomzy2EF6IT6AiTCvOJdrXfpOYzSoZrttEjeWFVhQ1jOEQXaCki9
         Js/NIVZOwOr3WUxy3WJlBEWg6QCg89V7f52pxhdn+bMUFyl1FJXVNxgd86Af9mYL1n7j
         6nzeZyYcJbIRkYTCJaJrpSj5Da33kfGx18gsHG0lj1jie8jFzhawBOGVhuZ1ogEpVk+B
         cZ6z+o1Z2nFtcSCGPlfHtc2Zwz1wOGs3W1VfDHrnqvfxpZWQhIP7B3DwH1m1Xs7QK2YE
         4rCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793483291; x=1794088091;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4EItL5xvGpqO6UWOBBCZmsuFutwBGP9FjsFh6RXA9XA=;
        b=AyaXuRqGxON3ar3mORhUjQGtzLlBh+qc+v7D5gpQtyV3LpnWChYF7YhLX1DBUW6L/2
         4yegTxYlP3n7FPc0XMHjolXEzR797WhNK77ogM3i5L3+GtrhtFfRopIJfPhfATf78wJ0
         kNTtw05nImiSGFMKIy0QbbPV2890wH+vzYRRdc20O8BxbczL9a6yuRvBs4G3PKgQaeHi
         rIDcDlHviRfUurJvmy5vFscz+qTic6pnYzgOo3vgFlUtlbIQQ8c+AVZLX50tKeX2XFdz
         pj2/m40QgTMO2Cf8+sdJWju+CHz//PHh8m1C3a/g5VF+t4GOdt1A6cAOyJlfvlwgI20S
         NKNw==
X-Forwarded-Encrypted: i=1; AKwUvBzzWOAV9y0poufeCmdD+mUCAR4yBJyxfqOymxDEig6glNXnhimfxjSx8B96/OFQT8RxfZLP44buykcO@vger.kernel.org
X-Gm-Message-State: AFq9FYIZzVyehGqNG6lEChR5clj6HIj3QOy7EmrRLkGS35CO+M7Nlcsc
	bTV0Jaa89TY59ziG341lfD7fDtaYaNHMUcLEZLsAffWfjD+QkrarFEAawAaMaF0qmSACIzTpz+Q
	zLTD+JgCif5R1IrYxuaPe1N8TCkz5GNz509eNQ0MJNOIoMBGW/mifmIRzfr6tcMf1
X-Gm-Gg: AYBFou1zG3wxRmktqAJJsm68nWnURdF+0q1ssVUJfdaW6bIKHr79+lX55uvKhewQ4Y6
	hcZNDqTWIcpyXPirLZ1bBQhffjWMZ+X5HqApNz+qhxGBNqZ/M1XN0Ivqu2KD7OJafwNSTwFF3s6
	EAFwWD0OrHa/IuBIpMXeM6r5wg01HN0RebgEiACgPPlw7Y+IAkIQmC94DLtEJGrDPKNpJvkD8Ea
	V8jxwNC4yekeLYKQJyX1KldU/IR2gC4IsuemOdNhWW6JVPNcFKUcJ4KTqz76yssrL//UaTNh1Bl
	WcsRJPCS4VP+NdSASWix6ftGMC4f1Pz6ysn2uevwBqXKNJLwN7RlbKPG21BP3PkWw4JotM56M4C
	P0YgKRNZuCPmsolBBCoFKfkuZ51/zi3ERX36yWUOtNUl/T1/UK0T1bBBJ9UyVOCMERXquXtYybC
	BtXZG/3k1D+i2fzwH4q9nL4EzaWmhQJ+rQa71nI2saSmZ2TbPbA/+gNarzoGLKsA==
X-Received: by 2002:a05:620a:29c1:b0:93f:228c:52fc with SMTP id af79cd13be357-9442175b13emr960249385a.58.1793483290803;
        Sat, 31 Oct 2026 14:48:10 -0700 (PDT)
X-Received: by 2002:a05:620a:29c1:b0:93f:228c:52fc with SMTP id af79cd13be357-9442175b13emr960246385a.58.1793483290275;
        Sat, 31 Oct 2026 14:48:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe073e5e6sm790440e87.57.2026.10.31.14.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:48:09 -0700 (PDT)
Date: Sat, 31 Oct 2026 23:48:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm8750: describe all MDSS block
 resets
Message-ID: <dkwloahmxcka2ykjdrf6nh6d6cde6zgd7fe5s763h7s6nv3eqe@pm32d33ghgbb>
References: <20261029123238.29877-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261029123238.29877-4-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029123238.29877-4-xiaqinghuan@mail.ustc.edu.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfXxbMaon51udPY
 lXcuT7ngE3ca4QXUYAoItN8XsOZlXT5aAmn/+kz5Wyd6B1j4Zu7b9BIhJwhC35dxCZ77WK9Cfrx
 aLuZQKyWO7FihQ+LkBpHAgp5mOzi4TGJiVNAXYW2Wr5NAjqb8Uaq0pEeHYm9c2GJ86GEM5lyQAv
 2VOfo5yAJtXvJ1rlCfy2uY/aPc43KLfSnA34V1CUk9sa5GbypLrBDtjGlYRs+3ZzmAJcZRoy9IP
 8lJkoV6U9uOlRL3R8E8lOOBa+aU5YOy3CHIZqJGQ6EndisRr5BiKPnXcBMKff5F05qMsgcWPDls
 PFXBZvbdmHwiVxLVbRBYVL7lEZnsQNENPRZqAsImpsZN6SfNaxmnaPfXj++CLm+ouYN3WRjI4k8
 jpWaXScgs2xl+K1sWS+IHudzUysSiQPXNN/jDppeiaujKrfopaX4UfIeaMPbm6I9EA+gqZrUMBG
 PHF/xw1X7uR/EfyH9eg==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae6621c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=b0wOoaS58wixzsa18XgA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: gswIjfSAfDSLlz3Wh3mXtfJejONdq6kV
X-Proofpoint-GUID: gswIjfSAfDSLlz3Wh3mXtfJejONdq6kV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfXw6zM9rlEa0Fj
 SeoVw4PE1uYBg26bytdd/MOwtX2iJQzrXvlQ63Fct61K5sfR1UGCNScpjYSO8W4oXophk/wKbLL
 ngtbhhfEvtxnbUwV6STIdK2GcaxFiSs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310086

On Thu, Oct 29, 2026 at 08:32:38PM +0800, Qianhui Xu wrote:
> The SM8750 display clock controller provides, beside the MDSS core
> reset, block resets for the MDSS core INT2 interrupt controller and for
> the MDSS RSC.  On devices whose bootloader hands over with the display
> block still active (PLLs locked, MDSS core / INT2 / RSC out of reset),
> the kernel so far reset only the MDSS core and left the INT2 and RSC
> blocks in the state left behind by the bootloader; command-mode panel
> initialisation then fails with command DMA timeouts and the display
> comes up as backlight only, without a DRM device.
> 
> Describe all three block resets so that the MDSS reset returns the
> whole display subsystem to a known state before any display hardware is
> programmed.
> 
> The reset runs after the display clock controller has programmed its
> PLLs (the clock controller supplies the MDSS clocks and power domain,
> so it always probes first).  The block resets do not touch the PLL
> registers and no display pipeline is active at this point, so the PLL
> configuration survives the reset and nothing visible can glitch.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index dd738d13df..950c528bc4 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -3071,7 +3071,9 @@ mdss: display-subsystem@ae00000 {
>  				 <&gcc GCC_DISP_HF_AXI_CLK>,
>  				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
>  
> -			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
> +			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>,
> +				 <&dispcc DISP_CC_MDSS_CORE_INT2_BCR>,
> +				 <&dispcc DISP_CC_MDSS_RSCC_BCR>;

Please drop the RSCC reset

>  
>  			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
>  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
