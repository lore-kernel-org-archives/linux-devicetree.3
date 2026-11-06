Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984257;
	b=gBui0rGj8n+99xEQaajQN5DP5MiSokP939fpdK/dBo3Gl5Bcx4UVGa9WSS0lkp3loslz
	 /WV4TiFnUEiWQWswtneU/4bk7CfHGrXMwBZz0XMtYVQ/cR8FL7Vz+IlqhTbs8JguksUIV
	 6Y8V2QBRn6HeD2bzugcStzZY9bedeVMdPaRb+LDFzoPcv7yQsdShkTEd878QzackhzCJH
	 4RpuNMBND0lyo316pTYJ/GXPzeM+6O8Buvt4lSOBZe+borjkwop+8tJ1OKU8g35Hjq7I3
	 tznvvB+zqBHrNGZ3X5W8YB/MeiU38P7jAz/hTxt39H74gss26CWUqxMiAHta24bT8xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Dui2HnVpfjzkzxu9M35L+PlJD8C9n4WzI7XNWWzwiiw=;
	b=lpWM7W78mN/bEj0d2EqiyyUV+0Dk5mGuAnLzYm7PNi/qs4KmpBboqLYjjpabM/oZPb1Y
	 kD+fUfW7CfTWZfAkW0f4E0IMYhETNvo4FyQDkZMlYtDO6abic8FF3JrRE7FsjAJyscvUg
	 ZmHdlIWYYZDrS8SkojPirGD8hPYZc5Sgw5EBtKAmT05xqgM8cegOGOaEycsON3J4ujJQ1
	 ambzizpCAbI3E+qTbCI0d6ED5ZX5ErqTDrQs9RjlkTsdOyJRj9eYSlfSNSPVSUaZST0K4
	 u8W7y/Q7aXjW6cucoxUD6p26UFxvAZ2bjjKBRXBNQCs3WpP3T/kYXIGPtZ7YN94tsww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JOFE8Euv;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1B1606A339
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 16:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B1B1606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JOFE8Euv
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so7539215e9.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 08:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793984255; x=1794589055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dui2HnVpfjzkzxu9M35L+PlJD8C9n4WzI7XNWWzwiiw=;
        b=JOFE8EuvP/aiaExAz3zhbWKSmdofbIo2gyAi15JmBQowqrHdneLciitNKgOd/Rc1MY
         TqlwQ0qZ6+zprLi8oRzpeZdfT9rm4Gk/2vmpzUyY+WYVrFq/4VnGWu0F92eSYknQ9eca
         irv+2yYK4tyLv49lJoGUX8YQNNFvczC/QXgxtd5OBkAnr7myUkbuqiIoV2K3p4F1obdH
         Hit0fyb+jSGiSyYi6k7b2PCp0Nplky8lQRcW62b9a1jHv9+1r6ph2IuIoqmuX0KV/xai
         49KfI4QeYxnwjMZnTkPOQWP+BsrShNRyaJdZxDrxjQM18awoxYdnpxd7/h6wjQeogqtO
         LtZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984255; x=1794589055;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dui2HnVpfjzkzxu9M35L+PlJD8C9n4WzI7XNWWzwiiw=;
        b=x49zF3ew4UggfAV2yb8rc8dzvlTzqaIj6esFpwOJ4oWDqvpWHkexI++Z2RALKggF79
         prKYz94a36EYK7b06v6/ZXHO0QbErWFQLfPj/teLVkMfVszGg6OrMK0LySNTCD2dry5c
         9cE9kDyXW/LwyStEzd8wi2R5RYpMhT1JQQZIJSRDWxksLlZQ917zoZ+RJoEHHaOwIqEN
         HTyPIrqKGY5Ew7hA2yCBdlVrtQOwhEAxcsQs/e+xCH9aU32FNFAQfbQw0thlKLVmk5kU
         f93Da2JWkcTaTdFnBOUzlyoG+xT0ZmGa0d+9rRhtz3O6nYDbCdkPs3n+IvsRvWH/JrKj
         mITg==
X-Forwarded-Encrypted: i=1; AKwUvBxnQQwTsRuPMIvQUnc0uaAfSR6N/vuXZv+6/jo6hWSnHdWVgyk4kQsGmXHbK9AKUBDCIwCwhg94S3ml@vger.kernel.org
X-Gm-Message-State: APuU4Z98uTGFxJXtlNa0WX/k7zm9UYfmyHoAD5ISZOpC6OJI6rMU9WVt
	APXozDvABj88mZBNJq4NJF5psB3RAlL+TpSNkNTDimPkKm+PsGVv5rooIezI9b4qFvQ=
X-Gm-Gg: AYBFou0Vp2DZU8hjWGhD5xLw6Xely2lhApX2i8k88jcIrtQ5Z2cxQwz291H/Y1Jn7bh
	I7Hie3Nyo05B/1h4lC8hqBnCaNVUVEH0HFvAZJJAEJpUqZnWDaEA3uws9a0azanCBkDIB7niw1N
	CpgCJcolXvA1LHIITlezAkF1dB/SZ/mKhy6GHtnc67VCxgTrrl9bXrE8Z+nhLaMPs3GRgqCiRu1
	zqtsw640Hn2BPLNHvgXLvvxtrfM0iJhSlt08bHfJwh0CD2wBnCM+ZiQbfvNQqJxMBVCBiKaSGqz
	s8K+Jk6jiBKkkDsGdyDHbs45AKjdgmLi6KaWiB5HU1TAHlTPgWbmvkKNQNEZ1Zfn13IZI/ayRKx
	BdN58NKzupXIA1WPGGgHbnFLTCaiT9nIIyOAfpP66IEEU4ZHsVXqsgRkW4MvuaFGlFd8jTmmEoe
	q5MNrWv9WMJPUpPjci1/u1nqe12zreTiSXhAN+tg4HyXkHft9l/cAFl4Z9gAve3Lk3xfGFknRPL
	/H1WFJ/1QB1opo2DUNk+VgH5TcaZyzqV7gkSs4b1AV3sJuKTdNxr8YvYOaF9gN72h38/vfu6K5S
	vAmfIy3N4MaHi+BDePpJm/+TuLjGYjHQ
X-Received: by 2002:a05:600c:a013:b0:4a1:c6fd:4db0 with SMTP id 5b1f17b1804b1-4b6df5eabebmr51738615e9.19.1793984254955;
        Fri, 06 Nov 2026 08:57:34 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b571f46538sm144730095e9.5.2026.11.06.08.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:57:34 -0800 (PST)
Date: Fri, 6 Nov 2026 17:57:32 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Shan-Chun Hung <shanchun1218@gmail.com>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, vkoul@kernel.org, 
	Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	kees@kernel.org, gustavoars@kernel.org, linux-arm-kernel@lists.infradead.org, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 2/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
Message-ID: <au4GkvPTXmcvReoj@monoceros>
References: <20261103022202.2139674-1-shanchun1218@gmail.com>
 <20261103022202.2139674-3-shanchun1218@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xgc4symavcbtq745"
Content-Disposition: inline
In-Reply-To: <20261103022202.2139674-3-shanchun1218@gmail.com>


--xgc4symavcbtq745
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
MIME-Version: 1.0

Hello,

On Tue, Nov 03, 2026 at 10:22:02AM +0800, Shan-Chun Hung wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
good enough to provide of_device_id already. If you insist on full iwyu,
please use <linux/device-id/of.h> instead.

Best regards
Uwe

--xgc4symavcbtq745
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmruBvIACgkQj4D7WH0S
/k7itAf+LYAMF4hi693tZ3vEcl9qdHQIjdqKde20tlG9djgG8wsFu0VZ/opYIUir
Ba2Ft+nXyZ+omHvukP/oarePmgmCz7dlRmpi6tKOAV+werJYpdagvT2ZHxjF2/eU
SRq3hKVqHZVh/RS7hfRwxcPjy41xhU8PPT9ijH9syFoVtOUYbKKLjzdGTFdq0VNm
TeXK1teYk1wcOc1zWnVsLIdMk2DtMOGpFMisNxIvSXPHr8CPqfQh3ZhDwVLC6WpK
Jo3OwmvckiCe8ewY1FX7j/uIvM0c69sIBKKFnHgagXSTXFfhUgxYs4I/UgegsndF
7ViQI0kKjp36E6n5RxerITZ5eDHGng==
=zoc2
-----END PGP SIGNATURE-----

--xgc4symavcbtq745--
