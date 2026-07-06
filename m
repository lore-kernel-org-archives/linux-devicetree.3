Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768F038645E
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 07:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783324655; cv=none; b=Hu0HAR7pDrE1r40mmjw3n9dDXH73DVSuAnBLEtco/ILHJYAnmKkhc4kHr6ic1r7Bla4Ru9zQBhCHjyfJ61oXisKGFc4D9SfAKFCAgx3JAtaxQ2gvx+u87eNwo8rpH1W/696FwUZLUVPGfZuUqQSdTkJGjWXV4oMO8mXyvDdFTOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783324655; c=relaxed/simple;
	bh=9rUAdY1bqdroaIZBNoRnWUT1ZjWTBEwO0TyKfjFIbdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NZa2n191tVJhV4Nog4loCih3DtffiBco6sy3RqfUF1LUu3VnyT0LarINz6ICOxkuEMD61vrJprObjbCDi4pzY0rQg8jIy8VoJ2xRfoJs490uqrcG3uUrqYppjbOPkChTtX2jKQNrppI+cou8HECBFLWc6DVA9qvEUGal7keQuBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tIER4XnP; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tIER4XnP"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso27935885e9.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 00:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783324647; x=1783929447; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wPDzWcnE/ifTtdQxRYWVMNosWjNjJ8DQqD5V74MEqYk=;
        b=tIER4XnP4CRpLZw+G8woC/s/tsQ4yLnPO0NYINiXSmFo4IC3mVFzfFo3SOpHFUpKKU
         4OcQOkFJDJ09cBSdNmVw8jtNJ8g3CDOVrglVrYXXeEDi/C2bZjgpqQavHOoaWErbgy5j
         9BLeG8QAPb4i+DtUcgaMZAdMKpkaUsWsVthLZlr0dF5aAbvgwcE/Q2Y7EXlK1NbCNLs9
         kWAv95Lfqm9K0aUWi2VQQSOq165qDeq/sE5MUua7QVU26kYaGv6wlv5emtB5dgs/nz24
         AcTztPUTmyfbC9eeH6twz7uV0LMzpXVtcSvnBdaOAtCH4CxJ3Do+czh7KUKvx7/nXzrH
         ZYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783324647; x=1783929447;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPDzWcnE/ifTtdQxRYWVMNosWjNjJ8DQqD5V74MEqYk=;
        b=jCT1lPTCQ9WtMU6TONw7rTD9nYRb3/mYT6s2dB1Dr5waz1v4eNds0fITOlzLTcrTde
         2nTfLu6fqvBkKrpCC5rVtrW9Il7WmztLGLNCd+ay8PGRAjPuViOxEBn7y//Eo5WNgfmi
         VT57DgVqh4IAyI+RE94Fio0N/arDR5HbmGYmUq4Q379KNnzUg1KgMAWv29kqo2Nmbgp6
         UyBlU78S2vcDMB4hDMMKsfUPtsuf+yDVvy+A+Qg//lC85ktyjRBfu9NTQHawgub0UZI5
         Su4ML3jfZ/+pvGFTim0qqVrqFyeTSDDjZ1nAdPBSGqiWMpJUy9rn+ay64+44PbH/6ere
         ACmg==
X-Forwarded-Encrypted: i=1; AHgh+RpuH8UVviX3YZhEaBZ/qsrX3UAgj7t92Kc2Cf8XqhjUqS4ZTXiBteKxmGQqiqo2RDw66J0p2B4BTxWn@vger.kernel.org
X-Gm-Message-State: AOJu0YycRqugBQcbW7pt9+1meBVkCRnVdW22bN7e6s7F5x1npjxc5NGo
	jK9ncmCkOQ4Hae38MfAhuU948BL2WVJ+3FlJm7g8VMUegNjyJlzYilFz
X-Gm-Gg: AfdE7cmJVN9O9M7+pJCnauE24gOV6rCOS+smovUBbupFU3/qQejswGIwBZyMaUJZm6y
	7f2sR479pBwrkhVpSEXbC9qqnxqUWW3KpzMQVQYxnc/wG0QoS66aOnpqD2Hr1Deb9VvNtl+T3IH
	JxEQIx6XIV7wChgBIivAekSyreMcfYPKwsFB32t7jMWrWaaLRo5HHu50OmdWoR/Fz946U7fD+7P
	FwStRG0qOh34AGW1/kkTWSLpsMxqKnPJvlxKxHiayrVVTVJBXZn34uE/u/HbHvGBPndQTYQ0cWN
	jhOD82IYchQtYXGr31/cBaUb/O1UmuIo0nTkm1eq5GbqZkHokJJq3vCGwiFuf/s8E6FmbmMvBYw
	QNrCxI9alEjCwAFccj8sd2e3p/Fqp/D75OsnovKyHiCySPGrMH4MV7oI4zgHI5rw/NLK3H1U91R
	teBfVqfPs87bItUZ+062IP7I6r4+5oiVr2uejISj13c/JlrBqG/9W8JYKlMvA=
X-Received: by 2002:a05:600c:6087:b0:493:dcad:84ee with SMTP id 5b1f17b1804b1-493dcad864amr16118265e9.0.1783324647312;
        Mon, 06 Jul 2026 00:57:27 -0700 (PDT)
Received: from [192.168.1.107] (87-126-128-216.ip.btc-net.bg. [87.126.128.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce03fa1sm256320455e9.11.2026.07.06.00.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 00:57:26 -0700 (PDT)
Message-ID: <c0e3a874-0d9b-4fc7-bfe9-23ad9d339918@gmail.com>
Date: Mon, 6 Jul 2026 10:57:24 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-binding: ARM: samsung: Add Samsung Exynos8855
To: Alim Akhtar <alim.akhtar@samsung.com>, krzk@kernel.org,
 peter.griffin@linaro.org, robh@kernel.org, conor+dt@kernel.org,
 linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 hajun.sung@samsung.com
References: <20260627171228.2687857-1-alim.akhtar@samsung.com>
 <CGME20260627165406epcas5p1be75af2010edfc57cad0f668a8e3568d@epcas5p1.samsung.com>
 <20260627171228.2687857-2-alim.akhtar@samsung.com>
 <4df9f388-2dc7-47b6-afc0-7a0cc6d15ca3@gmail.com>
 <08ba01dd0cf9$cbe0a4b0$63a1ee10$@samsung.com>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <08ba01dd0cf9$cbe0a4b0$63a1ee10$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/6/26 6:44 AM, Alim Akhtar wrote:
> Hi Ivaylo,
> Thanks for your review. 

No problem :D

> 
>> -----Original Message-----
>> From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> Sent: Monday, July 6, 2026 4:11 AM
>> To: Alim Akhtar <alim.akhtar@samsung.com>; krzk@kernel.org;
>> peter.griffin@linaro.org; robh@kernel.org; conor+dt@kernel.org;
>> linusw@kernel.org
>> Cc: linux-samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-gpio@vger.kernel.org;
>> hajun.sung@samsung.com
>> Subject: Re: [PATCH v3 1/6] dt-binding: ARM: samsung: Add Samsung
>> Exynos8855
>>
>> On 6/27/26 20:12, Alim Akhtar wrote:
>>> Add Samsung Exynos8855 smdk board to documentation
>>>
>>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>>> ---
>>>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
>>> b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
>>> index 753b3ba1b607..273464400477 100644
>>> ---
>>> a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-
>> boards.yam
>>> +++ l
>>> @@ -235,6 +235,12 @@ properties:
>>>                - winlink,e850-96                 # WinLink E850-96
>>>            - const: samsung,exynos850
>>>
>>> +      - description: Exynos8855 based boards
>>> +        items:
>>> +          - enum:
>>> +              - samsung,exynos8855-smdk         # Samsung SMDK
>>> +          - const: samsung,exynos8855
>>
>> Is there any particular reason for using "exynos8855" rather than the
>> commercial name - exynos1580? We've already established using the latter
>> naming scheme as a convention (e.g. exynos3830 -> exynos850, exynos9830 ->
>> exynos990) rather than the development model numbers, so I don't think
>> breaking that will help anyone with the already painful model number confusion.
>>
> The reason for using Exynos8855 is that it comes from the chip-id register, which is RO register.
> And in my opinion it has to be chip-id, maintaining two names is confusing (as you also mentioned).

I see your point but I'm not sure whether exynos-based platforms like tensors
will follow this. Afaik GS101's development name is e9845. So there likely will
still be some deviation.

It's not really a fatal thing, just a nit imo because all bindings will have
to follow that for the upstreamed SoC, so non-revertable. But if maintainers
are okay with this, I'm happy to start using chip-id names for future contributions
too.

Best regards,
Ivaylo

> Yes, there were couple of deviation but let's come back to the "original" convention (which is to use chip-id).
> 
> @ Krzysztof, Peter 
> Any input on this? 
> 
>> Best regards,
>> Ivaylo
>>
>>> +
>>>        - description: Exynos8895 based boards
>>>          items:
>>>            - enum:
> 
> 

