Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CCA4B8260
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 16:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791823139; cv=none; b=bJC9k7Q0AGbPAZWa+DFIF0R+Aj/Pn+uuCP300cBAouhz1vW3F9gGXq/G/RfH0jarZAoCG6/HoPuCRs7ecMvpNi7tEf4brXJGPIf2Eum9XydYRbUiGmd0JOUtsiJIKucb2gDX42G+LW2gLLsP8Uv8KI7TuQ/7VYgkRqfP83CpesQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791823139; c=relaxed/simple;
	bh=r2aQ6nppuYAXx7FaIX4bzju76FGdPzsoUMRmiNPIsTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nwhty8IcnXY3WeEzPvkjCWWBjNVbWYOVZc78FnmsLT68nmUbG18YmekV3/TBxi0hXhpDF6k9P+6j4+G0J0TUyZa/83rQ3SGiFg2if9LBHrv2lVec043ZA3Lu7PwtxXRfpkPrk7y6S5RdVRsu3SoDgSm8kfw3nSCq2ReEF9DkmxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EFYNjBA+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kI3g8LM6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EFYNjBA+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kI3g8LM6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFf0eP1290975
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 16:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W9hWISRKxYpfkDOhDQ86zNqoHmHjtrP19NViwFa2Ukk=; b=EFYNjBA+3Yb6xa16
	glc9d8L1Y0XzPvDxAeQRot+x408D7JVSsJL2xgYuxA8xb0ogUy5bSQDdo6V3sQyf
	S8NSbO5yXzIEhGVgZr9P1z+Ol5L8MkE1ZUGOvhmNOrIltWLKF4qC3rnSqFm109TX
	T4eqwsftgftWWotLNTGbfFg8ABTTxwUJ316Ml5FkcS2x50/+t3ZRpT6m54sPkFRN
	ykdfZQTxHCKZ3RIRWobGlVUvXbwAhrsYxuxyAy6pYkb5VYJ13487dg1Q/9/VtSqv
	K0WDg00TOeQbp9dJksSR+z+mn2O5xqYRbxKbutoybkw6Neh5XBEBqsgMnm/40NlX
	n8MRGQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcsr50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 16:38:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179fb39cb4so5969236d6.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791823134; x=1792427934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W9hWISRKxYpfkDOhDQ86zNqoHmHjtrP19NViwFa2Ukk=;
        b=kI3g8LM625TE4j3RjzddBDWFfU+mO9HN4IVybl9u4SOfV2tNDXOG1xiY/Gu1/vYqzg
         k1lhkjUvk6uqs6p6mIvjAP7zZcqrHqZ4yl6qSUGNb2aXb5jfzzmNxKFcXYVEYKoAim6W
         7JTCP5Mub3MBUVBKGyWMbaa8bpDsN1VHZ/j0pz4IbLQM4cnTaBt9I3kyAezzqhKQPO8D
         6nTubllZDPdIUlBEgkgEL++WAaHMRYuRDHJBqnnI4r/y/grfVLO4Bfv6yUkXWQM49Nxb
         f2/1HkM2KHhdt/k0H3YMcY3bAbKpwMIMQ4WpDrMW/6C+OBDpLSQduxEi1vu61axpy3hm
         HmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791823134; x=1792427934;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W9hWISRKxYpfkDOhDQ86zNqoHmHjtrP19NViwFa2Ukk=;
        b=L84GjQyfblBusq8Z+RL0/X6dza77NQul0VTVDWB2lN1V5J4Eesi4owXEn3zO+UNyvj
         66zX553dNo7VE+Hqr0uXGF8ED9ssfz5cbBcEs9i9Rhol6zPxAKVRLjnZKb8mZXvVc0oY
         apvAf9Km9VNNzhH/bKswFkCBWhxmk6o43DIYwrbO0QzTq7LGqvHr5vBtRhCIHOHencBI
         39zjQMw03BqlZf04Xr89tED1DK3s6iA7EDOJglpp8wtOd/T7v2LigM4hPD6RJsdDrDvc
         QC/s2jbB55D+N1bwvnzSOiT1l5DtRg1jLL8/aAWVXk3oe7SSczzgtnmGqojgYeEO7dLv
         9FMg==
X-Forwarded-Encrypted: i=1; AKwUvBzPlBW3vwH9t3PkJmbW2HwoLSju7IqR7Zgb+ujWq3vgk6G9DRjeA8s3Edt9d8T+PivVyINzqumIdI8D@vger.kernel.org
X-Gm-Message-State: AFq9FYLRP49VnurCXtxuVG/76QP9zjfub/wzhE/Hixt9iSIgFvfVFT+T
	PaTD/1uM38P1pcha9de9cIo6+yPLJt95rbA9Pxmi8k3p1vkklsK96r+7iIVw6I75ZXHPzSe+XGo
	8k9c/2o/3E5Z+hYJg4XBF4dyStFIJMWSDMiWFFigrc/VIISIBFZSbxde50LaLxuGx
X-Gm-Gg: AYBFou3OQapaJ9dzeDsjA2Ev0QAc2N1RejAOgL18fJM/Lwp2nuErwLojFcXr+yRWxOp
	vGWP0BnB7Rfwefh9MwzKPj16Z0vGrl6wVPzsGfses6NjRB4Rb/SsvrA/nZMY2p3AZWFnVHGX2cE
	vRUQjUdvw1kuRW/ICOHQsyfV+o2wRBu/z08a8sQROnitYkATGPHrBp3jgcVcby/o4FEuAEi8nI3
	h5//PEUq9a+rAAybSRgWTZLaxnVjO1sp6dtFqssH1+TeLLorPNqiaKJS49AcIoGljqNPOe9rigb
	ECwPiGHOFBC+7T0wlL2cJw5ImWE1GJ6M1Iq+sPb9xBGR+Je1DsNY37aosVfLKBkxz7hEq/rH+yc
	VeKsML5r+fibJ1ipDyUkySw==
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr1731093485a.0.1791823134336;
        Mon, 12 Oct 2026 09:38:54 -0700 (PDT)
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr1731087985a.0.1791823133859;
        Mon, 12 Oct 2026 09:38:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34adc25c89sm152588366b.45.2026.10.12.09.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 09:38:52 -0700 (PDT)
Message-ID: <571681d6-67f3-47fe-9a42-dce5aca13c99@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 18:38:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] dt-bindings: wireless: ieee80211: Add
 disable-rfkill property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: jerome.debretagne@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Dale Whinham <daleyo@gmail.com>
References: <20251220-surface-sp11-for-next-v5-0-16065bef8ef3@gmail.com>
 <M7kfFb5fz-WB43U_xCUwgxpmBJ4TNdp4jE6yFu6HmemIcDx5tXO6H4xnW_pEQz6DMkKm-3POdB9hIdB092zhGQ==@protonmail.internalid>
 <20251220-surface-sp11-for-next-v5-2-16065bef8ef3@gmail.com>
 <e0e9e690-c56e-4b56-90f9-2af46a7feaf3@nxsw.ie>
 <20251220-fervent-mamba-of-sunshine-f680a8@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251220-fervent-mamba-of-sunshine-f680a8@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6l9oiwY1ndIJeuYeZ9hk2AStGu9t8WZC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NiBTYWx0ZWRfX4VeiUiJ6bHem
 81ymIscS6+CV3LXIwlDbwHD05Li7kKHvIhEucvh5t9kpS2lNprbUQSjsBEONtuTkKJQma2f6U09
 CZ9QA9KDyhFl3YFAYRBvKHzomkAbWJo=
X-Proofpoint-ORIG-GUID: 6l9oiwY1ndIJeuYeZ9hk2AStGu9t8WZC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NiBTYWx0ZWRfXzhBsquOB1edA
 1RxUSrGBu/X0G2da2wM+zjBIlwllEp3HGEkY7gdhPuyLuRWeZobX1piwcKiLcA7YSQbOtX9XzG0
 YEbC5WYPcIgZEar+TIe5P58SzkptBc3mayyjp21bB2wdmrShlrqQQkReyCrSf3ac3GfzKW94bBY
 uUPCBwiVLhkY/ZZ2xDiNji5TfXI6qbuuR1+6+eYcl0b0gv9VC8ooPz/zDiu/FV8ir0eVaILMsdU
 0+QkGIl4w1X910elvW5n8T82s3axB0+6nQCJ8oFjnBDhhJS+17dgLXvfbhlveKvuFhcDPGjwJCF
 9yahv4tqKTE7zwZ451FYzCgQv+/tyUC+nR/iaiDx3eC5xKNeqcBZmIjLql7cDjF3an/h7kpTjNW
 DJH/7JPRSj+BhIQEidT9gm1zeLug7jHRwPbVMAmI5CJklAUeWN85i+A5vsMdiCY5xzo03dLXSuq
 Q+Mao1REA76y6H1pWPg==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6acd0d1f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=TqhBrkvpmi7PlCebGDEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120066

On 12/20/25 10:12 AM, Krzysztof Kozlowski wrote:
> On Sat, Dec 20, 2025 at 06:04:00AM +0000, Bryan O'Donoghue wrote:
>> On 20/12/2025 00:21, Jérôme de Bretagne via B4 Relay wrote:
>>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>>
>>> For some devices, Wi-Fi is entirely hard blocked by default making
>>> the Wi-Fi radio unusable, except if rfkill is disabled as expected
>>> on those models.

[...]

>> Is this really a hardware description though ?
>>
>> Its really more of a logical/functional description. It tells the runtime
>> what todo, not what the hardware is.
>>
>> You could also have a list of quirks in ath12k for this or have a user-space
>> utility look for the appropriate platform device string name and disable
>> rfkill.
>>
>> I think this logic belongs in drivers/net/wireless/ath/ath12k/ triggering on
>> a compat string.
> 
> This is good point. Either this could be deducible from the compatible
> or this should actually describe the hardware and whatever is there
> wired/configured, not what OS should do.

Sorry for digging up an old thread. The board-compatible change is now
I think merged into ath12k, but I'm not sure I like that, as now every
OS consuming this DT has to carry a table of board compatibles (hence
needing updates _every single time_ we want to support a new device),
instead of being able to convey the quirk through the property

Perhaps we could revisit this approach?

Konrad
