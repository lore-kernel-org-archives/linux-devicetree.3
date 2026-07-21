Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988BF44AB6A
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784674014; cv=none; b=Eb29KzeZwDkdcY6yKVd6bJWU2JrJNeF5oy9nB2oeEQF2Z3c4/800peqr97k85Dl5y3ehsUkPFgjFe37fsgsA5C5UeOEsat1UUJ7kg8zG7FEXRvLkb4WDn0zd8bnIZf3r+Fjx0OAtPiSa9flCGycdXGnHqcEmkHtvy4t5hGCkW3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784674014; c=relaxed/simple;
	bh=UrX+FfK5xngLltgGZozE0HVIhtHDxj8UkG/GgGuN3Os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdqLzQnEIJN6dOsWaNXO4GSlYKq0/+sz7C2LqLGholY8AQYDSO8M/g6DG2744oGxrKC5uepL6Rh7WmPHzY7qwNKtgYO26Xv6PC2I7MI5gbH+GVmbatDd2779NZBbOIarcA/+K0JQEvaWrAsjd9lSYUpkb8if0d4qUhn3lqpCJl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oW3X1PeS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FpG2Yx3f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oW3X1PeS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FpG2Yx3f"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZPFZ2910856
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FBLyKhH6QlZwbtDhRtvyYm8q
	UDIOFADLvRXOHopvWq8=; b=oW3X1PeSxECCkuaTkjTjy44Pj2zcExcyYQmZPbD1
	nJyrbs+USExMnmER8cgHdd4eq/U5g+5iWejlHlhoAUfyH4W0byxCkFnbQJd9slwf
	d76FmQrdSkwjacQm71ggWqbXs+8bvqoqy9qP39WIgTj3RHp7IEW0NkqA/5Fji7z7
	iYeNEhw+cnPM2qv6fePFLEIXhJ8MACpNJblGnf1qFVuBRXtfJ4zUH3YDPhgieQpv
	8vD9YxZbZYT1njn9EQidHQwzC9GRRznoBpI5OHFnz/lexsgoOXEFRQm8Eo1Ptb0s
	ctYtkgvdGZ5Jn30xSF7E4kaNVJHJsbUVqdbBj9emlIPdAg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9c42e8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:46:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c2af04aeeso41052581cf.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784674012; x=1785278812; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FBLyKhH6QlZwbtDhRtvyYm8qUDIOFADLvRXOHopvWq8=;
        b=FpG2Yx3fbgFb5on9qHACP1QZOuTbp5fnazNFqPYfsy8NcjjXMsVOGZ6J/oyN/HF00I
         b6RZgpCkQg3yrVjB32Hyb4aU5x3XoM5YEmlmV8wScuewAcDsk1MxXKMA8s0hQj4rzuUr
         xfaDw7uEpkaIuLOYwyJA6qilO8hcBN1z/elu3bgRDbvKcUtj3Bl2u27XEhEiST65GE4R
         Npfbot1MXQ3BoZS+CafjAcbwOurKbzqMeS7OGV7yAKKWvRVcv5zUrA9tqXMnVu0mHsEJ
         R/cMha4LRz8pp+QUW/6P3raXJxRHzM4E9TASmdvCRj3LZ0ANIkSczm6wrKzzN7/daWyM
         ImMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784674012; x=1785278812;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FBLyKhH6QlZwbtDhRtvyYm8qUDIOFADLvRXOHopvWq8=;
        b=Ogw58QFYJ5Q6Kfx7fJHtl0k5A4sdoF/HQQaye8H433BEJ4HGDesNAp3Y5A8xQZ6ajb
         L31kTJBoLLV0u/K8ri0q6dQixl+C4e+UWYKX9od71Fi6VkxZRYqHoeWD1YJ7Omfv+x8+
         Ep7mioRXqVf4avh8YfB0dP4Jn5mn42kDpxYUps7qCntPep95xky/cA/oLMF6tculLPcs
         SKyQlu8IxJtT7cis1l0oHqQ1eTQeSWWCA8+n7E+1FEsum8jbQsGxe5KHAj9uS6XMWvw1
         ZehlQqai6zis0ND2SiegQqelKsQeGvdgZ0Vyzs66BxvRjFBZ3dOx4S9HbIZNpSv81Jex
         OCSg==
X-Forwarded-Encrypted: i=1; AHgh+Row+IeafWXDTP1yQ8XjxfFOX38VTFtznDzEvQ88lC1Gqx+DyaDf0xitprhGRzBgbs762ccJXkEbSYtv@vger.kernel.org
X-Gm-Message-State: AOJu0YyQIcrao3B5Rm+ZDw6LT6B2E/lgfYtudU9gNP7IIKR5tBGGf3O0
	8isQyPvMNVjRuw15b7wBhDeAV1YYgE2llYJJIaO6G83aGI8E/nyYKssZBvtaGpt5+0jFlPM2zXk
	rO80wZaluud3l7jMp6ddPj5IK6CB/YVF+wdoiBsXQ3ZCShJiXC3qt7r4wh/dmIaru
X-Gm-Gg: AR+sD13tVtCGZu3gDf7UynF8yipiaagi7nu71nyOXnu+cQ45C58tjQJ5glbshf+1v+L
	sFG3dgXJLNAOJ8UjxmlDt4h0V1DDjv0WOQhDPniU38oTYt3YM7SsQff+wF6Shjx2RQ9o89YaAC0
	FzDLsuA4fyr+F8KGKePIcIyWM3MWc8RGCXXK0Gor+RG1HorUBLu+n4AEw8l2vCN21902GWnHYMA
	nt90++ZNk5lMD1rJurzwtEku4ySNdT4aHtdAxsfiy8f0eK11Ho0hzfqbJN0HbPdFBuo7/KltvAM
	ToSaHUi9nwufH+Ip5tNr8hsAcVzK7D+pU5cbBlbVEVT4sYohOj6TFMMXvqBwyqv0MGilJddndbz
	Ord3heP1MH/7HLeipWKgZTvnZgYdxeIizMx5zEBtUnX/qjr7tJSu2PzWBegErp5PqPdwMYFH16m
	NbFuvry7sUZJ2Apg==
X-Received: by 2002:ac8:5a48:0:b0:51b:fe30:b8d5 with SMTP id d75a77b69052e-527a8a4d134mr17061711cf.29.1784674011778;
        Tue, 21 Jul 2026 15:46:51 -0700 (PDT)
X-Received: by 2002:ac8:5a48:0:b0:51b:fe30:b8d5 with SMTP id d75a77b69052e-527a8a4d134mr17061531cf.29.1784674011351;
        Tue, 21 Jul 2026 15:46:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8cd3fsm154169e87.1.2026.07.21.15.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:46:50 -0700 (PDT)
Date: Wed, 22 Jul 2026 01:46:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: esteuwu@proton.me
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] phy: qcom: qmp-combo: Specify PLL version in
 qmp_v6_dp_serdes_tbl structs
Message-ID: <wg6lgpaexz4ktjlfzqpsidj56wr3hjax2ktn75kqsoaubtdxre@xh3yn3xpr4af>
References: <20260715-sm8475-bup-usbss-v2-0-2d8def39b190@proton.me>
 <20260715-sm8475-bup-usbss-v2-2-2d8def39b190@proton.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-sm8475-bup-usbss-v2-2-2d8def39b190@proton.me>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a5ff6dc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=ScSKZHR6t8cGUoQXxYQA:9
 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: FhTcGCvUv5cC8acen6L4rKLagSBaEoVp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzNSBTYWx0ZWRfX+zsLwHXylZ+h
 p3mXOxnhrj6seS2XhlGUKhVTuov7cNlkRQ81qbFjZPvOdKicZmX4Cxtxdqy4hccL45TkXRM0GkU
 UFmNrbrzhmwn7dM9WXLPXPFiSO/qoscXNvUT1VQcudPllocTFVZlEUvUTynmhgyjSsLBlDruQCd
 cO7yM5a968kMrjiTurYrROP+w5LuEu5RACy1joUa4mmAb/c+4LgVaTr49vMago/v1TOCMgwP8rs
 rorJ0qbjcT2iyZRW8Ej5wyjQOFVrJhNQx6VyhFbm7RFKdhAdxtm4ewNMWAoDqRsEmtoJPjLX8AN
 Vhl4TFqklAHnj5LLO6RVZY3clNZOp0rvjaHFcmeY/FGfWZXwOFieapp0/pP9UTXVkIMcziuxnBR
 6738/rM8GAq7K4SNfydtdVVkeDqPdkAot4eTZACC/U573TGmUr9XuFPbfBOqZkwESFhXaB1O/EK
 jRtpif/Ath7ltazgjKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzNSBTYWx0ZWRfXwF5vn1wjk0+K
 EYuTfGYz5gAEUReOsHcTWjnTKv5SmaM2WVGDTRZgPdOoMJG9cObeN20gmX0LvI/P9uKPP9fIjJA
 OuMRKcv6dQl41wQgUL//LO3zh3v4tFo=
X-Proofpoint-GUID: FhTcGCvUv5cC8acen6L4rKLagSBaEoVp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210235

On Wed, Jul 15, 2026 at 03:06:55AM -0400, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Two versions of PLLs for v6 PHYs exist: v1 and v1.1.
> These tables only cover v1.1 PLLs.
> For serdes, the difference between v1 and v1.1 PLLs is the value written to
> the BG_TIMER register.
> This register is set to 0x0e for v1 PLLs and 0x0a for v1.1 PLLs.
> As reference, SM8550 and SM8650 SoCs use v1.1 PLLs.
> For RBR/HBR/HBR2/HBR3, most values change.
> Make this distinction clear to avoid confusion when adding support for SoCs
> making use of v1 PLLs.

Checking the hardware docs I see no mention of v1 or v1.1 for these
PHYs.

> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 90 +++++++++++++++----------------
>  1 file changed, 45 insertions(+), 45 deletions(-)

-- 
With best wishes
Dmitry
