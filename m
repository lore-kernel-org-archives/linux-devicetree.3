Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752DE3E0C6F
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781093557; cv=none; b=sG6e8yjVo0FYNpnwr0FFbmkkq7Erf40jIzCkJYLFw5e0SdUqxRkiRRjdg9epDeIKPbn2g+YHehRK0hdC3GqjjqbwThxgOS5AZWPSADuxSJv3/wo0LbD1Jl4rVgPezS9Kr4ekXGxx6Tjrn1pWK55gIaJ31mwhaEwcdtGGsPJD3oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781093557; c=relaxed/simple;
	bh=L0qZU6i34qpv+dgZCZSCEzfepQSubfCh6BsSq1iUQpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B4IfXlFmR6c8rX/g/32KgBBCTQNdFESegH4LTW6gYcbxyLe51IIbCj3K+1RWDMTtXx4vzX9DE0JdYmHFSB8gz04HACDktauc1EIdqlwt5FuNMvKnrgXJuCOu/W9dATcvxaO4+cLc/rNzdzOvimWE+jHu2sp7Rix4T7FsytZ/7zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k9ZQfilt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d2NUtxD4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k9ZQfilt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d2NUtxD4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBnxE1135318
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:12:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xGkUpLUxzhuoLP0OdwLiPqPmRiRkn9HrYAcmu30w4u8=; b=k9ZQfilt+a71nvjj
	91Pc8x2Qlq0RR6NQrRuKrjPzV1jVBeV6mg1HL0nnQ8/WIrnlrEsIn5RCFBVYpnkB
	xzpJiklROibXTgk5x2oGjRhBw/AuYyvx9NXObdWNcEdwto2h8VMU6SaZr2WsQC01
	smdtJGens3ry8VwxsbQHQB3vVjD9s11iq/ancHDAlsmgOXdsYcoww/EOivOzIQVC
	nQzQ3FMMO2GCC7XOoc1K1qZPQ60ceqF1M+iSkmC6pkJ72AQ1/KiK6tA/F+0Zg8YT
	qacFNvA9Utd5uGqMoMP6zTX7oWm3GzJL9rgExip3r4uIloCls+0adbZEKvVGlz21
	zYcZ1A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0m1sqa3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:12:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8cce532f1fdso12226436d6.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 05:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781093555; x=1781698355; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xGkUpLUxzhuoLP0OdwLiPqPmRiRkn9HrYAcmu30w4u8=;
        b=d2NUtxD4hhBfDAPqXU7C/PL2zc5LE0+JSYQP4w1Xggl4SaPx1J+kQCfNzxjzf4OW8Q
         DZv3qaxhDZNNrRBBPfo8ZHvO0Ys8cSpHeQdXnMghPRZrvP7YDw6cyvXXgomrsyEmBeLe
         T5AWM9CUldVWxyDxFXlKa4vonrNoIJWmkZfLAqmHuNT5lQRiDLxl6Ej4FhZyWXpyicHr
         lCyan/nubIgYGjyWB4Sz7jXUdqWDkrln3M+zHRsf8fmgSkhoN5D0Gxh+KCdIFrafgGLP
         utmddDmMpoxB3ep/PpFNw751j+OdGBnN7KbLue2LgePs1aNQendBiGzmtnXyOyrzg7Ph
         RJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781093555; x=1781698355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGkUpLUxzhuoLP0OdwLiPqPmRiRkn9HrYAcmu30w4u8=;
        b=ZUCVR9GIhJntAI7Y0laSRHoboG1aR66pso/Kcwt1lINCxSHWuP0fZeQV9w0KYXNdd/
         o6OIpGqavK6MAhVa+7OhrlCxpAsQ5wzEsregyCCaeX/cy9S6xLOh7A/Jw2H/md/o+6Bg
         8MGlXsdPTIUpiFJsdISg/DgOENkoLsa67cn0o5HX8Rf+6AKyicGsH14Mkl9XoBhA78yJ
         cZfkG0t8StVbQPtONcFmCe2eeytk2R2Ff4s8YZMNhH9M7uj9a0TyKBMKO6FaMVUDdXhi
         U/Amv2mDJqSaKyiKJ/xIVYAq8dwJY9ED0I4/OxNV9n+U2UewN3xwwie5paaZ7jBn1wDB
         tppA==
X-Forwarded-Encrypted: i=1; AFNElJ/eYOsscm+sgYkNlG8hc1x+mI0l77InWcdKb9lQEL0uYWq2KpzQLls3jNG9GG+qWpJjZ+th9T3JTqod@vger.kernel.org
X-Gm-Message-State: AOJu0YxgLgo/ooWfCa0VFu0aq6/pOhSGxNabp3WgXF3tmucsfQ0g4Rps
	1L770HiKfGitZQEnrrhP+sQcUq2kgjT01Jbd7y0iixd5HDdx0BTT5veUZXDyto4QcJvuYoDqgjt
	hqOrog1/bVwwP2BdJWf+RoDHYJhR54iuj67+oRz1kbufznBa/a7Vg95j6bIAGQ+6a
X-Gm-Gg: Acq92OF+E3XQehogYfId11Km8Yv5E82SRqK30ThrO6ht6wN1lpR44kiOQY32AIJQj1R
	QHS4bwOT2Jmq+9G+1SvG6nUzoINchdywyZ4dps3RPoqyDQcHmlu9RiFgHf/8oIV1SYqjrg9nl+D
	4hoaeDNdSsFHl3Ykeks+2etLsRurWryx5pjlSMfjBEBWxu5UDgXh5OX+2eMHWOQudaNZh5tEh0w
	9Oo7CbJ8K2lZ1wn6QHQM9gHqVES4PSISXfSCvtNqEZgmn08tBhsc/JJSU8D780uCZo545blsCak
	bppZaletMCvOTxE/snxLcx1y6y5dI/5Vo0TugNenPKzjv9IlXOXwlbg4DafJP0efvJLS6l5vIR2
	ouOfpoD0wTONbeDLi9EA8G59+qLIHP6eIe4OGRX4++ffqdjCg8wvgIczB
X-Received: by 2002:a05:622a:93:b0:50e:5e6a:c7d5 with SMTP id d75a77b69052e-51795aa8074mr209898831cf.1.1781093554613;
        Wed, 10 Jun 2026 05:12:34 -0700 (PDT)
X-Received: by 2002:a05:622a:93:b0:50e:5e6a:c7d5 with SMTP id d75a77b69052e-51795aa8074mr209898381cf.1.1781093554071;
        Wed, 10 Jun 2026 05:12:34 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm1193637566b.9.2026.06.10.05.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 05:12:33 -0700 (PDT)
Message-ID: <841a54ff-6287-48d2-a513-a7442d624ab6@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:12:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: arm: qcom: Add Lenovo Yoga Slim 7x Gen11
To: Krzysztof Kozlowski <krzk@kernel.org>, rob.clark@oss.qualcomm.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson
 <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
 <20260604-topic-yoga_submission-v1-2-57c70c23d0d6@oss.qualcomm.com>
 <7a330941-8715-4523-9f39-10b57586c69d@kernel.org>
 <CACSVV03J7Y4-ADRNE+4qArqsWvQZ3qmTc04r7vmY64s0qDYFkw@mail.gmail.com>
 <799fea04-e7d0-4184-b9ae-4cebfdac38d5@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <799fea04-e7d0-4184-b9ae-4cebfdac38d5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDExNiBTYWx0ZWRfX6XVpjYtJyrTW
 Fmp91Y7GKwAw1j4Py/18gJ6ZjSTgsh6bEK1mA5kKZ/jqcAAA5inkvCEuzX/zuVkIvc9ZhF8uirR
 QtRS4OvGBKCRsaAx5v7y0JSoxydOxlSO6Ny2k6gTPoK5tD0heo0VwuRx6kkxZlHGBgGAwNh3DMF
 SLvm5pHVXWkqxNp4/AIbC+2RgF5ihCVDCJ+OOMkH4Li2Cb8YbcBTurXLdjgduTW80+T3uXa9F8B
 tYU13KmoYR8IyeF/glkjAP9goXKd5miUznlwAbPlBygT+zKffviT5YFRrQK7B6yR9yR1jBvz08X
 eI+Iu76K9Xro0pZXk6qDQdoYrC653GEk67+xQFq4eLK0hPGzvg0A6/fvjzqQ+ZoAsaN262iNKBh
 NaLrSGE5TQ4zMca6i5tgrlrNYxYh6Tgh0najWdLSJBuGD4HNUxuzNds+54ncd+4ttKmYDdoUuPC
 JJir0JHJ2geubw2Zi3g==
X-Proofpoint-GUID: AH90BjTGo7NBD9JuEy4AVigYxMlBCaoN
X-Authority-Analysis: v=2.4 cv=UdJhjqSN c=1 sm=1 tr=0 ts=6a2954b3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=8k6WQxmsAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=8WJLHc3ceWcLwtWtDxIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: AH90BjTGo7NBD9JuEy4AVigYxMlBCaoN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100116

On 6/4/26 5:18 PM, Krzysztof Kozlowski wrote:
> On 04/06/2026 17:13, Rob Clark wrote:
>> On Thu, Jun 4, 2026 at 8:09 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>
>>> On 04/06/2026 10:06, Konrad Dybcio wrote:
>>>> The Yoga Slim 7x Gen11 is a Snapdragon X2 Elite-based 14" laptop from
>>>> Lenovo, featuring an OLED touch panel. Add a compatible for it.
>>>>
>>>> According to the spec page [1], there  also exist other variations
>>>> (based on the Mahua SoC and/or with a different type of display panel),
>>>> but those are to be described separately
>>>>
>>>> [1] https://psref.lenovo.com/Product/Yoga_Slim_7_14Q8Y11?tab=spec
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> index 50cc18a6ec5eddaf48542b85387c2d430cd4721a..fca3d180489d4cd3eb2726a722f15febe44f03ad 100644
>>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> @@ -68,6 +68,7 @@ properties:
>>>>
>>>>        - items:
>>>>            - enum:
>>>> +              - lenovo,yoga-slim7x-gen11
>>>
>>> I imagine you might want different panel variants, just like T14s has
>>> LCD and OLED?
>>
>> I expect this will be the case.
> 
> Then better to prepare for this now, otherwise later you need to change
> bindings. If unsure what other variants are, then at least make this
> compatible panel-specific, e.g. lenovo,yoga-slim7x-gen11-oled-foo-bar.

I took another look at psref [1] and there's only OLED SKUs (today?).
There are however, two different resolutions available and both can be
touch/notouch.

I don't know what this will entail - if the panels are both samsung, I
would guesstimate the same driver works for them (and Doug was against
adding new compatibles [2]).

There's also different SoCs (which will need another #include in DT to
override, sorta like hamoa and purwa models; they seem not to be
available in the store rn, but I'd assume it's fine to just rely on the
SoC strings in the compatible chain to differentiate them.

Konrad

[1] https://psref.lenovo.com/l/Product/Yoga/Yoga_Slim_7_14Q8Y11?tab=spec
[2] https://lore.kernel.org/linux-arm-msm/CAD=FV=XBn78eOC_zG0S2U-W3whrVYEpghKF_WgX+3zpUJ82-5g@mail.gmail.com/
