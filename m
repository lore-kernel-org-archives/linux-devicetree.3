Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794126736;
	b=KNr9tnRuoGaEKyYLSIDdB9p75OSBldQaUS++noxgzrvS//oduqGKVFcyvDN4p8wTRSWt
	 H4QATWWm4XFmZvVIgXMtydUItUG2dOiBgOtRxZ/goL5kqKgq10LIuymP7AXQXHMxGWhvv
	 znX7gdpbJkt4OCxoDxjAjyIc56lh8BWMcyc3DEnV6EZ+KXbAzUDdo5vr+FILe0HvzxmRg
	 IF8c3Qc8LHeK0Ujp8KET+EnG6oetGnw17tqqwwodwZxqd2Rcose/TRxe+FCcMOYA2OeAN
	 9Zeq78STcs1V764N3LlQnR14s4n3RikiQ7CbzI1uISnOhGAmtvHXpZPyB5B1yZrGykw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794126736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=N8zgWG/m1wk1ElvtKBvqbB6y6J69miXFE8MYrY3hlgw=;
	b=Qm0jkAyi6i+9HEANmoDSOx0ESmgC6r0AYYKUQQrei2XIpUvmEy4UWs/Hl8BkSnYnkI1D
	 4KVdQ2bTPp5BM7byFtCdAVez9hOYJG5/4yuFtepFEMCUHbwS0gJTjzRnYnEdQkHsE+vpS
	 gMTZCPNVefjPaj4f+PgGEvjI9KgaULDDGay7bvocTRptKd9Pj+pOIS+4eJOjBEg8Khzmv
	 S280VeBg9wZtsz0oTKey3BJ1Eg+vn3zsbI73UzMoCPDxEkLXFG+JwydWMTkG1lGEugcdQ
	 C+ZVL0TsD3kq27U59mDOrNpJxlL4rmWFM+JGXlA52fc6fvGEAzBb8ocXXWavPiLmVLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XimmvAM6;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D8E606A31C
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 08:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48D8E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XimmvAM6
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso1075905e9.2
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 00:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794126734; x=1794731534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N8zgWG/m1wk1ElvtKBvqbB6y6J69miXFE8MYrY3hlgw=;
        b=XimmvAM6MvuLGCxnPvd32X6MVNSf++ePdgANOfTnjNwg/vHm1rC5BlB8GLL0vpJbAF
         spJn4cP8UxrRT2X6K8PZdZgxt4jBSdvSvxZk315N4UU3h9uEUOuOCHd+QrBm93O87i2r
         y9P+xZFRJpT0qsSdB+NaHn34HVsdRzZihT7viVUJwP634lOahSySjkyC52n8vSQjOhme
         87JjzIsDJ2LUSfuO5WWIOCXfCen3plmzrzWR3tbLsKGDcq2iRBIHGvn4OC9tpathkqoe
         DQ4HGLirSrUNK4JKcQoj0qoDKnPENY8122iBmWiQxY2C7Norxfd3NAZ9TUEXNmbo7vXb
         lcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794126734; x=1794731534;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N8zgWG/m1wk1ElvtKBvqbB6y6J69miXFE8MYrY3hlgw=;
        b=LWVKiC9o/wWjLVPlxDdTwZzRPpXWogEE3iFy3AU5AB1QLSmbVKZXMcNjHqXa4kX19E
         WMyJfxyrMJqtHvQBLYuZAj3zetGMnMWi02fOQ83Dq8LtqdFKVHQpZzwOgr2Gc2CL/GOM
         lp/bwMji9WWmBUK+KXK2oJikMlrmL66gMIIPicfjKQhyN7AaS6iHgHLZC7l1lANp3/8t
         pvmn+LDrAbWeU/AqPxaryIYjktiJrlgp30nuyYOuXgaQLsXvhnfsTLHO/+Mn7xG3AL56
         FT5nAYQnR8u9Rw5eIpfJa/1QEiGS2/meWojzR8tjLctMfUcqABoGLUkiIo9JbWWilZU9
         lnmQ==
X-Forwarded-Encrypted: i=1; AL+hErHGyW7GIKMdJQBzGZY55AbfPUuo6dwLYuMYyNSWCMipFu5BEQUh3JnZiFf2SPnji+uLHfgTFzNnjwFz@vger.kernel.org
X-Gm-Message-State: APuU4Z/rg1AFogcLTiDnivKRTJ67PAVd/TcgkroLmAlszt2VZqsyi3X2
	JOLxCgW/9Wcwgi/gXS7nwFVmo+Fqh1n4TveJ2G2wnhGXDUEvcJvR/dJfc7EZs/rj/Tk=
X-Gm-Gg: AYBFou1LzwkEX02Tok3IMRo5Vp0mJlpz9lYT2rPQi/HkrQ4DfpaNtZ7CRH6cBiosgcm
	Jo90EBqr+81/reEXEUxqp/p9RUWoTTHRfNaXYV/NhPrj1IpIUPJt9ZFys5CFVEWnSxN23jyCfiE
	fHWww0bk0+j9QPL3YHi3U2V2Yvj2lpaTtIegIci43b4qPLiUkXEv6RheYZ8L4zJXxZ+h16MuF6j
	tQYS5okdFDoEe+b8uaz/zdpJhvyGIhLdSNNvMBsNTPXv6X+6qLzgl+EdoBpz8Vp5UzrUapPABFC
	1dfO3V0wIzyC3qApXxTUtw2Oox8dZgCBrjdmrUfhEWjxnsBpNgT1htLixJrjMYjTqxkbjalUkJE
	JR0I1AAKttdcPtdz0SH0HbTV9pGj3fZobuo2DAdk+Ypc0Xau35vkuHtZBaQGqUTB1ZF8x5/eKN3
	PyYPL/9yZBsoHigMPoxjRz8vaox7R6bdbeixqM7IKPmmWcPgWB+zAs2BoNAyNIEMvkRJHbhkGLL
	YkVylI+AQL0iO8WI08IDV0Qz0ajfwiwTeYbkYlqxzfLlsW+inOJMr70Duvo6O9mJkfmHINX0RD2
	brKv69/xv+N+JhwtW02gaN3acxU0nYvwISk5BHpVjqeAcQviRkfjOqw=
X-Received: by 2002:a05:600c:8b86:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4b963c6e58dmr16840235e9.26.1794126733390;
        Sun, 08 Nov 2026 00:32:13 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b76cb76697sm83632255e9.0.2026.11.08.00.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 00:32:12 -0800 (PST)
Date: Sun, 8 Nov 2026 09:32:10 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Rodolfo Giometti <giometti@enneenne.com>, 
	Marcelo Schmitt <marcelo.schmitt@analog.com>, Antoniu Miclaus <antoniu.miclaus@analog.com>, 
	Angelo Dureghello <adureghello@baylibre.com>, Tobias Sperling <tobias.sperling@softing.com>, 
	Eason Yang <j2anfernee@gmail.com>, Marilene Andrade Garcia <marilene.agarcia@gmail.com>, 
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, duje@dujemihanovic.xyz, herve.codina@bootlin.com, 
	thomas.petazzoni@bootlin.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iio: adc: add driver for Texas Instruments
 TLA2528 adc
Message-ID: <avAy6cemm3MRHSQO@monoceros>
References: <20261030164705.297354-1-maxime.chevallier@bootlin.com>
 <20261030164705.297354-3-maxime.chevallier@bootlin.com>
 <auyjgDddFs3OvnC3@monoceros>
 <20261108013218.0fe627e7@jic23-hlaptop>
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
	protocol="application/pgp-signature"; boundary="nzwaajfdqqb5x5jv"
Content-Disposition: inline
In-Reply-To: <20261108013218.0fe627e7@jic23-hlaptop>


--nzwaajfdqqb5x5jv
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] iio: adc: add driver for Texas Instruments
 TLA2528 adc
MIME-Version: 1.0

On Sun, Nov 08, 2026 at 01:32:18AM +0000, Jonathan Cameron wrote:
> On Thu, 5 Nov 2026 16:42:42 +0100
> Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com> wrote:
>=20
> > On Fri, Oct 30, 2026 at 05:47:04PM +0100, Maxime Chevallier wrote:
> > > +#include <linux/i2c.h>
> > > +#include <linux/mod_devicetable.h> =20
> >=20
> > Please don't include <linux/mod_devicetable.h>. <linux/i2c.h> already
> > provides i2c_device_id and of_device_id. <linux/mod_devicetable.h>
> > provides many more *_device_id and thus introduces a big list of
> > unnecessary dependencies.
> >=20
> > I recommend to just drop <linux/mod_devicetable.h> here. If you insist
> > on full iwyu, there is <linux/device-id/i2c.h> and
> > <linux/device-id/of.h>.
>=20
> IWYU is always a bit of a 'roughly' case in the kernel.
> There are standards assumed sets of this header will always
> include this other one. I've just started assuming that is
> always the case for these ones.=20

Not sure I understand you correctly, but I think it's safe to assume
that including <linux/i2c.h> will always enough to get a definition of
the structs i2c_device_id and of_device_id. My preference is also to not
add includes for <linux/device-id/*.h> in drivers, but opinions differ
and so I typically point out this possibility.

Best regards
Uwe

--nzwaajfdqqb5x5jv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrwM4cACgkQj4D7WH0S
/k7nfQf/dmSfUoe2s/ZZJPtCi+WOplpfP4laRiw1uBUXG0x4haFv7821WViD/bhF
dvg4X3D486E8LLkSsWGz4mKh8N7M6EsL1Vddr0iCBrz0pbsjdVIkEFS8ymBvBOud
gBHytbfcmR1LBJH/wNhfLqoPeEpJYhuL3511QmrCiBBwbtgSWL2Suj8GNF54a3pc
BipU7Kk/io8HXiR6H3D6i3zmjoKT0adjlt2eiCw4egBAx+/vTIMqXF+/6/6MMMvi
hrU3TjFMWokLNEdekI/XHecdT3dCdmHuRnJzriW8rw+zVxMMpheFcqb8fVjkPUA+
2ozYOslTZ9RtLyy0OB9+omPbgKcEQw==
=zcoz
-----END PGP SIGNATURE-----

--nzwaajfdqqb5x5jv--
