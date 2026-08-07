Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6310B377AAC
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 18:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786126505; cv=none; b=Kfv20txolRFAqeRYFNybld+RYOSjjkle9QOgkNd/SXi8le/rCH4Euw6QUIz3AdugWYJ+5EGSbXaAbiP7MIZnV/zOKK4Re1IgNgGtkVevaGkM0A4TEErZGS+GCpsyyhp6O6EZHa6ifZLhYumP/d4V/Rv1KQmpis0mA0ubFG2ELGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786126505; c=relaxed/simple;
	bh=s9tjNp6sYyYP4mCT3gXmsSd7L9AQpuVwD/wbCY/jEec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2yRhB72F4zQAEd5SAivlO+uiH0AGKySEmNBweUXzNJkcp8cFWdhN/dzisFY7zEvd0Z4g1xRkZi3gsB0rD0kdD5P3KZTHDSKxjW4yzU7sTTZVrLlXMpXch8NblfORgz/QaTL4A3kz/Ez/44oeofLoahC9EzTWUak+esr8zXZIvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=pYUZhPwS; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="pYUZhPwS"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7ec3b429a3aso2643628a34.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 11:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786126501; x=1786731301; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O7m1ciHkvtKCbvcubLILJiqP/goECKk0dZZNr4piEjQ=;
        b=pYUZhPwSJxeO9WBfXuZFCy+XTWYeJFw2E4CTViQObxGkLsJFuvu2dPDqLak1ROGuz5
         P38wMNPMXE2fPz1A5MjSSXe60c7iCLf8PaMyRmZ9p5wZhF7rYakZ92qa6LVEQ1ngj3Hm
         VAWwkcmHrQKzaDSDRGO4fo26pC+UiHaPvt2TEgEYuVwI+5tIjf1CbyFvNkqHVcAR+8at
         57EAPGGpG4CnGeP74WdGT8CZM4REzccVR5ZCrjvcYDDlom6nlCaw8twffqBYr63P+iAv
         NSJ0En7H+0oKQi49EcP3Z/ukleylKQeHvEem6O3QZ4MnAl2snIkhhTYTXyfUiFwxLqK9
         57Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126501; x=1786731301;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7m1ciHkvtKCbvcubLILJiqP/goECKk0dZZNr4piEjQ=;
        b=b+1dkjpx5hV1TmuZZCAEx0cPR9qgu1I38714zjPYQe3PeuJ6vq6t+PbTm5/KLzodQ7
         1oul+5WXlLchG7qNJYYAymcQhBNxa+mhWB4JNTXGLW4tJlXhrI/Z4oNW3Ta4hs7M0hzS
         MKRpZGClv968bT77E5tzDds4TWPR4fxYD9SgC50cZv0v6yiyo10FJeyL+SmgOXN7Ubm2
         22ZFpd2LYW8/tZz6VgBke0zPwOvY5kYTNbCrB0tPPfUJdRmJfWd29Oqh0bdjgHGumhoQ
         UKkzuycZfA5eQX92M3EHAAz/A1BCTHBX62tmczIIPvsmoD9InqmhdaErUfd1nwAaP8AL
         fOOA==
X-Forwarded-Encrypted: i=1; AHgh+RqbXlNCi+0FZPFPRFgQGv4QT2YBkTD7jgS0uQZ+8KIlK/bwbhEd+rlQjD8Idg3ZK7vU0FY+gMXpp20u@vger.kernel.org
X-Gm-Message-State: AOJu0YygOHWCSKjk+SckVlM5mcBgzO7vSjR7RoeaZXtGiC+limswMQ3Y
	YQ0ZtrnAiyuu6mPmKT9b37ak3RIQ8VsKV29R1ZkzEkgx1Ku0dtSi438Cq0Fodt59UCs=
X-Gm-Gg: AR+sD11r07jHUcQ4pGJYLHvQCWVZTq+qSSBO1EIB+CvRYd3R0f+Joyamb7MOmYvvbdV
	8WNssZqe9m5KBZm+bPBCKcl+IwAvzwPWcWBrO/x72oP1Dom5eqwwFgSaMvqCXvZPpE8Cu/npJ7R
	G6dbTMI6OqnMFK1CL+7G3FwxzwTwYlXdzNfm6tkkjdZt90hPxP+Dk0fpp4VI6QWT2QSvqaF8IxX
	3VHLwIiYwEMEHfOkjtRBP1Q6o1J7UJyo4vM+xVtC9YhNkbdsc5xFvmPvugvmP3ncKRrDB0s7+pi
	YghVB8/l7MRfx3kqoQBj4VI7036IIXDC8kXPBD2LFGVTPMnL4Zzd3cZF31bnpBAIUFnl+ynLDeM
	QvVJDfpQsQkjphZbxql2rg5lzBsFrwwF/hVBFasl7o4iZ5HbJAC7K7XdfjVdQNEFZ3hKtiDQLdJ
	8BFb3BJa0pcxd7XhodtqCKd6mxjbIFEWNcMgZqG4lZ+dygpelJagUmOhvNnbHp2PXx4bKDzyXhn
	fxkghpA3XXbxl6ONwZE51mLvqdDw9e1pa0qOGgnAEdF10G4
X-Received: by 2002:a05:6830:6685:b0:7ec:2fe:1ec0 with SMTP id 46e09a7af769-7f1e5ce9482mr16883603a34.4.1786126500710;
        Fri, 07 Aug 2026 11:15:00 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:b714:88c:313d:dee2? ([2600:8803:e7e4:500:b714:88c:313d:dee2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f35b563978sm1826299a34.4.2026.08.07.11.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 11:15:00 -0700 (PDT)
Message-ID: <53ded669-6dec-4472-840c-91052b1afcb3@baylibre.com>
Date: Fri, 7 Aug 2026 13:14:59 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dt-bindings: iio: proximity: move LIDAR-Lite out of
 trivial-devices
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>, jic23@kernel.org,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mranostay@gmail.com
Cc: ~lkcamp/patches@lists.sr.ht, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20260714215433.41259-1-rodrigo.gobbi.7@gmail.com>
 <7b8973fd-385d-4532-8213-bb0a811081ae@baylibre.com>
 <0ca14770-bb0c-4be7-a9b0-6e07d521550d@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <0ca14770-bb0c-4be7-a9b0-6e07d521550d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/7/26 12:10 PM, Rodrigo Gobbi wrote:
> On 7/14/26 19:44, David Lechner wrote:
>>
>> interrupts:
>>   description: 
>>     Mode control pin can be used as a status output to provide interrupt.
>>   maxItems: 1
>>
>> Mode control pin can also be clock output, so we could add:
>>
>> '#clock-cells':
>>   const: 0
>>
>> if:
>>   required:
>>     interrupts
>> then:
>>   '#clock-cells': false
>>
>> I only checked Lidar Lite v3 docs, so we should see if these are available
>> on v2 as well.
> David, quick pushback on the #clock-cells suggestion:
> 
> The oscillator-output mode, per the Garmin datasheet, page 8 reg 0x4 from [1], isn't really
> meant to supply a clock for another device's logic. As I understand it, it exists so the host
> can measure it against its own reference and compute a compensation factor for the device's
> own distance readings, since the on-chip oscillator is only rated to ~1% accuracy.
> 
> That seems like a different relationship than what #clock-cells models: a provider is
> expected to report a rate that a consumer just uses to drive its own logic. Here it's the
> opposite — the rate itself is what's untrustworthy and needs an external measurement, and
> there's no consumer that would actually want to clock anything off of it.
> 
> Given that, maybe it's better to just describe this rather than model it as a clock property,
> or leave it out of the binding entirely for now until there's an actual consumer for it? My
> point is more about whether #clock-cells is the right semantics for potential consumers here.

Yes, this sounds like one of those cases where there isn't an obvious
correct binding and we should leave it until there is an actual use
case to make sure we get it right.

> 
> Tks and regards.
> 
> [1] https://static.garmin.com/pumac/LIDAR_Lite_v3_Operation_Manual_and_Technical_Specifications.pdf

