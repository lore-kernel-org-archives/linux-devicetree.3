Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C7E47CA70
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785327822; cv=none; b=NfsEkRuZcrsWUNz+Foutyfi5dro2gtOeaFoy1rT0lv6cuixvstCmgPATg6KwvQQzQNBVNrAyu4YDRJ3Sq4OYelhwIBAmK63f9DXXRBRhBYKuL3ZhlsSre4Vbr7CMkWksI2US/Rb4NDJO6cisQtORKN1OWbSSQOtWORnqiAzkcu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785327822; c=relaxed/simple;
	bh=C9TEJDpYY6Qs9FGzGqgxmi5b/j0OLmiHaNMCg7TRK3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LGdEnjn7cZaUTH/aTHPxQBij2GMl7uP3jKOX+MlIxT6Lo0noiWAYp6baglBN//pOvxI58zFVHqNOV37S6PD2mfvcAHlOSl5egi93hFtGyVg8lgCTjOFdu/Y/rLY5MaWkGGReitPW3ejNhvFjib4sAb32aHXlKpm5k2URA3v35Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=plEDZKfH; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="plEDZKfH"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso612113f8f.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 05:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785327819; x=1785932619; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C9TEJDpYY6Qs9FGzGqgxmi5b/j0OLmiHaNMCg7TRK3M=;
        b=plEDZKfHrqfj//fm5lTI3mKXDsTCoPvpaOgo94KLU/FyoP25hHOBDYU7+gZ7Ddnx//
         SCKKT89DcpOE8DDqrIBS0kREl5YBM8rN3HJ5lV2CkGh/XCjWIPg37E0uBa/1SvjwNev8
         G2Jr4cFY8YkCgZaOJjRkQpFTJ10rOVC+dbxYEe+mVUrXxQoCbjoM0SU50/+7NHhel9Vw
         YyGmoIUw8rwuoQR/BH1kfYGqWjvtaMPBY1Xt06C8xz4+unTfLu49Ld2Qe93WwBSGz1Yv
         6eNtRHUpbk75ipAMdMx2tL1HUj7CGX6lWVdUNBJ+VAMooTUH2mjo0Nm8CjQDtX44gqoY
         M15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327819; x=1785932619;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9TEJDpYY6Qs9FGzGqgxmi5b/j0OLmiHaNMCg7TRK3M=;
        b=AubnWbqvLKjYoVl5Cn9R/6EIcR0rnpCT+HaC6KaLed1CdbH5j/MT6QHxQVebcvc4yR
         WC117DIOxyq0IgO5lYnmEQVQXkhzOIC6psi40r/Ba8DN67R8INe+Zn+lJ3TQxVQErqHk
         KEEMbFpokSqhXxfHz6eHYzkB4KfOcK+eUWQPYPDnBDHS7WI1yXa+/EHotqPc8u+oqZaT
         VyzFssyGp6Tc9FYgW+tLnA1BO7nPG83Sy4VYzIfFVhwXCurs/E8lbbS3Whn3nPePqfv/
         0JW4xiGWx/elfcO/HG/o5sAKY5W2ImKK6txNyQMIwRWza9hiwSfSHiqhuGOZ7ohMhKk7
         0Ctw==
X-Forwarded-Encrypted: i=1; AHgh+Ropi29WkLTHG2tP7MlxVzudgzGgUBW0wcmz83i2Vbh7bD4E8mA3yqbLzoSTBhT7ojpCzUubvHzObNcR@vger.kernel.org
X-Gm-Message-State: AOJu0YzaK3e+Vt1VxT7geGm0s3LDaj67L+/gy2xmrBZ0aSE22YJT8S4G
	6mS0eNko8+UxIfm6JSWPlaCMK+NqImZjfLdHTdt1xcYNceIa3FV2r3xo04/goWLyCk8=
X-Gm-Gg: AR+sD11jrOLBbmCzEg3GMVX2f21uMe7k7kZZ/i3xuTtWBZ0rcGzgwjvjyXDQjlvATJm
	YMKvqipyuSnTI4GbP46A1bxkt8D8d5P9Nat8m1KUHchHfuCydx8ML/vKK5OAlzRcUqAI3D9Qltj
	DU7mfFiIlqwY/Kvwf9IQY5vCAkKiVHmk4iHn77G09kPlIvIdygRaXPUQ2AqibM26xye4oxo/YMG
	mfLbMNmBCKdYZZ19kyoi9Mzqvo5oq5tKq0ujIITxg5imWg79W9WiOa05e5AzbkK1xyvgErllcYv
	E8kygRl4JXRf2qpfzl1WKKp3FH1X37rGgCqsyHA4rv714WWQk+gvMK7v6tGhEzq07Qx8+HwlaYp
	CDO6nmeR0gXesIO4v0hRILjqk1+0I8R1tbwo07LOw771v+qJGJfy1QXcX+1TWjOcdssHynk4tZj
	uBv4CRhRpf392feia5Jbu0b1+MCdZtV2UxHP12azZeLKI1wE8Gdrf4Bbv9LR1wUfAr2v+w0riQk
	UvfEpqK3GDcB+5Iexz+aoIfOqi+wAPFNo80Mccp4Y2PIiZupcWcYWs9BznXyQ==
X-Received: by 2002:a05:6000:26c9:b0:47f:93fc:2d24 with SMTP id ffacd0b85a97d-47fb1ecdecfmr7698897f8f.32.1785327818663;
        Wed, 29 Jul 2026 05:23:38 -0700 (PDT)
Received: from localhost (p200300f65f47db0401da7fd03a16a046.dip0.t-ipconnect.de. [2003:f6:5f47:db04:1da:7fd0:3a16:a046])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fbf0a4a00sm1380426f8f.34.2026.07.29.05.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:23:37 -0700 (PDT)
Date: Wed, 29 Jul 2026 14:23:36 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Ariana Lazar <ariana.lazar@microchip.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iio: adc: add support for PAC1711
Message-ID: <amnwpCYeuv99uQxx@monoceros>
References: <20260728-pac1711-v2-0-609bc026093c@microchip.com>
 <20260728-pac1711-v2-2-609bc026093c@microchip.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5uhykc3qqf5i5ckw"
Content-Disposition: inline
In-Reply-To: <20260728-pac1711-v2-2-609bc026093c@microchip.com>


--5uhykc3qqf5i5ckw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 2/2] iio: adc: add support for PAC1711
MIME-Version: 1.0

Hello,

On Tue, Jul 28, 2026 at 03:03:49PM +0300, Ariana Lazar wrote:
> +#include <linux/i2c.h>
> [...]
> +#include <linux/mod_devicetable.h>

<linux/i2c.h> already makes sure that of_device_id and i2c_device_id
are available and <linux/mod_devicetable.h> will go away soon.

So please drop the latter #include.

Best regards
Uwe

--5uhykc3qqf5i5ckw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpp8MUACgkQj4D7WH0S
/k6mJgf+KAbv5DnvJDiMrLYKle0wO1AjZvUzLqKWqEUVDbLO4F4TZgrud6YNe36a
IvDlJrQvkjoBSPlv02r5HmMhmm369PzNTh9czUg+8HLuW4JomalTM0VO14vw79Mz
gCX9MtlcE59mEttg4b1yHexQqZOz3wtsfScxaBC6nrF/4Qa0ZQzQN0VoM/GW3QTt
UMSnLLfuhfD78uM+yikKiU4JiVoLcmc3/PGQbIQaW4fURWftcmonTQnmnnnDXVit
XJ/KDMRnqN5MVtoXKI98albs6RBu60uXcHs8rw7ugFWmWsLgG/g3ugnf9oxV2UNL
6NMgObZQMp0ehA5lFeSjBaaJCdPBNQ==
=oLKn
-----END PGP SIGNATURE-----

--5uhykc3qqf5i5ckw--
