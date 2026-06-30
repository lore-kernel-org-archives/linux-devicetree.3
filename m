Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0773C1973
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 17:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782838987; cv=none; b=nk+QZV9TNI2VRu5vQOVPJiKjjgkYdiI5wYlte3BQZWJV5x0ennvVoDhZ0QIHkOAUFjVLrQ2RpKM6gLe3ra51BeK/PSLkTnL1tfVuNi280BhGoQmqu2L82wqM45xtLCONQv8chQw8g55/SJga/ypWw5rtX96yhSgE6eOvA6HnnEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782838987; c=relaxed/simple;
	bh=wFcPxcQLP8FI+3mLIH02StKQAxTWliyQeGTu8bwHZa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NlzF7grENVW3j3RXzThiqvNMp7WR+eTqyVnt/NCRkefG0u0dkLog0Y+9w4SNDianQzCXR/n0QaMrNYOHqEVoaz9wPnvQ+Kg0sAkqMrhEEnqyFpCZJ/TfhFdStEk+XFrdQ1DEn2wCQvPs9VmB90C5ylxg/A6Rfe6/q6cId5RsQs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FoBJ4f1M; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FoBJ4f1M"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493b7612475so11479295e9.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782838984; x=1783443784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=065FLRDoYNi4tJNRO4o9kX5ArAQ4ACVdhpCQabyC+5Y=;
        b=FoBJ4f1MSciH9tqQe8ajKu8ZgKsJgeMU826++81YGL3WtbCGwAnwUq4PmF/2hR9eYg
         L/vwWBPBhHoEqdlN8uAlojIPnydgC/+F1vjfnQjho5qO7UJkB7NP3owWaNUoMDXkVl9J
         zx+hG7PAMe5OINaA1dEJukKU7o4rDOUG/S++YCTeCQo0/Db9toco37J/DcnxnrdQOCJ5
         sZKyLYnZGwmC6G3IgOmjgZTaT08BIu9VFJhFCoTtoAGyeSTeuqpj79zsPSogPrLFVNWW
         QsHsu8UiTYblDb5IGIolZxenL/MiL/Ja0hHTwO2iaMmDNiz9w/f6cccth5NBpCsoznCb
         x1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782838984; x=1783443784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=065FLRDoYNi4tJNRO4o9kX5ArAQ4ACVdhpCQabyC+5Y=;
        b=N7Mdg/sq6xSYRCHGOZ+41rA8UDoHvFlH3NzZBTj/2nGdyOoVihxj57QvRr322E+I43
         SkWR74+974hsvwGqsTC+6GDe+vrip7yiFPXkYZZZWxMxZb6NnG+ZABRYNnJi+ha1hh5o
         flCoDw2A5RYpyc7vKNlKHVCLWG/B0al+FSPOljUJ8HZ6WI7w55m5IfTn0bhFHFCZ7kXC
         /CRRR1I2sxFONUcUOcYLefcdrc2oELftTHUtLyy0aUiWuNL0u2MWgXzi2C7dgmmsctbw
         wKcZkL4/UzL83kr5tnD8FuBAiRBDhHptD5mU4j0hmDH4IF/act3+LRMC7MDsuUhDCnYy
         xv0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/CxfbJCyyAhkeZGozlAFM5KbjzflQz2SWi1uf/zm8qP7RfPD8W3CgweGl9elYceVIfpq163PMHfK+e@vger.kernel.org
X-Gm-Message-State: AOJu0YxA+wuAl8IjFjoVn9POps9Silfe56654NLsIr7T3FPt7kGbQiP3
	VpoFrJs8l9145z0emXFDKO5ZAo9j5qIShz7paNGY/1L3vO279EAhkvnT+vGjvkedg8g=
X-Gm-Gg: AfdE7cmogHm4+Fod1vMCsn4b//Pl+BmKuerZ+6xnGatUHY9B0Ki8Z6YwtJ94sPSlCh9
	9PrqS7yjWw3MnlH01nikZQSTcRjcd9mzoZp78M3kMrTxYCpuhosvZUpNA9xaWoDXkUjUxEeKHl+
	ovdgZh0Gh2bVMcdZW0g4UdDmSPWJ4J1dHSzfmEtUfVfgatFNcnZJED2kLWmd7bQGvtK10UWn61R
	Cz/irHGXlBYVT1xLMxZ9XKCaf8VYbtHSQ3GHjptsp/6SrsE1wmP/yH7PPX7R7YDjwDChVEnpIfY
	fG0z+U3nX3ONLFphtGjTtdjBFbZRXCs/D51uPQNlYRY1JxZXNUspRNk/OSHv8/5XGQL/FKIDHWL
	kHSH8XGhtcWBtKlT9Hg1ohUAsTGzb52rNr5VycfPqgr/y5q989w0Gs4vB33kP1wWEbWlc88KSkk
	9aM8Qzmoz4E38ySURhqMpHHUvELCmoh8pQPTnXkzOmKQfD7Y8m7mDGggezdSGz+MdRGp+HlNOc7
	bLXgc/3FDPIsXw=
X-Received: by 2002:a05:600c:8b05:b0:493:b764:ff98 with SMTP id 5b1f17b1804b1-493b828631fmr71049215e9.11.1782838983777;
        Tue, 30 Jun 2026 10:03:03 -0700 (PDT)
Received: from localhost (p200300f65f47db042a9b551def0a6b94.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2a9b:551d:ef0a:6b94])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493be4c8080sm10175345e9.1.2026.06.30.10.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 10:03:02 -0700 (PDT)
Date: Tue, 30 Jun 2026 19:03:01 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lukas Metz <lukas.metz@gmx.net>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] iio: dac: dac8163: Add driver for DAC8163
Message-ID: <akP2RSriqaN8qqQT@monoceros>
References: <20260623-dac8163-work-v1-0-5b508158faa0@gmx.net>
 <20260623-dac8163-work-v1-1-5b508158faa0@gmx.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pdjo7z7h4wmknyds"
Content-Disposition: inline
In-Reply-To: <20260623-dac8163-work-v1-1-5b508158faa0@gmx.net>


--pdjo7z7h4wmknyds
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 1/2] iio: dac: dac8163: Add driver for DAC8163
MIME-Version: 1.0

Hello,

On Tue, Jun 23, 2026 at 06:07:27PM +0200, Lukas Metz wrote:
> +#define DACXX6X_COMPATIBLE(of_compatible, id)        \
> +	{                                            \
> +		.compatible = of_compatible,         \
> +		.data = &dacxx6x_chip_info_table[id] \

Missing , after the value for .data.

> +	}
> +
> +static const struct of_device_id dacxx6x_of_match[] = {
> +	DACXX6X_COMPATIBLE("ti,dac7562", ID_DAC7562),
> +	DACXX6X_COMPATIBLE("ti,dac7563", ID_DAC7563),
> +	DACXX6X_COMPATIBLE("ti,dac8162", ID_DAC8162),
> +	DACXX6X_COMPATIBLE("ti,dac8163", ID_DAC8163),
> +	DACXX6X_COMPATIBLE("ti,dac8562", ID_DAC8562),
> +	DACXX6X_COMPATIBLE("ti,dac8563", ID_DAC8563),
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, dacxx6x_of_match);
> +
> +static const struct spi_device_id dacxx6x_id_table[] = {
> +	{ "dac7562", (kernel_ulong_t)&dacxx6x_chip_info_table[ID_DAC7562] },
> +	{ "dac7563", (kernel_ulong_t)&dacxx6x_chip_info_table[ID_DAC7563] },
> +	{ "dac8162", (kernel_ulong_t)&dacxx6x_chip_info_table[ID_DAC8162] },
> +	{ "dac8163", (kernel_ulong_t)&dacxx6x_chip_info_table[ID_DAC8163] },
> +	{ "dac8562", (kernel_ulong_t)&dacxx6x_chip_info_table[ID_DAC8562] },
> +	{ "dac8563", (kernel_ulong_t)&dacxx6x_chip_info_table[ID_DAC8563] },
> +	{}
> +};

Additional to the missing space pointed out already by others, please
also use named initializers, i.e.

	static const struct spi_device_id dacxx6x_id_table[] = {
		{ .name = "dac7562", .driver_data = (kernel_ulong_t)&dacxx6x_chip_info_table[ID_DAC7562] },
		{ .name = "dac7563", .driver_data = (kernel_ulong_t)&dacxx6x_chip_info_table[ID_DAC7563] },
		{ .name = "dac8162", .driver_data = (kernel_ulong_t)&dacxx6x_chip_info_table[ID_DAC8162] },
		{ .name = "dac8163", .driver_data = (kernel_ulong_t)&dacxx6x_chip_info_table[ID_DAC8163] },
		{ .name = "dac8562", .driver_data = (kernel_ulong_t)&dacxx6x_chip_info_table[ID_DAC8562] },
		{ .name = "dac8563", .driver_data = (kernel_ulong_t)&dacxx6x_chip_info_table[ID_DAC8563] },
		{ }
	};

See
https://lore.kernel.org/lkml/20260515103150.164887-2-u.kleine-koenig@baylibre.com/
for a rationale.

Best regards
Uwe

--pdjo7z7h4wmknyds
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpD9sIACgkQj4D7WH0S
/k7rhAgAj7ImlgrgPsZWeETvfMzKOH4o9IxIZniUJoYukNSn+rqWsYNyyxQA5HbO
HkpfYskuDV6YkIDEL/5rqz8g41y0kqc8Txxni9tjRfvHRjY5z/CU+32qs7sSVCQ4
eoTAo1C4qIleNRSiDJpqcRk9DfoLKFDXTJRFVYeIQvWW1Y1KEXLea/3kxda2/gcX
snPcROQwWZIr7OPy0sR54lqGn/dgCqyh+d6mDATGcngE5KW4FVChyNn10K1rshh+
Kxx3PWXueDbvBqDAFVoLn1EXhajNrQJ/v6YIs+9h65UwHbHwQlFfzp0AWd7d/oKb
hgxn4938MwqWPGTf65MnzW26QK2zNA==
=D1q/
-----END PGP SIGNATURE-----

--pdjo7z7h4wmknyds--
