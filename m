Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE03E37B3F7
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 22:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783894826; cv=none; b=SAZwP17aYc8Kp7gsBv0Drj1YUsrvont1DqwnFJIsgpDgMhVbosx42UPUdS9pOJxmHBmu3hQCJgX1GdRhm+bUOoHz9tmUdrmaA4YecG4ioNt7c0F8h7WcwFddbzY1ph9aR6YxRaUzxGZrtdxRefZncAi7J0gHAUwl99aXDO5HdVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783894826; c=relaxed/simple;
	bh=UaMv9jjDVMG8x3MdfIlU0zA7Ho7EYQX5iZFhg+NF948=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNwOS6kJOUUznuxg4FCPf6rK7abkN4ZA7lKhfrCjCewtW8rEF1joy7kN3jKLBK2umurfXLswT22ty+MvyAepwg01u5qsz3sCU0tUppP8wKIHj0f9LNxtyqqAuVMZpzzqz9h6KV/CqTAMNFFYFaW6TqxGK3KASG9PdwNDxVGp/6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=lN8G7KxX; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="lN8G7KxX"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-475881b9a4bso2478909f8f.3
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 15:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783894823; x=1784499623; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UaMv9jjDVMG8x3MdfIlU0zA7Ho7EYQX5iZFhg+NF948=;
        b=lN8G7KxXSd8P7G3ZbIDh7eIE215G3TJnw5wbSyafF2wb/HoNhbLnWvE3f7+CSR7VdJ
         Zrvdm9DhsMGgVLDkBL9/I/NGtdQV2ySKuOiJg0RshKEinonuG42fSMUYo2hL856HI7w5
         xqTcPUrwXy3zeIwz6VSRPYOlBTY+BjnGiU2PkrB4vJE61xLP2w4TlWeAQfdieT5QI9yY
         fyLXGwixtV4lXE27vKr0oYOhhr2YkuoleNP5YQDwP2ovrD91jVQBV/Tz8SfTfx8N402p
         aKiHMrfTMYLXW/C4aLgpnXZncqFun15LgBcRttfIK1t2xSWqjwC6EpVjLscbp0TmjyxH
         UgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783894823; x=1784499623;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UaMv9jjDVMG8x3MdfIlU0zA7Ho7EYQX5iZFhg+NF948=;
        b=Gyq73Zui0NOen8mKlPISUzxmL2oRUINpbBugQvTTeD8VoXupv3aVHAVsrFs0tvtg8t
         A2srgXTg2ZeIHiVLEtwvqPnvefk3Zr7V989YpkoaCLgfp+5EcSJGLOYpwk9YY/P8OA9D
         Fr08FfuzHLQmmzkzteVdL+Tmeg2wq36TSFZQCxL3CXmIz+81eyGOWLTg0ENgUPkcwpsy
         /h+467HiE74eehmlYurQ2oPWH5m4uU8jhCx8VQxFk57biGsfLyZAu6HMFLTBeFT9vRU+
         bBvOSBBHZFrnqICQPxPNs/H6UR1CQnMmuT8V4kZyHljlHeVHupDOH86Sio3rsbmm46Mo
         4Nmg==
X-Forwarded-Encrypted: i=1; AHgh+RqcY6OlLlCV96tmcGCREHOd4TceRfim/BvklsWpdGDBA4ppRS1q//sGTuaH6Y4mJZQsDPj0SDfuunBn@vger.kernel.org
X-Gm-Message-State: AOJu0YzB8rEC/Bud6wwCuCTWGwbA3cxb7ofXgpmbuU/dewWA52dSK8Dr
	+frcT32DrUmaYgEVCsuORc83j848NK1DdVgNZyRZXPA+C4270RszVQYrZwb1bUSAZ9o=
X-Gm-Gg: AfdE7cleSwD7PwcoqDjGPTS8eU0Lwu0wnUqH/8IRycz4/brrPAk+PX4QuA28/uptIW3
	DxbLFUBtQqQT3HOnNQqnxYp/D1UVhrCPJLurKaS3m3dDK2ZHU8ii0SMad0yZoI4dq48pUtiPPeo
	Fr7DURle44tar6XHSqHXqKKT5EAeCB76FjKtdriCdtOy6XRe7hHriJBHzbS37xTA+EgZW1kVJin
	IY7aIJ16H2IB3clbBDbsZYhlWxQzZ4h4UxLlWo8DcwhWuc1WKXBTIghyAdau2W9sCw62JyDshlz
	Lm6lUdUNybNUwhWkQ3L+0aDVMNMMITgOeWZEPHrAjigeGlpffjrm7ONodw9sHjp/KUMUZ9otn7D
	+UHBVjD/cQOJN6yoKyP22hCVQpk0eFmd4hXvGLdODCyL34b9Ede3ktCO9fAwclYdh/r8PDj66h/
	Krm1vVW+Iau1aqhUSbaA==
X-Received: by 2002:a5d:59c7:0:b0:461:a16c:a5f4 with SMTP id ffacd0b85a97d-47f2dd1f29emr7463754f8f.33.1783894823120;
        Sun, 12 Jul 2026 15:20:23 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47df6a31dd5sm36072226f8f.16.2026.07.12.15.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 15:20:22 -0700 (PDT)
Date: Mon, 13 Jul 2026 00:20:21 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Rosin <peda@axentia.se>, kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	David Jander <david@protonic.nl>
Subject: Re: [PATCH v15 5/6] hwmon: add NXP MC33978/MC34978 driver
Message-ID: <alQS61NF-jIPf9c3@monoceros>
References: <20260710101358.2606941-1-o.rempel@pengutronix.de>
 <20260710101358.2606941-6-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eoelryauyxzr5o6p"
Content-Disposition: inline
In-Reply-To: <20260710101358.2606941-6-o.rempel@pengutronix.de>


--eoelryauyxzr5o6p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v15 5/6] hwmon: add NXP MC33978/MC34978 driver
MIME-Version: 1.0

Hallo again,

On Fri, Jul 10, 2026 at 12:13:54PM +0200, Oleksij Rempel wrote:
> +#include <linux/mod_devicetable.h>

As for patch 6/6: Please use the <linux/device-id/*.h> you actually need
only instead of this catch-all header that I want to get rid of.

Best regards
Uwe

--eoelryauyxzr5o6p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpUEyIACgkQj4D7WH0S
/k6v6Af8DonIBzgXRrAro1+NrzXfsyTcCvnpo5z61gfP7EYxqqQKmKb4nW1epVP5
C0qUafv1PYdk1SVNnLXcfezjA5hTzPObf6swpviDD1rKLmbL+IlC8LRDThYP75i2
6I2JbSV4MHpHV/CAeZPN8lJwEWWFKPZT6qMZSjL6i574MZkfBsAUvJbjktBJFMGL
19L4NPedixQWc4G2xw1/NUeAlhXt1Gqrwiff/nLqJj4wv0uf1VG4Oai9+wNNbzeS
u7Mxehx/iaIobftfGIEuo8Gh1zfkg8rG3Q/6HWZJwKDQtwSpcOPIJxCfGmcJQQi7
A1H/hqVhq/Ypnl6NzjF7vqu4eSFLRg==
=xsmz
-----END PGP SIGNATURE-----

--eoelryauyxzr5o6p--
