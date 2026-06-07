Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9064071C4
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 14:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780841985; cv=none; b=c20+gIzsF/KBFJypcO0mOTE9dCvoBG/bFdwfpR6rb4eNe2m+NvQnX/s9qlNoEYRjF61d5AajCJIxlWgdx4lvanK8Z3J5Wuj7U3iGycqqMZBkUQtkizreaLHKMDsgGPCxPssnhPU1566AHB+Kkthw/m7MOczlJXxECmiqaSMakfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780841985; c=relaxed/simple;
	bh=NR+DQBvQwShztSKjQQGmlzSCNsn0o36fqH265tpUDo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aPTFM7Ewz7ByHb4RjPaQnxFSRvBsKLItYLHj5EPixORwTX/vMf6eP1Vqy8mxooxWOOBm3foFNYjvbA5Cu/V3LpMoMjL04K1TiOi/GrESqVC7WD8mIMjaXtNjIlyZsIIh6Ls7UVoWPGRGSmt2AL4Sd9cHROayo0Rzv6r0S1omo6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDzlBLVJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDzlBLVJ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490abf12f0fso17078105e9.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 07:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780841983; x=1781446783; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EqnoCYSVmAs4yJkpYfyvmNPY6El36uKrPh+QUWUB0nc=;
        b=VDzlBLVJ0+3X5kghjLOXxLJMQMPVCLU5p1tU6KIr5ncZeupct6P4APBnnZi8IZ9w9Q
         MsMCUBOG9ybb6BJpW1HZ8MPwqEiB3bWjWpJv7QoJNlGnZWdjY8q2PuW+oza8nrC57ywk
         GI4oCZjQeVGU0cGYYa12PTNMZ7PnMqP5oQ5SaI/a+Kr99G/WCl46l1m2I6OhxjKCJIu8
         IcCYE7+wA9tTcm0sEDE0e5hWvDGCYfApQjunApml4MEFBM0jcF3PrZEFQm4ccTnPHv0d
         72wcKPpgtykLkECvbpJtO6asHr6gAqc9fgMthKr/k9ZbQ/RLBEHMaxpEIEYkCRMQILOp
         N58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780841983; x=1781446783;
        h=content-transfer-encoding:autocrypt:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EqnoCYSVmAs4yJkpYfyvmNPY6El36uKrPh+QUWUB0nc=;
        b=fRPfEMUQit47fENzFkiv1lHBg39lo7qO/gs8Sx1io4a2G/XfT17ICT568ityGcWLCm
         Yl/7Z2qE70mqnOtGmblzBTwLpVHVwKvO+CVUxlopMF79q6U930NEvfHe0iIhC0331/mQ
         IphOULI4wyhb+AOpLS5BfmPU5xDA2o2L9/DRiv5ogL5/03VFdh8/j8aebhLaiQTU9JOU
         oUznnsIojHLKnryUneOVNABQeiVjH+NITwlyPrwls9xfJCSxvqgmQzacd+oKYWIDkopi
         X3rqCPgRqi1ZWgUCzXFtyo7sEaOhXT/AWrrRsRWPbr671wM4l6FMwmaXTsrD2Ui/9xGF
         v7IQ==
X-Gm-Message-State: AOJu0YwECTTyUxs1Tai/4ObZOQnuSgU243PHfQ88SOaDGd0SLeNpYmZa
	lSy9p62iCel8sEOpHiYXrMSV40CXDiYKyEgLTlxGFW8RKLtyDR11giLn
X-Gm-Gg: Acq92OG4rFVVWTMkEuoQ18e+Rjjcg/alx6PzEnsrgp5+O/Jt48pA1p6kMM9IUFgFD70
	ORNAnJL5ZNjhXpGXS+yT3pkpB2yN8IVFthaiskAjm1CpxE6/z6amm3/g2c5lnM/vjIGizfb78Df
	QzFmnxQsLJjxEGkDt3nPwVTRPN4dfasTV4tS1np9WO8uGsOuY2qjFw7HJfTo9OglpA3+hcaAXZG
	5o6eX4+/RWuukg2vIJtE6B15tdtriJZTMMfPQ6AvtqYVVmBYw1P1q/1Vy1CtONgJFa1GSrT/dID
	Axhfx42iYDOsYS6bmL5x81H14PDe9Y/5yWOROzfkWvQWYLG0BrnoNPKvPOqGQx73DPjop8r/RpE
	FibI9zkvDvy6jqWiORab840A+uosJMx6e82hWMoomjgXG+ZFuS7IaipB8kseOpFem96CCCnAU6+
	5yIM/3P0NspOVw9nkYZkL5h5rVPD6q45KF+xUHU+SVmlaRCMYluWI3p1AyfcCLQgn87S9zedHlU
	Qm12vgMG2Y7P7hU1m/U3t22BIQoTlf/jtcNHQjmzXxNCQIeH8Bk9pEQ
X-Received: by 2002:a05:600c:8010:b0:490:b4a8:e031 with SMTP id 5b1f17b1804b1-490c2cba8e7mr152181225e9.4.1780841982669;
        Sun, 07 Jun 2026 07:19:42 -0700 (PDT)
Received: from radijator.localnet (93-140-232-240.adsl.net.t-com.hr. [93.140.232.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc391aaasm365115795e9.1.2026.06.07.07.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 07:19:42 -0700 (PDT)
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <dujemihanovic32@gmail.com>
To: Karel Balej <balejk@matfyz.cz>
Cc: devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] mfd: 88pm886: Initialize battery page
Date: Sun, 07 Jun 2026 16:19:40 +0200
Message-ID: <uME6Hy8mQeKxnZAg1Q4aPA@gmail.com>
In-Reply-To: <DJ2QONQXFUDK.22S5350HOO2N6@matfyz.cz>
References:
 <20260526-88pm886-vbus-v1-0-f2bd1fd3c19e@dujemihanovic.xyz>
 <20260526-88pm886-vbus-v1-2-f2bd1fd3c19e@dujemihanovic.xyz>
 <DJ2QONQXFUDK.22S5350HOO2N6@matfyz.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Autocrypt: addr=dujemihanovic32@gmail.com;
 keydata=
 mDMEabRVUBYJKwYBBAHaRw8BAQdAG5VJBpoPRIGQml4+E2LcPdyVtnXRuuqoD1BsHxRjNQ60KER
 1amUgTWloYW5vdmnEhyA8ZHVqZUBkdWplbWloYW5vdmljLnh5ej6ImQQTFgoAQRYhBJvUYwF2kA
 idqo3CZidfVEs7G0eSBQJptFVQAhsDBQkFo5qABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAA
 AoJECdfVEs7G0eStq0A/1SDcm8Bkq1JV+GTGMC8qE1QzCFvnoJuZqtUuQRCkd31AP9Mbc3pmg1K
 JDxgPl17/CQohZ98dbUVffmdQpJJLLMsArgzBGm0VXYWCSsGAQQB2kcPAQEHQH8nnS6QNfgpc1Y
 tqU80DWMWMsDPEGJ7yZ9Nf90mPEEQiPUEGBYKACYWIQSb1GMBdpAInaqNwmYnX1RLOxtHkgUCab
 RVdgIbAgUJBaOagACBCRAnX1RLOxtHknYgBBkWCgAdFiEEA6Ue0g5lV5FAcj1ivjIt18NZWcUFA
 mm0VXYACgkQvjIt18NZWcUyDwEA5OK1WRFN4/psOq/bS6Wuh5ysy0CyXIydqIwDJDdAFukA+wfc
 lr1qyAbEX0FHVunCl+sxv/ymvjsup85rAH+a2j8HA7gBAIolabvAIUTUfCQNCu5MUt482b2EC8K
 40xl/6HT43dunAQCqxwRLI2k0xmTdia2AZwqbbMvqWonOLWtdZwWvodgjBLg4BGm0VaASCisGAQ
 QBl1UBBQEBB0CoqkQL2R15WHRvj3RlkxjW3pPpZVUOHyfhEX+Q9PhTcwMBCAeIfgQYFgoAJhYhB
 JvUYwF2kAidqo3CZidfVEs7G0eSBQJptFWgAhsMBQkFo5qAAAoJECdfVEs7G0eSnB0A/3oyRxS5
 cUJMNnM1+4UkRahmU5/42NfVOxIL5d5oaW13AQD617LpOfnCuZR3U0vHLOW5vrnFtdvi32N5zLD
 9wyShC7gzBGm0VbYWCSsGAQQB2kcPAQEHQPRL1mWe9nIhjicyAqqEN80IXEF0NeKSFFpN8n75b2
 YIiH4EGBYKACYWIQSb1GMBdpAInaqNwmYnX1RLOxtHkgUCabRVtgIbIAUJBaOagAAKCRAnX1RLO
 xtHktyGAQCJPD6JsQhQZEB8ciZrJz+hnonsJp+KZZQQGEK/KsLHEgD/ePz/x0pQdI/DcJd/5Qge
 +IJGd+jyv4zyevPxipVbyAo=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Sunday, 7 June 2026 12:19:21 Central European Summer Time Karel Balej=20
wrote:
> Duje Mihanovi=C4=87, 2026-05-26T21:14:48+02:00:

[...]

> > @@ -88,7 +94,8 @@ static int pm886_probe(struct i2c_client *client)
> >=20
> >  	struct regmap_irq_chip_data *irq_data;
> >  	struct device *dev =3D &client->dev;
> >  	struct pm886_chip *chip;
> >=20
> > -	struct regmap *regmap;
> > +	struct regmap *regmap, *regmap_battery;
> > +	struct i2c_client *battery_page;
>=20
> Not sure if this should be reordered to preserve the "reverse Christmas
> tree", but maybe it's fine if checkpatch didn't complain.

I opted not to move the declarations around in this case as IMO it would=20
present noise in the diff, but on second thought it may have been the bette=
r=20
choice.

Lee, do you by chance know how to proceed here?

[...]

> > +	battery_page =3D devm_i2c_new_dummy_device(dev, client->adapter,
> > +						 client->addr +=20
PM886_PAGE_OFFSET_BATTERY);
> > +	if (IS_ERR(battery_page))
> > +		return dev_err_probe(dev, PTR_ERR(battery_page),
> > +				     "Failed to initialize battery=20
page\n");
> > +
> > +	regmap_battery =3D devm_regmap_init_i2c(battery_page,
> > &pm886_regmap_battery_config); +	if (IS_ERR(regmap_battery))
> > +		return dev_err_probe(dev, PTR_ERR(regmap_battery),
> > +				     "Failed to initialize battery=20
regmap\n");
> > +	chip->regmap_battery =3D regmap_battery;
> > +
>=20
> Nit: maybe this could go below the chip ID check so that it's not
> executed if the check subsequently fails?

Good catch, I'll do that in v2.

> Also, I think the error messages are missing either a definite article
> or an underscore. Same in the commit message title.

I agree for the commit message, but adding one to the error messages would =
IMO=20
make them inconsistent with the existing ones.

[...]

Regards,
=2D-
Duje



