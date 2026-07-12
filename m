Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D3323393F
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 22:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783895017; cv=none; b=Nn1QVifNDza5AjqFxZVliGBo1ONd9C2HwSTsJBZb6zSBRG4esRkgdmBefFyjkxiYueWXohrIVcaLIq0VucfVWe+OAkB9xgjusmDPnIlEZri3AQYN+1ogQay8eL17yIzyC8b608PLvyOOHJawc4oGKr/WX9raqweGatU8vfVoHwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783895017; c=relaxed/simple;
	bh=TlYSe0jy49bn1otfuXKX68FXcwXXpoWANHvk8CZNBHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9QSFaS6om9uKyPq3vYYBriN3MaOHb6mMiqDoq5oGsvTtr52PVWXYYwfQw5bpj6GSwLKAL5eX8Hf+W8RekM+mOM69PsJYxxPF7VjGpTv8o8mWP12U/YuPd6mDEtQLkDSJSjI4bi5h9j93SjNJk+W7NKrlYKifnWs9JDuOPNwreI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=i5q0yZT7; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="i5q0yZT7"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso1350884f8f.1
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 15:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783895014; x=1784499814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TlYSe0jy49bn1otfuXKX68FXcwXXpoWANHvk8CZNBHc=;
        b=i5q0yZT72548ygGZiAviXfDhiKPYP5ijrRVxG5Ff5fKKZWts0VxX3gRdur8nlwKqKi
         QXFl+DEIoydxV+0ltWKNUr7DL8bv30oIthPl8tCCikVVtzc1CryA4w4Tk/P/pEg6KtNU
         mJ2AzwWwGaXDKsB/3ds64b+O+lUD7kQF/JVNOjTu+hBJfb87pH9n4gLKmfNjfeEFK4v6
         wb5P18Gq4zyJD/jBLu2Mnujfv/p6YkUWiEBvLqBlOzovfPnm6KwuOrPIhL6UEqrPhAbg
         YFbEZhhljIO0sJen9YYmi7RnenIgogeI5W5Qn8SOeaLX5lc71rsbVFwcXjgSonSbNHgP
         fxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783895014; x=1784499814;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TlYSe0jy49bn1otfuXKX68FXcwXXpoWANHvk8CZNBHc=;
        b=pj2DbUlAE2cdSyyuybcVyJ4LssbZl/rGOOlP6glpFwWkGbh2YyPplNuH0ToBT/uO2p
         q3SuMCSfSp8P7oxmCVqxJSlt5Gmy1qG26Ug1JN5DLIs/eUvQz9MjO7f+JLQrpF9CpgED
         OXnNBJwuypAiVFZbBf44G0fmTcEK9RdgxGo7mZss2oqq1e+fbFkjO6BFW6ojgujnj5Wo
         LkyZSeg5DmKGUMB9/BX7LNb33BQ+xyYM7t+3cr7P1yzYndbhN2A/j8OFr3vB1KbLVxvp
         0RmI4XyEVyTxKf0geJuddMJIBidqMdUvHQJ+C52QjrBBjNgwOPY1DWZ7JUWk/ndBSLEh
         +JSw==
X-Forwarded-Encrypted: i=1; AHgh+RpU8ZL3CUSAIfopvmWwQb0dfTEOWcU/ALoWJvo8xB6SaJm5R/2SU95eL5h21+CW57rUzvaYaN54dbZ5@vger.kernel.org
X-Gm-Message-State: AOJu0YxPEtbVn+5CVTTcgly8DFzc0tRqnzqu/gRNfLcW+mshhDZAT2lu
	6/nwvW7iuV5pG20qP1dPICT3rloQQNUOCnGKtuDLgX7lgjCq18HlU7M4roeD1p0UqXo=
X-Gm-Gg: AfdE7cmDRxlEq/x5y6gTnMjip/PHMTLHkXhv/Yp4bq7HaDvs4l9qb3kc6yPoDby0FSD
	upNTI5eFinWQvFCEvZcOZCKV5hsDqqVnG7S0zNjkgOml91+knLVWutL+2SgL32c8DfbMU2wkRJc
	+qCcXod25NRHJcslRSbBMdhsIbVxPrtXZHl9RD0q3wQB/1kSOWekdWLQtR3fB21lh+A87gqrDH+
	MRRLciql3486JIa5dPLnsufOrgur2fE9pHfupDcOt17UPmY4P+UsEqgHB11WnY8hT3LCundNY2C
	FewijN87VEIW5yzJjief/Mc1nRzc8ei6XBUSUVAw4JzkEgXqls/43iBhsZhTfI1Zz88En2BRsut
	ptjQlNdkIKcDsz+2VuOMXHXlFtTWD28CJ+/AluE1Sxh8NE2DaQSrPQL8xmV4Y8xmchvhwVIrOF0
	zZ1+RfQICOndlsHgWYgA==
X-Received: by 2002:a05:6000:1841:b0:46e:230f:d095 with SMTP id ffacd0b85a97d-47f2dca8281mr8226010f8f.7.1783895014327;
        Sun, 12 Jul 2026 15:23:34 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa039ae44sm76389862f8f.23.2026.07.12.15.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 15:23:33 -0700 (PDT)
Date: Mon, 13 Jul 2026 00:23:32 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lukas Metz <lukas.metz@gmx.net>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iio: dac: dac8163: Add driver for DAC8163
Message-ID: <alQT0Lt6ZJ1xhUf5@monoceros>
References: <20260708-dac8163-work-v2-0-3acd1bf20182@gmx.net>
 <20260708-dac8163-work-v2-2-3acd1bf20182@gmx.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5yttxzejrfhhipfe"
Content-Disposition: inline
In-Reply-To: <20260708-dac8163-work-v2-2-3acd1bf20182@gmx.net>


--5yttxzejrfhhipfe
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 2/2] iio: dac: dac8163: Add driver for DAC8163
MIME-Version: 1.0

On Wed, Jul 08, 2026 at 11:52:44AM +0200, Lukas Metz wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users for this header file. Only use those
<linux/device-id/*.h> that you actually need (if any).

Thanks
Uwe

--5yttxzejrfhhipfe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpUE+IACgkQj4D7WH0S
/k7rVggAncTlgqbrd81//WeDfgi4RvfqynpYPjXAsNzS5gsj4cvUpj1uu4AdvrT0
WmLGmkIvIZ4O7CG53voaaGGZdCycSgptADOIdgw7p+73sC6o8HZy52DX8wNgdZxF
tV1WsekBDc9zyPYIzFaB4VPRcxXfUFj1SKoKILNqCaUXqbQxi0vrm41SlLkVYK9i
0Y3F6NVUiMu1+3C9zC5cjz/lkYWdMf6uB60kbdZ7KQJ8mL093f0Oo8PeyU5oaAvY
KppvbqdEuQTNOVHRkXgGuHaKuJArimze9219anRzsFzY0/dVBvJSHmVbyt06jJIK
7hxhCnEBOKbJjMZxjXulgu7IMzsdIg==
=NVyv
-----END PGP SIGNATURE-----

--5yttxzejrfhhipfe--
