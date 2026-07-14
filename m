Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC9639CCF8
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 19:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057130; cv=none; b=KdZ+bUY5bo9szaNEPk2AWFMPe4c9uo+xMz8UURn8l+N2uRQKP0u2ghn5P5DwSFA0iOf/vIg9dPnncJ9G4K0f21mUIOv2N6U2cJP3fcmWhTvJ0YX/ggugcQbWYU1EfLdgf30jiYYobuae8mdviboHf4zVYuSE1Yd3FWWLhCuRfXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057130; c=relaxed/simple;
	bh=EX5yKJb8Euh5X5VHbTkU92t1oQnTP18tRQRozxrHgjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FsC+7y53uQFK1qJ+O6kpdVgXBfphodFvyxLorhX76kQvmv/CrtxYXXcbJpcJUNeSaoZ7gs+wbAWJKJ0ORjhl6MSlry/d95CQ/3xIRPKVxVgQztf2Oz6uTk4tZZNagdCMCdvqJZXgtyvIgqjvw65CiXRwwlVkm/0A5MyDYDuvRO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GhqoKbLY; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="GhqoKbLY"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6a3d77e72ffso117180eaf.2
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784057127; x=1784661927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m4ONTzaMp1liWwOrIeA/8iMl09tZSizZYRiO5e4Y3Gs=;
        b=GhqoKbLYyftAiGIg8EgIbsYWldMPOvKxIFb22SgeixCVTst2JWWD2aEcB9SK6u2YvM
         qJuVrERbTsFIdhrmOu4aBJZLPGBvstKa5SRfItuFpvL//7uOuKGHjbPnj/VsjZTFY5aj
         pubxwCtuKPygzb02zFtB3uuIYgvDdlSLGl+O+mKPm7mp67i9ZBENz12Yv3niGe05oglJ
         rexz+IEVAkSqii+xRSAy3oKmbs1H/69SdG1W2uPDOVfi1NotCwxiuhtMAu0bzkHLZ7Wt
         sKY1ovQurxASlLJKA/NiO794CF3EvgYN7eC5UX39lDcbiowNabTM4H+KED4nNAoW8iAu
         iYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057127; x=1784661927;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m4ONTzaMp1liWwOrIeA/8iMl09tZSizZYRiO5e4Y3Gs=;
        b=sj4U5GC9l5sivd2j4caaYpgjwbiS0IaUdLV9eLQQFpbhGnHXsdD/lKrtW8InzUV3im
         zNYrAOll9jHRMtt0UX/9n28TvXwPHlyhUSl22IHiNLjZ0PRr80SkcxQvnVpen4SS0CZD
         sEO+y1TyyMn0kWxsEfvPOiwL4auvE67gBh3BBgaKU8M7hq9yPgwFtreyS7CFN5TrDA8w
         +CPkOVd7Obtlfhb5gUNv9MRsRZPxYucgIoWrL19j3t76WrWNn8I3g9hhhARj08F+++sk
         y7mL1lTopR9QzZtHS4xtvZWcnT8xwJ/p5f6hKqe0g7xLGnl9B9rvB+ew4W5D7WA7Elwm
         vLdw==
X-Forwarded-Encrypted: i=1; AFNElJ8VYfK8YDD3NLJiP42Omw439uokvQE3HM3LNhQ+dvi4KvxiIJxuDb+bdvBgllxoADwFXad6rXhaXeQt@vger.kernel.org
X-Gm-Message-State: AOJu0YyGygBr9euUCsItmioDfpf8a7SjQQrchdOJjUg15BB5A4NOd3XJ
	h67YVLIuMs59w1t8Uzg/jhOqj8ARqX0UhAYkjXCztIK5chWM1vdX9Fr2IWTRJmPcKng=
X-Gm-Gg: AfdE7clQb24TMesPTRU7F2Ii9MJzrkTTWFzaUBxB5Bk+l8q6R8XL+gYMUyOypM/wOtQ
	5AJ+1xtv0D9vwI5P+zz8Ln6XWpR6FKDCj+bCHXR1bANgQIhTwc7IBM3agVXKORs7wkfC15T5itL
	j6aeOmwmTqIA5I/I6P7YS0H6GQZTFGqD4Vxh7r0fCXxIGyuVdcAQAJ0Tj0rKV+c1k3bCW9HJ47u
	00Pv5BxyUnamim+7yKA8p55k72mikwV6xyPoc+lzQz66zo8ldsIDb9y2rLV386oMy95lce44uwF
	ahD3eTgbGQuAmqDi8dTqZpgIDdQ3t4WbjgRr5xkrlsxuaPsIwXQ5HUklnarFjl/52VdDpgmj6T9
	V2+otsQxX6jDc9OfRrO0Cf6oFVEXzb6LBZn/CZctgi4o+u+ndnu26Trhc73S4COE1fLC1iJ2kvh
	X26BinMtq2ewPLRrnp+iY9ppENw+qMYcGnyqqFH7EeZd4sd+NI9qGf4FRwg3vY++5iN8/615RD8
	w==
X-Received: by 2002:a05:6820:3410:10b0:6a3:c52b:b953 with SMTP id 006d021491bc7-6a3c52bbe82mr2181491eaf.50.1784057127280;
        Tue, 14 Jul 2026 12:25:27 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:280e:69fd:7612:d5a9? ([2600:8803:e7e4:500:280e:69fd:7612:d5a9])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e16c7d8sm8811266eaf.9.2026.07.14.12.25.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 12:25:26 -0700 (PDT)
Message-ID: <2a86e4a0-0203-47bf-8857-cf4fa9b642ff@baylibre.com>
Date: Tue, 14 Jul 2026 14:25:25 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: dac: Add DAC8163
To: Conor Dooley <conor@kernel.org>, Lukas <lukas.metz@gmx.net>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org
References: <20260708-dac8163-work-v2-0-3acd1bf20182@gmx.net>
 <20260708-dac8163-work-v2-1-3acd1bf20182@gmx.net>
 <20260708-spotty-spectacle-f270b4c66d18@spud>
 <alZPZuAQfiROz8kf@berta-MS-7693> <20260714-unweave-pointed-ef9c6c02a053@spud>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260714-unweave-pointed-ef9c6c02a053@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/14/26 11:49 AM, Conor Dooley wrote:
> On Tue, Jul 14, 2026 at 05:01:58PM +0200, Lukas wrote:
>> On Wed, Jul 08, 2026 at 05:37:44PM +0100, Conor Dooley wrote:
>>>> +  clr-gpios:
>>>> +    description:
>>>> +      The device registers are reset when this pin is asserted. The output is
>>>> +      set to zero (xxx2 devices) or mid-scale (xxx3 devices).
>>>> +    maxItems: 1
>>>> +
>>>
>>> Sounds like this should be reset-gpios?
>>>
>>
>> Thanks for pointing this out. The description is actually wrong. The
>> datasheet says: "On activation of CLR, zero scale (DACxx62) or 
>> mid-scale (DACxx63) is loaded to all input and DAC registers".
>> That means other registers are unaffected. I will update the description
>> but the clr-gpios is correct in this case i guess?
> 
> Sounds about right.

For ad5791, we used clear-gpios for a pin with the same function
(even though the pin there is labeled CLR just like here).

So would be good to stick with that convention. (Same reason
we always use reset-gpios even when a pin is labeled RST, it
is the same function.)

