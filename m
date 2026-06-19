Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24450285CB6
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 13:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781876575; cv=none; b=Pkk3Z4DwWv00g+vZUqW0n3ud5MjFARWWp/SzfKZM9hf9tL/9W4JQ6hEdOCpw7nQpxgjSKbmvbVIRFgL4afHJ7xsAEO3DD0oJpVmXWMjizKbwtIKD2GJt3BN3WPpg5FAU+qNOAdAqy5HOmtQTtzu5GDwfU489AegWuDXs2C94A1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781876575; c=relaxed/simple;
	bh=M7CVklpq7KndjrW50LOp8CVhG5s/LjIeFYmYNUk4gCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EeZ1R6YjnYF3gbh2cNcZGxiHqz21QUmtA4SruLy3Yk9WHMxnbByRYpEqkP5zD+Js5RLvPzDakrPci/AzgIE5z7BVWDv/NgwNMQ7T20yZnr8VWdRuDnX2Zc3DDutbu+W3vkn3JNi57MeROPRvJVwf45aiE7wIYvAKPQswU1gRm2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QgKlNgOj; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QgKlNgOj"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-46255b269c2so1646034f8f.3
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 06:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781876571; x=1782481371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IXaVBwhLdjQBaUQeTrfgetZEnvKtgsn0Oo1huRmzs/k=;
        b=QgKlNgOjucHp3KGwbGNW+hOJ+57KzZ4YUzNguGNM90q+YCBRrvhUinUnKKfIdg8Pf3
         pig1CDhHrciIpuCEs78WNAexIuCXjSF0tYZhO7pp07hACHsQcL/w88QFqrhvpzck14KV
         eeJNdTeCABziGI2mf6mg8ZGGSFQOCCtcNSnHQTiddJJUY66s7ij4sSCjdyBC8K5fqht9
         Zv/mzve0Wwol/EwUihIuX/aScpA5KOk0X4TJrw1Jtr/3w30rq+WwgXZnLjqxGE5sFGvJ
         l8mrwxLhpZwdyTZySvb9QBacpDZ5EYUUR4+Z8nwFFf1f7A83WMSpLHdQJ28yGvGZfAt5
         s2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781876571; x=1782481371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXaVBwhLdjQBaUQeTrfgetZEnvKtgsn0Oo1huRmzs/k=;
        b=DFI3wAILpIkedSlI6af9NI4dM/hitofRwlHKCtqUcrA1pW9j5i97OTi9a/vajSXagh
         SisqHhUjVNBfRkM/hSygSjdDVK0EtfuqdfwNbPxLG2OuOxms8RdC7Qojcv6pv35uBvru
         F/Ldm3ZuAiJsu3LCV/ckPvOBBq3XqBgIlE2HjAVB7o6+nRSpGUiG1W+wAh86Vg+m09F+
         P9BnFxm7eOUQeS45MwoQh4wDCimO4TmW4r32ZL+ygCWxef22CqGzzMU4CSf/5F59z9fv
         s+aSf0aZUfCfAPHSXmPJcuoprutN+Q6ePK4pAQpcrg6iFa4HOUjwQ19UT5ujHljkG0AW
         0bkw==
X-Forwarded-Encrypted: i=1; AFNElJ8mf1ItBSenqRKoiENofvY5bVGtUllN1B4MoUVIms0T+2UPoof6Kb5w/sdNzpABb0I8d0z8CoQj63zE@vger.kernel.org
X-Gm-Message-State: AOJu0YzcnDQebiNdoEQ3FiynVkgHIYd1KtEEqorzunbRu7t8nqukafye
	OIw2ybcXxsMJO9EtBhQdX6Bh8t9hSTCM1PjHHWz3SHvn6kDTEeXOqQsXM0y+FFIO+zk=
X-Gm-Gg: AfdE7clR85SCSnf4kVZonIdxVflZlgbiHcwntSuLc3td+vFBS69VlwdqTKN3+6d5lry
	hbxjR0PtQNLppMWuHUN7YgQJsqCGRZ6lA0AOOtA3/8vTmwyL0MfF+DJ6RvNxrRfxbnZUzvZCHql
	oqNzL9NwSqhPwS1k1mSpgfABDPzduJotqfLkrT5rc+MWI3OpWo5I8LPd6ZY9FhdSXWtR/bOLJjZ
	iJSS5wzBV43/RyDvaGVUJifMl++HZaHvnRWr+rK/8wzO7tgUF0qn45DjD2hwucSBz5PS+bX6cbp
	j6uQzpR2n0cassYY0VY7URICu1kpVYb1BiP5eJTlEb6gMqomLgR2WzQ6bK9+v5Wb/tfit5fbX5q
	5Ql3Tr5WMAMdBTTIp1pzuvgsr5a0x1Mt10Ey0nAldtTy9RO9YuLQZLWCL9TaBVAufC5l+RjCA6e
	VSjUiUO4MLYMk4xnA6Z2jkT0du0SYiDcdc9rhM0+Y2jxED5JcP3LtLXCTddemFh9dTQncTcExvF
	1Y=
X-Received: by 2002:a5d:508a:0:b0:45e:f302:94e with SMTP id ffacd0b85a97d-465028ccabfmr4886888f8f.37.1781876571519;
        Fri, 19 Jun 2026 06:42:51 -0700 (PDT)
Received: from localhost (p200300f65f47db04359fc0e70763236f.dip0.t-ipconnect.de. [2003:f6:5f47:db04:359f:c0e7:763:236f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46508a04dd1sm8986721f8f.7.2026.06.19.06.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 06:42:49 -0700 (PDT)
Date: Fri, 19 Jun 2026 15:42:48 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Zhongfa Wang <zhongfa.wang@unisoc.com>
Subject: Re: [PATCH v5 3/3] regulator: Add regulator driver for Unisoc SC2730
 PMIC
Message-ID: <ajVGtio2YdwGpZb7@monoceros>
References: <20260619-sc2730-regulators-v5-0-0a24c7ed7a97@abscue.de>
 <20260619-sc2730-regulators-v5-3-0a24c7ed7a97@abscue.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g2lt5xio4rpdpolu"
Content-Disposition: inline
In-Reply-To: <20260619-sc2730-regulators-v5-3-0a24c7ed7a97@abscue.de>


--g2lt5xio4rpdpolu
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 3/3] regulator: Add regulator driver for Unisoc SC2730
 PMIC
MIME-Version: 1.0

Hello Otto,

On Fri, Jun 19, 2026 at 01:41:49PM +0200, Otto Pfl=FCger wrote:
> +static int sc2730_regulator_probe(struct platform_device *pdev)
> +{
> +	int i, ret;
> +	struct regmap *regmap;
> +	struct regulator_config config =3D { };
> +	struct regulator_dev *rdev;
> +
> +	regmap =3D dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!regmap) {
> +		dev_err(&pdev->dev, "failed to get regmap.\n");
> +		return -ENODEV;
> +	}
> +
> +	ret =3D sc2730_regulator_unlock(regmap);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to release regulator lock\n");
> +		return ret;
> +	}

This can be shortend (and improved) to:

	if (ret)
		return dev_err_probe(&pdev->dev, ret, "failed to release regulator lock\n=
");

ditto for the other error messages in .probe().

> +
> +	config.dev =3D pdev->dev.parent;
> +	config.regmap =3D regmap;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(regulators); i++) {
> +		rdev =3D devm_regulator_register(&pdev->dev, &regulators[i], &config);
> +		if (IS_ERR(rdev)) {
> +			dev_err(&pdev->dev, "failed to register regulator %s\n",
> +				regulators[i].name);
> +			return PTR_ERR(rdev);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct platform_device_id sc2730_regulator_id_table[] =3D {
> +	{ "sc2730-regulator" },

Please make this

	{ .name =3D "sc2730-regulator" },

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(platform, sc2730_regulator_id_table);

Best regards
Uwe

--g2lt5xio4rpdpolu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmo1R1UACgkQj4D7WH0S
/k4d6Qf+Lu1bwA3t19q0m/mYtun6RIABNPyut3NnP7iCEAlR70Nd4bkIWhSnq27g
RyUy8e0V5776VYD6zNGL+xMqMxXs5440ZOvL30Nb3kkEqk4AeYcbYmf27dxC8tc4
Gef2ATqrv+yFXZ9Hk1AU+7rfvSedHupvUzwAv/setvvB/0yttwVDDl+Jo0z3B417
JHkXdEdewcTBWKulfN8sBbJbqKJANAvn19EyLmy+6rXlaA93ffAJgVkCmU9vTHVB
ukz/T8KW9e3/GF0P+y/EqszL1Rur8NNLpnS1x0CbNaozmYx8oUKqRa3aoy8vsnFu
BS7JMEJwl7tIx0/CpqyASAUmHIV8Hg==
=c86R
-----END PGP SIGNATURE-----

--g2lt5xio4rpdpolu--
