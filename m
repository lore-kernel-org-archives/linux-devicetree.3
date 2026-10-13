Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E051F4F96C9
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 19:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791918272; cv=none; b=dniY20BrBUo70doP6Xbe0e24q+wfi7sAqkpBjHo4glxZIa6ET2Jf+fy9qfV/3VS2/dlcglcfks6VReSBl6uaCqVOlB6bYVm7aqjpEF2nuTweEY8x33gswNFGxaQaPLRLBXbfPFDTFo1pg6sc+wo3FJFueCsnE1Q+/7HUZKN+kvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791918272; c=relaxed/simple;
	bh=PVG+fL6tWhRaYjr50UkRjI82YcG7H2Vhz2OQdtPhIvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DqUm1WkAbYo/iCq8NVjuj4xR7adgS1rIReCmsNFhpzp4BGyBdz5+pR/GH8lhNG1OGgpA27etVkS9S37+3EE9otZEj0MsV1blNK6wgjpD9MaSxYIXOsVzNAsXnWtOvMEt605nyQokO2+5DZYh48AVF/RApH7EBvXwYBukuGUDX4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K5XOyA3X; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K5XOyA3X"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2e69aa07c3so35832666b.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 12:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791918268; x=1792523068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dw+YFgILYLXDibJ1USxmY+eqnIWA3ZQcZYKp70r8oiE=;
        b=K5XOyA3XRCnyAP6Rk6namb9KAnorIwrJEG6OwJ1BX2eEr73GjYkZr8v9RhB8uOS9rM
         l8jjpSvIlvPuEpUw7qJ7DFKKE5dOh5sfeHPFX4tly04X/fge2zMop7c5fNQ52HWNM8Re
         KkFGTJd5HK7n7X5NF60m8cmI0Xc/6AKPi8Wi9RVnsP/NpCgFz1gK4HeLDPEk0a8mOBhN
         lo0qZHLSN1WRXROkazCY1YLbytPqOmrQCubN6E7wWfUcbu8NdHrD+4aH3o5lMKhR5CF9
         /9UNvC929mpdngqsiNXAEifRZWvqCRU2RQDhP6gSIQGqVKwIzp/sDWbY4cVl7NkSohOj
         IVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791918268; x=1792523068;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dw+YFgILYLXDibJ1USxmY+eqnIWA3ZQcZYKp70r8oiE=;
        b=Ut0X8KcwnsqwOqfjj1AQU34pvGzyNobijclZtvsIGZslGe8hFut6m0l0EQFT6peJhO
         qqy8Q0PFEpJL+ii78YfEqF2i5mDmfXzSdLU9x8nKUmr++hmal24jON9tfRkShXN3h/Qq
         9kYHYtHGtxDxysWJlN3n7Ym7v0twW0WNUdxT2sz8VJ1bhreqGc6rYmEq2mc/d0vQdPZM
         oLurzxzg+tCYb/kSwJBsrlQ0r4cbt/YRi+MX77yXzKbEzD0Ad3RGo3bir/+HdCb1kh4W
         aNz0rCwn69SqGueNsYYVunwCA4n24/zr/a1wuw2i2IQ3+HbHDXmT5qVorjVguX4MaFkO
         gRJg==
X-Forwarded-Encrypted: i=1; AKwUvBxTz9lxXzgeDK6kkxIKHZkSy0RWXSXBtCi7AcbIaVOjM77PwAQK5C4rEyhIsGCTqIZGMENgyM7UgICX@vger.kernel.org
X-Gm-Message-State: AFq9FYLLHG2rN6PNaf8DJusWbMrx1zXc1RsMCAvPrk8i3ILKVvLDpdBI
	87S2oiikVBNiFjhUsuRyHNrStfh64udNTZp2nnCq8Dxekr1kVvP+icku
X-Gm-Gg: AYBFou0GO6xGebXdPRYaMfcKi292A3vzufncJKKR3BkRm9AfzPGRigvI7GRhqOr/pR6
	bnW02tG27QGufdp13+rjmaDvtVZnqM2sm/IHlIaZ9eh8v1jOkI/dTjp9eynmXtBvqBZ/+4XntXn
	+2csK9whSf1aDJECvLGn9XvK/oW0JqIhoyby1oJ+7u5AKCRBK7Gpa8IGHgtCBgqqS0PR62v7380
	tRDTjf9pDjsZoV42f8LsdiU0sgnYHPOxUj1AtnJy15JVd/37e0YpwLGCzhIxGlincK7NRfaQ28F
	xX/slbwIjkK7cxM68XXuxLpfW/EkYw4goJX4ITg+dPa3xoh4PyxGHVwxEBqHeF+EqGz2+MkzJB+
	Ujr/YN+ik2d8L4dEEtC1rug87oxFFRLPJT9uUVWStfD7/B9BeoCNaFdwmVqG5pBQhOq1FK6mzO2
	+1+U8IbVyyHfY7hi5Dmyls8EPG/plXLjlEBxKAOx4a1upyM+Pco84KmzrqemAYEeiSznit4btjK
	yL6xOrZJv8=
X-Received: by 2002:a17:907:9615:b0:c24:adf4:5c73 with SMTP id a640c23a62f3a-c31a9a28825mr1274888966b.1.1791918267915;
        Tue, 13 Oct 2026 12:04:27 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3596566d8bsm224558166b.16.2026.10.13.12.04.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 12:04:27 -0700 (PDT)
Message-ID: <f7475c9d-8dda-4dd7-9d11-4b981de1b7f8@gmail.com>
Date: Tue, 13 Oct 2026 21:04:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] dt-bindings: leds: skyworks,aat1290: Document
 FLINH pin
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261007085457.98762-1-clamor95@gmail.com>
 <20261007085457.98762-3-clamor95@gmail.com>
 <6a69d4aa-d04c-4bb2-912f-1584abd31e0e@gmail.com>
 <CAPVz0n0FiT93626L3MnMCto1X0_FmWp_zzQpQ=yRBXn+ir6OPg@mail.gmail.com>
 <4abc72fd-c645-4410-9387-3f03c751fd3c@gmail.com>
 <CAPVz0n1YKV84J6eG9juM_V5kLCy63WY0hmicUmyEXZp2eEHKyw@mail.gmail.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <CAPVz0n1YKV84J6eG9juM_V5kLCy63WY0hmicUmyEXZp2eEHKyw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/12/26 9:25 AM, Svyatoslav Ryhel wrote:
> нд, 11 жовт. 2026 р. о 20:35 Jacek Anaszewski <jacek.anaszewski@gmail.com> пише:
>>
>> On 10/11/26 3:55 PM, Svyatoslav Ryhel wrote:
>>> нд, 11 жовт. 2026 р. о 16:28 Jacek Anaszewski <jacek.anaszewski@gmail.com> пише:
>>>>
>>>> Hi Svyatoslav,
>>>>
>>>> On 10/7/26 10:54 AM, Svyatoslav Ryhel wrote:
>>>>> Both the AAT1270 and AAT1290 feature a FLINH pin used for mandatory Flash
>>>>> inhibition.
>>>>>
>>>>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>>>>> ---
>>>>>     Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml | 4 ++++
>>>>>     1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
>>>>> index a65d92522c9cf..596b5e284f44a 100644
>>>>> --- a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
>>>>> +++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
>>>>> @@ -31,6 +31,10 @@ properties:
>>>>>         maxItems: 1
>>>>>         description: FL_EN pin
>>>>>
>>>>> +  flinh-gpios:
>>>>> +    maxItems: 1
>>>>> +    description: FLINH pin
>>>>> +
>>>>
>>>> You don't seem to make use of it in your patch.
>>>>
>>>
>>> I don't have to use it in my patch. This change completes and improves
>>> hardware description of the AAT1290/1270.
>>
>> Still, If we don't have the use case I'd avoid adding it to not confuse
>> people looking for its use in the driver.
>>
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/writing-bindings.rst?h=next-20261009#n17
> 
> - DO attempt to make bindings complete even if a driver doesn't
> support some features. For example, if a device has an interrupt, then
> include the 'interrupts' property even if the driver is only polled
> mode.
> 
> - DON'T refer to Linux or "device driver" in bindings. Bindings should
> be based on what the hardware has, not what an OS and driver currently
> support.

I'll leave it to the maintainer.

-- 
Best regards,
Jacek Anaszewski
