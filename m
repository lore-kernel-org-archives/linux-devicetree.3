Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749832;
	b=WfYedKUYfULQBqcI/n6kJUcFs15FMm0wKlNnPWBsprs7Jz8zuoPflt53tMrJYuMI8ecz
	 K6tzkBhZj0NQh5zj/HBsaF0Dm4Fek+2Qh6HJcVhaRRbYl2DxlrDkWblAkVjrN/Qo07cIz
	 wOJ/b+kER9UKeEeSCW0rtJKXUnXklW8xmehwPIxZ4rfCov/xS6qq2ohrsWCGUhyqi3kXd
	 VRgFa8EJVhDiiIMIXk4mBdcY+2v0mN/atsVQM6B/jL+cepDvTkhjTUsDnbPvcYvlt3jPz
	 S2qwmZRFn8ttSj+l4lY4IHgHjRN5qnkNSpF5haHGfgvQU/01HAMMdNZhxHqDPSp2mXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749832;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iOomS8sJJA+g1LuOJyNNfjwxlhWVKpv3aLO7udUuLI0=;
	b=GB82rXS/aaaC9IAj7O+riFmlsCMzrli+17UYfjy+F7NhPAy0crEgIGsWOP5MZK1rRqwk
	 6rkGFb2C96q0u9ptg7RX2/aunlZp9aR1R0zG/gceU1VNqr/gDfqHHNFn6UzGOUH+B4QT4
	 44ZtXZ/QXVQLnsfQmzXLrmeVE7PMoUklMeNS5nowRt0X/8HM72ml8iQcEzGWdH3SGpq9K
	 po0znN5ooOYSpn3rpZefmHTdNVdVmzB7sUik/8kgb12IMSmG2GgkvRQ140EFE+YuxXeX/
	 inuFE0WBQkwUVV4ohUjMey+G1dBZZVY+j0zFMaeAtsV+A1LO9O92RgxMjEBQiFXKKFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mLGHNjZ7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R63aZJPA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7587A606A31A
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7587A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mLGHNjZ7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R63aZJPA
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FO6w1552878
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iOomS8sJJA+g1LuOJyNNfjwxlhWVKpv3aLO7udUuLI0=; b=mLGHNjZ7FQaMcyGK
	8pqEg/gVX+Wy4nm7/BRD3lOKUrlxq2WiiPV8ys/NiunCPYvy/Mn9sPrrffm6giKK
	HnAyiR4XJTPFLMe8e2ghwsz6S4aWt/EEf2yT+LjaC3XTJr744+PminRBS5VeEbtK
	vvGYEOmcfmNJtMZtfXLRuigFeVUJPCvdJpiYXZR2qw97rlVei8Ln+fRx6k3BeXg+
	nyqPFlZiQSYWT1w6QnToNc6r5M+YN2QzU9aT/HATeKmqnaXDzg0VJtt/n2IBxU6y
	8CNcYSmIJkgtGv8Q584mGiBbc3DCwIP6FNHxWCQi2W7fA16UEgB90CojchPgKq0o
	AZG4Xw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtu4d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:03:50 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5caeeb345c7so14948e0c.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 03:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792749830; x=1793354630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iOomS8sJJA+g1LuOJyNNfjwxlhWVKpv3aLO7udUuLI0=;
        b=R63aZJPALpIGd2XJtTQYWdxWBctfwSq7+ZTYIbb3C/FErv4w1Xark+Jrv6fZKTv4Kg
         /0kuAVgUkmjT1xoh90WbHA6UGEo8ATHcUEMMkgeYnNub0CqddrKynNzxuWhdkrbW9Egh
         kUrVrsGE7LlRSVK5yz3vC3Oq/mBYkps3d4divtAXo1h09PMxrBgUnCz8orf2BjjWHedg
         gMchj/VXuC03/BsDIVHB1ZyMB3Ev7nE91lEC+WkoAj2LjI1XU4Az1P2q1nzWbLna5rzM
         vh7NeNzeKG2NgQ8pWLP1dtnXEsakRegDKY0gOW96ha47XaoMzucOqgDlPM+uVWc7y7x0
         aZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749830; x=1793354630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOomS8sJJA+g1LuOJyNNfjwxlhWVKpv3aLO7udUuLI0=;
        b=mrBICjdpQuZwOQr3494tad78SPEcsAMQ730GLS5yql4X0ZZyrEQrBnESNFLN5dhJ67
         mx4KjM4Vu73YoKvCm8ZaiWgf246/9p+o3/TPKCUIYcSeMVxxT3heuzgBO6KJB+S3W+TI
         8nkT0fTrTvarKI/r4Jt1OCaRp68B0MWhW9oD/7Vo4BFVVNwT/qSoRiG9UzbgLvt+bDw1
         B8iMPL8VuIzRRcFTZ7gMr3tcIiTJBF3xF6koqMnuEMjXUKvYwtJqUaGx7KrwKuD/nXE2
         9j991SDZ3P6Y8opc7Z9ki96NxhfMN+hRajyOM+6b13EDUnTRPrqnMhHPt0yhoMYqRao7
         2nUw==
X-Forwarded-Encrypted: i=1; AKwUvBx/hc55Xx8J8NMOuCe7wpeMCpkruLdV5c9//kCG8edwWjf9TbV5DGn+m5r5uy7xipkLLzbYNauouJj/@vger.kernel.org
X-Gm-Message-State: AFq9FYLMe5LbNyES4TXEfcwnKyf+QFXx2COX0kuTMfJd7fnoEFz2E0rg
	pO1hq7S/nASZOI3L9iRdZX3FoMKj2sYpZL2MxnOwCne9TmUmNSrkBUgUNRj+sa1fFze3ftI2Gb3
	GtzKK9yKC7l1HcFBo2iO7EaJfuBjk11R+6em0dfmHnA4qimuKnk/a+nerR1eDPr2kTTjSs+Fn
X-Gm-Gg: AYBFou0qxSkRqo1CYOnujny/hN9EbsJ/WuruJ1L+hpzpe6rvw9Q8Otr/9+M0lM0NjEH
	Co3lTQkFzlfDQ3IYhkv+9cpdH6QviAE0WSiYYjaifXch7bhUpqaM4muTBVvgk1acoOj/4ZB6Qc1
	+x6hr7lIUJP1HBPYYoSJi6dgrWjFhOwsBxHxx11khgK64sfzvVooedliHIVsbnZflONVUQQMC3B
	ukYKN7A4D/bfqGN8sdu0JLZ/1yZqCkPqO0LYZf0pxmuOVsqXE0C7eiq85dACotsA/l1+vzhge7C
	6OUYaKD36rc9KNCi3lKwMcQ8HxdAcyDIcg4wfyPdaQJM0p95s0RQ6duL5Z9z0R4Hq/AJqc6VGSh
	vH9muIH6Gc2qxem/1fZJGkQ==
X-Received: by 2002:a05:6102:8648:10b0:7cc:22a0:de89 with SMTP id ada2fe7eead31-7ccc3313669mr512081137.3.1792749829643;
        Fri, 23 Oct 2026 03:03:49 -0700 (PDT)
X-Received: by 2002:a05:6102:8648:10b0:7cc:22a0:de89 with SMTP id ada2fe7eead31-7ccc3313669mr512050137.3.1792749829147;
        Fri, 23 Oct 2026 03:03:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cfa594sm84380366b.80.2026.10.23.03.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:03:48 -0700 (PDT)
Message-ID: <70d5ef70-00c7-4265-b2aa-3a784d4f0d1a@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:03:44 +0200
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
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261023-msm_gdsc2-v4-0-40b6a71d4e3f@oss.qualcomm.com>
 <20261023-msm_gdsc2-v4-3-40b6a71d4e3f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023-msm_gdsc2-v4-3-40b6a71d4e3f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb3106 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=6bGC0mKcvBxu2wzPFmMA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: F2t3j_fuev4ErPD45M1e8QB_ifpNgKyv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX33V0Vp2tCs7S
 Ty+ohdzTMfo2ZkOrvYRN0uBD4RZfZompSME7NEF+PPV5Mh3cXjVPfzseyQdwKYC/Oxd3Hbsy1iQ
 qZHuzxKne+LcSqk8RSTmjih3yLJMW//0qryOGTTZJI3dtJPGjYIkGVJ0+Mp3a/2AH5uV8tZmdlQ
 HJSq5mqOXLlWjCWv3lYkNjhM6gwVVTg8akqvdaaJdIu4xKu2ditQng9W1VVFPfjbEOKe+2JrhRF
 dPFxD/pXsTNWKWxLUSosNrJOt8esb60zsD+4h/i4XF8PnzZ2PoNBH3Rkxek2Gqms38RNEeonvpH
 sWyxkAVXY0/KF/W+N+fPBt3IMaLKu9bcxv6DZSXo93Pbgg9hlIqDpPVy7EgsXKekWKOsTSpc2Eq
 jPdMKOJl0rIuK0zgaPJ3FFwZL0aOdRtvm239S1QWF0jpJIfgqp8SvYL8+IU584qrkEyAhgWtnhO
 /0yQ9dH4CTDXpj8bmEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX9xoscPJoTEDp
 L0TXgatOb4TcZJfnNQFExxPC8/+pDVveX2uBi7DpxfPGhyW5DvRXGULB1xcQPfqZbfJz3aK4vP+
 FzNXpxtp/4vCXtGWOIAdyX/clfCsxFQ=
X-Proofpoint-ORIG-GUID: F2t3j_fuev4ErPD45M1e8QB_ifpNgKyv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230039

On 10/23/26 10:13 AM, Yongxing Mou wrote:
> The INT2 GDSC on Kaanapali (SM8850) powers the VIG2, VIG3 and DMA5
> source pipes. Without enabling it, these pipes remain inaccessible.
> 
> The DPU is supplied by both CORE and INT2, so describe both GDSCs as
> its power domains rather than attaching the DPU directly to their
> parent MMCX domain.
> 
> Keep CORE attached to the parent MDSS device because it also supplies
> shared MDSS hardware outside the DPU.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
