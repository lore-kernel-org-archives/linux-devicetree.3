Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377F738911B
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785327542; cv=none; b=pfNSMNaYUHD+ZV15ZIYMLo5gzVLO6WtxCuO4Dv1mZ7QKdWfPlHzut3Wo3VYoVHn4i384kDxQdoP0RCed92579wfQac3TrSFXTWf5t9nl3qgLqu8FHc00HAuzZGt6X5LFPXrmAS0m+74hOLQUBimfhfk3wyzKN67F3DGzy/fG33k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785327542; c=relaxed/simple;
	bh=RKttXu7FexOizbpwsY5nm2JyW7CYOkbl5iTB0i4sC7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TS4Lm5H6pa1XV4e5O3txmmR42ayf3mOrUvIjkvyDgv/8ZFXJaF0sDCFrse0ok7dxupEv10Pa7ZQ6n3/6/L8LWfQzmYxXpOIAnyfbPfLfspcCuaa40+UDMU7ZMEEFz16pKoe+CtMeVBahX6ABsm/vagvutNaGB2VtIVXrNqKXF+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=RJf/pO6V; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="RJf/pO6V"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f81a3ccf9so707688f8f.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 05:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785327538; x=1785932338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RKttXu7FexOizbpwsY5nm2JyW7CYOkbl5iTB0i4sC7k=;
        b=RJf/pO6Vc3JuAlNkGi1cpUY32xGjv9IjLCMIsbCFeytkCBFL+ot5NaP9GuPHpTG1dh
         LK2le7kj58ESa43Dx1J1m2v6DtBwOF2vrtgk32z++9S7h+OYiucKoX5vrjnau/3ttJEd
         9XqnzIdTJXV/p1jTLoc1WppJOLIo1XZ4AGhHDHJULy+b17nd/6SWsD2DM6VtSnYBGo42
         CBhZNnqWok9MwDKNDWEEQUHyNS2lIwXVO2vgMB5Vy31fGyA2+2GhzJGW+a/QlLxBYquh
         H+p991AClM69xCeNA+531GUQLI8idbQAbgGZBrWUMuF0cMyJkmkjMXNkegpn9hQ5/nW6
         LzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327538; x=1785932338;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RKttXu7FexOizbpwsY5nm2JyW7CYOkbl5iTB0i4sC7k=;
        b=gU4uvBXAGF0BZPiMgtimblUBXzw1w0bv2OiBJct35Kj4DeecYYGroyj7pgwGyZkpis
         Jch/mTD+nDzmy4biLG3SbtjWjIjD+2nKKA3QHf5gF5UD5PwBUaDLil92PlMV55bol3+v
         NBFu7UcDDSZb8sYg/6o7GPmQDkgp9COa8T+fBBD++vM6pzyk+1nRCHI2Qh/AgLRjNXmc
         o2BQIXCvI6Bxin8gsr3JwWBDJFXrKDXuB9o41hmiQMf+zL1YRofUQqX4ikFurERa1cZr
         dzYcQV40Pu2mp3b5uC6G9uTpVU1RiN3NxZMfo/aO6mZdG8bwWpT5dKUUAAFO+q+eGVhD
         FVGA==
X-Forwarded-Encrypted: i=1; AHgh+RoYMkxKxT+vGgCshUQ6unIOym+537JfdjPmUTWd1ZsO4UApkt+nnq5DUBZfz8zskKR9iUpo5uQ93Qiz@vger.kernel.org
X-Gm-Message-State: AOJu0YzQpdpPqF7WuBnRx1qer9TbNI/vLsov2n2zbtjd+Yw5n+vEXnZ0
	crlhdqT9Pj8UHjHTzxoD8tnmhkQLhh/ZSxKfRTdSc6rnMIObbq49nU/sYJ6VIW6akvQ=
X-Gm-Gg: AR+sD13R1AxhX8fK4Y9ZO6esMG2DP9moZhr6qNVbKX21Q0OVgmIbDDEqONz1DBaChyL
	f/lP8D7vqTV29R1SxB+Vd8+eAnyo8eV7JFwJ4WME7EdRDIe+3ZShv3w6Xfrx2p+ouWlxpaFYtYD
	liMk5ukOZ8Wb3AtIt6qV6+cN4+4FHR+HcdWYYvB7SXYca6auqwk9kPtlpMkbaj02qMY3syOCldk
	j33iXPaHpo6vDrZzsRZZA7K8YQIPFshXXKv3me35UCLMuiqNum7Jm/pYwnx3XJoJfuKzWaB7m7Z
	MnnsRNVU0X0XPCkWYBbbkltSvxaa0SlXrvj2mqoxWWsp2z7VUbzPCVZRrozQGYg8bctBMcDXElF
	tmZjl3vLOvUZpW3MznTfil2zBH6XXVUF7h1AogvjXwf/A6AmWc6UIfEdquPWAsp11VZ1CASGa0r
	kMMsTxAuFQX4zLLthvyKwwOsnU3OLS/sXeDS77jdDqfnZkHi2gpek1DnIhU0FDvAxL9QgzFbh3j
	9GNy1c24D34r3hDJ/kREhxZY28K7sJ3oO1EfKbwgrszX4zN44Y=
X-Received: by 2002:a05:6000:4911:b0:47f:97a6:1334 with SMTP id ffacd0b85a97d-47fb1f18049mr7073654f8f.46.1785327538205;
        Wed, 29 Jul 2026 05:18:58 -0700 (PDT)
Received: from localhost (p200300f65f47db0401da7fd03a16a046.dip0.t-ipconnect.de. [2003:f6:5f47:db04:1da:7fd0:3a16:a046])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fb6b2768fsm7550029f8f.37.2026.07.29.05.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:18:57 -0700 (PDT)
Date: Wed, 29 Jul 2026 14:18:55 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Alan Tull <atull@opensource.altera.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: Re: [PATCH 5/5] hwmon: (pmbus) add support for MAX20826 and similar
 devices
Message-ID: <amnvYB2Occ911k3B@monoceros>
References: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
 <20260728-hwmon-max20826-support-v1-5-224766e0acd1@analog.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n3ggbw5bacfwekjx"
Content-Disposition: inline
In-Reply-To: <20260728-hwmon-max20826-support-v1-5-224766e0acd1@analog.com>


--n3ggbw5bacfwekjx
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/5] hwmon: (pmbus) add support for MAX20826 and similar
 devices
MIME-Version: 1.0

On Tue, Jul 28, 2026 at 05:03:52PM +0100, Nuno S=E1 via B4 Relay wrote:
> +#include <linux/i2c.h>
> [...]
> +#include <linux/mod_devicetable.h>

<linux/i2c.h> already makes sure that of_device_id and i2c_device_id are
available and <linux/mod_devicetable.h> is going away soon. So please
drop the latter.

Best regards
Uwe

--n3ggbw5bacfwekjx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpp76sACgkQj4D7WH0S
/k6yCggAq8efA13zwRO+Od3kMS57XL7KmMYi+2Eh+9uZ7z7a0LHgWsU0VnvflFFJ
KAIXrYrr/94JXpdd7ba5V7gM/q9gO1TVpdAU6jKSE/P6ytUI3h5iVobiYzRDLvwM
FWz5otvARA+J1CXKX7BiqFqCVZdhm3jj/8GmDeUZXdudUC2++V40vzsgdD5HthOE
ZPqyWUne8JrzFmMPZRfMoWKvNHO6TPcYMwAylQRQYg0emRPmi0FQ/7cn8A773L2w
1BrcYY/dxpTVNn1ziLtmoKJ4sQyT60Wk6TpJ3MoYRqHEoVC9Zogow1beYtzKgoEC
nvPzV0EF/3Xx7tnKcG737INpSl0eMg==
=hHoq
-----END PGP SIGNATURE-----

--n3ggbw5bacfwekjx--
