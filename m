Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A59948CD7E
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791809158; cv=none; b=JSOfVMocW4mfMnPNzzXlgiZbkO1WdPy4zMk1AZ9MsGg1rgYYHMKj71m9s7fL8lTzhjaQeR/WDeKXo/gD5865QJzEHlOcqp+Yj3ztkLnGZ3Znp0w8pgU5UVkTiuPIeMAPZwvuwN+h6TGfEGrF+n4XlueQXcWFGZCPrnYKkHwW4aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791809158; c=relaxed/simple;
	bh=NbJ9L28kJ9mjXoB/PIvLtPzBb8AeWfedbTzsf0nW3+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZhVIbz0VcowJZ3Zqy00MiwRdDiauIx9BN0OZgLvOy5oteMU7yJ96Br9mn+rGqB5IRBT/7luN6UhKeniGqn3U1BFLZi36uPsl7yht8I8zlcb458P8XHW76i6Mc+IwfFMACR5IzczZTVCDkeY0B6nlXRqcofdIV1bLBlFyvmsE9Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BAP1RS58; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BAP1RS58"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so17302345e9.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 05:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791809154; x=1792413954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c+9ooOxds5wG2R5eVlPySU47R2RJzaza0U+MtqZs7Bk=;
        b=BAP1RS58JAz3g4nCg+E4ivbqBpNNxfd8C1Z4kZ4pOnD08u7AuqUg0KaE7CQX3KPIBE
         wbX8/PCuSU3B61G7Jvc+BdBbBicwuF5+VF/4VwikHjQBrIGyqEL/X+8gzAkzSDsfijTa
         3VMA+xm37yzEY7rJ9gEgcRP544Y4Q8ddevW6r+jxvWel0em1knJ9z7M6PyKG7GJHey1A
         KOpTbayf1Pi41gupaxZGzOLI0Vy7DF/eYDB3YgNEwhsFqZNb7EI0t3h46l7qQxebQdOl
         N/XLAb6yEvwASe331Y0XbTVKReoIt4tRWKnmzDl8moB7p0FtC874Q487gEsEIkszAdvx
         NNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791809154; x=1792413954;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+9ooOxds5wG2R5eVlPySU47R2RJzaza0U+MtqZs7Bk=;
        b=btFcePhGCi20YvYf/aoJJGdGbgYP/VAheMYDG/6nir/BVFyZIrEOOpc5upz6EWWlGW
         boXbty1lK7XjSnzBWuxlukLhCGMnzHRe2VE27x2JLlYaMW6SNfC6qUHwWljF4NTZJaN5
         klASCgUYBEHxfY4zUZVusWg+jRoVUP/4GvDrA0gq1TudvG8/DhyNQ+JHxTB1OTvA1oep
         i3RGVXHGiSXnwGLNEmROgL837M12jhOvgtcIMkwRLptfCBDnv5jrnjdo0V6P1QAAtKNP
         E/UaItyjc2V5WNXO9iKhYNy5bZ6/OxzbKcMrASGlskwR6+rtNfFL5DcXKuROwEZwtENO
         BI/A==
X-Forwarded-Encrypted: i=1; AKwUvByBaF1agcAe3thhRuAup46vu+A6RX/UtS+7ov16pK6zUl1XGe7ktswfpxQuywtzcFuchBTS/U2UpZVe@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1EUiqpWVZxew6KcLbyra8JTQcReW2zi43hYf9KnqdeLRj2i82
	70gSNjhEWQI8tn1EJPKeBdvshHHkqz90QGPjurlDUEdDRvJHLSEVyK+ikW1EhGxC64Q=
X-Gm-Gg: AYBFou0uc88EXK5eFJOFGVXC4FyOR4/nw9deLJceo+x/RddGn0+QtZLm1wShxW6+Y2i
	ivaKpyXi5Ad3imM6aoCUjPzqwMkhM77nFI/D/e0sFVF8iyiIiDwJFiYsRvkwzsWTZq4QZe28IXj
	XcBWbp3cklC7tt7LRdkzqpVk2O2WoNE1OjrGL0z3Uwq0g72JSrJT8PQeJnVzNy21EWxw2Tqxj8C
	ETBI6NxIuxqR45ugB/g0FXZOlt1Khas35qwWJvPakLpKtJdmTSX3GmZkLJXQzF4pm0myCVsANHf
	GchQf0XT/HTzcF1Skxbcb9bZ2BqtxPnmJI97w0V9SWjuD1pbZzsfgSkZjIQTAOR5N2uDuXyPgNV
	dHggUacXzd73CQeXmMldsGypWS16fMlWKbR70QyUooLMe/baxWkuakh9UgXWH0Kzveawfq6YDXk
	oYnYsNOslvlBunCxyS2/TQLm9rMxbSx2bfsUTKCfdaNu2wZo9UmVz+Ah3S8jKgGHps1ca/lisgH
	WCoFKGB4/RSRhSS
X-Received: by 2002:a05:600c:4709:b0:4a1:7baa:7303 with SMTP id 5b1f17b1804b1-4a18e4a5237mr183884265e9.7.1791809154496;
        Mon, 12 Oct 2026 05:45:54 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a18bf214a1sm328835625e9.7.2026.10.12.05.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:45:53 -0700 (PDT)
Date: Mon, 12 Oct 2026 14:45:52 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: radu.sabau@analog.com
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandru Ardelean <alexandru.ardelean@analog.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] iio: imu: Add driver for the ADI ADIS16607
Message-ID: <aszWHiDLbNZIQz3J@monoceros>
References: <20261008-adis16607-v2-0-7c94df80878a@analog.com>
 <20261008-adis16607-v2-3-7c94df80878a@analog.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g5xstlf4pzlgbinc"
Content-Disposition: inline
In-Reply-To: <20261008-adis16607-v2-3-7c94df80878a@analog.com>


--g5xstlf4pzlgbinc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 3/6] iio: imu: Add driver for the ADI ADIS16607
MIME-Version: 1.0

On Thu, Oct 08, 2026 at 11:31:55AM +0300, Radu Sabau via B4 Relay wrote:
> +#include <linux/mod_devicetable.h>

Please drop this header. <linux/spi/spi.h> already provides the needed
*_device_id structs.

> +static const struct spi_device_id adis16607_id[] = {
> +	{ "adis16607-2", (kernel_ulong_t)&adis16607_2_chip_info },
> +	{ "adis16607-3", (kernel_ulong_t)&adis16607_3_chip_info },

Please use named initializers here (i.e.

	{ .name = "adis16607-2", .driver_data = (kernel_ulong_t)&adis16607_2_chip_info },
	...

)

Best regards
Uwe

--g5xstlf4pzlgbinc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrM1n0ACgkQj4D7WH0S
/k6VnAf/VjtrhhmMZa7FGOkkKojdnt7WiU/lXeT67R5ejp3x3ljxO4gLmQKg0Jc9
XhrzsbZyTmXQtkBRjxwJDBPkRV00PXyi6Ai2WsFyyrXDXEbN5sJC4ozWIPwM3+9C
JUDQzm0qrRBHB2GWPHQpiWaU89Yr4jJImBZKJoABLmv/Pmhkh+P6Iti/kVgvZHsX
v1PTfeFKB79TZT/v7HpvlVe3yHriA+B54heLguUgndQhbf/UQX+R2HXNTwCNYJ59
px3h8SA3Jp2osMUAnbF5NDOZKhVpqV8GOJqeLS/iZyIk0vJiIf4JZxrx2yRcAxXs
sUCtn80B28G93AfXZAOqCHwJxaPpiw==
=HIoq
-----END PGP SIGNATURE-----

--g5xstlf4pzlgbinc--
