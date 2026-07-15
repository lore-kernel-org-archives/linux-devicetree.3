Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C4E3CF054
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 22:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784154150; cv=none; b=OQ5olyiIiC3WP1vf936vT1vNaZp0tN6d80JYQauzrK5tSXwoVJa8LcWNtpRum4K3GXiFnlCXEQJr3GsQ8m7jA4juQOrMT91WxvHNxC7RRFzWiBmxH4ByU5NpeBm69FIuw6TzeNFCOTYAicVz5DnsQy3HymtZOtVJJX8Bn+WhEMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784154150; c=relaxed/simple;
	bh=eGItwZhXhjcCNzydKc7M4IOfg6/7bc3EJbzam0oesV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKaoeA/cMZ/QcaBRK+0Fhe/IDZdmcN02EnqcEb52y+idEj1X7BmBDFKH9dizhGmBpl9niADbAWIJPF3sDJCTYe4L339wEo+QaLJ1oovs/OMwgDKmJ7GPJXwrTWZ/PiJgNR9KnUm2w93pGI7l6B87i5vfQ1R6OH3DLkY9u6XNCjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=eqTEQ29N; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="eqTEQ29N"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493ec555a26so38654065e9.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 15:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784154147; x=1784758947; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eGItwZhXhjcCNzydKc7M4IOfg6/7bc3EJbzam0oesV0=;
        b=eqTEQ29N1NF52BAPZ+DLQLG5hsZXPjuOb0wfMKF+jdxQ6VNb3Unu/Q6mTNoxui9M06
         M2urGLHhoJbVZ5fbkUMJtHEeYZqhBYcbNpigtyq7S6IcgmK1XICl9JnQVOOENvsasVaQ
         jrmoaYtASVJsaw25WKzG96LmzoFedYYTovj+4A+QWW7hqT7ZgU/sgKrdDxk1JrvvcJxa
         zCIAXuUIt9IYgCguLXXJJYV9/uqNdTTfCjdKdaXf1kFjINftyiMaTsTb/hxyHMf8OSsw
         UBA3EKnpr5Y0rCFuLL38xBN2C8odMWzxs54kpMEzXAi0rgoeOYI0j5cGvu3nrjbY/fu9
         vD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784154147; x=1784758947;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGItwZhXhjcCNzydKc7M4IOfg6/7bc3EJbzam0oesV0=;
        b=WM3mUG/brAo0NxYCV4zs65NP9eOk7ZEa8ojA/aeOYrd4ygwPwb/QrfJK9WF9FAClw1
         wsR/ltqOgvRUaTMM/SvuveKcP4xshm/IwF4t327xv5IV+lZoaUjLxNmPFa7PT0Dx1YZ7
         BCrsFTyKXDd+gHvfpj+bHpQsyfGvdRl7zOsz0qx3Wp4e4jBZBUpvC1oDYK5G3JeFOa2P
         2qzemw/meiLUtOUpTQo72/dexnN7HOF+JZTE/R/XrrvOMjRKA/e0IN//xiGwYxD+sn/t
         kdQTT0va8HKhl17B8zIxkELear+gibAky+G1KeGMl2ZLLNTUEs3PPWPGoCRAC/0XKeAS
         D72g==
X-Forwarded-Encrypted: i=1; AHgh+RqR6lR8WmVWpHvc7fU7nV3ICGUhl8t/br7oTfyXfsa4B8EKSFKMciFO78rL43HcklVvJGLlvaIxmLOz@vger.kernel.org
X-Gm-Message-State: AOJu0YyhQ12bEDOJ5ZuqDoVKC4Nl88Oyu5+XKHtuKSpxQk+luDocRzXy
	tQCaQTH93J89JkMYA/EEbhf34UiFPOvnei+TFaZtJnoU/G6jb4nrsnbymPyWgaj1e/E=
X-Gm-Gg: AfdE7cmbnrKAxJ1WWK503WpUqc5MGmdNzbto62q6bNZKqffX10NRPMId/yAP1a/zndK
	zKo1jKKLmf5y7xYdTKL2OBli/V0ipzs6CVvs1kvVjxVvjvtPVMLT4MIK2kcBaY1hPE1QOWfnggg
	SyhLlPLTzCjuDvitQ98yZE95ztaQ/vjfO3XVnazKo7YVQT2viVVkNWpE9TgNJhaRf02764omilT
	wCOY/tjoe8rZ3jBp/GOHLjR2LRqvno1a/APlCDGX8y96Uz/IOtSZ93a1kNUaP/nN0CaChfgPCRA
	De9nCHpiyLFPPg5lHaOUX0FnCGp8oAUe6LlU88AdOakARqclqfha1lvk/Zq+0TKIeb2i9rx5n2E
	lWGTpVvTS38McIJB07Km79UehF0jRguRbRVMqShhGJFAi6hPjKF1QpBo4hoLlVgIWLyZT/LjzMs
	SoHI3xU+E=
X-Received: by 2002:a05:600c:58d6:b0:493:f262:b8 with SMTP id 5b1f17b1804b1-4953c147474mr41635105e9.1.1784154146840;
        Wed, 15 Jul 2026 15:22:26 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4953c59b810sm88924315e9.0.2026.07.15.15.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 15:22:26 -0700 (PDT)
Date: Thu, 16 Jul 2026 00:22:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, 
	Marius Cristea <marius.cristea@microchip.com>, Marcus Folkesson <marcus.folkesson@gmail.com>, 
	Kent Gustavsson <kent@minoris.se>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Janani Sunil <jan.sun97@gmail.com>, 
	linux-spi@vger.kernel.org, Kent Gustavsson <nedo80@gmail.com>
Subject: Re: [PATCH v6 5/5] iio: dac: Add AD5529R DAC driver support
Message-ID: <algHt_w841FltSnL@monoceros>
References: <20260715-ad5529r-driver-v6-0-cfdf8b9f5ee3@analog.com>
 <20260715-ad5529r-driver-v6-5-cfdf8b9f5ee3@analog.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z552sxv3apml2j3g"
Content-Disposition: inline
In-Reply-To: <20260715-ad5529r-driver-v6-5-cfdf8b9f5ee3@analog.com>


--z552sxv3apml2j3g
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v6 5/5] iio: dac: Add AD5529R DAC driver support
MIME-Version: 1.0

Hello,

On Wed, Jul 15, 2026 at 01:41:08PM +0200, Janani Sunil wrote:
> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/dev_printk.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/iio/iio.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
> +#include <linux/spi/spi.h>
> +#include <linux/types.h>
> +#include <linux/units.h>

Please don't add new usages of <linux/mod_devicetable.h>, both
of_device_id and spi_device_id are provided by <linux/spi/spi.h>, so the
#include for <linux/mod_devicetable.h> can just be dropped.

Best regards
Uwe

--z552sxv3apml2j3g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpYCB4ACgkQj4D7WH0S
/k61Bwf/XWRg8XAN3lHoIJhsnA8+g3296Hm+E93+U777lyf9jyFKLx7iYqDKHWA9
kU2LMnREIemDelxgrlmVQ04lxzLBNI4KzBLvD3fyJHVaq/vL+TMQSTyfV1kb+g4t
w0HZrHT+ETT7mkD8rUtLLXsOyg2cBqauEU+s4Zte8QWbZliDqQ+dVrn+/yugVccG
F8Cv0+sAEkOhY+7Rp6BJTfsMJWgw8FnCDBWL7tB7OPsiUc0WIrKMq4x6Hpo/x1Jt
FH3wCIlAxKaE3x1GqiGec5q3WKFej3wvlwRiBZf+yKkobCQkFE8Wc79+SWFm6kDg
R06LdtSuCgAuTVHAXqMvde5Pysc4zw==
=f3f3
-----END PGP SIGNATURE-----

--z552sxv3apml2j3g--
