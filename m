Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606703;
	b=J1FX9TMg6QpC8rLbCC9tsqpyrYWnVTa3X8i4Y+6cpph/fJFTS3mWs6QBCZiyxtOQG9ks
	 pZsRy3NoEcf1RQDoVIsrfMNKGEHn8fyAUrWxLK6f2xeTbz3kdkUOkwfHG/a6bQa4RXIOu
	 iDegmrxdf0MzFLizVB0R0UqNxJ9EmenAmLPdWe3WzOxsN+heACF5ZYE1CA6zgjaNeIXqx
	 5sMly14hSAAjwx/PuJySBMpV3h9i0n1OVC5jPiRG/Wm5mhTWLkNCHh6TudITdapwJJmig
	 Z8XN/sfjdRq/P3bCjn7h3DnmADJBJvSdUWVRh501NSH4gjKVIXjzE/bl3redeEoiE0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606703;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=s2BIBd5zd4VkMYRFZWl5QkRuLP5x9yc/zhRV4K5hm78=;
	b=j93WF2VCIrkjlvQ6hLJ0xi8ZT5av57YnwmC5FoBK2vMoGEWvGsa4+LSaikmZj1MHNXE1
	 j5JZY/KQ0CYguq9nW70qWNwcds4/0izHwneddQb0fimbqe+mddLj7mmaILFLFQfqCJzOE
	 foXVlvRdRXyLnsbUy+8LUXH8WtOTHDkDR5AqcdiZHQxLMXvEQz8YWwyJqhioL+QMCAWPq
	 M40Jqg5biaPnPJPAiWR47BUXs5PqXObfgSRQYVGKI/lffuxvLa73iuL/h4F4GoNeZ1Ktp
	 gu5JibglrP53r2u1UQEtihySwNbvJPqztZAPLKPy+Pur82RN3pfYtr22/g3XFJoZb8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KSxpaI54;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A29B606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A29B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KSxpaI54
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so50335745e9.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795606700; x=1796211500; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s2BIBd5zd4VkMYRFZWl5QkRuLP5x9yc/zhRV4K5hm78=;
        b=KSxpaI54cIcKWf5gI0gybRkbKbqSsHskJJaBtu8FGJyA041yqykOD7fQ7w3lxItY7U
         U6CzI1hyJ6Cd0TwEeIMuK2GqFa7ZGy6jeJYyriiT9Pm1rEEm9+AD0ZzBiYOLhYoxJ+dd
         hKnF2s1f+5La/ykPimDFzAdMVZ6pZWXxNM7ay5wXp7vTEJZsy3bWMvF40GmEyWrpCWly
         geI2oIjjuq6B1hzzAHee75BiFkBTh21rh6ALomuOeq4UHC59IrsGSuy/ihOHZw2OWVEN
         NN7m6KUEML1LnrZHyGTzVkBPtKTkPsyBhX+8XMjy6wD2emnylX0cmeoEtgnBbjNh69G6
         MNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606700; x=1796211500;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s2BIBd5zd4VkMYRFZWl5QkRuLP5x9yc/zhRV4K5hm78=;
        b=g3MoEaSJgwMzkJaaDaBNtkmv75l2IAYxTKuZ0tEgM3xMGhFYR/8/h75lVoZfnlLDuT
         zjXRaXZvSzh+bkQi/yzqXrNORZqTFNADk6qj+cAyW883lZq+WODGo9NNwv2ff+0zd/1H
         VTRD83zwj7rnodJ27f5deB2r2zEwLOxZfnNgtHhcGnKWREuBWGPZELmAbSjPxnpLUUjr
         55pqAz9IKF/7JsI5I9WSVHQbxy7eUqp/p+r/60movOmI1zM5LvpHiv0dLA1CtQjJ+m+V
         cl9khjfIwQWow2VUNFnjXhIuwslteLjduJAz5XjKsJqfAoilTgNgBd9LTvbqDKSqHcZC
         XKnQ==
X-Forwarded-Encrypted: i=1; AL+hErGJ21e+Xcf/KbC5ABL6aYAwf21fQBJuLgIMg/ySZAPhadUw2wjAF9AHhEiGnlf1zCWWT7fPifZi0uUH@vger.kernel.org
X-Gm-Message-State: APuU4Z/yk3SozMHw2lJgXhC89+iacZQGGU63ti/Tf/YbnB0Di3Qoj8oE
	GhPUk6QrWAEawUs2MdSeD/WnF/R/iYq9yyQW6rwbkJfv9sMFut854VcDAuUg4+SJg5HNxew61x3
	4wQFz
X-Gm-Gg: AZFdTZd2t3rmiuIw1uqBa9b5L7CJBBgo40VecsGi/MFaOrOuUYS9PmPf/UgcGl4mbs+
	M6FwRuH2i4YgX9Ea8BbtQ0kQNl1/e6Oc/7iXCTaY0CBEQLk/6mo7Sg3R42L8IxvuKGCukm1DZE6
	DsVMWYWB+h4RlYKhHlZwxzFxFV7A3SfiFxTThW8e7nxgr8w8ZFcq/T2Twj93dldE+lo30voBL83
	RKXls9O5unQfk+5nLkhJywiHPKJMxgowUNYpBnVr8ocw7N78Zs5GoxSniDFO0+D1gxoHxVg0cOi
	hnXpUdAydVfaGRD2vxFtrF2rPrHbXJWeyVi+McA4JyLkupAxioLKrBVEPVWUgrGyBZ8mQUL0hai
	ijl0pCyVNAJu3udZp0RwAmYb/juNxyhpW0kKwdh8k3VDyQE58PtuMDhVputkObHRxJkUhMxZvbE
	SX6J4209NyugQ50EL6p1GqSWwYP12Hq7WuvfskqroDwPcrH/0oOwuJpflvIXDNWxLAT/joluPly
	NaoqlRRbADhLg/tGNS+XHfO/3DFZMuL6BMBb3BhD+eAz/6kuDRqE6cXWAuujym5xte6DUdnjRvx
	yCVXX4iwCq+mwxRUvMmh/IbaS7X0YnNNg3/YQfiWNqfZ9/IwD8Q7RRZdDsrXhuZuKrz09+eZDHd
	EDX51NNkuefSxNaClgRM9W2I=
X-Received: by 2002:a05:600c:1911:b0:4ba:38a9:85e3 with SMTP id 5b1f17b1804b1-4bb8880eecbmr389740405e9.12.1795606700561;
        Wed, 25 Nov 2026 03:38:20 -0800 (PST)
Received: from localhost (p200300f65f19a9043ef7230869dfba63.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3ef7:2308:69df:ba63])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb9067846esm334115195e9.4.2026.11.25.03.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:38:19 -0800 (PST)
Date: Wed, 25 Nov 2026 12:38:18 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: armandas.kvietkus@proton.me
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] power: supply: Add Maxim DS28E16 battery cycle
 counter driver
Message-ID: <awbIT7KY-jYiaTBe@monoceros>
References: <20261124-ds28e16-v1-0-bed431df0578@proton.me>
 <20261124-ds28e16-v1-2-bed431df0578@proton.me>
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
	protocol="application/pgp-signature"; boundary="jjrec77j6abl6thu"
Content-Disposition: inline
In-Reply-To: <20261124-ds28e16-v1-2-bed431df0578@proton.me>


--jjrec77j6abl6thu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] power: supply: Add Maxim DS28E16 battery cycle
 counter driver
MIME-Version: 1.0

Hello,

On Tue, Nov 24, 2026 at 06:43:21PM +0100, Armandas Kvietkus via B4 Relay wrote:
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h> as this file will go away
soon. With <linux/platform_device.h> already providing of_device_id
<linux/mod_devicetable.h> can just be dropped.

Best regards
Uwe

--jjrec77j6abl6thu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsGyKYACgkQj4D7WH0S
/k5AewgArBYfMFatnNpL8Psvv6tkIFRXFQrumMJZWzm4TrNGgZ0ChTINBtd3d+lq
eqw4N7FpU0I0B4hHymNl941aCVGDe2ChNrN2Vj57ZJ6kNh+XTomH5r+t9wGiYKNi
MZN+bNJdFCE+TSaeTTfkFzCmC0V6A/49lGho05mZSMOZaS8uOaLgvFQ5nE+eExZZ
o7Ynyh+REbs0ZriffD7bKmsvAuvRwXualNrIxDqg7/b3sEvknF4q6ibG59zVnv91
UGWjbKo1NNDayvISHATU2tiZdXL/ABRCIUPz5YxQA2uULskx/y6b67213Mv/B+QI
F+Z+tiGP82oeKZyu4hdSbd3Fk1APsw==
=Up78
-----END PGP SIGNATURE-----

--jjrec77j6abl6thu--
