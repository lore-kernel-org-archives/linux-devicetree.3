Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A853E7BCA
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 08:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786006174; cv=none; b=UK8ajCqwu8TLQfc2FzCbgy/gWAW24GKs1KH1hqhScbbQPZFEX2hVOzRqdf1OAmMlTlcZypx4dwiuXVQ/t9bgrT4aeX+fETF4EXAWkjESFsEQpJu5hT+LQ5RpccckF+yb3/QMSTigLJf0HIIJEM/nbwAVATa9u5mR4biY0+Wu57o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786006174; c=relaxed/simple;
	bh=KhzSMHpkl+T0k3/D4bj/TXm71L2GvbGLt9WmQapRokg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryr7cALt4o5K1FjBOweJ05TlXu5zzVFZ53GgEhaIVwRH3SR5rvRKXUFgjREfY1izdwaWs0gJZu+GnJTouIRKmJmgpUbhyPdepeHGOO3QoxKUqc/4y6FQ843jxeoleoC7pnQqJ3XrSt9bXPweCD79Zcor+CpYq+6tAX/p6rETEdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hTpkEE+Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CDqJklcd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hTpkEE+Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CDqJklcd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6767DU5x1354800
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 08:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fXWx2kJuD1txleNLiOTk7MZh
	NagWXN9ujUDiGfg4Op4=; b=hTpkEE+QLyetKxFDc7Z1I1UwO5H/bsHl+/Zj+H6w
	SNlZ7T7LuE0PuXG+sLgLbbWV1bScdilkE5ru8hg+niCNThaA0u7pv08eBEQBe8jy
	3VWpnssSwdSXO+flBX1G3DbZO8W7UZIIKCNTpkTTPP133Mki19FDAKlLe3o9qa7h
	9OJ/mos/LyYPYIsPuDutRkmJIlLKyVyCCB2/cTLAeV39GpoAyYNktNAC3s4FhsDQ
	nsWYMAuEKVpgJpTwaiDYE10X4yGHVTYkdM1h5gLUN2Kp/FrgRgWt+oTHgSNtunEo
	Dem99xo+SjV7L/O+ZbBKgxk0+H4FWwZosjk8xXmIKluuXg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9dmk96x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 08:49:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d30035dso14584881cf.2
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 01:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786006171; x=1786610971; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fXWx2kJuD1txleNLiOTk7MZhNagWXN9ujUDiGfg4Op4=;
        b=CDqJklcd9itEv4dd4CyZz1w7+lIkSb011DXhlzaINBC3m1LTAlTBB99rZTOrbphhrj
         Sux6n3hFk5mluIUS1lYBuooVo4Og7DoLLKaie48KblsTMzUzyMd8XqKifvhSeuT+3Qx3
         EdxclpIgr4483edKjtqy4vmZKUqo1L7YfWrM8Q16U31nEoeDgxbog7NexOW5geYaHwkj
         g4r0yVX1/J34uQ/um0TUHvawVGSgtnZTCFTLZX/H9TSba4STrZ9YgWYJKewOCJpHbzHq
         kCChIZLF6/sGgl1r8dXUJ03p38eqVopRXPzEqAxfcgGYPTERcM4bBXZ5/VpW4QKW3mN4
         AaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786006171; x=1786610971;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fXWx2kJuD1txleNLiOTk7MZhNagWXN9ujUDiGfg4Op4=;
        b=benXq3ydwOrldCg4D8u6CiRwJq56fe831ypAHqjvIwcKEkDQehOielzvkJYLFOUVmM
         8QCCLXtcHQERYOZ5e3Y4QLikGToyH00jod8MFwicUTZmWs69iR8rKisAi6iQ1uqvyS36
         fmkTKLPInf7aPHgWNUQIaV8wo5fBHqq/cHhDgZFol6fDaLO6vg9LiDmkSy6pGXtocKyV
         lFsdn4hn++o7bpxOA6sr6HYjcqds6n5kUaBQIlysH8rfzAxQId9/uqSdSEEeI+5YRZdo
         NUlQEo56jxr5QRRUNm5JH91uaVhAvhYbxuQX4rq51OwRlAsQV7v0Zj6ZNHrD6/f+/7OM
         on2w==
X-Forwarded-Encrypted: i=1; AHgh+RrzA1nq1aRZA7+E44lebR5qSg0S8iqfCJVmW05gilKiGbcwT2vXDQ4m8NSeZ3+NXKf9c1wUgmPhtGcD@vger.kernel.org
X-Gm-Message-State: AOJu0YzmO+DkCHnRMNaNT8uS+Tn2SjLWHdyMXAtbEtukIHJpntdCt827
	1+bOGT0nX/UtkFFmkreMSzHQT8M7JP2044PyxBIg5SPP3AoFJqNljEz+9yGYetBmIJrt2fW/a2J
	0qByPXWQnvtQvBkdxXwf1jGjx1gLEFujWdvG1Nl2qJS830r3IfrDJ5n065gTzU3bh
X-Gm-Gg: AR+sD12CoXFq1idXs0yAbJPc4L7LctzGgkf+OAN9Qwb5xz8EDm9+Jk0aMBK9kkrcsQr
	NnCUvG72/+npOsLfpxdC0zMGlfXS8L20lA8VNxkYAKyr7HYzbsRLmnuwNCSBBPE0ym5x3+5xamC
	TMM9MKMZBPbr8OxaH5oMX/z2gdVFkCO4N9p/M09QA30vLrIsT/0uhUPDsCNUkstRyQsWXCZSdpf
	cGVe8AvZswGFcMmZxSdy4xSlLoFwyQA8fDfpcUy1UfX2z3BJ4alt8DNTKTBDZNu2d1+3X0KtC7w
	foW7GQ6jiN39Bnj4R3RBoB43ywqRzWlc6e+zaR0w4wMqY5kvh8u34rIfurPwGI+3pPac9NbDsez
	ylSgrjDsOihskwdw8EcBchu+kEsMe2GgMwsj7JDKmrxrWPGmFC660OOU6e1/3rWJRm9NBLn+BgE
	vqXRHcyhjaT37dVA==
X-Received: by 2002:a05:622a:587:b0:528:38b1:b54b with SMTP id d75a77b69052e-52ce61016ebmr130093651cf.20.1786006170716;
        Thu, 06 Aug 2026 01:49:30 -0700 (PDT)
X-Received: by 2002:a05:622a:587:b0:528:38b1:b54b with SMTP id d75a77b69052e-52ce61016ebmr130093181cf.20.1786006170210;
        Thu, 06 Aug 2026 01:49:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f6235e88sm588382e87.11.2026.08.06.01.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:49:29 -0700 (PDT)
Date: Thu, 6 Aug 2026 11:49:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org,
        Daniel J Blueman <daniel@quora.org>
Subject: Re: [PATCH v2 01/12] dt-bindings: media: qcom,venus: Add context
 bank subnodes to common schema
Message-ID: <xusr4efn5dmsvcs2hl5vg3t7ctqbbchnbdx3mx6km5s7s3se23@mzzqs54lp46l>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-1-da52b5228dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731-vpu_iommu_iova_handling-v2-1-da52b5228dbd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TJR1jVla c=1 sm=1 tr=0 ts=6a744a9b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=e5mUnYsNAAAA:8
 a=jXNH7nskYnz8vVHi7d0A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: phgR4SQqY1M3SzBvrLAihZJElnDbiZRl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA2NyBTYWx0ZWRfX6yPAeTTTHAWO
 MyjKLIh/BMkzTNMu5W8Kf87iZBdW2Pi8EHU6C6NAX4rfxBadFgj2AtTdddXEInwLH3Z253CXqon
 3BiR2h+u90EdNWmBkiJDk/zDOxf3Le4=
X-Proofpoint-ORIG-GUID: phgR4SQqY1M3SzBvrLAihZJElnDbiZRl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA2NyBTYWx0ZWRfXwp5VG67dsKmt
 HmLvnDOuaVQIOP7+jAM6409vAFx8J+zHQdfPXJQ9VeXETIsCys1OznOp8t7X37a3I2Q6+Hdut+R
 lqvIGYEhKn5t5vNTCGCSSX8CZHhnKUsB9F8NbL844kl3l55toqFTcb0lMKg+0xaQ6aJowo8fpYp
 /wK5CJQ67nwKWTMF7YG+hkiPyklYj3otHDXjQyyhkWa8xRCz9/IoVnIDktRvsHWHECs0xoeQHve
 lKNBTeXWc+D+gZcagoMtyjwSXUT69MZ9lOVw4SiFm3CuYTscNrv6BKe0+8lVcqRmj5+5yrVyk8s
 3AOF3s6YURlCYtlR/yHWWAWIkTUeb7PN8q3R+lwkG48BZ50U56cFvvmB/uMKQc3N0HOtlAbId7Y
 V2XoOdnwQZ3Q3mMCe98ZRUKOipQRpEzIjf/T+zKYVIT+dcxUL+o6wwFLeISK60CLsn1j7xn84/D
 BV1Xj5dG4/3ei4k5I+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060067

On Fri, Jul 31, 2026 at 11:52:16PM +0530, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> is restricted to use 0-600MB of IOVA space, while the pixel stream can
> address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | pixel stream addressable range (0 - 3.5 GB)               |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
> A single "iommus" property on the video-codec node puts every stream in
> one IOMMU domain sharing one IOVA allocator, so nothing keeps a
> non-pixel buffer inside the low 600 MB. Once an allocation lands below
> that boundary the hardware faults, which shows up as unhandled SMMU page
> faults and spontaneous reboots:
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> 
>  
> +  dma-ranges: true
> +
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 2

This would conflict with the 32-bit addressed Venus nodes (and it will
also break examples). So both should be just 'true'

>  
> +oneOf:
> +  - required:
> +      - iommus
> +  - required:
> +      - non-pixel
> +      - pixel

- #address-cells
- #size-cells
- dma-ranges

> +
>  additionalProperties: true
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
