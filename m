Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3073546C0
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 15:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955620; cv=none; b=f5akxdZYmpNumTxBwwQGGY6LX4CJ1+w22gk5AupleXOmtp0OXV8tiWMbUmGP3kaBMo//M3DO6yG92wA8xUjMicbQEoSTlcwFOtKxquVykfOzG0+Yrc2Gab4WGWYf/qMbQJtK0q4VSE5KbgwyVfN5GtwmRne79BEBugPqIHrIPr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955620; c=relaxed/simple;
	bh=NqBUMuN62l5N2Nf1UtzR+VlT4Ju3NnVcgiOFc6mKLQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQwUSkixtU3kSl6jc/1eU+bYlpKgcqHiNMebBxUpwomtywKpZzXRoD38CAfelsXTrCuw68VZeGsQmTNfFBS4jKcJ/C9vSTKEsh1QrhtCsY0h2nTiMBT13nGwQdEmG70If3k134wUnFoeF04LvORnfjwWbu3zpX2Ypy73xLLXdfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XvdxBJZi; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XvdxBJZi"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493f431e317so440625e9.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783955617; x=1784560417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NqBUMuN62l5N2Nf1UtzR+VlT4Ju3NnVcgiOFc6mKLQ4=;
        b=XvdxBJZiGOn9DYNXobKCx2I1xUNkxnaPpPOJPhtY4NqsnJRHQ1TtSipMtIIkQlU4cD
         p3XjlgqHYDCEWs8aiAhMK+JuUsM1WjMnCuoysmDv/dbC+FmcwuarSChgOlOBxU60c4qL
         81TyXSGmXG/bk9SB3pgwyjlad7iS/ZYCnjseZyM+n265+vDedRHuv5erkE55uYYyib3e
         defNPDl2ho8eSknuLipDb4Je/LjWaGox0e3S8GqfypSw8SkPM5IgwYut7WontUfK1HZK
         R+Hc6q2fkNDkhRA6Ae7A18nOvSkGbmNOzhDkf2+j1/P7GMdxYwvn95jk0w+s+xCGTraw
         /Cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955617; x=1784560417;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqBUMuN62l5N2Nf1UtzR+VlT4Ju3NnVcgiOFc6mKLQ4=;
        b=YI31Vm7jQRXfo98ZNdYw0BN8Sl5rquObfay7/sc9hmyGmryHaCT9XX3L5L6LSJWpsC
         cJsQLt5A30AOIvdshxE45MeZl3EXdfrMezPwRbmdSP2bmOBzqVz28CrFb3vRv+NNsieV
         G3k0V7VurQGIyhO5c12lceP8buxoVw6PA8zvrIqWOMSQuY/Tg4rBq+NrL2bE1ABcW3+z
         dgTA8SQnkB/OeLpYANf5R+uBUQ+wlWmCqZJ5fd/osPBuN4aTLEMmKqviw0K6eBCK76cO
         Le/2oOlk5oHcjgPgZkuUToehg/K0HThaIGhyDSLse1R3Stwwemr8Im9+awoTJdHK4q6x
         NdSA==
X-Forwarded-Encrypted: i=1; AHgh+RoTJfexzufNZFfBol390n0IFuABlM1N/bBbz4bJZU8E69z8Iv406cts8+eVuoTTi6NoznlR3OaSNgLQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbnfa9FMsJYJ7h6Oe4VyqMLhrkQz8neYKMmgr6f9JknQemb960
	9Xy2U/M+tedLPWUDeVWTZXlP5KZ617YaedwROewbWp6nXrEaqT4n4MY18ps0MFXcS3s=
X-Gm-Gg: AfdE7ckA8vjH64WZW8RAYskDP0Ky5eAsSsd5XPQ6VVlMROt14HyL2LibT0aray2Tq5I
	0+mFD+FBCHA/RhpcQXv9LyfbjuhaNOtP6bohT/HrpDW9t6kBvIVMEWoppBHp0FvaXlRfvvGnD6i
	LmVuWWKj+SkmhvFrikzd2rx6nvf1oKi5nE+Pc4IIBYQFKViIkAEHQLuNYhNt8byrgtBhK32g0MF
	FnkDOT8IqwWRgsSrocnj03+VjMWfqHRy0/04PeX0ZJ1QXx7GJ5UtNLYsUWQyvbKzh+U8NspYQOm
	GA61EH6XnCIQt6V6KcfFlUHRkJx5F+s73gpiJ+2E03ww9J9gyP675Cwo68hw16LoosO0GCMHSJH
	Vr/etWowNeMVPLeH2k597Cyj8Y3qUUPktbZez+g+WUZvA54z+Fv3LVgkrh5uwgwKiLr9YT9LdRP
	RmnrBMhlPI/rPfpqWqFq0pu/9FWkRevC3mgiclWJ/zjXfvGCFWsMuXTe3vu34rm/MLZ4KK3h2Us
	YUMVO0wV5PN1p8=
X-Received: by 2002:a05:600c:310f:b0:493:d115:d835 with SMTP id 5b1f17b1804b1-493f87d5800mr97585625e9.8.1783955617181;
        Mon, 13 Jul 2026 08:13:37 -0700 (PDT)
Received: from localhost (p200300f65f47db04916e789240f263e3.dip0.t-ipconnect.de. [2003:f6:5f47:db04:916e:7892:40f2:63e3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4950a32c65asm1588755e9.14.2026.07.13.08.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:13:36 -0700 (PDT)
Date: Mon, 13 Jul 2026 17:13:35 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Rosin <peda@axentia.se>, kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	David Jander <david@protonic.nl>
Subject: Re: [PATCH v15 5/6] hwmon: add NXP MC33978/MC34978 driver
Message-ID: <alT_Scg-gKCvnx-M@monoceros>
References: <20260710101358.2606941-1-o.rempel@pengutronix.de>
 <20260710101358.2606941-6-o.rempel@pengutronix.de>
 <alQS61NF-jIPf9c3@monoceros>
 <6fa34460-7753-42cc-b88c-4e5aa58a8e90@roeck-us.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fnnztlncnaaigsvj"
Content-Disposition: inline
In-Reply-To: <6fa34460-7753-42cc-b88c-4e5aa58a8e90@roeck-us.net>


--fnnztlncnaaigsvj
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v15 5/6] hwmon: add NXP MC33978/MC34978 driver
MIME-Version: 1.0

Hello Guenter,

On Mon, Jul 13, 2026 at 06:20:48AM -0700, Guenter Roeck wrote:
> On 7/12/26 15:20, Uwe Kleine-K=F6nig wrote:
> > Hallo again,
> >=20
> > On Fri, Jul 10, 2026 at 12:13:54PM +0200, Oleksij Rempel wrote:
> > > +#include <linux/mod_devicetable.h>
> >=20
> > As for patch 6/6: Please use the <linux/device-id/*.h> you actually need
> > only instead of this catch-all header that I want to get rid of.
> >=20
>=20
> This was only introduced in v7.2-rc2. Not all contributor branches
> (including my hwmon-next branch, which is based off v7.2-rc1)
> are synchronized to that release candidate.

In most cases device drivers don't need to #include
<linux/mod_devicetable.h> explicitly. In this case the driver uses
platform_device_id, and its definition is provided by
<linux/platform_device.h>, so the #include can just be dropped without
needing to be based on -rc2.

Best regards
Uwe

--fnnztlncnaaigsvj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpVAJwACgkQj4D7WH0S
/k6XiwgAgXFXSkiO5tdspT8X0L+4tJrphihgjuzS1A2yZJ9tMyfIvhcg/eiXPZSL
DWoqAABbSTdxTvxvOW6IIptwPVfkVSRE6pw38mmzCOa6Uqa9ClQiPwM8kJl5A7GQ
aVxOaEKxIaq5SUS2mzzZ1G57e6DDCK3T9kEAydlf5d5D2gSjfm35CmyFElLfLwsH
SsvdxTDjsnmfHke5OKhgFXgyTUDJ756s7YmmOH/9RByitjtSPEgcZjoz9SrXqWfF
Wg1G9bzYGoY3SO38PsRu3hwGtkBSxrSkSuReMIHTdgm9cQiNHdq7VjBvKztmsz0u
o5cEjK8RfXLOMD4EaqpaVl5hJvDTXg==
=ac6S
-----END PGP SIGNATURE-----

--fnnztlncnaaigsvj--
