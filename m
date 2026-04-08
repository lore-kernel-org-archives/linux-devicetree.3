Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FFA2D29C8
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 09:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775640193; cv=none; b=aG/4tpPEFAhXjR/8ihSpBiKTB+5Rr4IXCOoGPa6R5n0zSyM4FEiPBVu5smQdkljGXC2f8MxIBWy7n0ozcFz/BCDGmCgP8jTlV4sli7PLeyKjDz+kb9L5Sf9S2QbAIHsNHOSMf86UMsKpvSHLwDf5w3LfbjHcjXkhIuv6DMKMyXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775640193; c=relaxed/simple;
	bh=OciCGuYKPx0OmNLbYq5+8PSeZaGEhkU8BuyuRxsEWzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZXpJn6HeCVMsu5fq3dt3DjoVy0Of2semq3WbQmc8Kmw4TvFgNnfvbI4l4PosVB/9CSNXw1ZC9b35EGcn8o+Dy9nC3ueVk21hskBZAQsCCG9f24u1n/g0KY/v8KRQYaGL+R3RXXcphN64ixW2ihDAubWSlXHdhwiaf3PFV7vc6SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JfkGQWWM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qi/QG2M5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JfkGQWWM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qi/QG2M5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6388RcaK1795453
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 09:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KiZ60Bm5/wNkvNavKwZJumFtEUHbNYllnqbCkPd5EZk=; b=JfkGQWWM5tU5X0si
	qJtNVBmFm5gWTmauZcqxl4AdRTTvEkbmZ4/2uBdw5OZA84f6L9JKJF88t/lRLAnH
	z/vI8ZB6YooAS7ffr/vZWN/7a6FtCnW7HGqs6w040H/74RaEdD29JILnh0mNf9yd
	ooIcvS8/lQwI5df0g2B16Ec0tLJRuXNxicXXOcjFovgfFJ1mw0SGBOqTL+NyVDUP
	0Q9pgeNXRmB07CDXOodWqu7BMmB2cp7ZNvWJf9VWoVF2Srg3oz6c+UwOgsbpt6fo
	UFLpFmOnh8Ue6rXfGma7zmKL+gJmmaZR4XYd7oAjGm46YAhawl8GGrItAXKUiKOl
	YoCKDA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd51dbday-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 09:23:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89f548d0872so20305596d6.3
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 02:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775640189; x=1776244989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KiZ60Bm5/wNkvNavKwZJumFtEUHbNYllnqbCkPd5EZk=;
        b=Qi/QG2M5HtblUnuvL/Y761Btrtc/BSDeMv0hLWEs4GzbnJl4C1L/T7qKCCoUZaGRew
         PS54OgdMBGPcdFkFbL2PulfzY/GbJ/Pa+t3djcn1dSTFKSV9a6CrQOihrjPvx5K3L2z5
         b5lu1DLz2mqYU5qyFVnCGBkiTa0afbzyIAMjqNhUy7ACrDE55ensSxklJF7h5VvcXNsi
         dII/fDHYQpldN4atnbrZ+Eq7Uoo2n4aCPsIFAW+3caQVrtNhwk9Lbdy8L7hqF6g96g8T
         D2pWvLwDDucwoeHW7Fh3fY3hEp6yHBs3ft3Zrjy4bVJ57fZ0NZYgPuUy7dNtn5DqriOu
         ZyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775640189; x=1776244989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KiZ60Bm5/wNkvNavKwZJumFtEUHbNYllnqbCkPd5EZk=;
        b=fYsIDLypgCKtRI2UZrN7y30z+OkZDEaDt+aovp0p9z+pi902jNP3mTWqNzwlgaUXJA
         4Vs7Y7dvll/Cg2yl9yAOdlxL4Rseef5U/PeuCSDQzvklKlWQotqVx9htxVCyss2VJ/Cp
         tiF6O/016y9zGP3hSlQ8tv9KLlrgYQ4tm3lK+omtthod7tv4pohEahbY4w9wBhbU4p3F
         Btn5reUKWUqXqy4slwwZjvfcCR6TXIW0fabyh/ieFD0TVkwSWXTPiuBfNKzlNyEcNKg5
         yZHVcQNPUFPm7PoF9G1QXmgvyT4Nk5p7PGbMDE+Q569mUsozidkBK6mN6MTfQTmKZqTd
         htyw==
X-Forwarded-Encrypted: i=1; AJvYcCVxmSb2dEWVnwEdgq1Rn+1E9Mdqst7AZ1OyAvRdt5s03LYvu+G45ifj0LRLCoS/Tqhl+LJ+t7eSSKo/@vger.kernel.org
X-Gm-Message-State: AOJu0YzmRxDS97kluYTh5aWyZ5FoUcOF96Wjy+2Ph7yK3pbWM+PGi/gV
	IFARkG/5hItJeS5f2FZBz1Uk1KkkZtEyoOporElmdPdpYXSBwAqH++MpMn6tOx7m1XQJ6+t/Cwu
	USc4o46NspwNDAfMONFVZy1n4fTHWFg+T6mRIPXUxPRO2LqjIuYOFKjCG6ULzYok8
X-Gm-Gg: AeBDieu1sRQF0ETErB+D3g3EejYScYl5v+ZNu7yH7rG/M907UDKyGn5Slrfxl/Y5hl7
	zqLNL93h/MupyqgrlEdLpJx+72u6utwVk2wr7yzDKTpdaXX342JVV3Wo58ze51qvXj5ThM7SF+s
	SGtYhFyiCeSQPJxtQgI4MwttJSYD3cJFfiLj5yw7yzpcwq556D+lAdGZnBjWWQO8SHZZ7Z0ufBM
	UgW8WBH/74aPu+YZ5bDwvAtroA5mId5yESkPzde1ZBFnBPcNePLxuxn2/BBf6yS7CEX9oLZyY8W
	paPYklQ4QwKtnxYoHXprbwFUizmQp9vqFa07mmf+8cQwzPBcmZ5//UwwmZLx1rCmGwBmlIWVG6p
	JCi1IwRyhhm59G6TJSVkftY4myrp70x3N86d9Lncod0gQh73+EsL0U41ds1Ws9zPxlPqKRYA7/1
	9gwRU=
X-Received: by 2002:a05:622a:13cc:b0:50d:9138:3322 with SMTP id d75a77b69052e-50db0327a7bmr32414171cf.7.1775640189351;
        Wed, 08 Apr 2026 02:23:09 -0700 (PDT)
X-Received: by 2002:a05:622a:13cc:b0:50d:9138:3322 with SMTP id d75a77b69052e-50db0327a7bmr32413901cf.7.1775640188928;
        Wed, 08 Apr 2026 02:23:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff130fsm630996766b.47.2026.04.08.02.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:23:08 -0700 (PDT)
Message-ID: <0dce2f2e-2671-46f4-b78f-3a6ecb068311@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:23:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/4] arm64: dts: qcom: Add GPU support for Glymur
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
 <20260405-glymur-gpu-dt-v1-3-2135eb11c562@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260405-glymur-gpu-dt-v1-3-2135eb11c562@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4p2I5_frKi6EwkqYlpxzC_aG29o28ahW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NSBTYWx0ZWRfX6xIfvvSelzes
 XSaa0gmetZt/5Eba/kicsxWQ3CWNaNVLnGFfXZHSpmEhcQEd13kSg/PIQQDMLlZpNNGhFRTeAkP
 emjuqW71Q1zlHyM3l2eOvFQf95SEdUlVU6aXb2KTTC/acZ8IF897IaCwotbSZVnTMrgbKog5BLM
 hk7uxMHXM7kWKk1aJ38+WYtJMdmQlNw7+oXoHbNcXaMKrnDnf5yMAUqU424MGBOfXpd++boJdFL
 Rih4Te8L58/izsYT3iSgE9pym4ZLd/DBv4iKLxTxiRvA7mIJ17zGC6Diuf7hkcuqgr0Ozd3jUHS
 08Lys6w6ShbvLBxwmS0S2MZKo69AXj8gN5rrLgxxcuptv2IgeAD/ISMk/6wVJHElh5bQ5mWk5qz
 NTt2ypPWxehaB6cE4WvCp0aT/DelBXG0HWQWAAl87JpUPDIrwwWgkclS2szskL39OkqFOT4QuOG
 CKFqSo9JEt3y+dhUoOQ==
X-Authority-Analysis: v=2.4 cv=AcaB2XXG c=1 sm=1 tr=0 ts=69d61e7e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rDmyxzWSWjEmya7nUckA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 4p2I5_frKi6EwkqYlpxzC_aG29o28ahW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080085

On 4/4/26 11:03 PM, Akhil P Oommen wrote:
> The Adreno X2 series GPU present in Glymur SoC belongs to the A8x
> family. It is a new HW IP with architectural improvements as well
> as different set of hw configs like GMEM, num SPs, Caches sizes etc.
> 
> Add the GPU and GMU nodes to describe this hardware.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +			gpu_zap_shader: zap-shader {
> +				status = "disabled";
> +				memory-region = <&gpu_microcode_mem>;
> +			};

My understanding is that we may drop this

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
