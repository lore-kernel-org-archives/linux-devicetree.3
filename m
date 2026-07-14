Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771103F5BD8
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 21:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784064084; cv=none; b=Lp849hG1bcwB8C+1YHIh4plR+NVBtMQ7gI9FPyElSS/cyVZqg54Y/6MToee3EFeFJGncPyDl1j0Rv04qVVVfLkx+9zvdhJuBw21EICuED2aD8kGzNn6Simi5SvMJXBkMaYjVbc2Ktt7znxA7YQ/DTkSCecNRWFvjNj540+cmSEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784064084; c=relaxed/simple;
	bh=yw2HrJD4EnW28VQxXIvfJ2mgB36yVB4/eQhPGNDBomA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qNcVvqiAEhV4+SMWa9svxi+4y01kvYRutoqk32pPaPI7oc48dYPlHuYQtOHEZuzasSiKdvERp339E6qPWhKaaad93Srbmd6o6iKbwVBeYxLqLy32WxK+3Z0HBBDDBiMg5lk6JhGuESjEf880+yaPJbNMpR9WgauwWv18tNb9JPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=OYPZHltL; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="OYPZHltL"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47122683cf3so2672590f8f.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 14:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784064081; x=1784668881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yw2HrJD4EnW28VQxXIvfJ2mgB36yVB4/eQhPGNDBomA=;
        b=OYPZHltLQVtLFcdQw3TxavhtSXHbPnQFzOcAGs1ZXVZR/QrLA5k/afyWXFFzq7ZqAx
         5xTSPjRIAnweLr/Dcaa7vBuV5Ih4zEs9jdJ01UV5spR0wHeW07umhfIOJulwnu+yhn1s
         brL1XByi/FMhtSVYXSFnIHhd1rO5Qc85f3R1RPE2kOfzpKUVJA4cRDI6nMle7tjKiHl2
         w7S1AKi60lXMKqfiIIas5FtP+qRvY1kxMs5noQ7HFvDa4WL+M3U90bMwQYjBzXZBusEW
         N+hrwCQCAKoyOLQ7WIsv/NJUgrKw9LVbhC5iWuC9j7b6NaIz1dS922r5msLMQjGdbIy8
         NtcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784064081; x=1784668881;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yw2HrJD4EnW28VQxXIvfJ2mgB36yVB4/eQhPGNDBomA=;
        b=qWUUSDDTdGRUYNtkGp699jmVYqw+2AsJCicsjjE9WRmGCDUhSrMe4BAN3rTOPTPTr8
         4yGi+yLle18tjceMuMe9jMj5HLW4hxOjprLkyHr+eTFdZAfKYHz6oiBG7PUxDAFkWxye
         BynQpD353Q6ouZFfqzetZcTzF2u52AGn/mxBc0eCVt707Y7p0ZQCjsARPzPOUzHRpPkM
         Y4J3wx52Xc9FPKh7ja0NuzK3erAoWxRGkR/pC2HhHjENQqCCRjSumR6RMOZhpE0UJT47
         rc9aoHEDM6cMYnJ1Wm/bvQkCjxtSQbYUISUQlblqaR2fxYBaE8nF/ihqBoM3Xn6EjCpQ
         k23w==
X-Forwarded-Encrypted: i=1; AHgh+RpXXMOC8oBuMslXyS0/cZdbBZBwivb9UtDyB1T5R1PoWB0e6LiRRcrspWGa/Ntb5X/1ibGP6+Vk/85c@vger.kernel.org
X-Gm-Message-State: AOJu0YwfRclT5Prz370qwDOhY1jw0yht9QnS4agAARL6Y7a3lUOrjpcR
	XG1dqdkug0UL7Qw/pQ6hiAMu0S6qSmt+XMilrGihQ898SkqVNRPQvB7+FHtjGdmc458=
X-Gm-Gg: AfdE7clJGn8FrC+WH+8xC6MFS2CTsYw9Q+4yTpGdq7U77X9X6isy9qBS5xg04wu2snJ
	5uCexhBjQu2smyNG259Qv0jZSwVwF/j+/0Dy/wK7LzF/bnPgUMPqT7rPmuVGPdfTTgkwi9M2Oce
	gbB9XbBvJpaze7evFSqYhiP4WFgGKJi8cHdzA1Ebvu+8Knp2V8l9iIX2sUUX8NCJOJ31xSEAbgR
	VIiDyb5L86QMuKQQuBNSwLfDsilxfhaPnL7p4WtrCM4GE+W8f0gxg6eeCwhSs0uk9olRGqXvocG
	A1+/J6Mm5XLeJ8cU0u3VYbZMuycZWzoK77PkDZOlEdqfYWnslpBoLgEi5QgJnu0lKxz7Sk7Floe
	6yDawSa/t4KXfiMledsfNq7vWi2xORm3UYD8ohP+uyAJXqMz2uSvgkFXMtMg9T7cyJKh90c8Bkz
	Xj8Pqk3VelKcNItUjKhw==
X-Received: by 2002:a05:600c:c04b:10b0:495:21e7:fd53 with SMTP id 5b1f17b1804b1-49521e7fd96mr44313885e9.18.1784064080765;
        Tue, 14 Jul 2026 14:21:20 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4953c6fe0c6sm4273135e9.1.2026.07.14.14.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 14:21:19 -0700 (PDT)
Date: Tue, 14 Jul 2026 23:21:18 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Siratul Islam <siratul.islam@linux.dev>, Luca Weiss <luca.weiss@fairphone.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] iio: magnetometer: add support for QST QMC6308
Message-ID: <alansZsKEH3nX_UN@monoceros>
References: <20260714202842.340293-1-jorijnvdgraaf@catcrafts.net>
 <20260714202842.340293-3-jorijnvdgraaf@catcrafts.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fwne57h3b6pk7whs"
Content-Disposition: inline
In-Reply-To: <20260714202842.340293-3-jorijnvdgraaf@catcrafts.net>


--fwne57h3b6pk7whs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] iio: magnetometer: add support for QST QMC6308
MIME-Version: 1.0

Hello,

On Tue, Jul 14, 2026 at 10:28:42PM +0200, Jorijn van der Graaf wrote:
> +#include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>

Please drop the include of <linux/mod_devicetable.h>. You need
i2c_device_id and of_device_id, both are provided by <linux/i2c.h>.

Best regards
Uwe

--fwne57h3b6pk7whs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpWqEoACgkQj4D7WH0S
/k49YAf/R118nhj7SqTdriZ9maLRuzr3XBenh2ENuYEmtwi2qAFOwOA66GQrg4Zo
2amincOgpKDOD/DybNYT7tahUZGx+FtHIum22ptdG+bK97qeja8L0F1ekrTMvMUw
OpQ0JZ4M0B/dmRB8digv6bjvmAN0sUVkNpbqyQ9GeD58FRVI9wxkb74cZrtYmy43
ni15dJzrO1f8ZZ0QDPAxGAcZafmOCC41ktIbKNH1sTvg+xFnauIGBiA4q7MiKcL9
w54Io/K61EweIwCM12jALoz8Wi+HLr1E54QYa1B3lBH+C/MJ8LABJyYJ612c6WDS
l2OhVGxAf0Roe2r0koBRwmoM2KVHJA==
=8BGo
-----END PGP SIGNATURE-----

--fwne57h3b6pk7whs--
