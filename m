Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A088744AB91
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784674065; cv=none; b=kr0WO8Hl4JiikEIKLDw6HFI3huIgeNQgwLEp5U7qBVIM7DVYqHuzTFk7md+/5fi+sBfyOP9V6iI6FdppA28+FZAA5e6mA4+3fTy0MRJmUTm9T1bwHNUYFv3+MkbcXaMAq3IvqjYbg5b7PJIyyTE8IzLMFFpdybNix6iVP70n0Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784674065; c=relaxed/simple;
	bh=KZ8jPzlr32ub1331C7LBmux3+jAzFbNlWFyK42tUhFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KLpVMLZZR6TNPP9fOU+Cd+QYUDWP/RT39gUdOpX8KJNdHHQ+3vpqv1YmCeQlMAoaz5z6G93gg9TiC9tjkJP1WgUXjdwH1+AR0WbNmiwjBmPB/UP15ie6cIPKa+Y2aQk8I7fykQq63TeultUFd1uKnexOnrliPhYHl1af50fMja8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O4/qQOuK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FlLWCG1d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O4/qQOuK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FlLWCG1d"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZ69C2812186
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZVRt+INxjSHKZ1UIV6a4RAoD
	Al3Kyyh9gvcFPMDgkLE=; b=O4/qQOuKkGRyWh0fTs/B5ziOHMwa58TywTfbajkG
	v4251LhcM8CfeToBoDB8gz1fBUO1yXpp5l+4xCIr5JPzQ9+NueO3eFVE/Ks43JFJ
	BL0z+SmfwCoGjY3X4ZQWQ7JWBUngFGGeJt49phcjjr4WPlEOJ+9+11hZgmCWrbMV
	GRUzN1ED8H38OfOgbRvfmIu57+AEIrM7tuAgIyzAB4hNwP7haPG/1bpI11vD/9Hj
	cJOo/9bbO2XMgiqZp4nOneJved0iGVjyrCol9smkSG+GH+Yy40nnOTcLcLF1eSXQ
	Xe4ZO++XwkOSPOp1cI3vUdMdIzbqKE1v2bPuyQz2qx/Iiw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e15n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:47:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-522de3c645dso97037071cf.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784674059; x=1785278859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZVRt+INxjSHKZ1UIV6a4RAoDAl3Kyyh9gvcFPMDgkLE=;
        b=FlLWCG1dLpRwG7SmsVkP7Lic5nC9RG6jn+ig0JQTcnrfQs77ml3ZwCcDZwkUe8J4wL
         /rOKdVRpT8GVfQUxQHnZHcLi9+DBZaSBzIWSufLMV7QSyAQ5cJ7TBh1zmv5/gjrs28VG
         TaVaCNuPSrHbYTReu07eeWOF7pXCvjYKBbG8OaJXVY1KruP/7nZA0lsCAanYqpdiRVEu
         hRpDPC5LDim5aGymU1pghPeO+KZ1hYAnJbRR5qMxMNXw3hsBPbFOcawFosHdN2q9HFf9
         sjU54yRxkweJXcBSDLUr0VJQeuVjzFZWHxAdaRmuhQLrfuvw83BxrnMQmue9Hfh0KgHC
         hSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784674059; x=1785278859;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZVRt+INxjSHKZ1UIV6a4RAoDAl3Kyyh9gvcFPMDgkLE=;
        b=hSGo9HSXwcqk5CuqyxXkEs641kuP2Y5/86/eApflqWFOLPi6PhtEp+JdlAGoPWb3fe
         l4942F48oAOWgtSq0NFVnX7rbqJGId3iNO1EyxX7bDLX7CeSNV+Zw0h7ZZgTbBWHLD+Q
         7qxLzK4Ov6aPN5t5TvjebaNenf31Xbw96CLsBQGpzYcgVYw1hKrftRcVs9yiryceeJOw
         w47ykbYgmJulEl1//0wDiooTYa5MA3+m3ymAjKSkYzOPXjNW5RJFC4XAWCITv5KA8jV/
         4vvz42hKWQU+4ik9jFZXjYl0GAXT6EHJUvBNt5542oYh6ESCj9Qhft2g+IoEo6jzNL/G
         MCgQ==
X-Forwarded-Encrypted: i=1; AHgh+RpVoq6dOgG1WWX+BnRtyES945JG4pUOWZwAK3n95u/F0rj8wdwmmuKrUx4/ptNGt5gYfJSBZUviutUI@vger.kernel.org
X-Gm-Message-State: AOJu0YwYmD2HAbjwFKG7fAGsoKS1JKTTGA24d1MZd7xaGQWGTF1mKmxd
	yeMqzgEtD3w3Tlqs4h0+d0o7RnnFVrWHq5ZmJj8Q5vjyuDXyR8U9FwSQzblX/XE+vQ7QlSS5OLB
	T0xPqrw4Qwb8IVxi4WM1uKH6oxYkpNCrErnPJ2L1mQsboqczX98b08AjPI8TOc8Hm
X-Gm-Gg: AfdE7clTQ7fYqJsS99ExLOMJNh2eemreiIMGvZFRSMH2Id0OnVcOdW2vqIS3V/D8H0t
	mdjVdHCZo4dJzgr1vIg+rl4kpeiQjZKXJjnaPy9YP40G1GbJL8kL+o3OrTntTUnaFR4xwnEtur3
	acj5rMT1pmAfLYXITY8zif4DqnRmV46PGgxtJFyjcXXOlQ1wh8PcOuuaH6SlkX1rLofJdjRbtqi
	+47tM6LDe4HDW/lgtZaXVq6b1Bi6OECrFKqG6yJjRRO44vF+WXslhGW1/g+QroUAxUApQSmZ5wA
	NyC6BZ7VqfQbBb41rk7GVDzH7wmUvyHCXZJ9M4qL4097/DWr8rgBxw2mmfB1qxLkSCflPbQDvGP
	QyOaB1Cm5a3XL9aCOfUAwAZSjyc0yGEc9iP+sovosDhl8JhLjyYnX2X1ZSZ4rzQsQZWnoEMLqUr
	OUprnFNZnW5+yucA==
X-Received: by 2002:ac8:588c:0:b0:51c:e6a:1b5a with SMTP id d75a77b69052e-5213a47acf8mr200832671cf.12.1784674059424;
        Tue, 21 Jul 2026 15:47:39 -0700 (PDT)
X-Received: by 2002:ac8:588c:0:b0:51c:e6a:1b5a with SMTP id d75a77b69052e-5213a47acf8mr200832471cf.12.1784674058899;
        Tue, 21 Jul 2026 15:47:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d30758sm146804e87.45.2026.07.21.15.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:47:36 -0700 (PDT)
Date: Wed, 22 Jul 2026 01:47:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: esteuwu@proton.me
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] phy: qcom: qmp-combo: Add SM8475 support
Message-ID: <j2oyolcgxtka734fn6fmv2fk7em6zkmrvkivihtldbbllmy4co@eh742ign7i6q>
References: <20260715-sm8475-bup-usbss-v2-0-2d8def39b190@proton.me>
 <20260715-sm8475-bup-usbss-v2-3-2d8def39b190@proton.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-sm8475-bup-usbss-v2-3-2d8def39b190@proton.me>
X-Proofpoint-GUID: XJvfoIV1eOeKRvCBiSVDZg8JW4deJzqz
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a5ff70c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=0cGqrpNjlybS6BQeJRMA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: XJvfoIV1eOeKRvCBiSVDZg8JW4deJzqz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzNSBTYWx0ZWRfXyguL4xheX7YX
 TDHDtQ/+9C+vJQyldseoDbz+RvPN9xvOZdLPlScyHhZVatpJOxmj7xj7p37YtZ80qDoLc+39fzx
 qEt2mGekgyacCAgwLTCxsylpey0ROfsOFICT5yLhH1UUWlsi6fOwIbGF4OvT02Y4ynxWare92ty
 DrSSu267s9KqBjlmoRfAwpb6dDqI+Od+98sdkn85l0AGn3jMPtW3pnoVmosrvaLXm04NInmdJU4
 LA7JY3U0HbJrNA6STQ7iOQ/2jWCfaIWDQiwwxKM482iIq3IsUn4fgT/uHN7Ne6cZW8ICMfLjf2Q
 4HFpvG3zlReiXwEcy/yNbuQ+WfMnAUYzLBoRVocBZxG4uXYGgq++vRQCUXCO0fU3ugIS5diZcVb
 zXaeqsY4Gw8LJEAF0zboMqFgVFR/Y022Wrg02FTrTetrWtq4GMXiKja/TEeUZ8rxL/PH/Y+kC26
 jHaJEkb8zPY/qqFgHUw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzNSBTYWx0ZWRfXyhCARHYICeaN
 qsL78jTbYoZCE3FlzLWwcaK/4pR4bRZzjHU6isWlIs7b6fmhX2rlsvoGrei4oLTDeNULBTo1K0/
 6vor6UdoCQJ4iscG/yqeHNBnd8ywTVA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210235

On Wed, Jul 15, 2026 at 03:06:56AM -0400, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Has been tested with the following capabilities:
> - USB Type-C at 10Gb/s
> - DP Alt Mode, using HBR2
> - USB Type-C at 480Mb/s + DP Alt Mode, using HBR2
> 
> RX and PCS USB tables had to be added, while serdes, TX and PCS tables were
> reused from other SoCs.
> Since SM8475 uses a v1 PLL, add and use v1 PLL tables as well.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 169 ++++++++++++++++++++++++++++++
>  1 file changed, 169 insertions(+)

With the v1 mentions being removed, LGTM.

-- 
With best wishes
Dmitry
