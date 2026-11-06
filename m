Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793983496;
	b=yaestAMAYkaBbTztS4eA7O7SSoqFGyqnTHdAwLW4pfILCCqP/aUoZSyaERULdYrX5+Ac
	 sf3C2gS8kzLG74Ix2AK5MK0pTshWfC2EyixkWCbK1CLy9o5IaNgWAnSCjhGiPWszjjhqN
	 Lro0JSHxqjFbbY7s9Ja5NbITOIeQXCMA39TbVp/egbZXh2YM5L95T+tZsUTUeRKSPQ9At
	 b4/oD6fzNl1nGhlLkjA+Pgy5N57bcKS37KUYTs+DNgw3nwKFtWoLoUSN8zV9I+44hCd1k
	 A1EUiXpjtEtApmriXkO6IsFi0eMXxItyZzNJk8OFD8t7aBU+Xj/wccNG4aSmoxOmmXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=AkkhwWikm9vacM3XjrJcYU5w9hh7TbvHGqZ6r0PhUZM=;
	b=OhnJqodbOXYBfqSly4PT0NVo9sBIWaZ89LmlBKb2IrvqKmrPOh1tedbN0egzn1pWiDU7
	 unvyMbByxp2H3/ZBXNe6RhqM0FuQFKi7KoH+BOpli2seR/j9QmJXMj3TVKQOYL5vAYZEP
	 9o+g2dA6IAWCtQvdNuBB6L3TelhMA9KZ1sPO3TqBHohpYaPt1M9E/v26xMumbtwM1Ug5J
	 Qbvf8dd5zrYU9La8pJm1VKo7vv6uIQm3sZ6k7ccKfVnoUbMUBzg9AyXo0I5lnsiM0Uu+R
	 y3tvkdHHbZS1WoFkmSum26nSU4Esm7IBPoYXNgz/r9SchWM8fcI2ymueZ4rY5GvYj5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OP2qMBHr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A002D606A32D
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 16:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A002D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OP2qMBHr
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so8357035e9.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 08:44:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793983494; cv=none;
        d=google.com; s=arc-20260327;
        b=lT5hs+qR0DYS/gv9FFj1pUSyGTy9zxZ3nr50LJ9ncYrmrFmFycvbncIwktXWu6grmK
         4TJi2pgTrTUsaMNRwDLTsaSLZZSlKBaF1J5g6dTPnW/9ypMZh6owgirwAprRLc/x7ktd
         tckp/Y1emBtHcWKXjHaGFyILGoJ8XXy/SsX4LLGXI8JCa4bvEmTz+vC5L2/ChWTf9ZXg
         8fNvoYuBBEtjSqFQ+yUmuqVzCCPd8zMHmtmg/ZuB9imdO8q2QH9cqgiRWMKrKtSW/rfe
         cdZlU7YXzlvMDpXJ0hGH9wxLLehUASRUNFBa+6gl/mkjQrMn/T9ew4IDgNw2MAy7dG+T
         HqBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AkkhwWikm9vacM3XjrJcYU5w9hh7TbvHGqZ6r0PhUZM=;
        fh=C6zxQOmitUs+QHMwIfS9wW3xtzMNf3Gsvvmt1VWq8IY=;
        b=mD42XR83JMpI6aubufn/XKQNOthbBFN5dm4fmxkxQZNM+8vUQ0KkuLAUEsqExdYOWK
         uTEF7Ig1DFU21xKW7KqJnUHFRTE2T5hnlSE+rSWNcDvXJdpqLoi2JUzgVIKtXgmcWHPO
         ufxVRxGoVP72bqiGLlhd+bTayfTEm+sp13gbNn3NZjBgBSQGFMMw3C3OYpO7dVgzdfUN
         ThSubFLrwhUa92Bsl81y33LwBI4RVAmXxR7udSMcpH1gMWzLO2sakdsVyoyhf8IEL4a7
         ZHbkrU4b8MbOnmr4TB+/gOtw+0wdELCIhJ7cyHKA6l0def2ToQVLoiLEXrpPAhoIe5K9
         7aiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793983494; x=1794588294; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AkkhwWikm9vacM3XjrJcYU5w9hh7TbvHGqZ6r0PhUZM=;
        b=OP2qMBHr9lioDRKtgRhNaWh39ghwFAMLP+ItBQRdo487l9X9yhOL7IL+mgxh92U3XZ
         61z8LnXQ82zOha4YmDzQFKQhEo2kg8C/aH6ISUupAn1DKDNbSk4QFEU+n/a5oykVQa9h
         9xut4hz/rU6/+bZjHzEHzZpdmWFZvw2nsFR88JeoM+cCkCvACENCixwemQW27gWTSXCq
         97IvaV4lP6bTIj0oafsxfNJ8Wi323YAR9IKCKxB0QRHc3uW2758LP9Ji/NGC2lwwetBQ
         Tvn+TVJ3ktAVJPs6XI8YbrxUcr9PnzAibMdrmW0PeEAAWdR9OS0UNVD5Q6pIx0PTO0VD
         yqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793983494; x=1794588294;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AkkhwWikm9vacM3XjrJcYU5w9hh7TbvHGqZ6r0PhUZM=;
        b=mPQ8s4DcSTGmil54tFOp1v9PGGGy/FOk9Z7nje39uCetjq1XdlNvfrLcVIi7SMhZ1b
         WBz3FWaCbouyJCQbdHZtnfVoSdkWWKAR37p1t+aAj5gG4g6TjzZ7Xh2ZqCulpyG18vpJ
         7RDhAWB69BjrjaMv3VvJLED7jQA4perDkxIL1SjFGgt+Mco1o4tD9vB9KLS/fCqfFKV6
         3l2MlpGIsMwxSTztwS+Ebr7YM67uKFvjDHQyWVXGI7EZlX4b72DGB7XBl2ln6BPyrGGq
         Ofc5onqwaDgqW9nCtG6BJaSHpcIC3XroOJD6pvRZ9cHzVPAKz79Nuj6+2dqAojeWBUtF
         H7XQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1HB5BQZQjb0EMfBZ32xhgi+UQVjaRnUzFE6s1F2+qCONuTQ6NnzXaNoEKSGDs1mbhonrUAFIpLorZ@vger.kernel.org
X-Gm-Message-State: APuU4Z8oaZLsOatpRFvU6hYehlfB/dZ4026UCDVDex11ogDDOywPFlV3
	MuWUA0C7wurvgWT3NjxCojZ/DVYm/98rf7tN7tD7uqmBtii/mUDl7FxMIAO+785dQLA86FC1Nnj
	o4l1sokGbe0tVh9doVYA2GMLFfXvTa8Q=
X-Gm-Gg: AYBFou2CS2172TqsATvumCZNghHjlv1FE9S5rWEqz2phBcH+tvfqvP1Mp6G8yXXBTxq
	Tkx+KriDD4ERRl0hHkPd9vQRoOI4BDCf838S1shwOY8aEZqdyYchdrC+/Iu5mrCfa+hbfvJTWn4
	Q8bXzsEx3ejPCNMo6Frgd3RMZQgMPQ33Lbq+at9XEXgB0LtLn8FwaK78vM0hTxmcZ2fsFkhOb5y
	x5FYyEvWcDMG5q4B1iJxAPuqs07cT7t99DDn6KOf4X4yJANoCYdQqOjjmhGmTQofkOJgBY3G8M/
	4U/jZThWfSGT24HgkVRAObWGR3sU7RF43n2tNlXpzQdr08TB9OV2bepICA/qrH4fDsWFrGbu4Y4
	04dtx4zk6krHsZhqhT3UgzHLSsym2aq6ZCE83xDgZsOWvldoTqwcfgETcUiTaBAlF3kO8ig==
X-Received: by 2002:a05:600c:34c8:b0:4a1:f90d:6f4c with SMTP id
 5b1f17b1804b1-4b6de4a6eb5mr56702895e9.7.1793983493852; Fri, 06 Nov 2026
 08:44:53 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-tle493d-v1-0-3246e91e6394@gmail.com> <20261105-tle493d-v1-2-3246e91e6394@gmail.com>
 <20261106030419.23ca9b26@jic23-hlaptop>
In-Reply-To: <20261106030419.23ca9b26@jic23-hlaptop>
From: Viral Patel <viral8854@gmail.com>
Date: Fri, 6 Nov 2026 22:14:42 +0530
X-Gm-Features: AclHuK_XeKU_SPo2lA1aZ8rEbHQTHoj1b1QTs8FYVvCmAA2aREqqEIZJNa0RqzM
Message-ID: <CAFkCdFyi0GD9aWMUZfx=QrZMg1ezjUDCdRr+LTsD0JMMT1DeiA@mail.gmail.com>
Subject: Re: [PATCH 2/2] iio: magnetometer: add Infineon TLE493D-W2B6 driver
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 03:04:00 +0000, Jonathan Cameron <jic23@kernel.org> wrote:
> Seems sashiko isn't done with this one yet ...

It has finished now and reported no issues on either patch.

> Use FIELD_GET() to extract the 1 bit values as well.

Will do.

> Why do this after setting data->regs[TLE493_REG_DIAG]?

It's deliberate: the cached Diag holds the frame counter of the last
frame read, and the next measurement waits for FRM to change. Updating
it even for a rejected frame means that frame is not treated as new
next time. I'll add a comment.

> I'd be tempted to just hold the lock a bit long and do the simpler
> case IIO_CHAN_INFO_RAW: {
> guard()...
>
> ...
> return IIO_VAL_INT;
> }

Ok, will simplify.

> Generally avoid any use of cleanup.h magic in a function with
> a goto.

Will switch to mutex_lock()/mutex_unlock().

>       for (unsigned int i = 0; ...

Will change.

> Is it same as SMBUS Quick?  If so use that.

Yes, the reset frames are Quick commands (read at 0x7f, write at
0x00). v2 will use I2C_SMBUS_QUICK and skip the reset when the adapter
lacks I2C_FUNC_SMBUS_QUICK. Note 0x00 is the general call address, so other
devices that respond to general call will see an empty write; this follows
the manual's reset sequence. The Pi 5 controller doesn't support Quick, so
the reset was not exercised in my testing.

> Can you add a few comments on what this iicadr is for.

IICadr in MOD1 selects which of the four addresses the sensor responds
on (User Manual v1.11, MOD1 and Table 4), and every MOD1 write includes
it. The manual's write example notes that IICadr must be kept at the
current value so the address doesn't change, so the driver has to
write the value matching the address the device is on. That's why an
address outside the list fails probe: there is no correct value to
write. The ID check is only informational. I'll add a comment.

Thanks,
Viral
