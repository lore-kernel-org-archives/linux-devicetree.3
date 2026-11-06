Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984477;
	b=SdQGr64pxycTV8/yMR9266AlaAzZThzrHSsi9f6SDlfRyGV/6ApnCtWxVqqUGPbAaofB
	 00kx4IMx4tlmE1yOnxANlJ6dOh/y8lGDo0PBwFI2VdIH7S0uHtIefH60IVkU3N7aqsxVL
	 7rB3ARsuZuY5kSz7oKFNkxlb/i+a2YaOxwWBY2v6sg97guB7jXRtX6RP6YuTKbqZoyYIk
	 4O1AconQ1qzWhMcUHnCHylPHfVxLP0JkdYzlQf8R2K5JRpagRTOdOH3QbQBNPcM3t9Kgs
	 zmkdNyVPwxmxkOf9LAOKDCi0ILIkTGHNTlcxNiUPc5aDUhxlt2NJg6Izc9syi1LEuYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3okvGIPuT9iWl4myy0QkIT0Qs33y5/YWxTYMyFUZVhM=;
	b=nnI4siZWnVhDRZs4xzuD5IJqD9pBoSFyShJgnf1FSjyhG03OC1ueBCmk44FYYSfn/R3F
	 lGchOs/lLDov1H9/poSCZ5BXHaVoBmRt388gmFImDi+jvrw/wTwXoWeVcbVhEtwK4e2+g
	 SfY2Luijf2VZCScIbiYouUpj/eZ9/keVROgYDruMF8nrAlTLZTJpRUgITj4VekhcpRGSq
	 IWQXJFhD5YroUGmWXYy+bCNtU4hQSNEffjMyYjMCW+biK/0EoCsYyIxPgb1xDZPotfLxt
	 5NhJom+yxHpzsqDc68fhgjD0J9H34Wo8qZbciqvgah3CuYoOmIzJI2yIGjhJ4Wxr8VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Ng3OOWZ8;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBF5606A32F
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 17:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BBF5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Ng3OOWZ8
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so5575545e9.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 09:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793984476; x=1794589276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3okvGIPuT9iWl4myy0QkIT0Qs33y5/YWxTYMyFUZVhM=;
        b=Ng3OOWZ8IrmsKsrad6/RsItRavtMbiq19ZqOmOWfNLvU1P+payjbAeAl1898rL6uhy
         0kJP6UXDC5E0M8Hzgq9/diGGQ8nCXbNcDtMx1dSVJWRUJzSoMu0z8H6Odxpx/wt7v6aO
         8KLWIW9+mc2rnCnGkRvdIg8WL6Q049lubnkUaJuqz2dDUIqn7wPpZ/1e81CyOJJDzxbV
         CTXzg2sYJh6akoPBXGAeWqlue9uUNUIwnC/Buw5oDrPPD/WzuiiAgzBpRQ3QV7gvD/n2
         XyO4XN3vGG1k2Bsf4P8HVsZSh8wGx8DmPTRNA9Ma51Q1UGAyLRplO0+mIwySZM6a0K9A
         2HtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984476; x=1794589276;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3okvGIPuT9iWl4myy0QkIT0Qs33y5/YWxTYMyFUZVhM=;
        b=wG5RkyNvzB0YA79rx7BqyHmiimnXCPfTwhT0j+X9VHWVEZJX79f5u0KUUO6xYS3XzD
         Yz2DtgZOQRuj2AN6uw52Mrl1rwKEpB0/k/9Tx2672Y3Q0BJmCRA7M9L23KLsIBXmsNG6
         /OAPvyTkHDWxJwu9avAUc0uDAfb3vC3mmTmUcWTqIbBAeDSrkHyRlMGKo13UwAxbW9s/
         peDMqfF5bjxoatWNbVhh6VE4yh6o5FltTDI8QUAlpSw3r6GOxhsbiCzivUckkC5Y08by
         ECwPeGTgwUcx7nOtun8SDw9lyb6I/KyjfoRXqk9aCpyI+Knr7qVUT/P2x81eyDs1nNNr
         OfKA==
X-Forwarded-Encrypted: i=1; AKwUvBzUtMA7LUvbaOqwf1SNzKTdB9qit34SphxGK13aMD8RRBqT4GaLGreKhv55VwD+PbmbHv2I02C5eTwP@vger.kernel.org
X-Gm-Message-State: APuU4Z9tuFkQ1elFwg7Ou2rUv48wHW1sNsnkTvr30FdClqlr04IR8j9j
	lIey3xcxD6vkSYUgr9AxtamdR05Qxg7LYHWGJpdNVdWOdMX1kXsxBSGZY6RuYNYESxo=
X-Gm-Gg: AYBFou0xU1HlIDeli1lNI9AC600D7rnu0HrwelwCq/w6RIg0DWt10w0ryoceAZp63pG
	18IdukT2c7wx3+Q/p+YJYNEPAWc78vpe/0m0Pg6wJecxMZyHqGuVD3OXfNlX9QlV0y7YAXYOFcE
	6hybUiTuJxmJ1uWQEXt2748IX1CiaxQ42vxrnZ0tbFI+Hle9TXN3chJarjNaMtwrIN3KyvXHs3P
	+VyBk5qkS80gnkWvwfEqmkwRgJU/Z3S1+tPDOtITr8Rn83xgtWm4khAReVkOoamZKSSziOnnNGE
	zGXBsMlIQd5nNcKCspyLT98Rg8Ey4DGdljO6qu+/GG5ZUN/tHWSnGkQf+PpdDKuZm9seu1fvL4j
	nG2FkK/p2MHKEH0gpq5VRhL3uwsnqrKm9/36F0IEE9AByLKOCBDUd4Tz/OhuoxosHbmg1prNkas
	fvSqJDaDjJ6JrsVJ4wJEJsvuTEIkQKAu6mSsiiLU51jK9JSZ0Cq0wpsjTvSFrmnViX6iuoj+LRE
	aEDQiHlHjOA49E/3R1xaLwY0vLgHZVcCMamrZQ+9V4GmWDpCrhxw4LhRKj5Hji1wPifuSBjgcVX
	5fV0zk8t52es+y/DIErAbjiqbdQWXx9Z5w==
X-Received: by 2002:a05:600c:4e8b:b0:4b2:61e5:b2f4 with SMTP id 5b1f17b1804b1-4b6de4a6fc0mr55956715e9.11.1793984475474;
        Fri, 06 Nov 2026 09:01:15 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-492d809ddbbsm4804011f8f.53.2026.11.06.09.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:01:13 -0800 (PST)
Date: Fri, 6 Nov 2026 18:01:12 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Joseph Telaak <joseph@telaak.dev>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Chuanhong Guo <gch981213@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: Add Siflower SF19A2890 pin controller driver
Message-ID: <au4HsW2aMYKyMspF@monoceros>
References: <20261104-sf19a2890-pinctrl-v1-0-4bb83afdbacf@telaak.dev>
 <20261104-sf19a2890-pinctrl-v1-2-4bb83afdbacf@telaak.dev>
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
	protocol="application/pgp-signature"; boundary="o4uxavg4tbipdm4x"
Content-Disposition: inline
In-Reply-To: <20261104-sf19a2890-pinctrl-v1-2-4bb83afdbacf@telaak.dev>


--o4uxavg4tbipdm4x
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] pinctrl: Add Siflower SF19A2890 pin controller driver
MIME-Version: 1.0

Hello,

On Wed, Nov 04, 2026 at 02:21:18AM -0500, Joseph Telaak wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
good enough to provide of_device_id already. If you insist on full iwyu,
please use <linux/device-id/of.h> instead.

Best regards
Uwe


--o4uxavg4tbipdm4x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmruB9YACgkQj4D7WH0S
/k70YAgAhxWSI5oFd+bG1IqCr9QN4qV0nHY8dR0wZt/s30JOYWejw0raTnkHbfMt
1cLN0THKoG3qMmY2yzVpFoHtreyYlcQK6NcK5fqhPRSFwniSgluT/eWevLV4H6NN
oVxFxC97OUD3EpjECtS4q8VTVZWg8kFbqxwARQl208IoayGOXIVNe9/A+/U1rHTJ
DNyJB0xyoYCnDmd0WA/wYkSx6HlNHUbTW4aDPaR6cW2G217wQnIQBzsnb2dUFn9S
q9yhYPN09un908r9vZU8s/sz/mY0bppEUg3ak/jVp1gJfu69jFo14DiN74abx3Ui
N6+6B5mC+kJGbjRTDMCieCzt0cZHEw==
=/RG4
-----END PGP SIGNATURE-----

--o4uxavg4tbipdm4x--
