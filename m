Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42BE34028B
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 21:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775339056; cv=none; b=QvHb6+eQ9z3oGKCrGyIRaGUAS3Fb37txi36DHNBSTOHFouQtGBnJqs3zEoHNWoUQuI7CAZUAa4Ubo2Fkf441FZuMcW5LgJKoeg0kJyr/QKoQY/SSpIMLL1V2p3Rp9FKuMKIKJ8l4wsrD5vGT0sb6Y4zqNUQ9ns5e2t/V9aGezn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775339056; c=relaxed/simple;
	bh=Wq9Npxav3ojT30mc/0QFoOV8vT0/M/+4DnebIc8PfbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gy0wTS9eU6PM+jx+R44Gj8HC784qpAN6fKRyTV+WpiZ3xo3OA/2myVpiAHLdgMKg5g1XHfUxSoakDgGb3fEUipVPFaGwYwKeQB+Z8kbfDE52UsBWoYZSh/mfCxRAw+j5ho3qhR/CsN7GsiQb/prXE5SQhIIycc2oC7/xIHkCZF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J6MeK2c6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GkXPF1tn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J6MeK2c6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GkXPF1tn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634Jw9nl2751121
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 21:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M1lqoTHHtvZmQw4ap8o2vp4C
	/j3uIcLBtxHCYWfV8yo=; b=J6MeK2c6jho5YyWLXnStUGAJCHSAIxta/xj1C1K8
	t8gyifGHUO4sj3l8R+9ExHrIrzRowGUgtstKJMdbGw0Bv7v3KW0dxTv/89NBSDc1
	eFsImhTW/Ckuj1b64mSD5p1vgZjtA7J3OArELnTsL1hERrkTG3jXmq83h37RaLH4
	T2ksbub0Q+8Yle/ReJ29xJtOtZHrOJJFXGsvr0+tIoBTCZaz//+jSZB6XfXUJugK
	RV1RXdY4iy16u2EsrXUqUFaROkIU3IiKBnel7xouy61gOf9HCh8A+w7GhepMZuXD
	IkcMz+TyEMsU5jC4OJbjBf2xolr/cVGuJ+890uE40e1NfQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daux89edu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 21:44:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50937cf66b5so134907901cf.3
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 14:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775339053; x=1775943853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M1lqoTHHtvZmQw4ap8o2vp4C/j3uIcLBtxHCYWfV8yo=;
        b=GkXPF1tn1t6dfJr5+zaO9+wyLYanpJ5klVF5T4fVKljhNDf/i/8orFiFw/eroBeyNM
         7BdebEg2f2wqpxrYDMF9Evkg/aTNnwmdBUZD9DuV+tFvWETxE6V0r3uHhNxJIjx6X0xV
         sCQDiw3N7kPl+conmFcg/FKJH++l8aV0HED2or/4RIu/ITXmY6iYhOVUyMpkbZYtMHEu
         XFw75dseECDQvwXxOvxfKz/YyOszrcQOygaIS1KIpYTfbuJ4XfJ65gwuZCSDviCO1Wjw
         +uf/9jUiGeV45+0Z4TydW5d62bT4K4fY2FEFdUz+OrgrBHaZHJonI6rdPQZt7Soqq8LH
         CGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775339053; x=1775943853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M1lqoTHHtvZmQw4ap8o2vp4C/j3uIcLBtxHCYWfV8yo=;
        b=sMN4P/3DsWv5Mo1rfkjZWg90TUr65iWSR62MuU8uo+eeGsReZdPQo6/bQzk0nwQshp
         UGwnOnM73gy4Ir5donZ+ko3VmLbuVuA7eSYCONQ8F5Ahoa4uhuNABX3F6kNECcLgCnmZ
         A6vYdbH33MZWxTviYSjOn5RvSzajA1uS2YgmVmbkMY+ZaeiVf9qiRQ2dJl8HCzNWIfBv
         JKmCflVQpdy3DPYW+NM9/0RtIXamlDih8Xgn33ePBH1Q33sA4mu2bMMoyu+t9CYKtP0P
         6ZdAvVJi6GWwGn33kB6GCkhZa0gh6ZqN30GBbPBXvDnTT49QqAiGWbPdISFwg5YLMI3B
         4GMA==
X-Forwarded-Encrypted: i=1; AJvYcCWYmknQ5k0JF+Dfw9atFaGyunywALuM0iCTog0saaCGEOzexvELV/QMjejml5XvNa2EFHE7mkp0Leuj@vger.kernel.org
X-Gm-Message-State: AOJu0YwhTr3fo2l5na5arpQtV+WeLl5fZWVnphSC+cKrcLszqnOjvS4a
	pQoVFfvvwUPwwRwQvb3tRjIoTbh26p9XjVBi5BO0qeioZFRuRSwYT7zI0f0+me6SwRr0eEhURAK
	nSgXt5UChfhEQvdes2WJdq+2BrToyyqFgJMuyl7isTI87NhZ4RHD8XKaLHU/816o1
X-Gm-Gg: AeBDieuOyEuNWEciGu62cWSjkIp7Cjg516zcsqjTyAcZLs+l2fne/x0SjHSDn60lPry
	IdnBgzmMeDKSaCMSzXFLtmXkDGogV9/O7epy1xYGNP95iTvxY6RL0yB6FBaVRrvyA8H/PrK/KxX
	D3a199vZFdNOXvvFn2ZGOIoKq78piOBXsHsDV5rV0AkmjspJ64XvRxp9Tm30UXhb2EqW9Pxb+Ef
	K4MxSrRv+W0WhSf2zBAyiE9V8qbHk/4Q4aG7amaYb2XjlnmgE/M4KAID3QsjfsxNCS0iw6UhRYP
	xOImD1j9TWEHooOXxdttu+TtbTZQjXQqrqhQPHs+1jqa/d/nccf7BX0nqLp6SNTdQCkmzM904nC
	6AWAO3bfNHliT460zd00q8j6+zzVI/waqfuvIlId4VRZQ5tk2krko/Vs84kEG1T0XFe5/3UcQMi
	SQXBpaFRbJJxI9iZrURYCQ9xwyIq9OBJ9MUu4=
X-Received: by 2002:a05:622a:59cd:b0:50b:4dc9:3488 with SMTP id d75a77b69052e-50d62a80f05mr118604281cf.45.1775339053270;
        Sat, 04 Apr 2026 14:44:13 -0700 (PDT)
X-Received: by 2002:a05:622a:59cd:b0:50b:4dc9:3488 with SMTP id d75a77b69052e-50d62a80f05mr118604001cf.45.1775339052836;
        Sat, 04 Apr 2026 14:44:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd217d85asm20165011fa.41.2026.04.04.14.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:44:11 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:44:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 4/4] arm64: dts: qcom: Enable GPU & GMU on Glymur CRD
Message-ID: <ui4r3krzvd3i6kjdozhmmueejdqpbnbo5wfa6pwzjolcse3eeg@3u7bdphqv4iz>
References: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
 <20260405-glymur-gpu-dt-v1-4-2135eb11c562@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405-glymur-gpu-dt-v1-4-2135eb11c562@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: rOy5m83Nu-poqxh90JNhcUL00yBmN3Nu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwNyBTYWx0ZWRfX+uXVZ81ZPruu
 Z8PcT3kEpz9Wg/85pmIBR+YRjo3CTLaYl4vFiwdmLQrtJyhQzoIE3KKglQRdgbhsrQCtie/37Nv
 1cz4gP2p6GyqrN6VDQxnGzdD9U9ys0J7nvSjz1PU7tH3+Lae2iNPgkXjjILcnK9qGxeYGNO7LLW
 jz3kk1W7fCVBgvEVssLs0TeM3sq+VWc2V03u09VBHEy2M+lGXbKRZJ9AJjngtpBA2iQwwLUrmrg
 Tjqbln0GPnSMJx5cIK4hoC96qT/GA9d0L044Q4vkfoLNczu/mzfNphu8tdi+GEZKdK1CfzbL41p
 qQkTuudxpJRqhDDrs+TVF52XSaKir3Wl4cRkq8/CN2Rzo6VHifzt2uIic9WU3WSt0j0sDZnLH+6
 QKaR5vwXHAaUpmK7/RGkhP8MDmpoMA5kIWAh9AnxQ+YhDbVNqA50wuqEPuqfaqvZpRBxwwjL99X
 0X5hBHUEq7MjgO/W2SA==
X-Proofpoint-GUID: rOy5m83Nu-poqxh90JNhcUL00yBmN3Nu
X-Authority-Analysis: v=2.4 cv=AuzjHe9P c=1 sm=1 tr=0 ts=69d1862e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=HqnkvqIaPZsfh6_35gUA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040207

On Sun, Apr 05, 2026 at 02:33:17AM +0530, Akhil P Oommen wrote:
> Enable the necessary DT nodes to add support for GPU on the Glymur CRD.
> The Glymur CRD boots Linux at EL2, which means it doesn't require the
> secure GPU firmware (zap fw).

Is this going to be a default mode for other laptops too? Otherwise it
might be better to keep ZAP node enabled by default and disable it here.

> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index 51ea23a49b9e..a579df902323 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -110,6 +110,14 @@ vreg_misc_3p3: regulator-misc-3p3 {
>  	};
>  };
>  
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gmu {
> +	status = "okay";
> +};
> +
>  &i2c0 {
>  	clock-frequency = <400000>;
>  
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry
