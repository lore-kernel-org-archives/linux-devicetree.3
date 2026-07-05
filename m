Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D992D211A14
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 15:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783265694; cv=none; b=OygVGWc3KW5oJtTNiecgckaC25fQkm46tfGNgv6IIRJ0tUJbkXj1Y9TYwWPPglcB4Hi9Dhy5Hqzm+uThNG7tiKev7b+A5taUaFQdjyj+XyA+1PJtIixQiuA4uRBxyy12+eWctxBAMssuK/MSuwEGFd1Ab1I1thRTO8rvFXjLmk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783265694; c=relaxed/simple;
	bh=2Yc2IMD0mgTkF39SyRHg6q3EK+7fbcohsK/5Wz6q898=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GZdE/96+xLZEAbpQ6x5vXypUSFmw6JlTpvdwWTh85zg//MoIVS1f9fZ/acJ6Ic8XmZ1DusSeNk/MutEStgPQK0ZKXu90KuLAolxtPYFYFlgTqw3d+V/cExN8qVMz7juWRAMYVSYJGDGXyML/LitziITSHfBAwIqymVKYzXo0mmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuVK7ctZ; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OuVK7ctZ"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-381065a7a03so1529962a91.0
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 08:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783265692; x=1783870492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uPm/HN4GUNTi7jMto5jqjALmE4rLy5csX5siSaTYK+Q=;
        b=OuVK7ctZpjf4W8wbXOGHLD8m7MevTq1rZcAL52EoyQF1kaRyTGE5ljbawcs/cAYtps
         wkra1OME/NgilTSPXM5iY7ZiyM9TOpLwN4l0VVZNWFq5lVcxIXAmMtl66cGeHHk2VrLN
         UFvljSV4pIPASSFglVUsBefT47qj/LMVyWcKQvEhehrrIMm+KkqatTDWvzYZV6OPxH6g
         GHa+7D1vcEjpN0LrFAzB/WKIuBx9YQOXOSNFMd59koSV1boh9+72FnaId9+93zoHsB3q
         HDp5AOsXxjIVwmsH7ZpvNC1++4ggxyrxXQu0t+cEj5z5Mf9uv4/F0OC9yg2TEEL8O+kx
         F8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783265692; x=1783870492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPm/HN4GUNTi7jMto5jqjALmE4rLy5csX5siSaTYK+Q=;
        b=p1LqogI7LZOllwRsRGLRwGAqxtazfy27sl0pAzDmRDniBYHch+zQ8zUiIIt8k7UJ3Z
         twRMW3A19BdDHbNE48KZpKWcIq4CDKsnak8p5jtrQ+uEJPDnVFT0/Rd7I3nGYPApE6jk
         c8e4rnyoJiIMnS/zipq+/dxYMJJ9UCqRRDXUSVmgV+Rt4uJ8aCSlqiJ+yJ50x1syQX5u
         0DEsuI1p2vXNdWk1+IrrCc9o1iLwcjflD3oXbfeQjHFKQ/wPA4+P0ie7qJmj7KcHTeFy
         NlFDncF6IRZEoVcf05XA6/8X6orP9u7t2M4upU/sCiDxYB5MhVJNESHHa/XhFt6iUB7+
         5ZUQ==
X-Forwarded-Encrypted: i=1; AHgh+RrqFk2yzPSmF08pok8/KF3lBMFgyJxtpHc6+a+ikWh/qgPfdBkqeGbKvD6IZMe9p5LCNMNW5NMdpjVb@vger.kernel.org
X-Gm-Message-State: AOJu0YwGlff+ZdoAE0FnGtrSssU5BIfWLbBbckSTM3Y5419+yNT8dCmI
	46XWhufjpGIK9L7+imfaemdCgdeeyLEiZVECYkvd7tjsLCfxrPtTG2B3
X-Gm-Gg: AfdE7cnGsjy0u1qV+jIRF0PGVNESjMpFG9nkizvA2Kgltgln5YLD3wcgc3JkqBz3qY0
	nLgQ+1kga8kAsR5PQAnoA/z/hCccCwyetW1/8njs8WyI3eqxz35ztynQk7SpmnkqGsndY0qPimQ
	+epsE7g64ASTh8ojkqsSZNOC2m0HlILgQB8PpNFnsmPtYMtND6NmHW43bSwPDnZ5arOnxHa1F7Q
	OQARDb+obScedM2ZlemzM87WUh1+GOeBIaM11HFm1Enky8HlyymDC7VuxzreOf+smIcFNSMn/4Y
	d+5vgTdBRPJEyKhCRbWsVfup+urn6t4nRR40q9loSgyf0O6c7tyhz89UJVlQbrLArh+MqAi6req
	Wks3BX4Vvuy1GOG0VLBAez8VC6KOWD5vI7qn6Kvems8BhdzSqIApw6x5KfcsfqMmefNSc2/1FEF
	wwIepinIAB3x4v6fKTBIRyL1DCBniz
X-Received: by 2002:a17:90b:134b:b0:380:534f:58c2 with SMTP id 98e67ed59e1d1-3829f5e8447mr5859302a91.30.1783265692223;
        Sun, 05 Jul 2026 08:34:52 -0700 (PDT)
Received: from [192.168.1.91] (cwgw.codeweavers.com. [4.36.164.2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f3c8b19c7sm25398486eec.4.2026.07.05.08.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 08:34:51 -0700 (PDT)
Message-ID: <68b83361-42a5-45ac-8441-f0661b005f85@gmail.com>
Date: Sun, 5 Jul 2026 23:34:45 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add Acer Swift Go Pro AI
 (SFA14-11)
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, konradybcio@kernel.org, andersson@kernel.org
References: <20260702063156.35169-1-kaipeng94@gmail.com>
 <20260702063156.35169-2-kaipeng94@gmail.com>
 <9d9645e5-2e63-4c22-8b5f-b0f4368c581f@kernel.org>
 <bdac77fc-41a2-4c89-9f60-3a8eefc9b9a4@oss.qualcomm.com>
 <a15ae7ec-4a83-4d14-b187-738f5006008a@kernel.org>
Content-Language: en-US
From: Kaipeng Zeng <kaipeng94@gmail.com>
In-Reply-To: <a15ae7ec-4a83-4d14-b187-738f5006008a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/2/26 17:32, Krzysztof Kozlowski wrote:
> On 02/07/2026 11:29, Konrad Dybcio wrote:
>> On 7/2/26 8:27 AM, Krzysztof Kozlowski wrote:
>>> On 02/07/2026 08:31, Kaipeng Zeng wrote:
>>>> Add compatible values for the Acer Swift Go Pro AI (SFA14-11),
>>>> using "acer,sfa14-11".
>>>
>>> "Add Acer Swift Go Pro AI (SFA14-11), a laptop based on the Snapdragon X
>>> Elite (X1E78100) SoC."
>>>
>>> That's it. Don't add unnecessary boilerplate.
>>>
>>>
>>>>
>>>> The laptop is based on the Snapdragon X Elite (X1E78100) SoC.
>>>>
>>>> Signed-off-by: Kaipeng Zeng <kaipeng94@gmail.com>
>>>> ---
>>>>   Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> index 50cc18a6ec5e..6b997d615bad 100644
>>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> @@ -1142,6 +1142,7 @@ properties:
>>>>   
>>>>         - items:
>>>>             - enum:
>>>> +              - acer,sfa14-11
>>>
>>> Why no user-recognizable name is used? Look at other consumer products:
>>> lenovo,thinkpad-x13s, lenovo,flex-5g, microsoft,surface-prox,
>>> lenovo,thinkpad-t14s-lcd, tuxedo,elite14gen1, microsoft,denali,
>>> asus,vivobook-s15... and so on.
>>
>> We have a good mix of both. I tend to dislike relying on marketing
>> names, as they may be similar (or identical) across wholly different
>> products.
>>
>> e.g. microsoft,denali that you mentioned is a MS codename for the
>> Surface Pro something something
> 
> I am fine with mixing (swift-go-sfa14-11), but the model number alone is
> very hard to parse by humans.
> 
> Best regards,
> Krzysztof

Initially, I chose the model number because Acer has several QCOM 
powered laptops with similar product names:
  - Acer Swift Go Pro AI (SFA14-11)
  - Acer Swift Go 14 AI (SFG14-*)
  - Acer Swift Spin 14 AI (SFSP14-Q51T)
  - Acer Swift 14 AI (SF14-11*)

Using the product name directly here can be confusing.
I think using a mixed name (swift-go-sfa14-11) is better, too.

