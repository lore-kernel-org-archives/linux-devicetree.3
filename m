Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551105;
	b=1sLz7yInqHWLFJtz6FSBTmnY73pMamAIx/rtiD/N1eRy2iWqhox2mThZqMfoDnEQ0PCm
	 IT7zfuJZB8hKXt5mHlkbMhfDguH88yz7DsW15QBEOPBNSCbyguzsm96oj4ASohXXqDttH
	 ejmjOP+GoiC3VNAI0Og+4JDaqqvRY2QX/UmGXteouu+soewRiCcl2zzQ9n0su+xOcnbBR
	 57kYcDGM6kfiB+YyceNeC3R4bAHdM2OlMu8qnSEbQnUft7W4/djUTtEULtV5QBDsVt7Fv
	 VJbKogwukWgSxPX6hFLVqiV7J3H/wdV8L+ds7JA5TXM4TF+AOyTqjeGRZ6+zeI7Hh4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/Y/iVRnV4ObqWfBTvVOJIAncw0xRUL0KHEf+fXRemdw=;
	b=iQ616Wz5hp1RPr9Wp7l3cUhKTR/CqFJpREAhYj0QAN1F4haU0QQYDOd1gwcEFVhGtaro
	 dyjXfXbupzaZnKyDZaLFr9l7bXvzrEpDZWzN4hFoAPiQWJ3RRYI1RK/f1cyNpBtUDv6cE
	 2FQNJG8nIoj5jSOG2Gzi7qExD2AGPkXg3VWdYcefufxaTjdSOMV/TwsUi6c5Uzfd8P+Q3
	 0f3M74ruwNh4QwabGLvMwLR747OiOKmlVZ3053o/Zz5ysPLT7Kq5DUEy/1UaGxYxdvR+G
	 gsxFglNAW7F8R8HndUQjdR5UWlJUlAk8XXxEHAx51lfOO/WuSxmFSCnAOcstPmbszpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gj29W04e;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2D6606A31C
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B2D6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gj29W04e
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so5333255e9.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 22:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794551103; x=1795155903; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Y/iVRnV4ObqWfBTvVOJIAncw0xRUL0KHEf+fXRemdw=;
        b=gj29W04eXkb5qIjLAIWJz8pxmukjfb6Kc8tpvLRp2RsZwRrX9TwNBoUGzZfXcbhDM0
         DjIV9Yq7n908GPX1ozQgjByI+/k+qXmFXYKSRJQ8ZyY8yoxXLDnJ/N6LqsbLDqyyRhle
         GEWaq4UHwYY1W7ZbxILKzy+mIUE7SsTqW83XGVFLj9vbHEl1WeDyT7eG6MAgu9KFowV9
         Hghd+RNvxyQjxFXsCxIRW/hoGjE+sM7D1jJuI2+cBGRHGyPn7og6LLZe7B0DMIJNzf7m
         Xydoiw8ZCuOhyb9Q/ZgiZXkZRu44scunyhEVctQm7gyHbu/x7Biuclr66oFGsSFN+j0W
         nZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551103; x=1795155903;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Y/iVRnV4ObqWfBTvVOJIAncw0xRUL0KHEf+fXRemdw=;
        b=tsS9bn00mPEgfVM9jCjoySAZNfmoeJVRg+p0csVs8eXgv97V4AsYyqweHpQ9cWB9RV
         whuCeGib5zLVKlIH2aym4alxQmlENvJtaUMOJKTDl5FOn/jH8I97aaDNFJ5TwhMTe/Qv
         n4YjaIP6D/orKOnQqOGeXUNuMGWLua0iYjPKAjkcCZllTtheZOE9oXdWWaXOB/1qdvN4
         ku2ZWdXotjwzFU2L4YMqgW0c7QCOuCDoTjN46iFrigr6Czj8A94zN8TJHwyMf5jdFHb9
         IN+7csqXbLRTa/+3KxEiF21e2Vam7GqUXJyKRRK1GK/D2WbT3ZrE8neHUkEALEBDTG7c
         mZPg==
X-Forwarded-Encrypted: i=1; AL+hErEemuon2M/110vhzsw1vGtoTULAGDxHcrrYNzJmcE6/BRfhGQrFhZ0hu11Lu5ND1FRZNsyba08uagtW@vger.kernel.org
X-Gm-Message-State: APuU4Z/niGfrcEHu/G3NjawwoiR342WVsvoX9BG360/mGgqd4ye7FLbu
	2rYCeK6Pc0f+DOwY4NQYSDdYwuc3w03mcPxxwzzU4x+/raKYFH4+1kdLnNARlUV8DWU=
X-Gm-Gg: AYBFou2nENPC0vhADnRHAtgDcArW+o8CvCyqLccgMxldTfAT26iIrkA91nD3lyyAfHu
	JkokaNJo+v1bZs3CehAO+j1UYt5Y/yvX2BnZu85SXF9HVqS/48Bo9Rh3s28IV1gYIH+hItQaU8d
	sJpd/mc6pQJQrsN7hxDD/BXmljYmnn+sAVAZiQ/GmZOcR77RWEk7xv/b3UsT61a3YljWXAQMixh
	0F9CR9UK3T97hP8xqTwuy3IyagXVVwZKimClGAFw61YnSRhvYD9g1Ai1fhYoyHwHKA9LWSQRFnh
	729iaE3RK13JBmIpxdvnV2fvMR89hOsqWJIYOkLTM+CGnATZ2YsYH23U/q0+MzMDYnfX+eCe17e
	I9+w4/D70W8N0UJLdVwRhRUBaxGVUuF+zb+So0yOEstpp1YPhu/72QYuCO0/Ccid1twYJIpuI2a
	HWzYaYgjwtUHEYhroStpnxW9BuY5HDtfXfkBpzBsSjwCQ464GQrVGCGl7X9VoimZZ8Sw0K66o4G
	ocmWeepNuGbfZ9/ps8Op/3VDNdW27ISRrzikKF8WvEDNdst9DoVjcdmaiZQaySFo+s+9yFdtsKY
	kCa+66nm3UxBZ7WjHZchxOokKPt1LHMnDXHtu50j32T4MtBRQHGztrTRAQxTZC/Vq9B0Ja5gVA=
	=
X-Received: by 2002:a05:600c:4e44:b0:4a2:180a:3417 with SMTP id 5b1f17b1804b1-4bb55c5f5admr25342125e9.1.1794551103537;
        Thu, 12 Nov 2026 22:25:03 -0800 (PST)
Received: from localhost (ip-091-089-005-024.um28.pools.vodafone-ip.de. [91.89.5.24])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb571cfa2esm25586955e9.2.2026.11.12.22.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:25:02 -0800 (PST)
Date: Fri, 13 Nov 2026 07:25:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] clk: stm32: Add STM32MP25 SYSCFG clock driver
Message-ID: <avas_9BOcoyn4j0y@monoceros>
References: <20261110-ups_mp25_clk_syscfg-v1-0-667829cd290a@foss.st.com>
 <20261110-ups_mp25_clk_syscfg-v1-3-667829cd290a@foss.st.com>
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
	protocol="application/pgp-signature"; boundary="ekj7jpy4oarwkme4"
Content-Disposition: inline
In-Reply-To: <20261110-ups_mp25_clk_syscfg-v1-3-667829cd290a@foss.st.com>


--ekj7jpy4oarwkme4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 3/5] clk: stm32: Add STM32MP25 SYSCFG clock driver
MIME-Version: 1.0

On Tue, Nov 10, 2026 at 11:42:18AM +0100, Gabriel Fernandez wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't add <linux/mod_devicetable.h>. of_device_id is already
provided (with less dependencies) by <linux/platform_device.h>.

Best regards
Uwe

--ekj7jpy4oarwkme4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr2rToACgkQj4D7WH0S
/k7rcwgAuyIO02PIHScObbQSwpTN1bOxntCQuOefipHur6Tv164hiCD+Ows3bueO
hHN81SuXrTS4hzRGcT5jFlW7zlkz9L2tSHYZ0us3Hep0wntBkIeA0JeCZqBCoASn
RuXE5+uHnhkMUlqy+/xZlblQtRTUnoCZmce9NixemtTaCIMPlL9gIeoouNGk9r2B
2Ov8mhk3tjy1A9K9YCE3vdde8NAm9G0myqV85K2q+/6a8k9IqoogrLX5x/9uNZgI
wH/iThyVCnk4MnvbQGHVc7Q3QXDOZAVGeZPck+t/XfvkrsVkuawozxF0NWZO8LMe
ldXWek5P8iobsActxH4I13gTcjgwBA==
=QOFE
-----END PGP SIGNATURE-----

--ekj7jpy4oarwkme4--
