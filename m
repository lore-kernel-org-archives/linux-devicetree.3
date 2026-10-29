Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264104;
	b=fawTFtnBqWlxrDmzB/pSK//LvL9T73TlDtWGnD+beLIO8Vty3TBjy/u9sr+weLjSIIYW
	 R95HBKH1f0iTAycT1v29vABI76evnT4LU2Kisxv0yI81eBP6uZXWyRErzl/5IzOa05gwK
	 9KlqYWV1j/x/6FzH5WiZ4fVWOVNlL49xqA0aaFichxOWayLppoW1DKKWaqEDuKd9n5N+n
	 GTuA8S7wBQU4TIQU5a78Cq7FPP7ASXCAG2Hh9wuQFj9qQbpdpbQFlPwcWNYMyUzpNLs/l
	 C90qwwQmwqeV5YUYL+4Y4rxbIkPrq9N+eXfPhXON8N9zLjXGI06hwoiYwFfAjKDNKvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264104;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QQ6HeVU5GVVFeki2uHOI6IzDnII3XEbjMrhu7Eabg10=;
	b=pkkmUHUVqRc1WwDxzoX87YdH/1C5C78JOWvef5gMjV8h/aY/JB3l1PE/+cyWZPwG9kwy
	 //aoeoQDcAa6yqjX461IIHIBQZ9BFs8t/hu12szu/hkM1KSqZwH5z7bFYsWnxr3cZeHKt
	 NodDSLy0Cf07fF7nwJHX3HfVK5xqCAzitWLXzQbiESSSzc4fyA81Xqu+QQm+PBPU0FcxX
	 4PuptcAyZlbfnGzUtdyIVfLnRL2vY59HyIjf8grrBZyT6452iskxOKIAAcrBFVFr/Im81
	 MDhFkRD/pnXueClD1Z85XoS9YNrj6akt/Nj8Hg8zfbt8C0xr/6NvYuknR0DuUZhbKJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPLapMnh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YW67NKSC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E57606A31F
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6E57606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPLapMnh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YW67NKSC
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8r2Gd2263520
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QQ6HeVU5GVVFeki2uHOI6IzD
	nII3XEbjMrhu7Eabg10=; b=ZPLapMnhHmGdrXnxA4Rls95VS0sKEZlR5RS85l7X
	PbpqNW59wmy01D/bnk59t55nrV+Y3krpAFsh0fsy+n/G7UMjAge6wOSikB6GGQlO
	5pZhQnM4yYheIjOcKgNb8PsmemC/dzXWZgHn1QzIJRtt3TpvQDHH4xTEoyRyieG+
	g8tB5QYa3UENUezmhJJgAXueg+iaaFxRWojakxpqYCg+qcHMOyGbCOFZ4Tze6LQl
	cWnXXQKuBoSyNq8H9ONkjlGu8uWmk+nxTtqRLPOXxAj53sS5aaPiIlMY6Z+Ved9h
	f4ckNPJCfG0JRK8JUyDcpGUoawQDUzsiEfYpLsG73VVXOw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm31b009p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:55:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb71b1443so386459985a.2
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 01:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264102; x=1793868902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QQ6HeVU5GVVFeki2uHOI6IzDnII3XEbjMrhu7Eabg10=;
        b=YW67NKSCZX8bqCPC6YIXhSdbNA1PDWa8lIkuZTQr/q4ciDqcN4OAtX5bNjS5eJPYm6
         ptFP19rYlfn2F/B0p1GusBZEpqfpjc8HULuRAdirGrpAFOgjyHeXjZk+Gq0f78UX/4Qn
         erW7RK316CGovOY8yWjAJsZfPbbCawFdgSB+ra4EiCEHlzdrw65Pk1bCGI6jv99agNkr
         1QITaIR2iNwZbdYS2hgZMPynb2iwryanNbQ04vTh770EMdwX3xFUJynhg+jWfghHl6St
         3Q/uRaIklHN3mr9p2yTSxBRuCd6eVyNqXsRMG4+7NSd6LQiMtHWCwaqpIdqE7bFurxt4
         k28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264102; x=1793868902;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QQ6HeVU5GVVFeki2uHOI6IzDnII3XEbjMrhu7Eabg10=;
        b=NYSEZky5yBP5lC8hCaLoJ9K6x4tLAa49nUz2wvHR9Bl9kBi13X8ytIzadCrAK3cyv0
         SD3MxUHwvAnRXCwuk3I+Zx8PSU2mrgOolrsFnmwG/y1f1cUNlWW/mihKfRIkSqF3WLTh
         LzLQeUaDT4F19958aVWNL8WDZX7XxW1BEM+vtdeE10t3GzkMfEU9rgwCPhmiylABTZCo
         w3/QaSSofD/6Jqb2QGYpeWhp5ZgLpKBiTc54t+OeYZUmEsYUiKMAZPU5Uz+18o03Vv0m
         PyLsV5mnOmu+/8IbCP+zZZ8d+s9V9rlEfl2VQ8eC1R0keXbq7dbMvFM/OKzXkD7d6K1c
         iH5g==
X-Forwarded-Encrypted: i=1; AKwUvBxzev6yl1paaJ8MLdUIsHy0K2bIvZhUL+eosN4SSGE30nbEIK3W3qJGG8wdpZXXmoVwMzNtM+c9KnVY@vger.kernel.org
X-Gm-Message-State: AFq9FYKUd7fDNHQOoV5UZQ/FfXR6dvQOVkSu9Iz/F4OsCzkbeS9D7K45
	elczsrTAVAQJln16cBo70SembcbF3/2GNxBLLV7RCiwmzNHS9YiOVln3+BQN/SZE6tdSSt3To92
	9OVZcBF0JuvEJtXds8A3Fiou1YxIg8n+n/L8SEou2BdzzgNfaNRsRdQzXs/fiWOml
X-Gm-Gg: AYBFou3u6jROnww266fs4ms58LIB+0KP5trQGTZ2rObdD1SyqXXPn2U9I9C7ovOFIYm
	BFcSCtGDDYwnu3JaQewINA2Fos04hx0NlQi4o4PGmxHWukE4zHCpSnzQkhrhBgSf/cejKztVw2o
	xf75ktm/avQ+xXGRQFyFT2j25uRZ7fOMGtnZEYw2cOocHUmA+CQ8hCgIR9D4GfjjKe4GtGGOWJs
	E2zaCsimZhlKk5rPr6zooRTvQqGNRl4A0M145q9JMOjqoKc5S0ZoCtIWGGWt4ZB3F/L35I4bnYk
	ae+57+rAtZ+C+NsYEo+LYMYcEGATcMHbcMQBxeh8gy0CuWQLYvaOYg6bH6RlOPT+JgdzN/S99Ku
	jOJLX6+vahyXozm5aqnDNfIzTJ/+viP7GSzaqIht7SDrxiiDGti7B5htCNYnrvdPO
X-Received: by 2002:a05:620a:172a:b0:93f:3e45:a419 with SMTP id af79cd13be357-94408a96943mr696891085a.38.1793264101756;
        Thu, 29 Oct 2026 01:55:01 -0700 (PDT)
X-Received: by 2002:a05:620a:172a:b0:93f:3e45:a419 with SMTP id af79cd13be357-94408a96943mr696887285a.38.1793264101109;
        Thu, 29 Oct 2026 01:55:01 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f05e4e4sm71726295e9.3.2026.10.29.01.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:55:00 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:54:58 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH RFC v3 1/3] arm64: dts: qcom: nord: Add display subsystem
 nodes
Message-ID: <35epdbgc7rduuwrrn5y4kygqk7h2wv33d4tr77qzd37xlhomi3@2764myqvenzd>
References: <20261029034728.633495-1-shengchao.guo@oss.qualcomm.com>
 <20261029034728.633495-2-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261029034728.633495-2-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX2PSZi3P40oIT
 aFnKU+Ih6KmDO2KRY8YpGsKoltekvRxFsFMImMoCWgTkmrVlw1wPo4YTF5Lod/+xz0X7e/c4h7S
 HA2+mNisytGdD63TNWfWsCwhVwUe8UY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfXyvYzm6ZnVtS2
 tjG1HB/VKtpzr9ohK1W4epPSxrdSj3Zdj2UBHS+FL3XR3lwG8ZdOIxDH2v/en5z6uwXZfL54bXy
 NhqNQ6TR0xCpcy6RtPSr8dJVnjAou0ajF0S9PEfRDQpBtW+exyESBH5JFpjWt3al5pj7lIsh0Gj
 41wtvJ1MMX+wkYuJHtrhKBsmXqHuqOK3XY6GESbOUhCe/d/yWkwF3t1u4of1XBHJd0qwldkrX8v
 MI27+Uj4GNbyG+Y+K6tgN6K4asSjCIjJax0IbpmLkwwNHJomIbNzgsef42Uk2wTIKK8dVXFrt2W
 shldZCS2/SolSzqt2ZDoN9lGcCmkOIv98toA1Ddt/6QwQZGpymL0KvbL160sUJchTujKMgVPH9G
 XAdfnCKg9XyrWGudNYflhhttcd5So8+TlKfPPHCulozW7q8D4JcSDim99hVk5xdTrpOQB3OYpW1
 N3LwPKR9syMuae9UISg==
X-Authority-Analysis: v=2.4 cv=A8T5rKWG c=1 sm=1 tr=0 ts=6ae309e6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=mY-c6RtcwyEVXP3PGRQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 0S3cl_JnkHruXTskCgKl82sUdkU35PFi
X-Proofpoint-ORIG-GUID: 0S3cl_JnkHruXTskCgKl82sUdkU35PFi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290034

On 26-10-29 11:47:26, Shawn Guo wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Add the MDSS, DPU, DP controller and eDP PHY nodes for the Qualcomm Nord
> SoC. Nord has two independent display subsystems, MDSS0 at 0xae00000 and
> MDSS1 at 0x8c00000, each with two DP controllers and two eDP PHYs. Nord
> is DP-only, so no DSI nodes are added. Wire the DP PHY outputs into the
> dispcc0 and dispcc1 clock inputs, which were previously stubbed with
> zeroes, and add the eDP0-3 hot-plug-detect pinctrl states.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
