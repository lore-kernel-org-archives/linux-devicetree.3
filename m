Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB8C4A6CC2
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059717; cv=none; b=GQPw8u30/ZWUpK785cpPrnHqkOfjrFJL2vyYtJiiVJfzGmtwEReXWE0kS6k9dqHCahlrHi1RFyU39mmBVdOiR5piZCy3//nyKX+j7bguQm1wSftZWOgJHocKKDwwH3ulat+PDscyojxvW2mwQ1wC2vSpxo4Kd7AIN2jQ2MmmlQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059717; c=relaxed/simple;
	bh=gDixHkkz/FSuEw67VpTGI72gcynBkvRnbSZ64oA8UOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rAFP1SDR1F1Ulp3ztPcMZzCqy9Wulu4ohob2F9uAMZAv5mwkEWBj6zsnckoo0aEcAsZYVn6Ha7+fGkBIbgabdAEL6/7TkfUQ1cGWP+XnRIKrAAZD4v3PMrodQQtcynA88setL5EhfNCUYt4WErO4iTz+YUcB+5N0Mwh6Hb/Ip7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dhGGS4IV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AJJAPrXY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dhGGS4IV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AJJAPrXY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jY6h2966392
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gDixHkkz/FSuEw67VpTGI72gcynBkvRnbSZ64oA8UOg=; b=dhGGS4IVacD7U72p
	Y/hTqljAPCqOuYlH9vi5eG5d9VrMGeoSOqpvyyJjufi8kmd+VGUv348y5BioRvmU
	guIxAdcdkOPCK7F3E2WjrbGKOEAvw9lWTnKL3Lupe1+sZT4Im+Jd+bbGzMy29RGt
	iJhUbWKyXq7V7i9Vs0bvQU0l5odM2JyUqNqo0JQ42qYsFMkx8ZH6eFS2F+Qj2La+
	iRJ51i/iqX8E/4eXTVIyHqGEvYuDVfMbH1pj49fERNYjd/4lj8XCd10fnxvGYAfK
	oPKej//88tw2br+RLal7CWqdVt96z4sz94bWmYD+mC5pNK4K+QBgurr8JPo87Tcs
	QAFoYg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wuhu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:21:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9179ef12a03so17329526d6.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 03:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792059715; x=1792664515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gDixHkkz/FSuEw67VpTGI72gcynBkvRnbSZ64oA8UOg=;
        b=AJJAPrXY0nrW6kox+JMev9iqyzycMjmjCDDTnjLQHpxYn9sGjSaFwpgAw1OmpDn8NJ
         K7Dt25PJUyJAx+v/ly2Gv+8jqDNa/IICgpPJFurwi3z3w4cnxJ3NKX83dO2lRBCJmrz1
         OdSljBQ9Hzrwys39ee9vxOxDlgOa/eK1uVeQkZPVbkMqRixI09Ly6lCCGCVx5RRKQbpM
         w9pkmShQgQiq1eL3LP7SmA7dwcf4MIDY95b2T859bwfMurMFPkz7THET3ltBIJsxvu47
         TOZREWPkNYnBys0Mx5XI0PwoEowa/oAyWPLBBpnlJuFHiR1SUyp0AlGc4tASna47pRlv
         b3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059715; x=1792664515;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gDixHkkz/FSuEw67VpTGI72gcynBkvRnbSZ64oA8UOg=;
        b=UXokuymLyNs7Adm9U9BEFBTpD4asWV3iktIpj4ZGN7wgpQ7gr8T42EFJKIluY0Vcfr
         GafBQbx8S5JJZAzUV0uzYEEMT1eViQw6VXBvcbZPx5zhbp9gRLk9v/nVMPk9RlkBpv99
         LL4QETHZ1MGNIjCp0k8YBN7Ni/rmIUZ5SuwUpzl6jaynRl+S1liB56WysEn3gcP99mgK
         8YpX1tG1llU9VY+z2X1f5tuA1jH3ID6wTmjhnYUXu6LoBAmhXEtwkz29GKrI+fYUmK3e
         NjPuqRzyGyAnYcwAWN8n+EUs8KW9GrKpSehoLiNwXpyMdzZ1S3uUjGxXObE9eD/Zqfda
         TBtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwiteetHQW2WGdYPm8P4l7BOoDy1iw1A+A/YTfsT2oidbX3cjM+r8SGgNIHFp1HY3himiSW+1ktKFp@vger.kernel.org
X-Gm-Message-State: AFq9FYIbZECMt/TgxeVUFMSQuKBN2VG8y2WSI1KgHc6wMs0vhSgYVHqy
	mS2MlGyFwSXGllQ+v25NzeYrjZzNO2F6Gf4SJeOXDIGLvYpsa7oc3kLIbrwztcLA8jkPbRefabJ
	3MRZ+1rtUfy8Y+ANC74HWIDTBU5jpbwfvtODWRskym9j1aLJKqhw20ZNFdRpAy0o+
X-Gm-Gg: AYBFou02XV81W9fAcEseVEHmZ6vSgonYsEMSJz19Dey8sBgB2VOUuq47P/WjyRVZdDv
	q9M7ZmPKhTjRGH3dCYpr2z2HaqeXl2Kt4e8yIyWZ2AobCM9jT5r/HAike6ZLYLtSKaw8jjZYDCX
	ag67l7MlxI0PopgXeFt5g8zV2kDfxq/kVpCqwkK1fZFUU2sma9xuU6hwVWbeWr46tj5i7UOfZTD
	GWCQAoKRO0VJPhcGpVWREuhWP0Bl1Mr8m0YUnhRn35HTLtcqv3xskSrhQk4KMXywZm6ygJUSeM/
	Cc0x71w/XDPic3u/nfh7FwnCK11TnHpL0CCdy3mUIdKdYothYlWHaR138XEtlSw4GIPrXV6qEIT
	YtN++4FzLHYAfC6fKzJrWnA==
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr3652784685a.1.1792059714845;
        Thu, 15 Oct 2026 03:21:54 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr3652781785a.1.1792059714411;
        Thu, 15 Oct 2026 03:21:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963e0dbsm106620466b.23.2026.10.15.03.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:21:51 -0700 (PDT)
Message-ID: <b30fe2b2-4d8a-42d7-adbe-a15cd1bdbf4e@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:21:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm8750: Fix videocc clock inputs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
 <20261008081036.3492003-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261008081036.3492003-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX7QuI6jVbCvin
 bToJWNuvSP4KaN/8JwHa7rFeUeMDFrZE+ghf0kGqmEsl1+vAYGpzChCf/3eE+WwuBdDZDUeuheq
 pqgApwMdWWiRBeFofCeOn/4AlbcW0h8=
X-Proofpoint-ORIG-GUID: UJGfhwOAE1Vz2GpuagY0VZrU8oyH91zC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX7huZlM+qWGeI
 XVlJugdtzamar9f5gNisViQlxT/aZOZnNZDirrqTnLJ4Y9f464uTviO6WJyIjIzvpTbzGCwziOc
 51Wz+0c4945VuHS+jXttIIb2cG3G+Tlj5a9uXjR8KHFnJarwTMA9ydkh8vZ/YKwG2igOrqUURaJ
 rnvwvI3cq6yqK8SIciV6uQ8kkCExy5xDrT5dCLr3wgQXMxzbcBOTASxSNEp7OO25RisBglC0FI6
 aCT6tL4oULm98lUQKw+zbvKCzmwXMSBua1hUe40qg1Sz0JRfYcJt2378kUIb99lO75OZHioIAa3
 0tDoNXGGpVgshRV74tyexh2if1CgjbatsHLw6jHsq9Rwz3n8Dp12MiSH7QDzC/yY/gE74BlPy69
 sgNsCxyKFwP0hWDnQufAD+iCAxA7XZ+X3E3UAu6l+EYQbAGGKctwmP7XxuISXmjR+qg6aPzzW4d
 ZgbCbm/gFh/2FC+bLZg==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad0a943 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Z62H7OANAOBda0uacUIA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: UJGfhwOAE1Vz2GpuagY0VZrU8oyH91zC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150041

On 10/8/26 10:10 AM, Shawn Guo wrote:
> The video clock controller binding describes three clock inputs for
> SM8750: the board XO, the always-on board XO and the 32 kHz sleep clock.

It's not always-on, it's active-only ("whenever APSS is up" for us)

Konrad
