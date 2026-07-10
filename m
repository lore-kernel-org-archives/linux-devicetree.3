Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC16223F40D
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691138; cv=none; b=ZIFbpRFZ3hsc7pgvFfo3V7F7zLaPL7S08A/duSmxf5DJVpL+kcHl1Wi3K1u0eFDj3MFsCp1pU3x5fSUKxwqJ8v2SibUMzKZjDdISrOg41HC0f/KswR6ujcR1/TrwceNAHBAnifaq6CnkHqmhOVzrdRmxAb5Dgc5hszgMW4b5eVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691138; c=relaxed/simple;
	bh=249hh1NXnkkrZXHaprMDjBSQruPO7owm+3gJ+27AxHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N401SLoc+tb/stwBzJRVZvMXAGTt9EMDHK7BEzmd7PJhjLf+b/nohyGtT3jeBxS+ztWhXsX9MtzkgILPE6buqcywVnU+vGicz6RfMQvXDldpXxJqR83uYWflWnKujtJxlqL2SEE3XolKI6ZVW6oWAjKOINP5aKi5elmA9cA53L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DY5Nmv4+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PLKAPKU8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DY5Nmv4+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PLKAPKU8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD5rqq776044
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:45:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3//0QFRPIjtK8tbhBTvpIX1B2oEir1n7dydnERdcIQo=; b=DY5Nmv4+aciJFDO0
	DRLw3Kei39IgnoFL57xzIiXIPXSDL+q/NJEkoPKnfodvN4aQb0hPY7h0Ix6vT1JY
	CNGTyrE5UI+aqRvTtK9XmtoPzv03Hr9nwGWfWenxzKCrhiAg2KVRHFCKY9QJZTuF
	uqnLFJAxd3+OwTvurAzsMawJ2rG5YxLH43hvbabD4od4r45qXcHfWw/5NeijJlH/
	nh2dpwasTrx5B/cWdyzmSteW5cGEXBLXlE+l8pJ3fOqhbpceZtoDnAMn2djvIhzq
	6qxSmmYtZp6MtVzCRUezk/jxsiT/1chCB4LV/mPoZYGo0utBtm+lkf1LWWILc8qS
	mLppLQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5dgwbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:45:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso11985085a.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691135; x=1784295935; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3//0QFRPIjtK8tbhBTvpIX1B2oEir1n7dydnERdcIQo=;
        b=PLKAPKU8znZVZnyOH1i4zARQSuHjg5uwBf71TalAkzx9b3AAkrm3Wpa8wPAHk0oBeA
         WC+/F1IJv0D7WQ5+xBQ6rCAZpkMHfenuDvNfuWV9wEtXTd6wye5jGsw/lIToHSI1Tf0N
         +ZchtlNJP85O7fg6vre8BMnQnwny58KTwLqWdY2Z6Ni7YQj6Z/KUw8caLpstJL+rM5j5
         9ZzlWRg+cdIhDCFyZlX9quTszr89s9yttnz9YjIsx6tKU/jtA4S6xjQmJK5w2glV7x6a
         J4Bdja7q1FlhEqs/+AbQZP1P0pcScN+IonUzawH1v44jN61OlR1hBV4oyZgpPx09bzkI
         QY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691135; x=1784295935;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3//0QFRPIjtK8tbhBTvpIX1B2oEir1n7dydnERdcIQo=;
        b=qhBHiyN8YnN67U6WnGCUS071VCzTF9YSgdnXUJTT4RAu49AimvTzEfKxZUW1o6ZFUA
         Pw6EhXTRdTXMHGkFV2r+ujIkTh40pde/3QRptQZnRg1PjapbyJuYCWCStyQupVqvvXXz
         b5qwuuofUdYhG3gWxYUPCPGoix3vIscfU8/hrBjdMneTGo6Q8gosFpip0ETZSBl1Ll6S
         tdi+3I5av0eLEpTU1GJcFQ53XZeolv9L22R+sralgSRJY0ktxFrQfoWI05/OOJc7GAIS
         6pjTnrzrPgRfO9oa1LhSbbUCi1Mk5DZ6YvCxhMLA2tiryQFBG8OTBmBoL11+CzFaaAhg
         FlPw==
X-Forwarded-Encrypted: i=1; AHgh+Rrpv4amGQ2KigpjRIwBZsT6ZRzzJ394WYTf0xi5Ip1tVgTIx5hiLfr0UuPqZHAaziVXPwbnQxIyee99@vger.kernel.org
X-Gm-Message-State: AOJu0YyfyQ7m+J4GpgfpJBn0IShPMl23f1CgjTGoYWQhTfHKcQ79cTD3
	42h8C6FV47cJZBC9RYxzCIK6HNuJ0ikYPDv7K3MAswRAa+7NX/1V9CDL2L2w2YDKjsvL7Y3HsBU
	g73xN98MH7vfC2wjUK2Obc9asTUN0jOTwMVqd4QhdbY/gexlebRD2hw1J0WX3/87G
X-Gm-Gg: AfdE7cn0a9M+7cb9bfoPKach8OeBHXoMTb33xpGvzmQrdWud4OVHfOwxAPLSET03BDG
	+pR8+nrVA9zbe/x+FvFnt5J9gbfOAtopT0BvnM/717GR2QaDPm2gWCRHB7Us29sKT/cA+aAm2RW
	w/jXHPnW8+ET0FAEnSnft4q+DV+72lljtYaQhv6Jx2dLErV5RX4AOclENTF9D1M39Cp/LBZNl8v
	VTpI9JkSpAYH2A1Di6gVhncGohtYs5+Ha4abCRKBLy861IwMr+7eEVGVC8juF6BCPORiMUmtsjh
	LzjbJB5rkd93PzX5/zLoo8SyGu/b5jRy3nfRmk2C6/v5kyppnZuDri7ZC+gh1F5lbhEJ+IMRn8K
	Ygc3tPLGl7C1iZkwV6EfSfgb+vp9ME7htaWY=
X-Received: by 2002:a05:620a:2b8c:b0:92a:d10e:bde3 with SMTP id af79cd13be357-92ed79e2ba1mr693516085a.3.1783691135105;
        Fri, 10 Jul 2026 06:45:35 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8c:b0:92a:d10e:bde3 with SMTP id af79cd13be357-92ed79e2ba1mr693509685a.3.1783691134272;
        Fri, 10 Jul 2026 06:45:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15cfac0f76sm429862766b.33.2026.07.10.06.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:45:33 -0700 (PDT)
Message-ID: <05aedb9f-c57d-424b-8cc6-19c3af768459@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:45:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: milos: add CPU OPP table with DDR &
 L3 bandwidths
To: Luca Weiss <luca.weiss@fairphone.com>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com>
 <20260710-milos-cpu-opp-v1-4-ae7f4b09bc77@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-milos-cpu-opp-v1-4-ae7f4b09bc77@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfX9GcDHNuJgprQ
 1zMk8fqQWBZmYxVzJBswW6sQeyg1b6OWcfnY4BlmSW1ygI8FfMnVUilxOVOvoRRalzfKD8eHcTO
 xUgzXMr4lxgSKeQ65m+f+1B0nvgKELo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfX/bkog1e1u68L
 SsXeXm3Y5hqcdinhMIHXe4JpI/kzSG5rtT8F/UKx6dBfS+CVJ5kuSXC2a7KVJ3hmBIGEK+fKAHm
 NaivSf+gsNei2tyXjeyblhYVgNB6qkVfGkgTN13Rj/ueMBhbBHrEIloWD98yqDlOX7K/nINo01o
 8OfoSh+rV8ILm+wodR2acrLjYg3pRZN9bW5F5naMS69RRi/5r13aKduO2EFB8Ir458E+MrBzxyC
 dPd22FEjZr1F6NR//kJ513DdgBJKyUjyPwjSWO+SXAuRCXlpRipxq13wlFGKlukk+Uay6867/bQ
 d7hQptcFllloLVSsKWaucz6PC//qlVSRvIhtXB4/73cftbo9Aax4hCmw/kjP8T24eNAdnh+byPz
 1RWlVgwabl85WFm/MslUJ4gYDTSix0T4pk9hHOEq7ob/Jf2RrHWlFYyvwSRtv75mtONzfALmjMx
 giZlutSle/hu7fGbd6Q==
X-Proofpoint-GUID: PBfqNkSV0NEkhYRVWYIgM9E7JruCyjRK
X-Proofpoint-ORIG-GUID: PBfqNkSV0NEkhYRVWYIgM9E7JruCyjRK
X-Authority-Analysis: v=2.4 cv=M/x97Sws c=1 sm=1 tr=0 ts=6a50f780 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=3I2yIiQ9ViMUFdqIhFsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100136

On 7/10/26 11:22 AM, Luca Weiss wrote:
> Add the OPP tables for each CPU clusters (cpu0-3, cpu4-6 & cpu7) to
> permit scaling the DDR and L3 cache frequency by aggregating bandwidth
> requests of all CPU core with reference to the current OPP they are
> configured in by the LMH/EPSS hardware.
> 
> The effect is a proper caches & DDR frequency scaling when CPU cores
> change frequency.
> 
> The OPP tables were built using the downstream memlat ddr & l3 tables
> for each cluster type with the actual EPSS cpufreq LUT tables from
> running devices. Note, that higher frequencies than SM7635 are available
> on QCS6690, those have been added here as far as possible but may not be
> fully complete. Additional OPPs may need to be added for that SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

