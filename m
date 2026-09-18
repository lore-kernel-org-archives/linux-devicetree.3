Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CB1399000
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 07:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789715343; cv=none; b=odpZsNSbgLfNXp0Oa8J+v5vrCEwlXHMNu93ae+AEMJaIFZ8ugJFdloljdvLWc4pSadMSZx+Zd4ba+8oV4EJlv7uO8dXSi+DRVPJyIunEnRTT3Mg+yAXaegM77JSydDifp9AUq4qUw2dZhbjQ0ieT/UYKOqeptVp9HV5XoU9JN44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789715343; c=relaxed/simple;
	bh=p4bb+zBHJnPJfKQ3DuhQrsQU/ybQ7EqVzyn5dFbuHt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bcrw1DPGdUxtTZYKNoQ7ZUQsizmpaAxfg35USIdhRXpbvsVHEbz6mum0KLu/gt696tq73DsFD5oMN4wYYQhIoNVL4OgR8bMhETTtvY3ryuFcQbyBsTn43jc5TGvlfmUOzzy0xO5UmMOGYZVKPWbrlRVquZOEsUkQOVSVw00pa2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fo4xVFpk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QS2dlw8r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fo4xVFpk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QS2dlw8r"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I5xo2N3254749
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 07:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4wM01dpinLcGjeeVb6PylFoAR0qepZkT+u1aGAqcjXE=; b=Fo4xVFpkxpoSCjRK
	KgUO6IPDONUzkS2JrL1n8IlX1/L6UEQQTP/FVnL9xCFhINyFGjBSoYp7TG8VgTxG
	XudK7qVrlKADe8oKH9Uq/aJQ/4e3U9LASuJvTJV8LmA98thSsyqfkdmldfxSiCBv
	wwzIT5qVwAT8GdxkniFxDeZ56AL3OVVsdTvZEQS805Qao7P8QqaxLYnh9bO4jscP
	JA7KaJlAbLzfnlKQdxTIvbNLe0K6Fg2Ijgi/mB0gxp/2Kuk4lPMhxzgWlGqgcLbr
	raD+2h2RL+WYQEcaHi23pisKfNOfb9k04T/J6/3RuTExEs8oUbVt1aqseBAGwkZf
	PVnd9w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grmv5jwmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 07:09:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f3426a7cso85572985a.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 00:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789715340; x=1790320140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4wM01dpinLcGjeeVb6PylFoAR0qepZkT+u1aGAqcjXE=;
        b=QS2dlw8rsHaH8Fdx4v8/5B6Uiif/ejETRypx7hzpEjAEh9yRHumS3+LBhUC9kNJeTd
         IgaZWLlgJBnEPIq5ig9BYME4kxFCnmL+BQkaXQTmQY8z2JKRwY785w0nyXng3E6oQ+++
         w9JaIK5PWsxVPrLHVuSD0+7/PvsQYtMwjdMLhQ7pQZl2e6r0Y8ygnl4tPzzzJzQikRVn
         eP5DT+lrl0jdrkAI9kq5/sbAq2ev19IaE9HQIi2cpIsAd5laeolifk3yIlZSjmekDkBz
         OSCtl7v7293zkahVCarpY1UyxDOPtaijELV8tLAMp8Upar7K7u7i0EJJ7Pxz3UxzjyXW
         kICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789715340; x=1790320140;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4wM01dpinLcGjeeVb6PylFoAR0qepZkT+u1aGAqcjXE=;
        b=T6F2u6sKULWzRKPMpflTBSQZHzlrbDS3TMHJZDneI87pw7ftAPdZRiKwn4nGA1eoIO
         GcLpZfvuF/ys705P9m0p69QflCzA9aFcJUcVeiE9EOklEAymJdZN3y4ZCBExNNTVM5BV
         XfWOKfBC+5gEdxlThYKGJoY03zpko8QLGUaIkVDsjDV/2UBJVBjFlLJHUmXvkDtRZw6E
         zd+7wFiwDhxoKaNl0Gvb9xM7Ldi8aokDsXr0dQIdXuXE3q66WxQ1OZPx/7sEYlrEzi69
         DK6Ns24yA1E/gQxe8cb2xwFotrWN0rYTgpNdFSSzDqgHZ3GOMYmYtjPpuiLYth6afOm2
         WkmA==
X-Forwarded-Encrypted: i=1; AKwUvBxa8F/jcO1YVcL++o0jkk46eEWze89hvgekjv0GTaV/HDlnYUsN0BH7+WrOj0aKdRy+LM9vLA1DvU4W@vger.kernel.org
X-Gm-Message-State: AFuF++mgRAyixTlGdOsnYyIKG2kQk9p+QalgZ91YhUu2DwvjOSRJ4Q1Q
	bdiOqEv1yLq9BpWyReo7SktH1iNN4xqU4b1kXn+An3MtuJrJAkLfQn+ofqJEUvPIq4LDyR/Gj2J
	wOdX/u1ad35kXflgapr7EfG/TjmVaxeSWlr1BHvGeC/vzp9HjwjJlPnbS/ZudMbm7
X-Gm-Gg: AYBFou2bZUjzU5dG7O+LwPGVSx+laNjmDk2N2hb8gVl3XHEnRkW2GRZ0YUH0nkUerkv
	WkA4jRkEWrsprP8nO89i2JqBK8GHrFFOJf0OEBmcOQ9jpGKJKOz4fWItNvwH8hNP2HOuxZbc1Q0
	OEhGB5MvmnVFOy7qBcOdKiP8ZOzOT2272K9E3tNPKDX1Mad9ObWjxzwOVXd06O+adKPlZOXXHzm
	WQCiklUWy2b6fZZctGJXtFgMwUNMO2sQZiHFaGHSdhp/8zih90tJKj4rgxHXM7j4YvpRhH7nRhL
	QYzfWbMZ6jt0eeIx8cC44nrzHwHp9ZvfYTEke7H9zGmuGau779JsjYi88kYlfTi4HXYbyVh3S6w
	Xmqoqq9sfDKziYy2N523vPzZQyDxy9IHj1i1ttMzBHxdW5tJPgAGdXHBhXYNTJ9Rn
X-Received: by 2002:a05:620a:2713:b0:936:623e:2603 with SMTP id af79cd13be357-93bdc6988f8mr194508285a.17.1789715339633;
        Fri, 18 Sep 2026 00:08:59 -0700 (PDT)
X-Received: by 2002:a05:620a:2713:b0:936:623e:2603 with SMTP id af79cd13be357-93bdc6988f8mr194505585a.17.1789715339162;
        Fri, 18 Sep 2026 00:08:59 -0700 (PDT)
Received: from [10.111.172.118] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91258056195sm6164066d6.29.2026.09.18.00.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 00:08:58 -0700 (PDT)
Message-ID: <ebe9f27b-4eb2-4c87-a02f-78961dbc1827@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 15:08:52 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: media: Add bindings for qcom,nord-camss
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
 <20260915-nord-v1-1-20db41a7f1ff@oss.qualcomm.com>
 <20260917-active-strong-emu-bf8fbd@quoll>
 <d89a7376-ffab-405a-a3b6-d3633cddd063@oss.qualcomm.com>
 <f6cb2a51-b385-4203-bd33-4b789cac5616@kernel.org>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <f6cb2a51-b385-4203-bd33-4b789cac5616@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA5NiBTYWx0ZWRfX4yApIN8rPmAc
 MY+yCgjj0y60aplYaBPNmIxER/NH8txH98kQ2rzjnqmcPDY9w4P1QVZZCiypw/sL6kDm6jkeiFm
 zvCXafK2t3xQI6krEYlqOLSxCI0jS4IjrWKsud5p8rQ/5QKA9rXsmSQy7n3Cg9S7KbDsgHANNZn
 BM7W5rdKNxvlYwnzpLPb8fVFsyuZHMZpL1Akpf9gt1LRb2D21B40agby5SE4xoMB6JmpNiS+JjT
 l6vN3xyUlLTL7+8zE1QG0lEoMCyPMhFw9zw2g+TnTvzzmmKEkFvhnrg5hIi5ymB7tGktafWJDHz
 RHiVgG+hqOaugFOciFlLUij8ywrvi+7OPvoFN4ECVGEcz5213ViSQhvHOMZLLH4C0J5JM+bXCNO
 riwTcNGss2iZy3xufDkzgXqQ1U/i8yrUb1JPsXqM3PFQxOBiBHinw6yubriBlweNqVzK1dh6Jpn
 8GafeuWKUrsrOJjE7fg==
X-Authority-Analysis: v=2.4 cv=E+5YNqdl c=1 sm=1 tr=0 ts=6aace38c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=qU0-ABsse5SAqXbbjgwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: eQqiMZPUAVjWXRAFJ2eT3exbsw3Nf7_i
X-Proofpoint-GUID: eQqiMZPUAVjWXRAFJ2eT3exbsw3Nf7_i
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA5NiBTYWx0ZWRfXzAi6TTgjY4YC
 1gYx2eiqQZ5mdWzSR9oYJznbh8Uj/XyUQjzE4HZjlLI9KiIc6+4VbzA3hUkTCQSM1vukNfu3lP9
 yyS07y13bBwV9wGj9zmHNL4eNq6U8go=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180096



On 9/18/2026 2:47 PM, Krzysztof Kozlowski wrote:
> On 17/09/2026 14:37, Wenmeng Liu wrote:
>> Hi Krzysztof,
>>
>> On 9/17/2026 6:13 PM, Krzysztof Kozlowski wrote:
>>> On Tue, Sep 15, 2026 at 05:34:11PM +0800, Wenmeng Liu wrote:
>>>> Add bindings for the camera subsystem (CAMSS) on the Qualcomm Nord
>>>> platform.
>>>>
>>>> The Nord platform provides:
>>>> - 3 x TPG (Test Pattern Generator)
>>>> - 3 x CSID (CSI Decoder)
>>>> - 10 x CSID Lite
>>>> - 3 x VFE (Video Front End)
>>>> - 10 x VFE Lite
>>>>
>>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>> ---
>>>>    .../devicetree/bindings/media/qcom,nord-camss.yaml | 393 +++++++++++++++++++++
>>>>    1 file changed, 393 insertions(+)
>>>
>>> A nit, subject: drop second/last, redundant "bindings for". The
>>> "dt-bindings" prefix is already stating that these are bindings.
>>> See also:
>>> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
>>>
>> ACK
>>
>>> ...
>>>
>>>> +        description:
>>>> +          Input port for receiving CSI data.
>>>> +
>>>> +        properties:
>>>> +          endpoint:
>>>> +            $ref: video-interfaces.yaml#
>>>> +            unevaluatedProperties: false
>>>> +
>>>> +            properties:
>>>> +              data-lanes:
>>>> +                minItems: 1
>>>> +                maxItems: 4
>>>> +
>>>> +              bus-type:
>>>> +                enum:
>>>> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
>>>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>>>> +
>>>> +            required:
>>>> +              - data-lanes
>>>> +
>>>
>>> Missing supplies, altough maybe this is related to some other ongoing
>>> work, so would be useful to see explanation in commit msg.
>>
>> At the moment, the Nord platform only supports TPG. Perhaps I should
>> remove this part of the change for now and reintroduce it later when
>> CSIPHY support is available, once the EVK board is ready.
> 
> Hm? So you added hardware for TPG? I do not see how such hardware is
> useful at all, thus I don't think we want the bindings for it. Bring
> real hardware, since the bindings should be complete.
> 
> Best regards,
> Krzysztof

CSIPHY support will be added later on top of Bryan's CSIPHY rework, and 
the current bindings are already complete with new csiphy rework.
At the moment, no suitable hardware is available, so only the TPG -> 
CSID -> VFE path is supported.

Thanks,
Wenmeng



