Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FAC3ADBB4
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 16:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783354786; cv=none; b=Boapes2ilhvvyd1CmTeXFiQE+CkjHo7Ph6ch8goSrYdIPyQyAqB4iOSzf0lCi+PCfVtiKP7l4S1WzmZdCzjbBEPa0WqXor5g/jVbqoViugILgNMfwFxlfaGYXZsU8bagm0IQRkHaOmEfV8p8aaxoICLq75/y8ryWYtLTUeTlIQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783354786; c=relaxed/simple;
	bh=vA11+14l5gSo/MhdBMFiq+ymaNF3lUVsP5h/DVioFiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eLIonrDo+xEzAyT/SDV80K1lteqFcKIFuLSoq/yUhOGPbokljjwqtOqcv6bn7b5qr1bNRxrwnrhqvMyukJAsmTzLhgru9skJrFN2/7qvIizZl8OlHwdGXdhixO1Ajb8HuJLujtUrPk4WqxYBdrR7IXVpjtfJncXDM8cXIX65TWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=CUkC/5I7; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="CUkC/5I7"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7eb64085c45so1992102a34.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783354783; x=1783959583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U+xEzohj9Gz6QYFWnlANkEH3cDEdCmvWNWgOEl1idZI=;
        b=CUkC/5I7FbDOMhQI5ZrOB/6HnShu82xZM4CVYvwSnjk90XdQb2T3naNc19n2/i3UVI
         ii+V7JK0pLp1KDtmdIsLCaWyNjZgZ0OTget8J/tMGdxfCYJ+GTyiXaF37R8w3+HI0cBa
         E3N4p7V0Pf+Hr4C+akIGtR2yKZtwgEqiWjsljHqAVR/h1CB2fdZJQJQ/zq9aJ5F5GtBK
         IyrVcVJC51PLGVi71LSJbE4FR+AImRHnenjYxrDsPOkxXb0iASfoyywrHRqDOHFWtgx9
         5xBxpRBwhma2d9tD7g3nSqIS0xXGvrI7j0wLUYF0wOlPPyERLK8RCBTOXYN53zSfNRTG
         IJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783354783; x=1783959583;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U+xEzohj9Gz6QYFWnlANkEH3cDEdCmvWNWgOEl1idZI=;
        b=bRApUFFbXewMRLWvg9G4wO3GxGA1rVtKXD2s00wlDxiMSKy/755KAVsegTxbbW8ZWR
         kxworeVzeKVC7HsppmZoQEwiPp+IWSjq9pc9RtWJ1EPy3JrvPE60gf/FaXdArNpK7tDo
         1SU3RHFaVml4bIwuHfSIdaKmN/Vy9Q1MV0Jq9h3j21bRo4S/2kypW1xeTMJCjJG2ZIXn
         IG2o29tB2mP6JTKxX0dIJsruSyO9ENV7y/+6mHYaH93QUeWLCEL9Y1GxfICz5e1w0Wc7
         vu6uSfhI6ezefWCu2WZ7qH/fAGilyidWDtvOLasAD4MEGuPgmdmqHE9Ni+Qy4WA24p+s
         LGDw==
X-Forwarded-Encrypted: i=1; AFNElJ/5hnDVhL2zKvL1wyrG+yowKbSTP3iwDazRIpeAqdXBYWawEwNOQqGVHUMEVfXN6ATL1fz5DdIM4IZ1@vger.kernel.org
X-Gm-Message-State: AOJu0YzCUL/t6xtSAqdCW0HvEh5VQ+5rPiV9f61T8H9NxpXC3TJeJtWf
	kyhdA9x0JkQ8x7IvFIS7g7kPESChqUGkjH1cXJF9uC3lO5NMw0gG6jAyLTg9/m5noPg=
X-Gm-Gg: AfdE7clngshbWdh7NjIVx5jUW2ETPzQqFj3wtYJz4xrubgKTMGtpOwSWH5579bf66AR
	lcJ7OwevOxa7ISGid/I2leD8WQAMCgjCJC6PLEKxPpIfyvqpkOlvUPl4Rr9dTe8bdyzUupdlbxn
	S4S7YQoN70Unm0EgDizIF3HVr9iTijiwCwuy4is5eWHStgr59XVyiRdeFp/gg89oml9ZZe5tYdS
	wCcqXrvTuxBenykF/EXOsb4VMIBkeujBbV/Rw/1S3O4UcBTManr4hPp3JUhNkZW23sp3A272uQh
	0Fo5mryR68CIoy2sV+ZhsYk2gkI2JunfYP239uXVpVWRq0U3GNtiFHwrLN7hU3EKrRkY7aL1ctm
	EagwjrF2bBV0qE7FohEfLL9NHubYoe/T1wCNvzsKpre56mdQTXzX2HevQ89aX0DRu2U7tsZLJSY
	UPaxKm1rGgaQucE6KSvLuzhmO/gag91yePxz65XlbAQBMeA2Pe8fIUrnAz4bpuqyn78y5lMKL7L
	g==
X-Received: by 2002:a05:6830:6603:b0:7dc:4947:36a1 with SMTP id 46e09a7af769-7ebb222aba7mr768726a34.12.1783354782993;
        Mon, 06 Jul 2026 09:19:42 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:a38a:a0af:ed1d:5c77? ([2600:8803:e7e4:500:a38a:a0af:ed1d:5c77])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb8a1fe31bsm5441582a34.2.2026.07.06.09.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 09:19:41 -0700 (PDT)
Message-ID: <8dd4bb6b-a83d-4584-8893-b56b8aaed973@baylibre.com>
Date: Mon, 6 Jul 2026 11:19:40 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] iio: adc: ti-ads1262: Add conversion delay support
To: Jonathan Cameron <jic23@kernel.org>
Cc: Kurt Borja <kuurtb@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260628-ads126x-v2-0-4b1b231325ba@gmail.com>
 <20260628-ads126x-v2-5-4b1b231325ba@gmail.com>
 <20260630015027.3afdfc3a@jic23-huawei> <DJMK3NCDCHL8.1EHG93D5O7ROZ@gmail.com>
 <d8fbab77-6cb4-435d-aac9-0d72cd4a59bc@baylibre.com>
 <20260701012026.29f18bf4@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260701012026.29f18bf4@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/30/26 7:20 PM, Jonathan Cameron wrote:
> On Tue, 30 Jun 2026 13:44:49 -0500
> David Lechner <dlechner@baylibre.com> wrote:
> 
>> On 6/30/26 12:23 PM, Kurt Borja wrote:
>>> On Mon Jun 29, 2026 at 7:50 PM -05, Jonathan Cameron wrote:  
>>>> On Sun, 28 Jun 2026 00:36:06 -0500
>>>> Kurt Borja <kuurtb@gmail.com> wrote:
>>>>  
>>>>> Expose the programmable conversion start delay as a per-channel
>>>>> IIO_CHAN_INFO_CONVDELAY attribute.  
>>>> Coversion delay was always a somewhere weird bit of ABI.
>>>> What are the delays relative to in this case?
>>>> Is this a device that does simultaneous sampling?  Pictures
>>>> suggest otherwise, and convdelay is currently only defined
>>>> in that case.  We might be able to extend it but it needs
>>>> some thought.  
>>>
>>> The chip has a configurable internal conversion delay to allow for
>>> external settling effects. See datasheet section 9.4.3 if you'd like a
>>> bit more details.  
>>
>> Since this depends on external components, it sounds like it belongs
>> in the devicetree. I have the same feature in the chip I am working
>> on and was just looking at this and plan to add it to the ti,ads112c14
>> devicetree patch.
>>
>> This delay only applies to a "new conversion", i.e. when certain config
>> registers change, and not every conversion, so isn't like the convdelay
>> attribute.
> 
> See settling-time-us in adc.yaml.  I'd forgotten we had that ;)

I got some more feedback on this and this may indeed be something we
want to tune at runtime after all.

I'm not really sure where it fits in though. On AD112C14 that I am working
on, the DELAY register value adds a delay (for settling time) in addition
to some other intrinsic delays. I'm pretty sure ADS1262 is similar.

So one question is do we want a usespace control to be the total delay
or just the additional delay?

And when the delay takes effect depends on other things. Normally the
delay only happens before the first sample after any other parameters
change. If we read the same channel again with the same config, then
there won't be any added delay. But if input chopping is enabled, then
this delay happens on every conversion.

I'm a bit on the fence of if we should extend the definition of convdelay
for this or if we should propose a new settling time attribute. I'll have
to think about it some more.

Maybe something like in_voltageY_calibsettlingtime?

> 
>>
>>>
>>> But you're right, I should at least also edit the ABI description of
>>> this attribute. We can postpone this discussion for a future series.
>>>   
>>>>
>>>> Jonathan  
>>>   
>>
> 

