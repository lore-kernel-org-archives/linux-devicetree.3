Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86143BD653
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 08:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775032855; cv=none; b=EHPjVwqUGRROAZygA54FHbok3Xmf4p3BSuHs+cRDflv6Vc/OdWy9SBBrFrmL5Wh/JfQ6j3aDhFOWS4va7PaVT2N+t5C2ReaBp5X2G51+AecRP+G+cycLB9PX3LJ19HYLbsD9QH0lziGjIugrCMXI//c2ZDmhbJxQ3YHihrCjeWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775032855; c=relaxed/simple;
	bh=8+2pinsmZIZHrgZafWj0M08Rc+oW8YYdi2c9xhS1fXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tXYnYy57JxC0/ZqHZzIZMEhfsPdEdBzsqgQArgjTPQb+HqOAi4mw515Evj0DJVWf61i99w/AtQxv7H+Rqww7CnjPxHvSt3rSVSDoAt1/W/UPcgTo4dAibrWzGK2os+6KEMKyMcxDAO3Bz/hfPvr+zzRjLQ5PzIR5Nq/XmjzoKPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AfWyphj5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JtV6NOxT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AfWyphj5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JtV6NOxT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6314JcGR3364810
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 08:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BDagwufMCUS3ui7Czr00qwvBpE5LW4lU/kv1dVv43gY=; b=AfWyphj5jGRKJdU2
	mIUbel0nlnEeEn9iIhQxbQ8Ti4Ondjh2ic3+AY4Uxt83fAeYuoGriKN+LYiiWSrK
	mXtnfyddpHqjsWBv/sMpRMfXIG6zjc9qYSt2pi7nU2If+qF1Qy4YuPzswFSSuJTf
	7Onu2mNftjqFrzpPss9pQehWhyPTncW6EQx/pkFm1B6AbTZxtHyrxhUlwidb6YJF
	tbPLAwl2Uau+ajY9fDfJdv2BEWFiFnq7ns/AhgWjCOE9st983BdZZL1ozdzLqRQe
	CRLLnzRodzZWPyxrOqPwo+VlTdSVouWy0yHjrywM7StnXfdBj6x8400O+6CxkMK1
	ygp1hg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8nddjg0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 08:40:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89ccf10567dso33425596d6.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 01:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775032847; x=1775637647; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BDagwufMCUS3ui7Czr00qwvBpE5LW4lU/kv1dVv43gY=;
        b=JtV6NOxTT99pcoucBwGZH5USOYnEzHYlqp66l9AVLbAXLKvmepzb0bF2DS2WAo0ME5
         gus1ZEJEJ61bBuLqLuWw9AtpD0GVEVYvvwjXtVb3zU2cmBbZAhELefxxMOgfUdXbtQ6y
         hhllyDB1IRRcGn91JKHhQYepIgrWE3kSdT2Mr7pJll3GIdRACLIpE8Mh5adv7K44Frv2
         eiI+Tgv5e4UTZ2gLmCBaN+BDVZF1V5HNCQC/wlxc8gp4k7kX/3Xu61Lwi5nZS/LmT18v
         SHM0TpbBDSL7JvkWP0+4J8wFHznClY99MN8jB5Mtau7bE3FfZofugSf8zX305TGGnnnR
         VYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775032847; x=1775637647;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDagwufMCUS3ui7Czr00qwvBpE5LW4lU/kv1dVv43gY=;
        b=aEegoB0Z61C69QGQdjm/GxE5/Xum+N02v9R6Cdg8VBqxoVPhw2OSZt0KanOyWjpTBJ
         kWyyvmz37AbixL3NKsZQeZwa4dhpGHhsiHGWE3fXP52V4n7aa7OK4NkvxsT+bQrkDxo2
         VIdVRPw46ZYp3jcYodDdU7uiGQ5TxxWAR3STG+ZYgtXGUzwxxAfWcit8RZeWhteaZB0Q
         FEenZOpMnyDiVjfBHL0v/YG4rZjHADrXcnaEF3OG/q/o+pBocrsyLaHU/ujKv++QjCHE
         RXIU8s5ZAqrErvqRbQRGVw4BjsMQ2+hmfwxWRFvZuxAmw/z+k/Ab9kMCoNFVjHEuiCIs
         wfdg==
X-Forwarded-Encrypted: i=1; AJvYcCWz/I2P1nFVSKUzuXzEGrf/43OQKJ2oREuzYZNzcCgKOS6yCEHBWAZZoZu/5GH6NYvm2D3vmTK4MVfq@vger.kernel.org
X-Gm-Message-State: AOJu0YwVAHhoYQ4iQuGypkvPOr0FrwqnZKUlnzEcl/G+OzALpxy0LkQd
	erCZutiQ8sz5sjaSMDcVuklhUlr5fjydBlhpPIcRiRP/t5BJU5I7il49LQARDaIDZ7bdoONpdaZ
	RIm4ZThBEAgJzI4owQtGtsuXSW0LzC7WcdtFsGWbLcJfVI/psO0dYn3zuYFW61ON2
X-Gm-Gg: ATEYQzyQvCE263QCowW2txxif+jCh2zoCTeVf1KHEHDegUfjNe0njDi/+Gh3jlNmgxp
	kMrMdARglTDk8UOHSD4Qp9Gc3USbq6EiEqoKzM2Lqa64VcIYrT5e4d/2bGtk5I+ZDl5vSFF25z9
	fUz7yYxyWFZVkfsfYUPUt8B8F86v8rtCNfEWYbNJ9hGbRjXN0MRkGtJo3Q4ELVDM1mu8C7Potiv
	FQnAqT/Lax5itucFY5Q2hmJTXB28KeIpHGp9WwVh/1xtt3cwsomaecAjO2MYBwIYYK2i4nyBZbT
	FpweBMfMW2F/u8h8nSU/9ynfNIbHdDVLOQoCdTB22RAmDKadB269oismJsg5oedaGYtrl7LmuTd
	s6qZcVztPnNrycaGL3Bjca9ogGT/gXf0gax33vZkhOHASVrOvKg+QQR5yQVlOF2z9XOsgf7pKow
	d30To=
X-Received: by 2002:a05:6214:4012:b0:89c:cc08:c56 with SMTP id 6a1803df08f44-8a438dd0481mr28226176d6.3.1775032847052;
        Wed, 01 Apr 2026 01:40:47 -0700 (PDT)
X-Received: by 2002:a05:6214:4012:b0:89c:cc08:c56 with SMTP id 6a1803df08f44-8a438dd0481mr28225896d6.3.1775032846552;
        Wed, 01 Apr 2026 01:40:46 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a5dddsm506284866b.35.2026.04.01.01.40.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 01:40:45 -0700 (PDT)
Message-ID: <e1d05708-a812-4fa6-8985-ff6995350da9@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 10:40:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/msm/adreno: rename llc_mmio to cx_mmio
To: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-adreno-810-v1-0-725801dbb12b@pm.me>
 <20260331-adreno-810-v1-2-725801dbb12b@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-adreno-810-v1-2-725801dbb12b@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZfUQ98VA c=1 sm=1 tr=0 ts=69ccda0f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EWmrOR-qnjryNtOcuEoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 8ZAxOBm1qzyyRxNXJTMUQTtnVNlOS8Q4
X-Proofpoint-ORIG-GUID: 8ZAxOBm1qzyyRxNXJTMUQTtnVNlOS8Q4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA3NyBTYWx0ZWRfX3sJiSB76yh7M
 MJQN9xL9st28N+VIYk0w2omo7x6M29m3DCWIRSjcImMfQI72H03mzCdbovVPGhIJtreAuhPhkeX
 N4rAmnUfvv52EQn2vZ1HTkqZh1ienV6vnzKS8OlLE2SdX6LvJXVczxBpJn1YpBjN5zsWHJg6XQF
 vWdyHkuv/6xIgBVyx0PILv1iC/en5E1BAyW373bpoIuf4WupWc9Iv8Y7S88uDYqSmlCGtmD7GB4
 JWtV1oFEYeGsNSd9lDbvZhY4nbLEfrS2Tbo9Z49raLp7mi2mxL8F/F5xutUz2TYGzX3PD+lv5S+
 Y5Mtcxcu77FG4Wzgl6FhSlRFt4YJSB1N97NDpqG4RKICGA+MbKqGcQ9a4y4XDl7UXViZuv6V0Xq
 Q/EdQCbNf8PnmjxLHP0iuhhPd1LNlYwqTBz5LiNb6GF+6Tq1Yk7qLWdhLGsKCAGbhHMZ5Aj2zR4
 szhum0es2G2E02KvTgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010077

On 4/1/26 4:17 AM, Alexander Koskovich wrote:
> This region is used for more than just LLCC, it also provides access to
> software fuse values (raytracing, etc).
> 
> Rename relevant symbols from _llc to _cx for use in a follow up change
> that decouples this from LLCC.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

I think this would be better named 'cx_misc', but maybe Akhil or Rob have
a preference.

(VDD_)CX is name of the power rail that powers most non-multimedia parts
of the SoC and in the Adreno team's lingo that roughly refers to
GPU-adjacent HW that does not need the VDD_GX ("Graphics") rail to be on

CX_MISC is a specific region within the GPUSS

Konrad
