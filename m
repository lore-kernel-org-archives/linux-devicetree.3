Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7B1369D7A
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031877; cv=none; b=seiUOM3s7v7XDi0YqOWNvqtzQuKFBbcy61GD6z4XWZrR8iDmRGuYNrwqo4z6tub3O3F35gJ4r2BKVOmCs43sbuNw6L6/2sYWkm8mQ8WxxYKNSIyllKOmrE/o2Sna98dL4hTK757vb4uMFY5AniK2UbEQEOrVYKMsnuF6J67xrcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031877; c=relaxed/simple;
	bh=SRObptwHoSX8kAd62LTXebK4+GvkQ/zgathGis9QzXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pl21lQkjPlCulZvYgyw63zyLvaPajnPTvCiKw2jj2qw8bqz5pHGLGkav2TPjLtb4r+QhrQJO8I58OWXJA7xuwUeFJvEJ7s7z14/Rd2/OBOj2kIP+n1o8R9z8h35etWzYlVbpavbVECLXSFqE1Toq1VDGt+K+3/CCycQpY35nPIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jYPyLcJj; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jYPyLcJj"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493f60208a5so36542555e9.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784031862; x=1784636662; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SRObptwHoSX8kAd62LTXebK4+GvkQ/zgathGis9QzXE=;
        b=jYPyLcJj2jcFvmX8pB+oOEe+d8lD9GJPiwqojBkVSXd1H6W1A0rv922CMzYaMZUxgL
         hqmzVnI4GVrdb/4Jq1qb6NRaI/ChnFOsoEoV7HYoO5MvEKbYKvMyCFFuP7x9GuPy5JIg
         oYNFaPhn6+pm2uYe1kZy0ra5HulWYG0NomzvoPsL7OwEdJvdWPuFPHIct2S5INwX0acS
         JD7RtnrB97LrBmwoztDsByHu6FgxYT4z5HtUF81dkNqAig2L5q7z47MUCCLSfRE0q4Z0
         ntIcHgU6J33evlWX9IAPFkZ5bCpAuBacIF4C5USYgkRNTVxcPJsTZm9OPHg64xGdq9O6
         A0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031862; x=1784636662;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRObptwHoSX8kAd62LTXebK4+GvkQ/zgathGis9QzXE=;
        b=IODNoRwzudq4QkSrTAH5TUVjUlC0MU2ym9nQdzrPe26JZoOlm51lHw6KewjKZFIW7Q
         dDVQiLrm8ziJi4UPuZEIk65JRgK0EpRwN9EL0quAUC5yyXcnfg4vOOhAIB5zoAXDjLC8
         UlKTdhCma1UdCsVatUBRTdWWx/uu0UE2I+h2L2LGwZGrj+ia6uHfSeyVW3wSCoefoCYe
         JnV4vyV2OWbUrshWk31mMZbbFEKthqYlg/eL3k2R7VEqh5grV5stU6PgiwAb85I2JeMZ
         ht3APNSWwJbTFOAXT1ApkhvpEV4JHHUMc7X46mmaeis4HcvSCWhF3m4PaR6aFIkyRe3O
         dzpw==
X-Forwarded-Encrypted: i=1; AHgh+Rp39+WuclXfDnle5JrAI7tRkSS7uIdLAe4I/yCxmBxKt1MOtD7mNilyV+LXafS4VZP/Knpqxq9cawqR@vger.kernel.org
X-Gm-Message-State: AOJu0YyEAjfUerRXCpg+zDuB6sL4++mLA3iVHG5dGSOAhMZEuzSB3t7X
	xOoIF+DXxhthhBMyMQb4DVLMijbtNWgHG2dSS3/jUrFGOAdEse57H5L9Zj98cfyToeg=
X-Gm-Gg: AfdE7cm7ZurlsWJwWxBt093LP1hfGQzOg9H7D8A6sr6eR7ltP/eTi89ndAbj5Jx0/T3
	n66gQgzeC6JGj41c8tehCMcNQMtygt+Ac6Ug+ab8jQoWwmSKhz7VqiKCnKqwWCOSyqHemKYXH7/
	+PSun4T58y/8wGRfDx1GPf4h2al0x4HOAmJVbCNp4xaBIzpWd3iSB/ctB8+USPZsbt9AJGqDGMQ
	Ot50YmSvsB9fT2vReswzhNPn3EwhoCFgpYJPTuPQQ0tJPxcVHmNMdeNhBkoGsVW9aXOQNu43kbh
	c9Q8PXL6KJZ+UnTmflduNkY/29ifi89T77Djv4X+fN3yKUe2i+ZwEKuitkbdE2mSLgvbXRNhg0w
	TrqQV8OlvBJXZVAxG6PVE/OMB1vDFP2+pvg7mH5ZJEt2b/2g3lOFI2YBin3CFXbpRhpiYTDESfy
	Sk3duTKtDJnvnZeF93Bf3SxmV2foHgJdEoYkvx3SME/YkBNNOizYlJGLE5w7KNbYR8/iWV6ZHed
	n6U
X-Received: by 2002:a05:600c:6091:b0:495:3a21:4e5d with SMTP id 5b1f17b1804b1-4953a214f0emr7787795e9.0.1784031861818;
        Tue, 14 Jul 2026 05:24:21 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49508732395sm71287545e9.5.2026.07.14.05.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:24:21 -0700 (PDT)
Date: Tue, 14 Jul 2026 14:24:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Stefan Popa <stefan.popa@analog.com>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, David Lechner <dlechner@baylibre.com>, 
	Nuno Sa <nuno.sa@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Siratul Islam <siratul.islam@linux.dev>, Ciprian Hegbeli <ciprian.hegbeli@analog.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] iio: adc: add MAX40080 current-sense amplifier
 driver
Message-ID: <alYqVxnzgBMc62eL@monoceros>
References: <20260703102941.1141341-1-stefan.popa@analog.com>
 <20260713120226.90303-1-stefan.popa@analog.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5ndtom5antb4jk7g"
Content-Disposition: inline
In-Reply-To: <20260713120226.90303-1-stefan.popa@analog.com>


--5ndtom5antb4jk7g
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 0/2] iio: adc: add MAX40080 current-sense amplifier
 driver
MIME-Version: 1.0

On Mon, Jul 13, 2026 at 03:02:24PM +0300, Stefan Popa wrote:
> Regarding mod_devicetable.h (Uwe): kept for now as the replacement
> headers (linux/device-id/*.h) are not yet available in mainline.

You can (and should) rely on <linux/i2c.h> to provide of_device_id.

Best regards
Uwe

--5ndtom5antb4jk7g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpWKnIACgkQj4D7WH0S
/k60tgf/V8OQPEZKKMM+CfRKN09vFY5OZ+u1nU87IvKEHqC++R5L5TQhfKCO9F4F
BTGplAOTlgjeJFe7uKWcZcwNgD4GphzitXwZJX+01xkRaVpfkMa+KyBapCmP6X4A
MjFqNqi65SADqt/ZbhCmoUMsOm4Jggpi2EiRY4wtcTEZKTXs9AWBMaIHSL6UkxrO
qiIDKDVn9++CTO+mjCHADHlZBQ9fxUwFATz5M5hJxI2un2/cmoK7G/A0SM8dBZAD
vkjGTQp0Gxbayz5lSI1KkCs4TGTNM5yVPFlWyuAGwpwTRwibcQouo9CO3jTpqLpB
wObhDx53iC4YcRc3ZhH8hE5OPTfKOw==
=cFbW
-----END PGP SIGNATURE-----

--5ndtom5antb4jk7g--
