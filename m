Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2F933C53F
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 13:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774444303; cv=none; b=n2UCdlUSMa1IdT+4fVQ0U71FzEbR7D210Z6QC40Cd2fsswJn866jdLzbGDiw8vQQZl8CNd0VF2dX2neazE6JUpBLEDJJNbUSgjoCbU6bxvM7MenX0qtupW43HJunzE3p4RuxEJIxed3nnxvNxvOc1LH28trsJLLVprtBHFrYkLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774444303; c=relaxed/simple;
	bh=g4wYbCrQQciM5eAA7bNgeswNgh+jLdm3yzIf2O7Ct2c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=or4Yfvh+Dq0Q1SHFKbyojwl2VXa6pWoK6SHdcEYtIuI9RLRvC0wP6UGwUmazQwtOn/c4/Vh61B29lpqSaH8n93/YYN/sXmU7n8EsuBz9SgEaGq00g86Lf7HtnNDJDuoQEefFsG8zbSdrkoPNzfxfjtuM5zWmL2ZA6FyBa4/HHpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FlUEcTUS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlUEcTUS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486507134e4so29758925e9.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 06:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774444301; x=1775049101; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3GPRX2Yqkh2fKcDql2NbbWnYF5EebgqjYrmp0cfTJ5I=;
        b=FlUEcTUSYKpCxvw92RDkKefbBgYBLc4ykoYW58S+9zQ3sNCSyItFQKnJX0mKXARFO2
         E9oo13U9zxVGkgarArAhzOZQliIG4F3CzAppc+X/xd1UklAGVxE+Pyv8oVqSR8Nmk7pW
         D3/JeMcd/wjGKnW3U0iac994/Akstb/UZtq1CSVlJBeKPWLqELnkrYUAXL7CWpb1vgGH
         uRdr/b4OWGQhJTwuP2vZIpjKAFm519CweJHdSicKy3nE3BYWKzM8/f0/tOJmVnsWc3CK
         ofbPmE+kU383DzjJOFdNEjTZNRmX4Ospc/wb2eylB7QgKfdyW+OtmehKkRFnpycQdcm1
         EZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774444301; x=1775049101;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3GPRX2Yqkh2fKcDql2NbbWnYF5EebgqjYrmp0cfTJ5I=;
        b=IqGKYLnJlOT6T5/x1JrPDXvQzBRGKeB7tL4Iw0SY6o5qAs/Ufqy12CfxUrVuZInsNS
         +5V/bbO85Z2KSY0XYvtF4PSZ5OG3zqROURRVZxqPf5MahnHS9l8lrcSpZDCAbRfRDROs
         U42ui1yfXIn6KNhHXNYkNdTJB+HQwqOmd611xa47FWMgZEuFcnHvCwwkbROaH53uI8J6
         u8QNQGhvWlr+KW4NqGdHveZq2XzOO8lf38UZcmyHczM6vNthq32vt/3e3ZGA8jFmQYrq
         yy8o9HMc8gLvrDzEBl9Ts93XNgFrHUsOg01CNuvth7OgyVXChlqo+HhiqVyOU5HZsETp
         rL3A==
X-Forwarded-Encrypted: i=1; AJvYcCU2oQmw8RH4XXFX7TRRC3gYwrSTNYf5ukPI/s3IeUxSYKLoU8ORM05E5KslXULsY/R4nUo39/SbzUt/@vger.kernel.org
X-Gm-Message-State: AOJu0YyrIsdN4e2LwOTR1Dxfl0Zk/p5bNxmqITK7+As0brhp9wgylrxQ
	yPBLSrjBPdJqFKfDK05pdmci7oH9QguLc1JjsEkkRdgvV3mMx15aVQew
X-Gm-Gg: ATEYQzzPm56bg3jEEQS61DXy9dEXv5EiHS+vZKyjGEJitWpLq4s8GIsrG0ZKVzfkhg2
	tsmi6nz/pmtB72SYRgVQAIgFufmZ5kx3ygjyuVxOqt4pmzNNIHro4mTBfWi0yRLZmbqhYM1DBSQ
	GEzlWROGeuO21oyU3RqGoZRgr+5/3wHRBrrJ9LCZrv0KuKfv+7qIGwyhIG7hhnNCncSjRTEuAAb
	PRXJz2t9eTMl8ke75tbLV6U7H9ifreX9QWdglNK9Abt/BBFp1OpIS6kaO9doLAygxmHIK+VLv35
	ovPq8RaYoo/mBaDkaXHi8K8M4x4KKm7tom9okUTI7WxDQBLXkDmWA0tDyETHOMXqsa1Q9bxBz8x
	WZItu+WdTiRYyEMVofa+jKmyJ+KM9kJy5nqz2KdkihKb97WgvJaTf8Ya/08/MLzK0+iQ0v6y5vW
	h9aC1oBrtSviDqyHQbcBvLgWoVgDi1Yq4=
X-Received: by 2002:a05:600c:4ecb:b0:487:1520:d107 with SMTP id 5b1f17b1804b1-487160aa232mr49865885e9.31.1774444300774;
        Wed, 25 Mar 2026 06:11:40 -0700 (PDT)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711709e95sm132827945e9.8.2026.03.25.06.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 06:11:40 -0700 (PDT)
Message-ID: <852233180cce9c9adffc491e4cdc16f281bfe09c.camel@gmail.com>
Subject: Re: [PATCH v4 3/4] iio: adc: ad4691: add triggered buffer support
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: "Sabau, Radu bogdan" <Radu.Sabau@analog.com>, Lars-Peter Clausen	
 <lars@metafoo.de>, "Hennerich, Michael" <Michael.Hennerich@analog.com>, 
 Jonathan Cameron	 <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, "Sa, Nuno"	 <Nuno.Sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Rob Herring	 <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,  Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Linus Walleij
 <linusw@kernel.org>,  Bartosz Golaszewski	 <brgl@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>
Cc: "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
 "devicetree@vger.kernel.org"
	 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, "linux-pwm@vger.kernel.org"
	 <linux-pwm@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	 <linux-gpio@vger.kernel.org>
Date: Wed, 25 Mar 2026 13:12:26 +0000
In-Reply-To: <SA5PR03MB84250500F1FB9567F7FD2701F749A@SA5PR03MB8425.namprd03.prod.outlook.com>
References: 
	<20260320-ad4692-multichannel-sar-adc-driver-v4-0-052c1050507a@analog.com>
		 <20260320-ad4692-multichannel-sar-adc-driver-v4-3-052c1050507a@analog.com>
	 <83d87ff35002e5c7b9448a5ee7f2791a63c38c38.camel@gmail.com>
	 <SA5PR03MB84250500F1FB9567F7FD2701F749A@SA5PR03MB8425.namprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-03-25 at 12:47 +0000, Sabau, Radu bogdan wrote:
>=20
>=20
> > -----Original Message-----
> > From: Nuno S=C3=A1 <noname.nuno@gmail.com>
> > Sent: Tuesday, March 24, 2026 2:23 PM
>=20
> ...
>=20
> > > +static int ad4691_cnv_burst_buffer_postdisable(struct iio_dev *indio=
_dev)
> > > +{
> > > +	struct ad4691_state *st =3D iio_priv(indio_dev);
> > > +	struct device *dev =3D regmap_get_device(st->regmap);
> > > +	int ret;
> > > +
> > > +	disable_irq(st->irq);
> >=20
> > Should we use disable_irq_sync()?
>=20
> Isn't disable_irq() already calling synchronize_irq() inside it? I can't =
see
> disable_irq_sync() in the current kernel, only disable_irq_nosync().

You're right! Sorry for the noise

- Nuno S=C3=A1

>=20
> > > +
> > > +	ret =3D ad4691_sampling_enable(st, false);
> > > +	if (ret)
> > > +		return ret;
> > > +
