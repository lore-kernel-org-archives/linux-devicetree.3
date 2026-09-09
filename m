Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDD7321F5F
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 19:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788980855; cv=none; b=uqx+/p1Y2fRkX6AnJUxmLdwdS2EIsIlUgQU80DLl1j5nMuQMAUTAPZdBYxWpQzAjBMC86cDHWQ9svsUuTZ1h2i3SKy2vOB4hw6rJqgi666MiFp/+ipm2UGaQljK7/e+Il1ofBqXp6siu+4/XyRALQyt9H84bogQpFImDZXYS/Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788980855; c=relaxed/simple;
	bh=W8MJq2ugcAxNBREyuEwjDGFxF4U27Ey4yhFzDVrZm6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FLHCDjWE3fw5+LxNASHz5HcL4S84arNBKJCh3RyGNPIFcCdilyEPaXAXeIbLtuftGrt0wtuXdy65nkdVi2wh6OfHasGW/XfBg4e4qdUgBUHaGlnKp6eOu5qfOAc4sX90kTag96c0LVMMb3nL5CnuY40M6wvNN3zj3x8xi73kQ7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YF/nozWl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MT8rNaAV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YF/nozWl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MT8rNaAV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689IgJSO2147071
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 19:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9plG6Wp3KDjg+jZPLptdEfry
	IUfYFr/lYfEhcs+JKgA=; b=YF/nozWlQXvL3b+f6IiwTg8uZf6osWcyYjjK+jd9
	7MsjId3ivpfa/c/gRS153RaIQbOoikwHRDqLbPIGggWH90AcrIE16bjm1m6wfOU7
	PL8lVwlrF7gTw0n/7OfPg6ve+0PcvEKNRKnH5K88PB2GJoXCRfgwPDf+8ElFxEA7
	sC3g2jSE/wgq0tLCuN7voNiCaO07FFq013CUGynKHqFx93ATtAQYXt6GoLuTcwTH
	Yftfwm2HtMaSj2r4eYTWMEsUFLPcBnG+lyrNXRZ2UKf3QeSZ7nWxXK8fObt39IL8
	Vf8M/AHcDPaReV3/HFtB5ep7EOgAWB4rBL9ue/70DPMq9A==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfg6ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 19:07:32 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9806756ea40so3927836241.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 12:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788980852; x=1789585652; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9plG6Wp3KDjg+jZPLptdEfryIUfYFr/lYfEhcs+JKgA=;
        b=MT8rNaAVgEpdyQD8Ley/3RlmC6lLbBuhxMkKSDza40Bx/0xIg/lYbavK0rXdC+Zra5
         kJnWX9XFSstcCDjUkp13H3MjSdVcirzt8SIR2WvbV3yRWdcjH+KlFo1oyitp2E1Ql7US
         qv3FhZeTazvlu7lPhsPxzfYcS06X6hFX/+vMecDnswWrQzJQKQojINmD83apWuOAvsQM
         HOMDW/dBOmHX51J384opgjyHE09KXHLSUxt3LxY9uZ0bCOGaeb48BDZopv7wplnyER15
         4fHa7iP1p26z+F4zOt7ngwIMZOCzPQWv4a+HN9h0W6ZCvGtKKuLoHfHdLINyRFfkFUpX
         ir5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788980852; x=1789585652;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9plG6Wp3KDjg+jZPLptdEfryIUfYFr/lYfEhcs+JKgA=;
        b=co60Xeqcgb3ZjdZSNyGokU5Q9xXHuA1sMZmjVyhoLxstU8xMpgYhUbxui48EurEhLC
         fb9cuWr/DjwkJn3nyNZN74AVvXy/GJiIK/fiNSf6942MhoHv+I7TiVs02S2q404+5pkg
         OtEIWwwQHX2CHGDU0j+qctIbPrSHNbr7Y48l9l/ybOkJX64egVPRHHYKf+s0HhHbRP+T
         6PF6ODV4d2utZvF4eKfCPwkX39cty4Z5GXal1k0VgPVeiDlkViiXGBb4L2XKmARTlAMA
         +IvF6WIEr1nkjvVCOcSpV4osDtBl8mri7H6IiM/4nnztJzby1ysAaMuy8Xi7ixy/xhM+
         uNfg==
X-Forwarded-Encrypted: i=1; AKwUvBxZn/8HS1sdWO0H879cE4bj4b7kwyyFj86DyRzZLsCQAUP3yDtLxf6MaMZBnNxmVnAOI2W0gFbVG4Xh@vger.kernel.org
X-Gm-Message-State: AFuF++ksI4Lkcw8RjVxi3cRKYK6BdQQbTqoKJlbzXNa3BgmpG+Q/e+ub
	eBRh2hosByT4ct077FdCw7/K5EmFB+U6FCr4dYfp0lK6ga1khyx+Dgh+A+3nzymF0Ia4m7YVQ1T
	+uPZn3Jo/a/6tX71HDTqH1PzCN/AOpi5SDp/GHzieIHTvsnG6vSbtkgqJ8dZn13cT
X-Gm-Gg: AYBFou2v8ijue5L/i1jzq6YEEZLDuQJUIxa0kSuHgCh0Vo3ATSzE3MsILEXARVE6AAB
	hHP1JfjicJ6CkcFQT12WHe8TcGgyxGgG7TID+vvDA0GWSrbb60cs6uzkQG8Ops+r3nROXNj8Gm0
	pyAem8bnlD1GvENFDptroQXIiHcljcV5uSEsPF05sEORp6+clcrkyf5g28eHoRijKpaZ+u6NAKc
	gAMPjcSdFrcW1kYhV/r3Cf8QGuLfF/HrLtK8U1bFbG5jTVqzdASnlAoUDJkHUbsxWmaXWJn48t7
	mKrjQgIX7/jrn0ZzHQ/sH8zkQh68VWqo2S2x7PuBOCeRRZRBnYzfbTWA+D+gDaR12hbONw97DPT
	axejps7LP7NmjFOrVrcm7KDsk6xkX3wpBvcFuMTv55K0tSNV6xG8mJ2QqnsbEYtsXWvg9m7s2VO
	mhC/b8ClyStuyG
X-Received: by 2002:a05:6102:e0d:b0:778:636c:71cb with SMTP id ada2fe7eead31-78a4a9c40c1mr19493169137.10.1788980852403;
        Wed, 09 Sep 2026 12:07:32 -0700 (PDT)
X-Received: by 2002:a05:6102:e0d:b0:778:636c:71cb with SMTP id ada2fe7eead31-78a4a9c40c1mr19493136137.10.1788980851937;
        Wed, 09 Sep 2026 12:07:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b899e5612bsm96412e87.40.2026.09.09.12.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:07:30 -0700 (PDT)
Date: Wed, 9 Sep 2026 22:07:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jan Paszkowski <jan.m.paszkowski@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, marijn.suijten@somainline.org
Subject: Re: [PATCH 1/1] arm64: dts: qcom: sm8350-sony-xperia-sagami: enable
 UFS
Message-ID: <co6oc5oag4olewddatuelkma6myc7wj2t7isulumuqjntgeiit@ncjc4anjesvq>
References: <20260909172421.33593-1-jan.m.paszkowski@gmail.com>
 <20260909172421.33593-2-jan.m.paszkowski@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909172421.33593-2-jan.m.paszkowski@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIxMyBTYWx0ZWRfX/XKNmrzuCU5P
 K5ftzs7E5Z5mfe8VvWC7/OWZuff7/ty+m7U6bB2d802LTEDLy67M5ffhfc0Km3BO5GqRzTYBH1q
 avrlEnESKGPLGrX4f8pr546d80nV6ag=
X-Proofpoint-ORIG-GUID: G2fu6SOS9TaZ0TPPmcWNdujfsce10lXK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIxMyBTYWx0ZWRfXyDVEVZD+Kyal
 +DLmfKihq/oDc33omjlDx3jotGYSWYoq73P+tp6BlmUB+sGgC0dSD/srGQhQGH0zwzJNYTiAthm
 D38/TpHyYJ/lBuY3jfLVLFdsodpl8XVVJEXAI7T4IkDmgnmZD3EhbTBJGhfgmz5G8waFVqlHy69
 /wRn62yACvmsv+VJnJQ7kZDMA3gCmi6IjSk4MIONix1l+RrzCuUQoAmk3ITPYC0415f5MU2g457
 nvmYQEPYOq3lM2tmJJzzaO6p19IZbPgFZQDzPmX+Ta558AewgSBwTalcGjocesW8WlakZQXJoFC
 gz5rqWtpUcmQs83mQPr/hUXvcMWLwag48kGcq3qw6drpdf+0vJ4pVineH0nYo/tZodMvaw+a66J
 1HNWaKgRIckWaAnX/6+YteSJTb6/PC9e7M8k+MxcWNnNg1UcR+fCbQEtLG3jYJljatJq/qiKZcB
 VBvoD6z4n31k46UoVoA==
X-Authority-Analysis: v=2.4 cv=H5pOUOYi c=1 sm=1 tr=0 ts=6aa1ae75 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=ppofqrV_mbaKQxakh5YA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: G2fu6SOS9TaZ0TPPmcWNdujfsce10lXK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609090213

On Wed, Sep 09, 2026 at 07:13:12PM +0200, Jan Paszkowski wrote:
> The UFS bug that haunted the Sony devices seems to be gone this
> generation. This patch enables it for the ability to use internal
> storage.
> 
> Signed-off-by: Jan Paszkowski <jan.m.paszkowski@gmail.com>
> ---
>  .../dts/qcom/sm8350-sony-xperia-sagami.dtsi     | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
> index 4b62ee50da7b..969c8cb31df9 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
> @@ -893,9 +893,20 @@ sdc2_card_det_sleep: sd-card-det-sleep-state {
>  	};
>  };
>  
> -/* BIG WARNING! DO NOT TOUCH UFS, YOUR DEVICE WILL DIE! */

You were brave.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
