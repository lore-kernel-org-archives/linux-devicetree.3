Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E8E3ACEE0
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792393410; cv=none; b=drRKSE3rgWQ3guKLI0xK7HnAULYh1TWmgTK1W+0lyVvfoy7Iwl5bGcB4IJuXGIktynjrAziFuNNDpAOkLSzcXbRCBHxpv1RMAja8rWPFgSCs5K9KmrEj2AQsR4cgo6J0T2WddCdMZwD46hZhupH5rdSfDPN0Q+cALsAKK22LqWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792393410; c=relaxed/simple;
	bh=Q+RRcDh4UKmIKJcO1riE/TsRCut6GRzew3emEAB2HSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fyNlsQyGAlZMy9q99ars+/v5crGfVUXXVawork7/MdDNOOEgrq9dpgF2Pae+0xiTmUyPBRiytPwgEfKLmaD2sjCVJTpHAblNAOzuhJUVR0rkNDsO8X0jO+4OWD3CThnCTyuaCHI29GYaXKDErCuxRGg+DKkhLxuU45ucm1iggY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Ey0EBFe3; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Ey0EBFe3"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1d484b4a9so23545005e9.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 00:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792393407; x=1792998207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q+RRcDh4UKmIKJcO1riE/TsRCut6GRzew3emEAB2HSk=;
        b=Ey0EBFe3kGy7HxJybpFxS6tZ67MeRrA+7dux5JOYXl6HnCP8ObAjlP7ArQaflxeW4j
         7foGWmM6OBgr9V+FB/KgTWgbzU8hVBEpmC8gCt5xWjf2mnb7hASs/HO4hyGRCCqXd3+B
         mXELTkr4LoqhkpvrCdvnw9z8mw5p3ulnd5bBq4NaXTT+mVTrw46q55Ct7+uSVapsfTLG
         te+WbEcT5qHoX8wnP/oEQOnfbAhNT5SKXxwkFMi/kY7BYXPByg6/ZLiyafWOTSkRP/J1
         Bs156uqHFWcBaf3mtYomlXYOM3ihv3bPvn/sdXR7kCxE67TWDaiHia5FdP88gwMlRyeX
         q4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792393407; x=1792998207;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q+RRcDh4UKmIKJcO1riE/TsRCut6GRzew3emEAB2HSk=;
        b=0yFsSJyoroV0iPNoDTYP9gGip9bRPAwvD0dpyiSEkcghtKDKRkT4nk8g3DB9rUzLbA
         Gz/LEjzXw7o7nOOuFsrOTnRYvasyBjEkpUUURbgdFR5RP0f0fPujboxgNt++tyvcmkOf
         P3ofSrKtqV99X3Q19A12fMAVE9q/VXGzpRrin0vG0yKsav0xR3tZI7U9dvmCFeBOmv6K
         4Ckq63+9RKQ+3CGcZ8FyYROrGFHVviluRXG9k0SKeYB0Qr+lKz5m0ra8EXQPCibPhWdG
         OpVT5PAubP/2OmbbClsIjOq05rtRKjq85GHyK2TroeiT+BYMxt8HbNGzC2KVvAfNqhXR
         dc0Q==
X-Forwarded-Encrypted: i=1; AKwUvBw0Dwya+2lBXD3tOszu4znfnfzPIXS9kLEZbArwHQFQvc3qmVxJ9zEZTx5KIjkLHoF4tDfjbr2SuCHK@vger.kernel.org
X-Gm-Message-State: AFq9FYLgIQUvxw2GoDMG7DxIjv6enD1RiB6/N6LbntFWbcH+n99iai/x
	e4LY8uVrIY8vJXcHum7j105IxXTT/tPVM+2hpfmN5maWdvku8eGR2qWHRg6/xhWWSb8=
X-Gm-Gg: AYBFou0vrGO1n6LaGHu4LZ88w444WaDsPtR0Sn9TqPG696j/Fetq9MOXu++NC3yc36O
	I4crPtbgFwDliuOATtrImbxMlSchGHQNemGyhtP6u9dGFjfw5TbETC1lzHM40RvDonHlI44+aVn
	loa9COIdQdR1rfu22866Xpg4esRCVBJ9caie3hTyQ9y5g+iTvfIPFwrqwlcYPlHeLe24P4KWFme
	oaWPs2On7yctjTl9VlGhFsZu1tWwqHXnBukytfsOC7uD2fKoyNDKpC2BsEM6ApKQsvZv48/XTLQ
	KKtV7zp1Y2aUDzpzd1HqMxYXSozMbUH4szLuN+yu8a7EvhUd4VuOEyclHWhLmsmqgC6Rg7ZE/RW
	x0cjBxh1pcqp5s8NPm2Wt6ChP35+0R1OcwpywCn71OBeH3TXbCwkd7s8vAq2ckx5jjiXaApNXAq
	nxEjcjSBqSNuMYwn9TNryM8yxpX98hDznUGg482XskVBbEURU4fl+ilkDrtzUO0IEV+QjdOiyhL
	GwiKsEPktymA3XOvsFOmT3ltAE8uNJEc9M6CRVvmxnMwFLOqOYubkvo9vSvYA==
X-Received: by 2002:a05:600c:1389:b0:4a1:ad27:e797 with SMTP id 5b1f17b1804b1-4a1d76074c6mr149306765e9.6.1792393406457;
        Mon, 19 Oct 2026 00:03:26 -0700 (PDT)
Received: from localhost (p200300f65f19a9041674bacf58593a35.dip0.t-ipconnect.de. [2003:f6:5f19:a904:1674:bacf:5859:3a35])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48dfd5008e7sm20882400f8f.43.2026.10.19.00.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:03:25 -0700 (PDT)
Date: Mon, 19 Oct 2026 09:03:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Stephan Costa Barros <stephanbrrs8@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mike Looijmans <mike.looijmans@topic.nl>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] iio: adc: ti-ads1299: add driver for TI ADS1299
Message-ID: <atXAQXmGEeGdJMZQ@monoceros>
References: <20261019001247.483005-1-stephanbrrs8@gmail.com>
 <20261019001247.483005-3-stephanbrrs8@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bem7tih7lw4hegfh"
Content-Disposition: inline
In-Reply-To: <20261019001247.483005-3-stephanbrrs8@gmail.com>


--bem7tih7lw4hegfh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] iio: adc: ti-ads1299: add driver for TI ADS1299
MIME-Version: 1.0

Hello,

On Sun, Oct 18, 2026 at 09:12:47PM -0300, Stephan Costa Barros wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/spi/spi.h>

<linux/spi/spi.h> provides both of_device_id and spi_device_id. So there
is no need to also include <linux/mod_devicetable.h>. The latter pulls
in a lot of useless dependencies, so there is actually some harm in
using it.

Best regards
Uwe

--bem7tih7lw4hegfh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrVwLkACgkQj4D7WH0S
/k7tFAgAuy07Qyb8M0VZ9zMcDlt26Ff3vPHTAn75HqkdKcwS114Jt42Ugs714HUS
+e6hR+YO4BtUqxXTetGlAYQBaBwW1DTE+F3Oe/NbiIiLtwRU34ZAcDV2WhpGZu8s
4rW106ThVsV+LtV7RwM+uTkdOBsjgw9N7S9cUpHzrrAJJ56Uf+vzlc3SxrJvagF8
k/5UVamCKRXMElttYBtZCmZVul2sRRpn0Wk8x79IYqk588VSXvtpolDI89jyyqhb
ApDyKPoTfcXJyCRWA6kJJBZHmKcheVedvx8GXF2zcRwRvFos3ADU6KC4iG2qzoCy
toZ5n1SBq7BVCtebyJ33TSjNnfrc1A==
=VLba
-----END PGP SIGNATURE-----

--bem7tih7lw4hegfh--
