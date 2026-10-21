Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595444;
	b=KxTnOdynbRdm2uUSNzvAo5x5g6g0AmcKF1FSKHxQYHN3rV2Fa+L7TZi684rzSKauqQv5
	 knEKSoSStfOZXDEqBhsQiD4V+f5+W6R30IKQA/pm+6qlKWFf6Zx7i3EtEpyLmDUaTcQmi
	 bkHncr3cCSjyyeznkZ2oLkxPuBtrZZadqnouXX4C6yd+n2b/GbySHBXFZRv0zGeB1bJEq
	 zswm0lxKXYXqXKpZabMbH6lHeTi+3myngiPkSJ08yLE2VxL4QsrT/PEB4hMYk84UL01eJ
	 ajcQOHL8MAcL5o9cLhBI4Iezxjp/x7rWI+YUramGmjALWhRhXhc1EQXkISGRG7nk25A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=W8mbMH/zd4LfA7Gj7RbbT0d7KvJilvfrispWtDi6taQ=;
	b=ytVzEAkYF14ePdfaeMaISM9NO25Hnyx6Qo2LjVquwFjhP/9JMr1xwZ4GXbzhvpRrV7Cs
	 YntOGRKO8w0CMF4izb/2yPvYDAkb3kq++sM+0Qx+TKK2WufA3/Y4zujwKnZ3KI6+Mfb1+
	 S0PYK8FjeBIk0mAeqw7WY5W1jECnBMsE/fCL8ZNff4/EYOq8+oVOgdgo8SmyjB0e32Duq
	 kEFvE+veIHNN/qlmSe0pjYxUv8+RjdTui7VTif9fRknmcmpb+jL/cuO0rkpETpLFtZkex
	 L0NDOOdkrAwf444yRArc6Cjxd3UJeIW/owKYflZb1d3AUiV8WitU34tcCVdx0pJAiRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="jwTMR9D/";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188FE606A31E
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 188FE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jwTMR9D/
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso612454f8f.3
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792595442; x=1793200242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W8mbMH/zd4LfA7Gj7RbbT0d7KvJilvfrispWtDi6taQ=;
        b=jwTMR9D/gfasU3/o9bndwoGOsikOYd3KZcNt6YADXeFTnchLV78PDoLv4SYJX5BFBS
         Eyj/6G8mH/ehvkBe4+u+i6t3hOBWF/Gk0ulUTgVFTElVCxTQHSRoL3dJmUds5/ydNZvd
         HY/O5dHYG7C/mU1JtvWd9xt0qf1j4O52JM0M524yVle+uGYziWoz3TSSRHxFfmvTfib7
         7KrCKvDsq+XRqXoNXUMwa8nPzyXizBSazY7dcvkJ3DIJjlsTGSX+wJK4j3+TQlhptZPr
         PAYDXMR2Pe79rIPp0irRoaTfbkppt9XE01kSTtpMGfWYBZ5D/PT9j0jS87p5DWdigitm
         kWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595442; x=1793200242;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W8mbMH/zd4LfA7Gj7RbbT0d7KvJilvfrispWtDi6taQ=;
        b=DGxQryY3dJqY7tuHoNRHYyHSsU4lFtZufvEPE7hFRnNneKzrdoqzvJeP+XcO0BEGh0
         lsWV2rh1DdUXJqnzu471JdX10QZi1qjWKSzubRIje3zWbF8f9xa3g+fKC/Nh4JAsmheX
         Gj+oifnKWTBUSXDniCy8oFZZXgmufpopx8kuGsnVpow7WdJ9c/OKxkteqG4+2CZzmIik
         3Rr1YKd7qpPNkP4NaFVqHycAmgca4wHQlwfUeOl4jDQnBfdk5rewShOS22aAPKo2srcr
         ZKbEe47C5I5FDEiH/Y6/JmC7Rztw4GBA39JF924NeDdP8J9A1SWfMIhmGAfk+slGgNm2
         uFsw==
X-Forwarded-Encrypted: i=1; AKwUvBxjyQoN3/tt+FJkp0Y0dGlTTO/cwIqnGaoctMidj/DQBH/8rPcm4LKgBlh2apJg2b4nwqPMDW/GsyiV@vger.kernel.org
X-Gm-Message-State: AFq9FYLlgTgLu6tT08NjyJpDuwOy9PGJex2PA0woIF5eVow/rTuGCopG
	+rh2Bj6SZiEhyP2wJsRMzGRIGjh3eImq6XydBpg9CfNCn6AhO7A9oLJZY7PVzTdBwic=
X-Gm-Gg: AYBFou1xgfxS5HaCSjlU6aexVZeZYJgINYdrUgs5H8nC+uAl3uNnwkXYifYiuuJmYBc
	tgiD51Lnn5oeUrw+Ho5aI1/ArlcArnDF0+KUsOA1Z4oTfTYzqYkIX0llacBO1sRuV1AsbNTOLsd
	iKurfoD1ZdcmJAtcsswLe91KLeEA3zp/YKp3SyoYRtvzV+jnGHXoT+NoZqQnZJc/K5jHDMKd/Oz
	RAThFiyQqhOnqMs3mUYLXDTajxLuFrbz797F0aaH94spoSDVhoqCSFpUCCFMpvLqJ/+pS233Lpm
	gaoKos4xqcbYLIPvS4Ra31M537TafLWO6A3haUt+eAGcGEFg7pVRHxaozaaBg6sCSiFl8SS/CZe
	EEPM7piPE6nZC8WOCD2Aq7H5BylA84+KRe8c3uw1blnK7aZxJF2DUb8322EKpciQl6CkLHAoWIN
	uIS9D6s5VxOQExoTmM8LqNkmI4CxRzYYGez5O1eKl4LW/znFtB9xBRBwo7HuqyVn8OHBAiZ4HXq
	RDpbs8tpshbFx58LF3HK5Kaw3Ia6ukGXnDGT22K7mZYA9Nx4tT0Ytem+e5CEQnGbzW8pt1waUBG
	XgRhmNKSkt0w2FeUWxhRqqZax90thWhZmGS/5GMieQdhNmTG8Vv7MpIcPSYjACTb
X-Received: by 2002:a05:600c:3d92:b0:4a1:dbb7:bb44 with SMTP id 5b1f17b1804b1-4a1fdb1d84fmr50055655e9.5.1792595442409;
        Wed, 21 Oct 2026 08:10:42 -0700 (PDT)
Received: from localhost (p200300f65f19a904634661a51962f5e0.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6346:61a5:1962:f5e0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm58202855e9.0.2026.10.21.08.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:10:41 -0700 (PDT)
Date: Wed, 21 Oct 2026 17:10:40 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 5/5] regulator: Add TI LM51772 support
Message-ID: <atjVWgpbnejKtblE@monoceros>
References: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
 <20261021-paul-lm51772-v1-5-25f0ffbffa8d@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="5zdcowfgw4xunjqo"
Content-Disposition: inline
In-Reply-To: <20261021-paul-lm51772-v1-5-25f0ffbffa8d@bootlin.com>


--5zdcowfgw4xunjqo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 5/5] regulator: Add TI LM51772 support
MIME-Version: 1.0

On Wed, Oct 21, 2026 at 12:27:46PM +0200, Paul Louvel wrote:
> +#include <linux/i2c.h>
> [...]
> +#include <linux/mod_devicetable.h>

<linux/i2c.h> already provides both of_device_id and i2c_device_id.
<linux/mod_devicetable.h> provides a plethora of more device_id structs
and thus implies a lot more build dependencies. So please drop the
latter.

> +static const struct i2c_device_id lm51772_id[] = {
> +	{ "lm51772" },

Please use a named initializer.

> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(i2c, lm51772_id);
> +
> +static struct i2c_driver lm51772_driver = {
> +	.driver = {
> +		.name = "lm51772",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +		.of_match_table = lm51772_of_match,
> +	},
> +	.probe = lm51772_probe,
> +	.id_table = lm51772_id

missing trailing comma

Best regards
Uwe

--5zdcowfgw4xunjqo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrY1ewACgkQj4D7WH0S
/k4kQQf/amz6cRsSwMfisVWMIoPvzfkvufe/wPOqr7qIAWWvAEtFhzMZsmkejVae
c9Q7/m+QGilqgpy6KS56ACE7J3TmBXUw5fMHjO5qhGj+8h8iMpA2RutXI1300yaQ
oyLuHPmmiz1x3lXxR+otWDhP3/3L/F9ZWR5w3cLvqByO7OW6csRVpGWAK6UfTwpk
XD1bMjsrYEgzyxgN+TL9DiF9ev/+UAWeJ/16y/dQnIbhcn0464hHA21F19xPn7v2
rFnOwgYj4rkW993Vdjn28rkprvLYa1/QQPln2ZbOlhCzWuimfccuL7xJPzm2riL8
i1ZX4Ou1mnRCuDoHqBSXeHwhtTRBlA==
=Omu0
-----END PGP SIGNATURE-----

--5zdcowfgw4xunjqo--
