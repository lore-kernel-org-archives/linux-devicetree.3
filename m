Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BFB1531E8
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785328716; cv=none; b=uG3+4lAkkMyMUWbC9ZQ4vbFP7J6NXVNXrSI/7WHaYLmCWriNGLMQWBNbbpTJsWHOdqzezU/m2e1eUvIv9GoF/S/Y8LrcVG1dY5MZqFPhicaTV8bCXBokrsYcgCKtiL1B2oku/gRPXJfYzVp1vs6rEwkby5S44NfIXEPKgKrWkg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785328716; c=relaxed/simple;
	bh=HbiqMD+wNgf/uak20PPJVEhWm20pEqxlGI705rh+Bvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dudd8ejmno2MBJcpAuQdKZLa3kMCQpWb7h/6OlXAhY3B6nyIO/gCwOGJg1peuF437IJX3UZ1QflBZ9wc54MyW1YTjOE//S5yo/BXeZZwL/K24IjXcUrdnZMNAcxasRuLr9TIq8S8lVKp/OVPs9EOiFmXDZ5UEGxf19WhWsqSjtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=RpvviNdi; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="RpvviNdi"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49558ce01afso6227475e9.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 05:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785328708; x=1785933508; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HbiqMD+wNgf/uak20PPJVEhWm20pEqxlGI705rh+Bvc=;
        b=RpvviNdil079QTbzeNJSIzKAzCRM6N4fSPXOEQ+ueuNBZbx/6k6D6BSrNq3bvHHymA
         1QQq3QSUykPEIU2DqC4XfmaEIbpu3gmWggt4v1MtNk4WWQPg8TnwCwWvpkDMvhvBFV54
         Kd1m4Wm6DF2FnFt2v8WPAOY7MkQAxJyObw/ufFl/jYKk2d32zbZ838Wi3Prp3uPin7TT
         XVj6/OanMGmjX8nCshJtmHq5je2/Y4tST7wKcKL2E3KGNdJe+xRPUivcc1XbS3/d2v5+
         K2KgSIut+fJrwT7hp4+cFxr5/Iwck3xPELZxv7P7eMcNLchusIr83EV2K2TB1U1IHhYO
         adDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785328708; x=1785933508;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HbiqMD+wNgf/uak20PPJVEhWm20pEqxlGI705rh+Bvc=;
        b=FsrbHbSZxfalNdfXkHj6qX/8uVv/wVyVsv/l0wYZnXq+V1HNEOkW9KQxI+lpSfj0fO
         yNcYEOylrQdEzFMB+QR7VoLTI0kAO9jIZoYpn9wZsjNo2u5HrnWfu6W+9bcPcEmQE79h
         AUSBmtTpfKfaT/GxXLceQbq7FbcAR/8+DNNxZ9XJmLkAm0a3HtRVp9557yl6+aTD2s+V
         tFVqi5krdCujXV2+cvadjKAUv5kP/nX/FsJSexBAcWdoL1afvpzbdOpzGYcwPIDcEV2E
         PMO/XlmFANocC2llnbvsMH44SRg0ir4KN4l9L/AP0WGIOWhv3pDv2E8+R8dCa8nAPLaS
         XsGA==
X-Forwarded-Encrypted: i=1; AHgh+RpVLqJ+WyIRyVD5QqgUJdD6BAQv2g+pIu4BC1Z5c62XmudntOb6/h/eXacFCHsiFCSgiJTBBdqlYitB@vger.kernel.org
X-Gm-Message-State: AOJu0YzkNvhkeXpB2KapaBnqwB56Qy/vL94npLc2t7iNdaEsaNLtZv5O
	K4e0OevbGSd9PHw10w2OIjIebzc80D9GmRuVVaQrsTngcchVyULdzp0z6blKnuElcnk=
X-Gm-Gg: AR+sD12U9Hvuz0TcwlJWIHMueemKfGVGx7nTu9Sd4KOuTDKP3pyPd3kmjdV8SuPtCGU
	627Y0cRJ7jW2MJ/lp5S/7rCMkeC80ot+cw3DXq2gOuJQbJYWvI262/yR/38/sRjZ3HtANm+sahP
	NW15jzoBoLyzTmfk2mmG+uQD6axVlo8N5v8qHixYOu87nO8/5jxFAGAvIBD3q4bykZlerxKrPlE
	sjuaAxcgk9YmmDGSTmcLx5H6u9ma22mUyVB5BtcRKC37DXt02krZCiuuZq2rxV6lDINxZE8UYdN
	Sj/7bLWN+BhqOzGmKk+K1pcuxaGeipTxmM2b6KDN7ZjJ0dO17UkLJETSLjUxvOAqAZzJjb1BUfu
	hgfUSsEW82ags0yNPmXktHVhHEc2B2wvHHA+71jxawdKFOoOmL7PulSbL/RyM8+N3OiQjvo6W9D
	VCmygs8gXfzb3XL9KqdrSjnWY/wCE7IqGCW4IBI8y0LIj88a80NpVb19eBMTI0CRdqy6BZGEZYY
	H3a3Qku/yLx3CDCFt+8uwWZuf7ol9EUGwZCyFB8Ag/YT7UhVIiql4qljqi/GA==
X-Received: by 2002:a05:600c:470d:b0:496:c249:dd9b with SMTP id 5b1f17b1804b1-496c6431be1mr70896085e9.13.1785328708527;
        Wed, 29 Jul 2026 05:38:28 -0700 (PDT)
Received: from localhost (p200300f65f47db0401da7fd03a16a046.dip0.t-ipconnect.de. [2003:f6:5f47:db04:1da:7fd0:3a16:a046])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fb6b2768fsm7708739f8f.37.2026.07.29.05.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:38:27 -0700 (PDT)
Date: Wed, 29 Jul 2026 14:38:26 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: "raghav.s" <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	peter.griffin@linaro.org, alim.akhtar@samsung.com, mturquette@baylibre.com, 
	sboyd@kernel.org, bmasney@redhat.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hajun.sung@samsung.com, 
	is.gandhi@samsung.com, ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: Re: [PATCH 03/13] clk: samsung: exynos8855: add block top and peric
 clock support
Message-ID: <amnz5qkX_zeeVUjU@monoceros>
References: <20260728121111.2077860-1-raghav.s@samsung.com>
 <CGME20260728115251epcas5p19aaf5fc01e0f847bc2adcec67bebda3a@epcas5p1.samsung.com>
 <20260728121111.2077860-4-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="upw3ihnr2pijnj4s"
Content-Disposition: inline
In-Reply-To: <20260728121111.2077860-4-raghav.s@samsung.com>


--upw3ihnr2pijnj4s
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 03/13] clk: samsung: exynos8855: add block top and peric
 clock support
MIME-Version: 1.0

Hello,

On Tue, Jul 28, 2026 at 05:41:01PM +0530, raghav.s wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/platform_device.h> already makes sure that of_device_id
is available and <linux/mod_devicetable.h> will go away soon.

So please don't #include the latter.

Best regards
Uwe

--upw3ihnr2pijnj4s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpp9D8ACgkQj4D7WH0S
/k5ORAf/Wc6gzSRyNn1+1FIXBR6MXs+6IigrmrQ45vjkC74pGi8j6I1XeucCzzuf
1MhDeQy6g8vGye7y9b0BY3nTOx4Lp71Zbgl5eF30pEKPBi8A29Nz6y0yfEjFfbS7
Vprcpq2dl7yiq22DXzzRBG1/XXhrjG3Pq2NPlpq6GSDvCMlZi32b2L3soaUWPgKX
0sjawB7A1voa8wd+tXglN4kpRiLsPK9aRac8r8SPIhAu47zAJTlbfNWLR43a6vsa
VFQzmBIw5G+rfDjtBYaLwxNtvlan+97F/lQzGWG3JxTwuEg58TM7GmSdnJ92jWRP
Tyk6i+iZlV8rbsX9EW8g/KllvAmioA==
=kgeI
-----END PGP SIGNATURE-----

--upw3ihnr2pijnj4s--
