Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027845;
	b=UB5zZ9EFrU92acRq/46sWSBkgdoty9jokZ63JMFqOnphu2n2bEVkXYZlWDHn4RykZtlk
	 ugIWzRxejrAr14HdzEJH1moFw49Y6llbNdzfEopjh9C+rNRYSzNNUxsy7euIct9rJYLrr
	 Uq0SKlvqR6ifNSpLBoMMEtbYlEj99ojnF0M61UXD/LOoH/9fz6OhEeZX9AIqxMbULWKEf
	 t5KnbMxhLxlWGGDE0KGOhK0APiY2YrdH1jA+U2vs68CKlmXwq/zlt5ZVMBZO6Xe5OTbf3
	 58GNK1NhT9zvan9/TcKLQJT0Lh6n3unKQR0yoij1rvId79gl2CxpP0lgr0q+MlT7LWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027845;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G6fSMtRefayhZI5g3aR9XsfohDmCy0PJvzpqSftD5bQ=;
	b=SGIBL3qnwnNq8CxAupPIR23uOgXTXmFmPUtGj9UfsXwRk3vuA/F5ez2xdSnXtisdOMsI
	 OvLHY6F67C90uSpE7r72qwbqiFwUKVLmi0ztxIBlYWePsGYlujxFpVyFP6PF0oYhCoJVz
	 +R0KSJgGHSOCGPvkNx63H2cWQ2hLeFder27dU05Wpgd2yS8z6AKSg9uFPwzfZ2gM84boI
	 9bYdV8YZ2KymEh2wgx8Eabmd+j4cXVL9TfruLPsnCqKMlYoXNoJyqjdZd4HWUh6Ce4Fpe
	 8oj0stYlrx4m1qXfC2DPk++fglM3TfDACIy2Iv7x1ioAtwizBY2rRyckosmMNGs+zAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iHsP0uPW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MmTpeerB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6F7606A32C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 18:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D6F7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iHsP0uPW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MmTpeerB
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AII1PaX275474
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 18:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G6fSMtRefayhZI5g3aR9XsfohDmCy0PJvzpqSftD5bQ=; b=iHsP0uPWNbZEl11k
	Q8Uuy0Ax70dRrgth9uQGkV9jWJCgNxJu9cKOmwRTbNJ+trEEMyMZextqDFnJkNCQ
	e9q1XghSK+7klBiQJvmB06OdHje5QRvR2J0hjMQlj8QgNQ9nosh9PV0YsmBpcA28
	0DpAHl4B/EhHU9XJUITKSdpZzktgBCPXflWFetqvKUnhoKdUZ8bmCAOI5qsr2fyy
	KuCwgX4DEYttanATHwSeMp4bL7LmzAbk3vsFY1aaI4hm50MArsxWoqSWmFQDMbEE
	K5nITVOPH93HT8ElbuFzXit7+26i+hjFvLlrO+295XTqZbGhvsQHLedkExmialxs
	R0bEUw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxcr794-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 18:50:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3b74351a4so1389451a91.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 10:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795027843; x=1795632643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G6fSMtRefayhZI5g3aR9XsfohDmCy0PJvzpqSftD5bQ=;
        b=MmTpeerBx3ZM5y7+v0at/sAF7oavwOpRJD/PxgLjHXPCfCJm2zXoSVm0wWxn4rT8rJ
         OnpTGgL7lPPdqqeWDRfko9ohvnNXj5PXLeNV4BywFOZ2tzWtlgxc4ov9/vRHcfTLErb5
         egCWLaNbKhhkZBMaXE3InpTQSEvD2ZNwtFnl87VMeJnDQ0e3jgntyNXaQUHC1GIgfUUu
         dX1cspyYBWwzyOvMIYo/WI/UzTsZYue8ang1qDxi8IR/VZiPtVzOGmcfbzkI4bP2xoiY
         F26LfFTkHiC4e7sFfBC4VPSuGIxAD+pzG6ZozCzONLVgBZTsCyu7FFzufokm45K9DtH0
         xusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027843; x=1795632643;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G6fSMtRefayhZI5g3aR9XsfohDmCy0PJvzpqSftD5bQ=;
        b=1MwJxcwcbZk4exsQuKhh9cB/MFjOuLrcvZtIBthouGNpg3RmxiIx6ndpcQ+xBmYH7e
         yMb70gp1I1uWZ9zfhrBiRB2UXs2blnufinQkDkY7zFbMe7IR6QbS0kWh7xu2H9l0GOHR
         veKRFBfvr/3d2ZTy+T7LpGy5Renv4DMjt5ByW72KXlOh2eNH4K/bFXmpmGPH2Hvz23Mc
         s0MWt3XYJcCdRTexqelo79ZsmVpiccptJvrUfBza8HCkaFtJd3bmA4Wc37KcJl976/I9
         9TG+TBXfwqqCTx3g7uFGZO9sjjXR22hdbKT2nMAEdosqPOec/1FziIpFP7yKb2gJ8Y6u
         NGgA==
X-Forwarded-Encrypted: i=1; AL+hErEGBsjSOC1/LUp9dUBbb89g94QSxQ5cUeVaX8BNO+TzVcaNsxrIKTCUYjuUpZu4m5jA1tmDS1BIsfUa@vger.kernel.org
X-Gm-Message-State: APuU4Z+UN3ZVgdOj2rBv7LhQdg/oJaYM2fH7LOT3M2qks+Vb7Tysoow/
	sxjTKpDJvDyTu9MT85drDx0vTGd4QF2yEYFvvICtliX3YpXZWo6YphvOLM+rq/H7CJQ+nBJu9+J
	YxwHDanpDnMUQWp0cjFIf/jh8NzZ2bo2SktKWrkAzTyedwyJnn2T3sMbc7j7fbGnJ
X-Gm-Gg: AZFdTZdHxiiqJLlDBCnObLfUDv8ozfzV5HjiswCEAZtUCz93YTX2iUgcCR8IEQTBHFE
	BlVUm268A1zLq3BPMlM1i61MeFzbG0E76scGjNq+Vt/gF3Lg6S0O0FcTFQCM59fdmxsMdHw2vfm
	6R1fq/KXqJR5JFO9zT2zj5z8wCoW2gA5pcrNNbDzHLfkLGv9BvdYDm88jBomnJCV1+byrxYuBNv
	GfIT+BnexRxDJ72ZdNZKE/Kc77hF2Fsh4bbMsTgJBL4ouSFOWSXJIZ0jcO/cVSaVz4eYkTVgEKH
	jCFV7pbC6uRK0Rd/9Onh2nVCv330WeuWtGICpFKLeFw5NSKHpMLSlT7IO2GxInyaK6gRrNLXQSf
	28mbXJtkAadQ6qSVYTFkgVytvm+g9lD3KwXZ2p+l7OcBxJZmdz076sXxbU9uOtsq/AbV4aea5hw
	==
X-Received: by 2002:a17:90a:fc50:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3b3d07598f0mr3522911a91.10.1795027842665;
        Wed, 18 Nov 2026 10:50:42 -0800 (PST)
X-Received: by 2002:a17:90a:fc50:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3b3d07598f0mr3522890a91.10.1795027842199;
        Wed, 18 Nov 2026 10:50:42 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3f6bbe469sm469942a91.11.2026.11.18.10.50.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:50:41 -0800 (PST)
Message-ID: <3b9e65b1-2b7e-4310-924f-ca190a0ce91d@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 00:20:33 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: shikra: Describe the GPU CX SMMU
 aperture
To: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
 <20261118-adreno-scm-fallback-v1-6-e99cdbf3121d@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261118-adreno-scm-fallback-v1-6-e99cdbf3121d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LZapeTfi c=1 sm=1 tr=0 ts=6afdf383 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2DaYFnQSzUVrrlYHPwYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: lTB1JPfzXaXwHjMZObd_n5r73r4NdQNB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NSBTYWx0ZWRfX7nQxoRV/zgKP
 tAVq/Lw8XfkYXi7PAuQr0tfpD8d3z5o/9rMTUd1EdiLbzE5z5kEnBKm4FVPSWtCOpArssOA3RGT
 Ht/egDk+Gv7Ao+hJZMFaVRF0ldpmo6dVqGGUfWxCeGM+uB9er5ul0iz/pgdJYxvOpJHQmcZIYFO
 MgS4pRChjGkin6hsEC7pofqsU0p75qAx3Z4qbNFeLXipOXZmw75+6XkebKDz1YonBDXhGTrbw69
 BBUr6Pk1IB4pPLir2VlL8MMGD4JqdT26JyVpFFFdC2lc14WnT+SObLYtxOLP54/vuLaIsydti75
 z/kpViPuvm4q8LmIs8K7wm1tvynIdlu2Mn/9NGH4wpi1orpoTmTtUXshXshH6t4PXVPavHTjaH/
 TWWGoeq/G8KE4Z4nHBxtyiopXWyQB6vC5yS6PWZqhm6u+ICR78tuTrp/rpijqPS56WD9SCtDdG9
 6dE4Af6cL6HWalYBUWg==
X-Proofpoint-GUID: lTB1JPfzXaXwHjMZObd_n5r73r4NdQNB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NSBTYWx0ZWRfX6uj9W9slWGTk
 AyI5VqeM0K34MD3LMqEwaVhVoPKR4SPOLdCuvV207GFVEqXZpYCMNCBCySNR/wrQrl3EYhk2hv/
 EVP79xyt7MxGhoMtiPhZUo/HHN1pgeU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180075



On 11/18/2026 6:38 PM, Puranam V G Tejaswi wrote:
> Add the CX SMMU aperture register region to the GPU node.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 0a95ad5a5582..ebbe5e23d173 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -2647,10 +2647,12 @@ gpu: gpu@5900000 {
>  			compatible = "qcom,adreno-07000400", "qcom,adreno";
>  			reg = <0x0 0x05900000 0x0 0x40000>,
>  			      <0x0 0x0599e000 0x0 0x1000>,
> -			      <0x0 0x05961000 0x0 0x800>;
> +			      <0x0 0x05961000 0x0 0x800>,
> +			      <0x0 0x05960000 0x0 0x1000>;
>  			reg-names = "kgsl_3d0_reg_memory",
>  				    "cx_mem",
> -				    "cx_dbgc";
> +				    "cx_dbgc",
> +				    "aperture";
>  
>  			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>;
>  
> 

