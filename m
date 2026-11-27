Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769256;
	b=BNdScpK3OZ+Jocn+zrhVFsVM5GRDP50DfXT15YQpijsRnkZSorkYXMOB3nkMbssm0RqR
	 AeGfpYoxGqWThTiFxSfgNgE2oSqMPe5aCq3mGAt8Y+VS/GHKQkOCCX2nu2oWn2qhFnfGW
	 ilnS8196OuIFuB6JlV5jA1lhS1eP0/tBL4CLQcsjuhvKcXPYRHLmxhsI6eRp1Gd7rnzkh
	 xuflLQ02TgJUma2SEBi5Dwv56tSRgFLdIhnw5L/XBJUUqiGqsZ0920ycn/ELo4/t4Q9uR
	 yPPtKyrCzQ9u3sodZh2vY5HsItiy4uiC7yb9yWXU/AYB5BEAcr6X7ohZW7ryc5XB2uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hFWAeWghUobS1SNh2HR/z8yfcl8Q4/5YjOR9+nLiaM8=;
	b=puZDAKbX7H5Aja25bwXDLxrRbwyjME5+2KslOzRn+bn/+jPsCpYbPATrjSHDkiQIu9Cx
	 flOz3Az/lb52uKd9qqKq6jNRGQEAPjZ7ysvjxbmqTLjYNXHSgABACmTmP5e5SFKyHHxSa
	 h+lCePMpjeeQbSyhTpYfR6S0khzmgnY1iGIjHdPYMJA6wsiwfR//fbgsQW/fUK3Rj+YY4
	 NUrJFBxqdPGzTOMyEQqs7NiCZ5IA2Aq1Ds8mpMW8Fs2x9J9Mv9fNdIyzbs0a+loslty12
	 NccyccYQQZYRuNzmf9159jTgKtz24PQ9KRhlSWCA33xlwkl94md66XR+Um3amuwYvfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YRrEPwAX;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F93606A323
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64F93606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YRrEPwAX
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so64191965e9.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 00:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795769255; x=1796374055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hFWAeWghUobS1SNh2HR/z8yfcl8Q4/5YjOR9+nLiaM8=;
        b=YRrEPwAXoqI5gP2IIQzDF7IMwF6mWmENF8YM+9EnjV7JeOQc93bnq1e8N27XjttZpF
         a1i0rHxiGEfrDBBvSq57VnSzKmbzUUcSTReIV6FSiAgxPanu+MLDwhJ68UsZNZ2KJHcT
         pzdxnynl3I3SfzEc5EtEyduv3QSvo5fQfoy4f3Pedo3Ah1wpXyeggYJINAWChbDw4zd5
         P7ob5ikcmiawzqcJrtlKQV6Rlx77LGgmdaC8rd88mSNvGD1rzhYjHuZ63Viagq6Dj9eO
         EDcHXwMJCLTUAb4UpkwMwcMxzdvujnZcbsu8+4oAHCht3UbCAZ5HZ1BIGIwFPYc8Q2Ui
         ZVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769255; x=1796374055;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hFWAeWghUobS1SNh2HR/z8yfcl8Q4/5YjOR9+nLiaM8=;
        b=oE/H+9ksy9oJkZXAeS+iW3SzaAQPA4QkG4X5giPCRPgDwC03OXRjaOMAB+gYvHfBOK
         wZun5UTQKTToVpHCVwQHqcGBv+MTL13yIk3rdVXPmhtf/l8D8Ztns4embtpfHrP/H8Vm
         qrZeuVSGt2XLHuua+4kP3TE35JURCKsncFuI+elow4jfBEAQVu8Y7Uz7RALBnMAgU3yk
         Q2I2NOZw6xhXVBnfJa8CWTfh/NPC4KVPvzSibC2Vvq2qV1SlwE3ig1+fuMKn2SC4wwDG
         0Ry7FJSS44clp7cmzEt77FBFR2wdwNxsIO9XyiBNkKgSJ4zqmH5JOHDmodTI0dAzJDqD
         Ifnw==
X-Forwarded-Encrypted: i=1; AL+hErE2MrSKFG72LHbKUVQVyOM6nDJHoATc/ZdhGm4j0T9F3230DjeLAhn/HSNsOPxxiePT7oD2ig6F7wC/@vger.kernel.org
X-Gm-Message-State: APuU4Z+qbhN9Wdwf4hILCXGXAK/b2Ku72TaPYEheGzuJjG+w1gZOg2VH
	/LF1zRiMkK7u+laGOh/mbRLYGd4Ck9joB45VvRgDAU1VfnOSR79PQTT70P22yxYj7myRGyiWMFo
	P9bd1vFw=
X-Gm-Gg: AZFdTZdwkI8imE+AIMHU1ihwWwniULzgdEO8wCBHqW97TnSeBCiwLWnegFjCSyaQfcu
	p+rhvCKwxEwUJ70LR8K4+vf7UttWi56a2oZAnhLAZicIN1BunUA3NsOlgI6FIjK3RlSf3oeHZ6J
	zm1KOn7x+aBvWEe2YFuDXUmZGluqFnxfPmdNpGNwogBhm6YXz+Du+eZltE/X3jEN6E7xYyzkkBf
	JeCQ4ZhoIxJEiGLQGXa5od9ATYrQEQ9d+6s1XMbD+u/zuSpqsy91vjQ3TnizH23Cyz9p3iuRaN8
	Cl1WHN1TlUWZy7VOmM6YXPPI1ANICFXdS7XDIPcQLMN470wZ7Ct8e3SwU9dHoHt2GZ2XwU6vGk9
	RfR5yWT5aYHix1f+TKkXE7EE3bvxl4PDyRkG7No3RTv7l6OfO1uEQsPPvyj0YyIT/plSiWqNin+
	bx9khM9rAsZ56qQz9hj9qxBBTU6okr/qXHQ+cW/CWU+sUxZibd+5J9Glu89znUvGT0LKnmfcE2d
	fgNjYcY3XUI8sSWhH66VqvVeOAt+UIPLQzZuKngVzAQEwMWgQeFgNLWfPo+rTMltWJRMEUOPQp0
	vYtobFAfL14/33QgwdEl+pb5h3VAapqKArQ8GOF2493TBOmGT2wwMyat7gE1JrFm+tyMfBhuuPR
	ayh30LgkFx9rfGn37
X-Received: by 2002:a05:600c:4e0d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4bb88922a67mr460696165e9.31.1795769254732;
        Fri, 27 Nov 2026 00:47:34 -0800 (PST)
Received: from localhost (p200300f65f19a90496f529fbcf0b312d.dip0.t-ipconnect.de. [2003:f6:5f19:a904:96f5:29fb:cf0b:312d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884a3a3dsm662489995e9.10.2026.11.27.00.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:47:33 -0800 (PST)
Date: Fri, 27 Nov 2026 09:47:32 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Romain TISSERAND <romain.tisserand@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 2/4] iio: adc: Add the Miyoo A30 analog stick MCU
Message-ID: <awlCneo6rrSJPgky@monoceros>
References: <20261127012612.1589039-1-romain.tisserand@gmail.com>
 <20261127012612.1589039-3-romain.tisserand@gmail.com>
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
	protocol="application/pgp-signature"; boundary="kmxikfi6vr3vqamf"
Content-Disposition: inline
In-Reply-To: <20261127012612.1589039-3-romain.tisserand@gmail.com>


--kmxikfi6vr3vqamf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/4] iio: adc: Add the Miyoo A30 analog stick MCU
MIME-Version: 1.0

Hello Romain,

On Fri, Nov 27, 2026 at 02:26:10AM +0100, Romain TISSERAND wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/serdev.h>

Please rely on <linux/serdev.h> to provide struct of_device_id and drop
the include for <linux/mod_devicetable.h>. The latter pulls in several
more header files that are not needed and that introduce build
dependencies that are not needed.

Same for patch #4 with <linux/i2c.h> providing i2c_device_id and
of_device_id.

There is no need to Cc: me for new revisions of this patch set.

Best regards
Uwe

--kmxikfi6vr3vqamf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsJQ6EACgkQj4D7WH0S
/k7MsQgAmXkeM4wMAFcot67XUVVbBIBHe14nNZchUfh2WmvpAi0XpKPNzsTIHhjj
/GUImj+kXS7eSvVQxGljXF5pczIDQsuen39afEPHvvhSyg6oxGFTEXp7SfEeuHAD
vg+2SwwGvurRKj5+owpBWNRDeCDTZnwZratfLSZdfT9kL4xjk49xBptg1K/Ev1GK
oz7iX7B2LJSQr71EV4/vWigA10VXxR6nsgBwhKbQmBLv3jBGoiU6UQdZ/O/BewLM
kvwT7M6MH34lt3X1gC97PXjO4XwqYOdg4tQG9eDWqJ4kh4TUCIKB03AzOEGJ8n82
VMq7sXMm64yM6YZAUq6tCbzxKjFNag==
=yo0y
-----END PGP SIGNATURE-----

--kmxikfi6vr3vqamf--
