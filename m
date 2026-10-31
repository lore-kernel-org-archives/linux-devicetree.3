Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793483274;
	b=lYRwe9n5AjcI/TVO3l14sX5t3ospNBF7IctJ0O2m1N3Yce+kARowHDgxHL/LEZg2A5TM
	 Eqr4aUrI6CaJpomG+fyp45pPcS5eESgzcSB/wbas3w6hoXR7zTnaLxPGH6/rGlXKRLV6B
	 yRxR3+XYw022cWouZaOJVXRSP+jo+1JZV1iuO0khkTSvokQzXuvzV5sVe8njp026ePtZk
	 tyNVtuCf0IsSxl7HD81tF3uU6+bxl+QpJco9xKLfjiekzTnBwvxYH9cAC8LmensW7XqAy
	 517Nye6cK22QVSSaREfleQwwmaDwBD9OJNnWG6I6FLYWmee2rDOZP4ET5ET/mVk/9PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793483274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UqYmn+dWGZ+bizn6nanBskc0M3ILH51untQXz8qg9Lw=;
	b=cVbAEJIv7gFMHYGbGaXamu3fU11uFWwbuVSRWlH4xL/8+YqUkj9P6a54qfTSH+hE/dGW
	 i+S5Ddud3VqbYV66MSU6X1qCUSJiDMibdByxLFp+YDQwmaOvdOqJ9FQI6jUeIAyiMwvq9
	 //rgbzbHe6LmEvjHYik5xTIbLFmYdsOaVycDXmXsFmjI3rqJ8mI7LIuUTge/HnK2T1GdW
	 CbnsGuvAoluWf1BzuFE8EYmxK1eD+w/0sMZug2/J3T8t7dUBOsvahgQzt+yIOuhN7jX7O
	 ujU4kIk+1FEjLle0jlqK5x82Q615DyyQ6b4EHbwgLY0f/OSIGgdaN/tU7SA1kycrGzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M2SSwTqG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LjBrbGBJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E775606A31C
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 21:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E775606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M2SSwTqG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LjBrbGBJ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJF1ga3976267
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 21:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UqYmn+dWGZ+bizn6nanBskc0
	M3ILH51untQXz8qg9Lw=; b=M2SSwTqGeuA0H/yPvVtef+Mp8xkHwwFekiHn0kBD
	IXkY8io9I7OOYrQNJc9veFLHQb/MO5gVqbJ5k0W/pdOnBUfT/j1tjPj2FdmaR+X6
	VvCxH97ZunhjVXdQFnvieF2sLRVVX/hTfOBcMkH3nuOVxn4QgzIJt1xrERdxXyOs
	03MMKpdvcPhhoWPCgvmJS4h8+xe0kGrSxOJ+Dix7JzCr/EMKLx78H0/zKj8ugeEb
	yCzE9/SlZ2sSogLTZlqalPlDO1WmzEuIcurm/8MOhU4MpCXTNVh6WJtR81AWSksU
	PBQuRM6eem+E2fV3GqzAYiYK4JgrlP9tWYQs3mYgU2zMVw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rt8gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 21:47:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f13c143c8so340073785a.3
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793483272; x=1794088072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UqYmn+dWGZ+bizn6nanBskc0M3ILH51untQXz8qg9Lw=;
        b=LjBrbGBJE+MS6r5K3/JcH4yrxJaBRxVBEF0oxUcYe8GCIkxb45rQ6JHlhkFKjZDL5o
         ytEuLWQ/ZHGpcQr/j7ymTfjwMM4pIwSnoTFTpfQW/76wPKTUC0OpByUpG9NPNfUPF1u0
         5fLQXFlBpDTrzi6azjEJxe84rtkOq6Vq1KttsoMzvCueRizoHxV9F6sASUJK9aTFgmlI
         sO6/WsOO1Al7I0qpkDfD0bExraem0jyUJdZITNaN/AHgCfz065F9gTab/U3T7hYVA2RE
         NqtY2gxowlCDfOPVHKZhqSo6WyCrZqVByrQN4Fkbo1ROqenHPwMUlwbeh7LMmDITGgVu
         /qFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793483272; x=1794088072;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UqYmn+dWGZ+bizn6nanBskc0M3ILH51untQXz8qg9Lw=;
        b=lM5UuOIXBBS45J13COVzaGn4lrdinbaOQ3KScc99iL3/cr/uYQrInZlE5lzE32axEC
         BwhpKMr0EN0YVElThfhcYHEQD/4X+FZNUNkvUu/jZ9HUd1se4fVKYOLAcQ1wuGN9pgfN
         o1nlMI3jSFWyxZE+4ftnCsMah+f6ujQyHdsz2q47CVIytx7cz2QmKzAPWjasljem0cnu
         pkEOGt9ZiCLCzX05PUB9kNo6DSCs50911dvO1Z7l7GhORel48UqyiDcSw9mThI1RhFxJ
         IBarl03mGl6ZtenkMRmX91WYINZ47DUkRENe+DiiURRDyUCV1dJps4Ia28WgzoQsS5uH
         pxUg==
X-Forwarded-Encrypted: i=1; AKwUvBzShUrkRkwIZmHStz3hj1pwHujtH9h3+gnCpb7PxPow+KM3LRqTEkPy94yYqzjulBIUlyWQq1dKkmeT@vger.kernel.org
X-Gm-Message-State: AFq9FYKlinZl4bUf7WnPnm/6GF0bHB4k+/jtsMvA/TautuJllhQKZZwG
	OtRr7paN15e8jAxwzdXueglkRo3EIZocpwEDJuVkxem0iAb41eVtmpSXyNBB8yAHCqyjYuJLASR
	sF9HBjope2eHVhhQ5EMbLFhfNHkhOuEHvC+s63GBnDxz0X8eYMrd9t9ZQv117YDOK
X-Gm-Gg: AYBFou1QbKNh6Cs9K7BkcGQBFZaxpq0/hnRSGc4yGLuoKBWxXbDX61RvpAaEzt7nTrH
	vcCWg/7FlxShJ/y9TpxvFOCGr/PW+yfMIqKBZDgX8chJJY3IJdRu7/UIuehixNxd2fRRmgFf/Kv
	1RCoi8Uu9zbuwGU1zBNU26UKFtk65ktIP66oFm286AVeET6awF+BfZHPdRgE/P41bMqIs+PLqlt
	v7cFY7RtaEpHYcP9PBcVjQKwdi1Xtq03SoVrX16AaOhD2F6rNiPGmG/9y15Xd9I/NZVn/Cguam2
	4Ef+3uhvxiLDRi6nYoiaf27AR25nWALpXao8NAUOwlEhwZfDKzVQjqDaMBW4pk3MatqfkoWT4cw
	fO+LrRixo4TBSEmUnfEUcw5y3aWfvnXcWFRIL/5F8xT/tiQyQPKz7e0t2AArP/EPAuZA5LsWLHq
	KnN702/5b9Ktb7h0bZucMAvvRKevJ0Y5N4y+ka2DhdXBy7ED6cCLEwPWrIfJLs0Q==
X-Received: by 2002:a05:620a:28c7:b0:93b:d7a3:45cc with SMTP id af79cd13be357-9442178def2mr985863585a.53.1793483271735;
        Sat, 31 Oct 2026 14:47:51 -0700 (PDT)
X-Received: by 2002:a05:620a:28c7:b0:93b:d7a3:45cc with SMTP id af79cd13be357-9442178def2mr985860485a.53.1793483271221;
        Sat, 31 Oct 2026 14:47:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04edd72sm758554e87.1.2026.10.31.14.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:47:48 -0700 (PDT)
Date: Sat, 31 Oct 2026 23:47:47 +0200
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
Subject: Re: [PATCH v2 2/3] drm/msm/mdss: reset all block resets described in
 DT
Message-ID: <odog4t5j3y7j4tatqsiywfj27iufeazkzp3vtfvzce2knct25n@ephs3ngmt2i6>
References: <20261029123238.29877-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261029123238.29877-3-xiaqinghuan@mail.ustc.edu.cn>
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
In-Reply-To: <20261029123238.29877-3-xiaqinghuan@mail.ustc.edu.cn>
X-Proofpoint-ORIG-GUID: 0B4CbKFAX7_alh50ym97W2S3mi14nYhw
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae66208 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=XGdKMLjMlLx_IEht72YA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfX2TyzJgIXnxrJ
 FE9/IX66guu9b220+I+8ZJrUE5kLHFC+LujEH0B8FDH7OgCMUyTyLnfWFZTDh13i2swNeTPF1ts
 G1U2a+LoJJSfxth+JqpsydMJaQ0wcr0=
X-Proofpoint-GUID: 0B4CbKFAX7_alh50ym97W2S3mi14nYhw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfX1MOCijZBlmzu
 3i0kzaH695kE/gb/UmZcnVSmga9M8g2cLuTq2DjiTfN702+N82KUWciV2XfWhQJMRWa7d9JXoZg
 QF35RO6wx06oLuo8RCDOcbCj73+bn3bJf9gUDO+HjHqw6MQdntAp8RKO3fmAR2KvEND4K1bS/q9
 2nGMLGY97Y4mJhF2ICDbf2HwiJXFI0NpgemjAKX0SyjjcNM20hgROm36xKI9aBrytnqZDnYFpXg
 cGp+lTbrelQmgNxMxx/Hr0ctCOKcgz2cKm02me4/fFiBl5FqV4alUt2k1pzSnGl19FoIujjlZTi
 JCfpOmMiehwZEZxJcJk084w65cOXPQ9kCKPvVCx+HuE6lQaxfuz3Inap8sgMtbwPeBA/I0iiAOz
 w+LTfT1FLVkoQIffu9K4QAYQWWeLrHrFOE8smSKUs8c4D339O2S0BsQPJfJ6rdCQ07OADVqNm1S
 Z/f/2WVJscKVr3qL8TQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310086

On Thu, Oct 29, 2026 at 08:32:37PM +0800, Qianhui Xu wrote:
> msm_mdss_reset() acquires only the first reset listed in the MDSS
> device node.  Platforms can describe additional MDSS block resets: the
> SM8750 display clock controller provides resets for the MDSS core INT2
> interrupt controller and for the MDSS RSC, which can be left out of
> reset together with the MDSS core when the bootloader hands over with
> the display block still running.
> 
> Switch to the reset control array API so that every reset listed in the
> device node is asserted and released as one group.  Devices without a
> reset in DT are unaffected, and for devices describing a single reset
> the assert/deassert sequence is unchanged.
> 
> The resets are driven from the display driver rather than from the
> display clock controller: the clock controller supplies the MDSS clocks
> and power domain, so it probes first and has already programmed its
> PLLs when MDSS probes.  The block resets do not touch the PLL registers
> and no display pipeline is running yet, so the PLL configuration
> survives the reset.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 9087c4b290..59343987bc 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -306,11 +306,22 @@ static void msm_mdss_destroy(struct msm_mdss *msm_mdss)
>  	irq_set_chained_handler_and_data(irq, NULL, NULL);
>  }
>  
> +/*
> + * The MDSS block resets are driven from the display driver, not from the
> + * display clock controller: the clock controller supplies the MDSS clocks
> + * and power domain, so it probes first and has already programmed its PLLs
> + * when MDSS probes.  The block resets do not touch the PLL registers and no
> + * display pipeline is running yet, so the PLL configuration survives the
> + * reset and nothing visible can glitch.  Bootloaders that hand over with
> + * the display block still running (PLLs locked, blocks out of reset) are
> + * returned to a known-zero state before any display hardware is programmed.
> + */

The comment should go away. AI agents like to insert lengthy comments.
they are useless.

>  static int msm_mdss_reset(struct device *dev)
>  {
>  	struct reset_control *reset;
>  
> -	reset = reset_control_get_optional_exclusive(dev, NULL);
> +	reset = devm_reset_control_array_get(dev,
> +					     RESET_CONTROL_OPTIONAL_EXCLUSIVE);
>  	if (!reset) {
>  		/* Optional reset not specified */
>  		return 0;
> @@ -327,8 +338,6 @@ static int msm_mdss_reset(struct device *dev)
>  	msleep(20);
>  	reset_control_deassert(reset);
>  
> -	reset_control_put(reset);
> -
>  	return 0;
>  }
>  
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
