Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2808F331A76
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 17:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781803552; cv=none; b=TvRcd/D74MB7FC/nAph3xDazi17g16+BkVmkxTeSygbcUJqtLJp6EmpZn1T4oSJNlzsHn7WlK2RwgohJH7aVbYWJsmLTOBB7Lf3NRYOKmguh0mNwtiv7m8ftYr/JZvJ2GLBNm1DMbQhG5oxQ9CNCEzfad2JqbuxG3wzJSdI0udY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781803552; c=relaxed/simple;
	bh=24kM4g3+wISlX1NWkhO/TxdeXtJj2lsQ+29OTn6CdrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L2C/V5AScyl7/+2XDBRXWk8xMSRwmVPOUEsUaVBISzLoa6E2pPclWuhnprFFL/L97mYZsndPBquUkpbApzKL+tokB18NiGFofuJrLHWuABqD0IFqMD4a2cgIgpZnFS8p1RCg5i7uLPvM0Ir/1eKX0gDSgtVDRSdfFcwxGI1S//A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=nXc7jAnr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="nXc7jAnr"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so7474815e9.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781803547; x=1782408347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pUs1pCYfgyslcqbM0nVDJGJ1LjB7KId+9/g65IhvUEc=;
        b=nXc7jAnr/vNQgi4/QSm9DQDXbNNZ2zEFnh9uqAj0jZlRtayFwH81ilQw7tYercoSj5
         lbaH6AHXZedZ5mGnoqWbDArmrHU1ZjcrhbmSPsg78o52dCzEeDOu6nOPud+JnfUCG/FF
         5THhww5p5vVc+sf2fiTFo9yD0x/X46s1I38i63XAxtQh4eUvEJuC0DOQlFCn52/TX7is
         cIaRSIrLZ1xeqzDsYpiIsf4ugsmrFTDb1WO9SjbSQxwxEjJCSifb3rZ8X4kcMBEkfkDC
         mc4DY8urIsIE8WtlQguVywni3ToAfm4JE3O2Gf+cIAUhGQwAKsh6d1k1MWomsfUy64Re
         zVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781803547; x=1782408347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pUs1pCYfgyslcqbM0nVDJGJ1LjB7KId+9/g65IhvUEc=;
        b=DDKjRpgVZcazD7zCmoxJxfNbkbMpCsJ8UYMnP0QcOumzQggyMBMHWqzkyymGpi1ibl
         d9XF6iIjdlFLrtmg5OBz1UVAwZbl56RRz0cYmH2r7gwfhcVq4uuLJmVvzOdKblDjsFbQ
         yc+1PtRFc2cCr755rYK0r582R1Ky8W6b0pPL8pdEnAFihoa2ZgFCKYjA+Vd9obHIccne
         smSuGnDJYFLH1ANs1odhBE+6nxi8QwmYQJo797hJJRJydFoFoon5mn02UppeaoCtmQQj
         aqZm7fhtyUujZtCCGVs1K11VrV5ZR5DRSkcRiusYip9M/PRdXVdLcvxvPLwn+RsMQDgl
         kccg==
X-Forwarded-Encrypted: i=1; AFNElJ8uuV1CdK6rS8OLXZraqMHIJhPRLKQnyUUbHneOQgExA7iuiQEeQvel4MyN3QMN8LZWvfJ+AehbpJNF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Fomn428fqf7/yJpIWDBigG1X+XsBuqurR32dg1u4f83QcHfj
	wmSJrf/zwWlmWmnP9N7tOGqzKO2bXEdMtX6ldkGlNXjcHbNWJpgy7et+4GO3ImxW31c=
X-Gm-Gg: AfdE7ckRUANyUBWwsTEOhBph2TCNWvvumm1vxGvwnwygcKdJYxt9+eSRur6mpyONRHD
	nRWoKgY7AOKWQrctQmI3wQ0d89k4rHvbIyaj1Gk6chJ+vZEkUHekEOzHsvxrBeTZPob3zScFiIU
	cLF97fJMVn/4bwSi4RPHXwsLRItz6mAu5CsbifM4WWdHnhbuyYcrN3e+eVz6JscChzsvLi4AvZ6
	ihgo9xdtpEYhNR+jD4mcvnts1A1M1NkSBXtkM7wvtsCWnqg/Uz+QVMsdTgPbeDmVnohar9MrGQJ
	A6DtRQhQkm/ENaFnBYbOlbn7W81O+KtNBdi7KZAHdw1LqsM50pkTewIEqSvNVbaj9uyzj+K2YJq
	CxdqyLNfg3vFjtMIVPauH0OxH5dlCmbFfPnl+QAic2/ANEgEtW/RtKh67wl+2mHLK2pAZapx++B
	ccaqVmIwqtdCzDEu6W8X+Mn+3wdxkPEpE3No1WYk+ALdRC9tYlxAqX7kEOZExY5nSPxcHpvuoRS
	0Px
X-Received: by 2002:a05:600c:3e86:b0:490:e18f:d112 with SMTP id 5b1f17b1804b1-4923f56c1b2mr8389095e9.21.1781803547407;
        Thu, 18 Jun 2026 10:25:47 -0700 (PDT)
Received: from localhost (p200300f65f47db04cea0a59ab11cac9f.dip0.t-ipconnect.de. [2003:f6:5f47:db04:cea0:a59a:b11c:ac9f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4923fd33dafsm4270305e9.8.2026.06.18.10.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 10:25:46 -0700 (PDT)
Date: Thu, 18 Jun 2026 19:25:44 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Nikhil Gautam <nikhilgtr@gmail.com>
Cc: linux-iio@vger.kernel.org, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iio: magnetometer: add support for Melexis
 MLX90393
Message-ID: <ajQpq1yzA-ig2c7s@monoceros>
References: <20260618160141.11409-1-nikhilgtr@gmail.com>
 <20260618160141.11409-3-nikhilgtr@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kc2atgzcidxkklwd"
Content-Disposition: inline
In-Reply-To: <20260618160141.11409-3-nikhilgtr@gmail.com>


--kc2atgzcidxkklwd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 2/2] iio: magnetometer: add support for Melexis
 MLX90393
MIME-Version: 1.0

Hello,

On Thu, Jun 18, 2026 at 09:31:41PM +0530, Nikhil Gautam wrote:
> +static const struct i2c_device_id mlx90393_id[] = {
> +	{ "mlx90393" },
> +	{ }

Please make that:

	{ .name = "mlx90393" },


> +};
> +MODULE_DEVICE_TABLE(i2c, mlx90393_id);
> +
> +static const struct of_device_id mlx90393_of_match[] = {
> +	{ .compatible = "melexis,mlx90393" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, mlx90393_of_match);
> +
> +static struct i2c_driver mlx90393_i2c_driver = {
> +	.driver = {
> +		.name = "mlx90393",
> +		.of_match_table = mlx90393_of_match,
> +	},
> +	.probe = mlx90393_i2c_probe,

I guess you want

	.id_table = mlx90393_id,

here.

Best regards
Uwe

--kc2atgzcidxkklwd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmo0KhUACgkQj4D7WH0S
/k7GrwgAu1DSqOXoWtneHXUsxpm3BPvSSx7V4coHsGQIVhGMIzOuHlj1DdyrM3yA
NuShM18WdXvHIZetC+I9MmN4vpQhgGcJKIe9uVh432ZK3s8JWcoOIOGufiLYTp8M
Yynw6i077ytTSA6K0EYger1u/6sYlNh2rBAqe3JqLQ3AOceOVzrtXF3XaVvsRxcI
WkaJBl9JnZwqidb063RRszj/iqWvAnMHz0VJocZIpXiIpsuhl+8WIzyITLEqGD8B
j/FG79DvaiU5XsFollRc2y6zgN9Gr1sIzeiugDciAJgy36JGKnKq6PhkzEA2jbQP
eF4QAbGXwI/F6wUFbhl2+Mw3U1DOKQ==
=EHbj
-----END PGP SIGNATURE-----

--kc2atgzcidxkklwd--
