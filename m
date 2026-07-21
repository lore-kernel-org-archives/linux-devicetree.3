Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EFE3B2D00
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 20:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784665861; cv=none; b=KsZonHaMOu5k32RHrdeOrbgrBCw6ylV0INFrOoONl3OagI4c73qsFSU+kwvz8FkwsmTdHBRKTQSo2ptNEdlSE33FHDKSIOZv3UzKtW5g/Pj4WPCgTCjP6gbZeEcUrvkn2nP+3+EdNxhbUZB+k9/6XbFRmHR/8X0CiMNdneG+m78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784665861; c=relaxed/simple;
	bh=lvPIUXGIpoD0xdJ4d2vEPOy2+3Mq17ewQ2XUHFf3Zi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4GcW7BLUKmODmhxuMllFbgt7Sy7zuDrhac731loMmp0aOty0fkDLKhSCW4fcFb3ZfMwPpamKj5snticBtDJF7DKm49IV7CuvUfc5iVGLNBGyTAuacb+5W3X5x+HZhVTaHbNjaHhQQBmKZeeHXKnOE/YwROnbahXZOtck50Eq20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EI+tEouW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bpV8xgP5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EI+tEouW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bpV8xgP5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2WN23439791
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 20:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SLL2gsqOQk0Xx1WlAHNqCLgB
	9g8VgdqsEj7V08KM8Lc=; b=EI+tEouWg/NStJL4RRi64ESClVJDNwhYaric4Qi/
	spdRPssiK0vIAqHXh0YUfcDaYE8xrQ32zzx4fqzPG00WCrOmcKJZZbY0W/sjLeq7
	GMOlYwuPjHWB08pL7h8DMh+UwYTPU+Q9GtRz4T2JlqwujdbpMO8YZqr4pW2WjCv1
	MOmkZ/0+ixh5PqMqVG4OWBKDynnZ4rRnhnKMGxVgYopfzVg9Ad4IKI5dWnPFx0RX
	Fw+H9a3TyGXl8Zz3mOvNcKPbvBNnoglGpaBNf0Rui2G2UJyvB1O2sgP0rQEeORYT
	TXBl9t8Mi/A9556vJaIoJj5i1ztvb19vBvjTLzG6E+spUA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nstxfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 20:30:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-526da7e3c9dso17003001cf.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 13:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784665858; x=1785270658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SLL2gsqOQk0Xx1WlAHNqCLgB9g8VgdqsEj7V08KM8Lc=;
        b=bpV8xgP5Aql89LqV3Gj4ofQ6ttigX37IdrXLbax44spUI22+IgKLAC2OnYn1p0LNAg
         yW+oiBnEmussBpiXVKchUA2yjfZ/XCJrZgbqGguN+tkMMoxPI6uMG/m5flJLGSWsXCv8
         IIOCheyUBYHzbFqaFSFmPAseu6UV7rQc6XfE0BzFDdpWtTkZe2kHbCl0nTVOF5apW/A4
         4mETTnZUEkQeOCaa8I3kuqnitIWwVYxlfiArHwBk9gkOV2NPVCDAznUgfjcwkvVd3thm
         j4psHsBhZnkwtLkqWvPpZr9v+AyBpPN5YCbL/vhj6bicO2UvTUsqOTYKI1DaXcHLVoP6
         xI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784665858; x=1785270658;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SLL2gsqOQk0Xx1WlAHNqCLgB9g8VgdqsEj7V08KM8Lc=;
        b=VyAsLZh4KuWXtmxiz0W8p0UGUdDOIx4x4PIQqnQLYoRaKwba7ggGeMzEEfdfDZzOJX
         GG2Btfm2oLfcLV+rcUosMNQJn3WHOujE33ChJ2TeF1ZqMeCjCO2k8dgrmWDu3SCbdui+
         8OEuOaUp75aQayH17mX/YwSCB62zl1ItqlYMyjvr1izjAO8R1J2wYeT1S9RfsJj3hpWS
         7VIXUmGcxq87JcXK6+YeG99wzJNN1sN7fDZlAvNbTJJiND3R3UCEsJCoyuyFNodsPQ3r
         mCzpZZHhV9YuOASC/SiPsNp/12VwqigiyKw9ufa3reLFriNX8B6rvRGes7eb6sLKj/O9
         wXsQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr5OJAxg2Y9PHB+tMsJWJ3qm69dMRMCyLtN5mvUNX/Stp/AHa6NloWN96813/e1u3wiOD9mv8WRLXgw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/UHxB555agKLGknvkkOb3TOtgP+KCHehJA7QBW6quLLFmOMGX
	83trpR184450t4BGkXUQn8brf8JlSIQYCRoOBW/uEMay6suQwEN5enhBdt/rBtZ14RKwPX2kGT4
	mgruC/ye8cg8MrRqyxQOSqF5klTce/WhYZ66CCfSFhyp+g7SIpgsWs25eYJDqEunp
X-Gm-Gg: AfdE7cljeuZI1zPYVpTJUQDlR3D+S/Kh3qZ/U9eS67NkmSBFDXQgP8WnDcrWAPEZzXy
	lJGj1t50zCT8rGKypVsIXpxJ5HIV219cPeXvqAkq2v0InbOawxA4+oGZaFGyxsKCWLeYmBSdqj/
	TLKEO/cH/dfRWQx/dNpo+P/soeUH0vNGnIYwLJ+5JCASlB/5mcxQiaYeBGJ9sU85JjA23AabNqo
	hUwcP0uiVBYYLM3H6C3FT/r47LkJOtWnbAVET+DWqZ7CJpf5eRnb2DAnRU40k8HOxzNkKMq/DUL
	t6cnkIqoR4g2/vk0/Q+SptmI6O2KFEKtwezGKVQUGcEJLtWoScit+G37amKj1l/hnj28ntc6CRK
	k8e6rWcP0SKfKD5mddSC9JlGRrA1tsyI267xazVIb7//a2bApwNPcImZMiQbpWcRW5MkhQbOcYe
	HB+dA99QtVqHpfVg==
X-Received: by 2002:a05:622a:1456:b0:51f:798:cf16 with SMTP id d75a77b69052e-5213e17e44bmr179982201cf.61.1784665858010;
        Tue, 21 Jul 2026 13:30:58 -0700 (PDT)
X-Received: by 2002:a05:622a:1456:b0:51f:798:cf16 with SMTP id d75a77b69052e-5213e17e44bmr179981751cf.61.1784665857577;
        Tue, 21 Jul 2026 13:30:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c09esm108437e87.2.2026.07.21.13.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 13:30:56 -0700 (PDT)
Date: Tue, 21 Jul 2026 23:30:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: Re: [PATCH v7 15/18] media: iris: Introduce buffer size calculations
 for AR50LT
Message-ID: <4yfgkaudmtwialwnne7ujx4ndfjvdn243l5mb3wz56ltqggln6@3ody6y5eyxfu>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-15-76af9dd4d1f6@oss.qualcomm.com>
 <b5c4f8d5-25c3-4e84-bba2-ab30e4e247ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5c4f8d5-25c3-4e84-bba2-ab30e4e247ab@oss.qualcomm.com>
X-Proofpoint-GUID: o-ENc3Jcgo0f9OLpK0TdVWBlKuK5bW6K
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIxMSBTYWx0ZWRfXwg7FlK9wJqXW
 nRMaDTN7SVe5bDoXt55vcEiLIWhQrXUbiO4bjva79dMpi48jlukWdnLE78tbbC8U8X3nkA57SCx
 3S1pD/5A6Hp0sHTfdXu845+Ar6sIu9w=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5fd703 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=_5KediVJeGQc1CAnrV0A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: o-ENc3Jcgo0f9OLpK0TdVWBlKuK5bW6K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIxMSBTYWx0ZWRfX5Gh7eqRYANiO
 YnziI9nSugV+tTyYgyj10icO51uuoiJo359jA8ohqBKp38xQJF3IOfcJ+7fkfJw5Bdv8UBKCWHe
 7exMbufp2piXEszLoz6LwXBrWtkJETcLX6c/gStdqiShr3wM8pahAsWAV2bABAAw5qY+7+t3/2p
 yfCtyQigY8fOg8n5zn20X8TE8k6s6iADufO7na40GnTMPPMQSCZ8cpABGolILNPspJyVsEeEQeq
 XGbeot4A1hvPcqI6dc3Q/d1Un151SP7T/Fd3Rs2dIUBSZDsgVoEcMAz0wxlN3I47sNdm2zDxrHj
 8TRk3zuph+HPEs/qMyY7uPoWhtXLIfaDk8JsuK21jgzLkmAH2Q6vJoDSe30SzmE6JNV8zkluWuO
 oi4rhC53FYz4bQ+iPvAwSpoBgop+DoDg2y107Fzbkp58b/6a+fRmMxO/oRG+yZhj7/yXiLoj7vG
 ltUTAkxZEI03DfpGb3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210211

On Tue, Jul 21, 2026 at 09:00:11PM +0530, Vikash Garodia wrote:
> 
> On 7/9/2026 7:12 PM, Dmitry Baryshkov wrote:
> > From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > 
> > Introduces AR50LT  buffer size calculation for both encoder and
> > decoder. Reuse the buffer size calculation which are common, while
> > adding the AR50LT specific ones separately.
> > 
> > Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 365 +++++++++++++++++++++
> >   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  37 +++
> >   2 files changed, 402 insertions(+)
> > 
> > +static inline
> > +u32 hfi_buffer_line_h265d_ar50lt(u32 frame_width, u32 frame_height)
> > +{
> > +	u32 size;
> > +
> > +	size = ALIGN(size_h265d_lb_fe_top_data_ar50lt(frame_width, frame_height), DMA_ALIGNMENT) +
> > +		ALIGN(size_h265d_lb_fe_top_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
> > +		ALIGN(size_h265d_lb_fe_left_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
> > +		ALIGN(size_h265d_lb_se_left_ctrl_ar50lt(frame_width, frame_height), DMA_ALIGNMENT) +
> > +		ALIGN(size_h265d_lb_se_top_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
> > +		ALIGN(size_h265d_lb_pe_top_data_ar50lt(frame_width, frame_height), DMA_ALIGNMENT) +
> > +		ALIGN(size_h265d_lb_vsp_top(frame_width, frame_height), DMA_ALIGNMENT) +
> > +		ALIGN(size_h265d_lb_vsp_left(frame_width, frame_height), DMA_ALIGNMENT) +
> > +		ALIGN(size_h265d_lb_recon_dma_metadata_wr(frame_width, frame_height), DMA_ALIGNMENT) * 4 +
> 
> WARNING: line length of 106 exceeds 100 columns
> #312: FILE: drivers/media/platform/qcom/iris/iris_vpu_buffer.c:587:
> +               ALIGN(size_h265d_lb_recon_dma_metadata_wr(frame_width,
> frame_height), DMA_ALIGNMENT) * 4 +

I'd prefer to keep it for readability.

> 
> > +		ALIGN(size_h265d_qp(frame_width, frame_height), DMA_ALIGNMENT);
> > +
> > +	return ALIGN(size, DMA_ALIGNMENT);
> > +}
> > +

-- 
With best wishes
Dmitry
