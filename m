Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6663D34A2
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 16:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782838329; cv=none; b=doyx76oooOtl1c+xP0pFI694DdiyvsXDYzwdM7NU6pbJPkYu2B5eEq3YyAqFbw/Ndh1g8unAXV0vly2Lzsle7PQkHvsMOF5yCV9+DTEWwXAfraqEClO/AA4miRgSd6+PBm4MWZlQKOiW8t5Fy8ewVRCg7/GoXpfxOmgrr5F2Y40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782838329; c=relaxed/simple;
	bh=p9qdUI/lUknXQnCWsii2SSCvYgUqIEJrzVQ1fSz/k8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o8m9tpnGNkDBGl2weodY/eytS0hDLTILSwrJolfUxE+mnGfD0UGfUmRcWK1AT+CKYC6/2qpS3D6F24u70mv10fW8E5DnTwyRkFZT/VUcD3p7DsZCg7+CPje3dn+xDtNzP+AMJP0hw1kM3D+bIn2srJ9X4rfBtOTzMMP5B3C873I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=H8Zthvmp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="H8Zthvmp"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so34742305e9.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782838326; x=1783443126; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1oD4crJkupbrs2P0dPAh7zAFV05yZx0M25Kw9ZEhuPw=;
        b=H8ZthvmpUdk8IFvzuo5z2hoR3O7xNKMLnJqzMWvNYxAjxJuxDGqmpNZ8y0uDdjTRp8
         jbhUI2Yn0WN0sKok8NBnuNsejY11K54kxZKbXMIukLUmb+UNu82htf5RLFgfZ7oGJGok
         gNo33X/4kZuPdD1JmcrumZOyD23RTJqLz7DQy9jMC055u9crZ3LNe+iR6/yIyptSZ/Bw
         Sn6FQa2OjCFri+dyTmqDRg8F8Tf9o4jF6swZygi6vzPBkU+uK3oBvG5Pd1fIrRyzaL4f
         t1IwJm3hG43Y4Wso3HnGarakLcmivTr79cGXDQoBzkfsmvEngT1Ty9TuFOhonheqx0Zm
         c0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782838326; x=1783443126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1oD4crJkupbrs2P0dPAh7zAFV05yZx0M25Kw9ZEhuPw=;
        b=sthdAHxERI+o4xjEgI5cLgWXXgygfPsaTKNjrGEmRUGYWsKqGbrBhfF/OJ9chHhdMV
         qGAZDDNRfWbI34lHPIeFJYCTvDk+9RWHma1cSXq472OeeVEAgr67ZfbzHknt6zYJ90yj
         Lr5g3heSQMxPQlviWZ/xxZCemg4jhlU9uCUfcZ6Ew4kFtr0daDL8qOa98Rbww8xfdcwt
         l8q/uT5U0ItZcQ/2eGdP7q7S1i028PZSDUNs+faRyOZf3CMBCaqwKWCcqe58+1pxXtEM
         2HOirBjw1lqWV1mM0FM84WXnFJbwNWcNCQfLaH94WfJLvGFHfWNkyBWIv46IeZOOM/rP
         jMZg==
X-Forwarded-Encrypted: i=1; AFNElJ9J0Dv7j0sEPFJTsjQP0FZQco7YsPrVyMQymu1oqlqNBw1HYzRczQa7s+2930fnfqY2D9pZX1O3qoJE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1jYM8WhwI5JUdgNvdQJtAt+1ATOc6w3FCTyCTncQxmJdiJR2E
	IT3RgWSvbkZ4K8eQvTjkolm6i42m86VxBki8tPAop8KMVFT22poM2QqKqOchKxNE0aX+WeaRyty
	DGERb
X-Gm-Gg: AfdE7ck4BWOlRqZAGjJx204LM9u0BY+fg3JLX/RlNEi7xXt8xF+hbaq6X97Q1lJQb0A
	UdjSv5/Q572BK8cHZuEv9W4Rycaa3S0KjEMBZdWnrXLZUoPw9K1vGkvHPqdlfC+f/voGdXNqm1d
	Kos/rl7aKpBLgdYCR4HggFP0WET66ZrbfLy37GpqQEAWhZszysdw8ijzRy9852f0/X3IghLZBj+
	IIkyTCQe6ner6dyNlw6/A8hNkPaQFw9+UUbEskdHxfa4kAjz1S/T2BuLNmzKhonHJkxhCfYLI4u
	RLU1XZynbEBOv28MJ7v2R45ayIShdKaCcX3Ayqci1N/DnHKfcDUWY8m/5SiidkAyBhuhfN+ackp
	+xTxzpBFnGRUJimK1YcwhY39r2unitqouqDdH8sFAOeagQ3Kx57SZPdagovONB9SujtEdgoO+xw
	5uuUkeKZDnhI2vcdmn9HxjsrSFki9Qgn+VGd38mFamU3cldNyh6MVdu3Ir0XS0QEIvsBkvJgh7G
	GRCCjLUnhIuNqg=
X-Received: by 2002:a05:600c:8114:b0:490:e190:3b50 with SMTP id 5b1f17b1804b1-493b8287298mr63861575e9.9.1782838326380;
        Tue, 30 Jun 2026 09:52:06 -0700 (PDT)
Received: from localhost (p200300f65f47db042a9b551def0a6b94.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2a9b:551d:ef0a:6b94])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47567884770sm9584973f8f.33.2026.06.30.09.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:52:05 -0700 (PDT)
Date: Tue, 30 Jun 2026 18:52:04 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Md Shofiqul Islam <shofiqtest@gmail.com>
Cc: linux-iio@vger.kernel.org, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] iio: health: add MAX86150 ECG and PPG biosensor
 driver
Message-ID: <akPz88UyBcppAXzx@monoceros>
References: <20260623140113.12574-1-shofiqtest@gmail.com>
 <20260623140113.12574-2-shofiqtest@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4mn3rmgxh7bhldsh"
Content-Disposition: inline
In-Reply-To: <20260623140113.12574-2-shofiqtest@gmail.com>


--4mn3rmgxh7bhldsh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 1/1] iio: health: add MAX86150 ECG and PPG biosensor
 driver
MIME-Version: 1.0

On Tue, Jun 23, 2026 at 05:01:13PM +0300, Md Shofiqul Islam wrote:
> +static const struct i2c_device_id max86150_id[] = {
> +	{ "max86150" },
> +	{ }
> +};

Please use a named initializer here, i.e.

	static const struct i2c_device_id max86150_id[] = {
		{ .name = "max86150" },
		{ }
	};

See
https://lore.kernel.org/lkml/20260515103150.164887-2-u.kleine-koenig@baylibre.com/
for the rationale.

Best regards
Uwe

--4mn3rmgxh7bhldsh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpD9DEACgkQj4D7WH0S
/k50agf5AXgF95nsug1XdkRpr7QReE2M4gY+aXGupfL9FLijTJVIMlEUEgahumfb
7KGqJ/jcH3nJyBLFUTamSRkYMyh+pxSi1lD96xGSDkhfme5DAgPJvHH4DXr6WjKU
v4ksv6Zg2WVsgi396pzoCUKQjNTV5M2g6GbJ6nuOUz6iRUKQsvwYgYS0RSNSGSKt
n9Oeg8KaI259VVuHY1wMQjGmVjCAnqqyeBj9RhehWZhdUVys8sqBjoIpZmM687lB
+ZiXBfzC/EhaKF4gBn3zbDjB1hllwHAsgLpVWn2DUkytgb3BFVXYE08mDYFcDFux
zu3Ld2CN/7hyhfHrdXkFaBUBC7zcuQ==
=IDGH
-----END PGP SIGNATURE-----

--4mn3rmgxh7bhldsh--
