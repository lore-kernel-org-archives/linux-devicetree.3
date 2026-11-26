Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717972;
	b=Jwn6NqSNyfWU36Sdn2gxIAXdEwXM+pnAgiTHqWFwq/k1gYK6dvqbODwVGF4jATiiTL6N
	 uRSuYlUM18NzChJ7hYYYjGCNlivZ9RrGfLtdG8WANGB+PSOawOC1Z2GKTu6obHjtGJKJG
	 /hVxKZWHLy69F8pRYxbxZJvNxdGX7ygyhYLqKnrxjqgHxZ5qOGzum/h6enS7fmUkay8qC
	 9wQm7xioOk+SzQYPUfGu4oY04T7gyzeOcQfqE+zzFgxgRiMoHGFBo28KGgJoPEQkgBUgB
	 hagUrp+g20nfA14TBYy3sNyLXkTTZ9gf5095f82a/3LEZ5CFpL4PzbnVpIHFDYlwnbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717972;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/AAbzqN6gL/Sx0YtNRBarMK5mPpXPZmH0nkOki+mzQo=;
	b=FG7Z+cdHgmNlagD/sV+hf874zX4qskRQB1xZaHROdRc1RAkAXGopUMl87Hfzfw2a8THJ
	 FHxMRn10LfIs8u5yu6h8A9YZh9snP6lI6FScO6mXlNacEQQUohzH3HzNepCzqrEOcrG8u
	 /vqzNt/Ze+6L/i3Cpc4lNmvoc4Crneoba9/MOM7Zuyt4UZDft0FlUQO7wHi4RG28n4N4m
	 bKW83NT++g8ifUVJHuByCz1YHEq9LZ44Gxqj4ayAdHGlrrCGu3ZkwXLkOtfpmdTubL0nB
	 BS4t8Jt6RMUdBxMHhNb7HxLgkjTAT0V2aqhOPU8NZHmbfNfRaKcEwKh6f2Y3LsMyf4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="bFGxra/0";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=COPiPtAq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF5E606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BF5E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bFGxra/0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=COPiPtAq
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu9CZ275267
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/AAbzqN6gL/Sx0YtNRBarMK5mPpXPZmH0nkOki+mzQo=; b=bFGxra/0eJHHWFJu
	0RIQ9y64G1jGfSfrswDn599e6gfUxhCB1vdVAqNwN+hTh0vSvGkAaHMQQemA3pnM
	2wMvlAYeqZO2Zm5ySUZkX6XKS+EkyvgALeb7EL/coJsPdVcHiK7WoYefnVhsNAti
	ZTOODe2FapSksKkYbyhcyTF0EYNMBqGni95LkfE7w+lSL1hkntzTYnDLC/RsTYVd
	A8pZCc4N+hYZXxgatrUZlc1eZNQgY5fabHEqmHEDiGIvYZDBtUtEUVRATniJE3is
	G3A7Lk+qZ+WpZZXbnwYFC5s41V2Zd5yk0NTFaF9BWG7/RZWqGjtT5N5alG/W5+xF
	jojcpQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm820hn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:32:49 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-384c78aa0dbso9353134eec.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795717969; x=1796322769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/AAbzqN6gL/Sx0YtNRBarMK5mPpXPZmH0nkOki+mzQo=;
        b=COPiPtAq5/rz6TPdhWg+FssP/VqnV6HCxUoBd2itKojxl+dbNG+Mc2qWvcQhssXQfL
         p017xnqCi1SED+UhHrtjEkmqHcCrQHfXt0CFXbE+ZHbvse6g7GI4ep2Ndyb8wME9JMqg
         oCEGKFc8a7yI+KJaw7t2DaJ/tlm/UqRWC7UlHHU1bnAt5s6/vUHsaqRL+tunZC9QMtL7
         gUY1BXn+yFNudPaxuz7Xdy4adj9Ouxw14XbOTYNaejUlPULcfrysw2hWpzV3/95/tPWy
         ViGqj9TOGXGrD8mnm1aW7ei8dohFSrjGmSDEtUfFIpAiEn1qgoNGfALyqYGUDmREofQV
         fzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795717969; x=1796322769;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/AAbzqN6gL/Sx0YtNRBarMK5mPpXPZmH0nkOki+mzQo=;
        b=vGlhL7pjDwcQ0JI9WFgxF+q3oIuFtAR0L26WeaGqERLR3p8AeHwaX0TQEj075YuOj6
         3erJwz5PIjBGu3tqJDmL5P6j11spFBcoI3ZX4P90AjiyFHi1EJp1ecLdtvo9bPpCMZnC
         U5nml42vCT0iGxYoVpU5g38cbPRiO46NAlwzXtklE+87Muti9JTZEQwDR+MLrGu4h41U
         wzZGw7eapzPK0UGaLJ/4m0RMYA0z8WvDjOkt1t5qnrLrhSUIlET3DjjSlTmUaMZfypMT
         4Va7ZTpV1qBsDoDcNdUqxl8z842mg9AbD8tm9DAD8G4GbdaJDWrIIfx57JjHQPV5PjFD
         GA+g==
X-Forwarded-Encrypted: i=1; AL+hErHOJMMlc/pL6JNQR5dPSlUApXS6epE3AhXIMVJ+eUy+c0TmyJqyTuqN5LtUO/UBJVEeE+2uCAyZuEkV@vger.kernel.org
X-Gm-Message-State: APuU4Z9wXMWZi2rBnpX3lPkhW5xpE1eQ9QGdEg9upElPVvKQ2YyMMkCH
	dTWfl+/CZ4pyOrh61XI5nmhSmy8/pYfLvPC/XrvkumyYdK+bMemir49vizq1BDEOdOyg+rN6kQW
	Ex6ysn3RX4+A6wRwSt5gF+CZgfKi4zTvVBG/VuUUswoNBE7Su7OABkHNUZq9K5P6B
X-Gm-Gg: AZFdTZf76PmgWXbofPsvAnZ3pj/SMywF1bEAO/G0M7vGS4lRc8cbsUyLhFXqNTH33yl
	uEXEEjiikGzOvKrfWd0sqtG6kU+uj1si6iyg4c+vOPtjrHLYcsKVftj9iXOtPKyoIKnKdJvxRtK
	YDwXLJ6Z8EJ6zOT4lcD/5MD1aH8c7Oozg7vLFCgmP1FCK53h6l3Z4w6cORSPgj+5ErXRCcA6UbO
	MCqmWYrK9QgXxr18zcBdHST1fugcOTm9VBzJTR8bSNA9iFCaW3qvY6AsI5XuXMmRKS2PpMJMVTd
	vqb79yq38U0k9KyKxh4e1TNOizOqsxzHdpCqAxQkguLJKmkmVVJfkHjNBGvn4T9PKA0Xddzntkq
	3jioAfxf+lOLiHxycwndMaxjR4oqno73AuOukajfdRNz2Hm9H2g7pLsfaDKHed/7HxJTEZQQZGA
	==
X-Received: by 2002:a05:7300:dd46:b0:385:7762:e1a3 with SMTP id 5a478bee46e88-3857762e729mr21207588eec.24.1795717968912;
        Thu, 26 Nov 2026 10:32:48 -0800 (PST)
X-Received: by 2002:a05:7300:dd46:b0:385:7762:e1a3 with SMTP id 5a478bee46e88-3857762e729mr21207541eec.24.1795717968385;
        Thu, 26 Nov 2026 10:32:48 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm60895320eec.13.2026.11.26.10.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 10:32:48 -0800 (PST)
Message-ID: <5ade8269-bc76-40e1-b0bb-559d3f211fd2@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 00:02:39 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] drm/msm/a6xx: Add Adreno 753 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Shivam Rawat <shivrawa@qti.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
 <20261118-nord-gpu1-v2-1-8d6d9908b7c5@oss.qualcomm.com>
 <a005f8a1-76a2-46ce-b328-2063bc307758@oss.qualcomm.com>
 <70651641-b264-43cc-a745-178ef2b02680@oss.qualcomm.com>
 <6962c4ef-ad14-4984-9df4-4624c4bb50ae@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <6962c4ef-ad14-4984-9df4-4624c4bb50ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lmCzS9qPsJT6rNQNg9FfL0JP5s-aQG8P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3MiBTYWx0ZWRfX7Sl1xlhw058D
 AAnw2Hk5Nk0Rd7ln9bxUIqYWnhuFpEov8SLKRHv+BQJC/F09pPfqyshkv02KWoyXTExqSn/Wmie
 iUUo3d7X0vJYynQWMMDzu0TllR8iDSs=
X-Proofpoint-GUID: lmCzS9qPsJT6rNQNg9FfL0JP5s-aQG8P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3MiBTYWx0ZWRfX47ZKhkxGzdsA
 D7zCfXP54dhDXoN8YFlWiqs/sMvep+2S9RSb6xSLPfUr9BIbnBZa5L/od9GRLdXiYRRdyAkiW6H
 9+r0uTy/T/PCnCGMKFFDHnYyPL0rd19XlJQj/drLM/QtdDDH/cWUTpoR7iBHD+U2eS3HLXwRuyn
 w2wHp0p1gtudt5C0V9H7Is17CYsvnzqRMcz1meiYzcoX5Vyyxd3uqp5G6bG59Cv3/ItTAcsXHt3
 6LAseXR4FMQ5uhamLOkJmIZsDL1V8MxtY0qtn0Tzpf+Unpp7kWnt129EeKfhJb28qOH5I86U72q
 AOyWIoTNQ2sfG4aKfLL3HwpBBsIEgoouddVPywNk2N+HjSHH3nxwXEijoXBxsLf+up6YNjhRke6
 B/DVMUSjbxKy/jrkia5D+sEmBnyfu/xhuY/mxr6mzR/1HMi6SF96Y0X9kbf5WjCWBzKPRCOgwV7
 OfOEJX8JwhotdXiBRMQ==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b087b51 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4rBPJfw8ZRJ0ovG7S4kA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260072



On 11/26/2026 8:59 PM, Konrad Dybcio wrote:
> On 11/26/26 3:53 PM, Akhil P Oommen wrote:
>>
>>
>> On 11/26/2026 8:17 PM, Konrad Dybcio wrote:
>>> On 11/18/26 12:00 AM, Akhil P Oommen wrote:
>>>> From: Shivam Rawat <shivrawa@qti.qualcomm.com>
>>>>
>>>> Adreno 753 is the primary GPU in the Qualcomm Nord SoC and belongs to
>>>> the A7xx Gen3 family. It is derived from A750 and shares the same
>>>> IP-level configuration: protected registers, pwrup/IFPC register lists,
>>>> GBIF CX registers, gmu_cgc_mode, 3MB GMEM, bus BCMs and preemption
>>>> record size. The differences visible to the KMD are the chip id
>>>> (0x43051701), the GMU chip id (0x70d0000) and the gen71300 SQE and GMU
>>>> firmware.
>>>
>>> [...]
>>>
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> @@ -651,6 +651,9 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>>>>  	if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
>>>>  		return;
>>>>  
>>>> +	if (adreno_is_a753(adreno_gpu))
>>>> +		state = false;
>>>
>>> Is that intended?
>>
>> yes. It is mentioned in the commit text.
> 
> Right, it says 'it's not working at the moment' - are we going to

Well, that clarifies that it is intended. :)
> have a moment where it works?

Yeah. Hoping to enable it in a separate patch later. It is under investigation.

-Akhil.

> 
> Konrad

