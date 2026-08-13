Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAAF43F4C5
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786609169; cv=none; b=nmDbC1/HWDy5nL4U6FMq9tq404VULhI2DFe8pNYRUETLkvexoP1nwjmWSVR7lmjFBz6CpUidKeqjYDSnewtXEufxq1Q0Zo5gXg0RSmg4ndX9KXNdWyi5ew51wqcgICfa14G8S8V1tEgFtOSNjKVj60hCqZV5cEcyY7FoSkuAqT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786609169; c=relaxed/simple;
	bh=3o0ghu/JaY4o1UrD0lyf5hXneVEdMI/7Llifd12GZP8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Yg+v2FhOrnduExP8x8k91AHtJEi2kQJI11Lxpp72GN2fcCz9NU464lhQ25IlQQGvZYY4F/Ym5UlRdko1RE1q6ITNwlo4S4rGF5+fXhzuRs42qARusX7wuUJHDXl4kz7pKJmDoL+RLTiDALZTKLj6Zxl7E+okXZy1BzDUq1V3Bco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cMH1T7WE; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cMH1T7WE"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954aff6088so13087585e9.3
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 01:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786609163; x=1787213963; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jnnmyEy0HKcgC5aHIY6kah2VQrRaESEvLGC8LbPQC3Q=;
        b=cMH1T7WE+q/CHYWpL8oVP2DobIYxltP/0UFkaXGKIp2Ly6yLvPfW8soLHmrFUFI5Ho
         3zy64UslUyBN1KcGLk22pIaGsO5ehM22Kz3ixB8dnYMqXF5xymlyxBE/bTf78UaE2SJt
         H3ht2pBpr1j8xfNEeCSu4mWP6/z9jxaC4P0ym7/D6VbufaIm25GECz0ynfHMKJBELL6L
         tYKxLAC9S8IZSAxP9ILd8ulGkZ75y/OP4DPrBK6hL3HDAWYrOt/pA3ucN+UUh0mkOcqX
         3vl0Lxc/GoYgVZIZ3AY6xrG2n38U/N0A9H6hutFuZUTjEZox4h8aFyyrdwJwWQfEvtZ7
         j0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786609163; x=1787213963;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jnnmyEy0HKcgC5aHIY6kah2VQrRaESEvLGC8LbPQC3Q=;
        b=nD4tzQOzgcfGN7YZOEC4RcL7yea3a5eB1Y4/I6JYA6lkX5eZ6rKPDanUhgXPp0BzlE
         Yh/5QyfNxttNDCKIY9qsxQbSNnX5ofcnU8WR013DkzNhsIRSowa5wuEg9AVpFgmaorvw
         3nV39SVmOUxBvYtBW44GaJ3C66bgEYr9fNfa7iscMniOCJq93VF0GBYUOeK0L89h6iDr
         80+7xPeoEOhkbQs43BSkYnejpybQiLdzuWeo03ZtKAToKePjNvQkq0+MI3GBIMgg35wR
         RLK6mgrE4wjzkTVvYr8YcEhEb8AhN5fjGzJXdYI7dsyJzFBPEGjAKkNSE/vSyfBd8VHb
         TCgg==
X-Forwarded-Encrypted: i=1; AHgh+Rrth79PZipcUYhx9fi/PsV2lW6JnHAy19C7B8cT9QxiK6kzkv6v0AEer5tOBTw3xC2de6FKO4tUB2fE@vger.kernel.org
X-Gm-Message-State: AOJu0YzWsg/ZbvoZymWcmC4FVFfw5mHnPHHMQxmkOhx/vX4rHhxUPbAz
	2O42WS0FUy2vzdBPWIXG+0wIrQNZ+Lif+bDN3MK9hk3J9LH4cliwYE3JALEhuwqa9JI=
X-Gm-Gg: AR+sD10OgfGW1Z5MJG748tMrMdxRSAAi9QnrEk4BgX/3SKL/RnlGXFn54LaXfamraFa
	Q14PH88g6pF4wdB8HcIboUbNVLbRFI03NHs+52BeCQyIk84om6IMLW4tNtfnixjOVxo2fvFrRjB
	NqvCBDv3uBG5VzkaDB776zZPp4iuQaN2yio7hJDClvtgSmwlXwU0rFKjOrKOWPwEaKxwNrBWpxI
	EU1r4aDzy7wKQja8DxTIZcQszJ8yy7Vo59GJB8TeLjuZ6ZJF8bASElLLLW/3FixCZrXb1ujdHdm
	j1y7JiKMAr08zskWCMNynoPGqDRHdZar3KmD8zzfuPzlMNTME+TVKB3Zae2zKfueZoBAtTbYEtR
	x2S7DXzTq7S4FkKzKuD9unuu5SO53T9Blpw8mnAG6iesHQgg9Y6oBe61DJDvj3Mi1/wj8nBur/k
	ahndKhQzXcwzwDSv1KTPi2nyowjut+8W9pGk5c9boFs8LlBxq7JpMIj4kx77I=
X-Received: by 2002:a05:600c:3e15:b0:499:819e:db2c with SMTP id 5b1f17b1804b1-499821d7ed1mr43073485e9.16.1786609163484;
        Thu, 13 Aug 2026 01:19:23 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:bd31:7f6f:53ba:7518])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49981e438edsm39581985e9.4.2026.08.13.01.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:19:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org,
 mfd@lists.linux.dev, devicetree@vger.kernel.org, lee@kernel.org
Subject: Re: [PATCH RESEND v6 1/5] mfd: axp20x: Constify axp313 and axp717
 cells
In-Reply-To: <20260812213712.1A8671F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Wed, 12 Aug 2026 21:37:11
	+0000")
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
	<20260812-axp318-regulator-v6-1-d6b84b55c000@baylibre.com>
	<20260812213712.1A8671F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 13 Aug 2026 10:19:21 +0200
Message-ID: <1jqzk2fn5i.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On sam. 12 janv. 2008 at 23:37, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [Medium] Hard-coded cell IDs are used in `axp806_cells` and
> `axp809_cells` instead of leveraging `platform_device->id` or
> `PLATFORM_DEVID_AUTO`, violating MFD subsystem guidelines.
> --
>
> --- Patch [1]: [PATCH RESEND v6 1/5] mfd: axp20x: Constify axp313 and axp717 cells ---
> commit d0271b0bfb6609a5dbfc9c713361a49994e56202
> Author: Jerome Brunet <jbrunet@baylibre.com>
>
> mfd: axp20x: Constify axp313 and axp717 cells
>
> This commit constifies the mfd_cells arrays for the axp313 and axp717 chips.
> It aligns their declarations with the rest of the supported chips where
> the arrays are properly marked as const.

As expected and already explained in the cover-letter.

>
>> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
>> index 679364189ea58..22baab6e10fa6 100644
>> --- a/drivers/mfd/axp20x.c
>> +++ b/drivers/mfd/axp20x.c
>
> [ ... ]
>
>> static const struct mfd_cell axp806_cells[] = {
>> 	{
>> 		.id		= 2,
>> 		.name		= "axp20x-regulator",
>> 	},
>> };
>> 
>> static const struct mfd_cell axp809_cells[] = {
>> 	{
>> 		.name		= "axp20x-gpio",
>> 		.of_compatible	= "x-powers,axp221-gpio",
>> 	}, {
>> 		.name		= "axp221-pek",
>> 		.num_resources	= ARRAY_SIZE(axp809_pek_resources),
>> 		.resources	= axp809_pek_resources,
>> 	}, {
>> 		.id		= 1,
>> 		.name		= "axp20x-regulator",
>> 	},
>> };
>
> [Severity: Medium]
> This is a pre-existing issue, but is it safe to use hard-coded cell IDs
> like 1 and 2 for the axp20x-regulator cells in the axp806_cells and
> axp809_cells arrays?
>
> The MFD subsystem guidelines require using PLATFORM_DEVID_AUTO for automatic
> cell indexing, or platform_device->id if numbering is explicitly needed.
>
> Can this hard-coded cell ID usage lead to device naming collisions in sysfs
> or driver load failures?

-- 
Jerome
