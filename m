Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02AA3E122C
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 12:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774960671; cv=pass; b=L10Z2xSKuW+BRPLxuIywr3bvOezvrr46wA5HYLglk7q6QEkJigeRjpwc1Sm260tQeUSi40WzxsUXAZWXS0hDEzPWUXYZk3zGLRkaYOxxJIIdeW2aCcrB/r1MViKPzjWb6ThJJz+pYEzJaJ7yY6LsEsv8n4eOskHfwXPsQiQU4Xo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774960671; c=relaxed/simple;
	bh=jPbNg7vnffslAngWLp1YXKpgROU2PnXJpaYVtorkLMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UCSHUnMcdiC0jfDIJBLJ3ZG5aH3X0MFeTC6+rq7ldb1GxWXQI0EPTAXyjeORhOYRytWTPb51z74ajb5K03oQ6F9rNtjzMO1193qWT3N2Lj3BYeF3gdBmjiUIiqDNqG8rnBu+vU4BT+LuTPfhLbKoBozrrB7bGI51RJxIO7OKi00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=OHFU5U3j; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="OHFU5U3j"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b9a0762ed5fso818565466b.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 05:37:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774960668; cv=none;
        d=google.com; s=arc-20240605;
        b=N2wbAmmwDU6PYsudQ42qv8QvojzDtwBj4gSx0PayWBKg4Yest62hmZ33nGUjF2U1yz
         BHsUPwWZQV7kx7vpk9kqHM81iIKfOXGHySQNVKP0MB8tMD/gMQd/fKLQEkd3zP1qymzA
         d+DQmG9VZ1eiYqQvmaGc6WMTg9P6WuBuPjqnhjRJ2vpLoIT1dbAugfLl7ypuVB88rpb8
         yr1prQnVYjosPhEzHLZM4tfAaip71q9DbHUNriY7imi5+4FRxOyFEzCkXmc1lZA0ifrs
         Kx/GOBH7D47e+0wUwp6B8vfz56PLh74JUIcTXYb8xbcRi1cwwuE4mthy2DYtjYZkS3EO
         I1HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=APk6GhrrYthp1r3qG0lb9C4gKQqFk3Q9Fs1Ji6JZing=;
        fh=2z9Cn2iY7VKR3/ZlXXqMVoE22n0ECd9eFZKHA35ul2o=;
        b=QkmC+lGt/8ut52RoXFkO1nV6so2KJCAz4zJml1YUkdtH+53tu7njCGBkzPuJEYX+gk
         /+zUd+RiCTkDNqucNSgz1byrv7PNKxK6cSJaUyhTNysRnXXGSpRu1wI8MCNOjT90q/7B
         WPAy/gvwJF7OsnmaDjaQso95o6CeX5QPmn0Fxbe+moNQvxUpfN2uVbO6OXXbSAoyCFZJ
         bcp7HDvNaCcbBttJdpRqLuTrdUNohKIMxrEbi7kFPZG/teBkPvfHpnukLemj0CfTylEb
         feAvIzum2HK15aa9ME7SpnaJxOr5v1WpD2XQ7oSYJ/WufkqE6V9WyR1S4d9K0UmO8iYu
         CpIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1774960668; x=1775565468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APk6GhrrYthp1r3qG0lb9C4gKQqFk3Q9Fs1Ji6JZing=;
        b=OHFU5U3j66PbvMavlSF+a6mpP45beTwgYQnPzHAdFNx0leuJLj5waAEmp4l9tkgnrT
         pNvR7PtQo85qheqJR39ZyW0Mups/YVBmIV2XTaoUazYWfzEeQHBYnaEMJGasa6b5fmNw
         jfa75bC3De8hZ7wju11xbrgk3XyItkeJNvutjovRhS4GL8LjXYWQSTk9+HlhC1j/BWFW
         12LsFxyxtdOQHd6kOVIfGvnXpYAFKn3e/5wOjuYCaBcKc1lm5ok8e5okhmlilT1iN0tu
         IB3gIQ6KASqksjWF5seja8ZdiGGYmjYScSFudcWC/0Jgoak+g48Ve5iMAnRwRej9WvWo
         uS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774960668; x=1775565468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=APk6GhrrYthp1r3qG0lb9C4gKQqFk3Q9Fs1Ji6JZing=;
        b=a1jjg8EyOho/fOiJQA8N6YGGthXry9qWJ7owuuXrKM5bUQCzA1a+12DsBTqMK4JN2F
         NPr0JnwhOM4V6IMZIpODUNimzSgICnRuaG6j4BRN4o2afRQsHqibjHOuVHpQrgN43oaH
         KD1nMiMRn9lrTZB+xm+aktYsYdw16bKDEINUZRfesct3VOIMaHTdhw+2X4AyTvnwR1UZ
         qOuSQJTfM8m4m26tgXyyb/X9dl2cVPm3LFp4Alf3JGL0H6RHxVfc5DlQIakGSZJGXtKt
         ffIDC8L21jBmzVJu+PYiKhmpwO9LTca7JUBxXFTmj5Eh+r+p71/FE+pfZ1PpAS4IgQ3D
         25iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtkVuBRGNyTSx+Gp0cKCjTX+BzpFcGt0TmLG8EgGxQmKrKtTI9oBTrTSlceK1sv/uALqmeBGjtQU6F@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Pxb6gom9WKrGvIDOeiytev/PDt6o1oKLQH/IJlw7KLheeUal
	musXzM4cBIIQrT50yDeV2MUgYLWPisPb63LJzMm0+nGrI6qoJkN+ISGx/slllNypQiZXRmCh7jO
	Ya3sEv7XF1HOVnKrq+1x3gmoNji9ArOySGoXwbHOfpw==
X-Gm-Gg: ATEYQzzOKqnGJqLypECHdAZZdvSqZRYwgTTaKR6uz0Z1iVpws7U+mD1ana4WF/ZNPFn
	zBHKrhmdDw+iWDWJE4/HaDqf92vvdu2xbhkGSxknvlvl+QEZokWZrLbswFG4U5rgv0BTT32ubMw
	rRO/oJyyOb/9Ely/E6UGhUttDq3bAZKPXYBb+hOk8KjPoM7GtmUhr1Wmztjv5Ry0rF2R1XweBg/
	bfMa4NWvt6KuMcslO1SdaONqg1mR0jwRnKpXeWFLDnX+HqdveoMV/kokIAjQesTMJ8TZVmdTB/L
	ezSAXEI=
X-Received: by 2002:a17:907:7245:b0:b90:4838:46ff with SMTP id
 a640c23a62f3a-b9be855a7cfmr188103066b.21.1774960668061; Tue, 31 Mar 2026
 05:37:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324-bq25792-v5-0-0a2eb58cf11d@flipper.net>
 <20260324-bq25792-v5-9-0a2eb58cf11d@flipper.net> <20260331102710.GB3795166@google.com>
In-Reply-To: <20260331102710.GB3795166@google.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 31 Mar 2026 16:37:38 +0400
X-Gm-Features: AQROBzBsOkDwD-_sfwvUc3QMEB-ceAPpDa8MP94cdzSz0KL5-FxEUULnB7SLa5s
Message-ID: <CAKTNdwE4omfEkd6FNdj=hZUY2ZwLprXzUu1L4juFhWCxbWEjpQ@mail.gmail.com>
Subject: Re: [PATCH v5 09/11] mfd: bq257xx: Add BQ25792 support
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 2:27=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Tue, 24 Mar 2026, Alexey Charkov wrote:
>
> > Add register definitions and a new 'type' enum to be passed via MFD
> > private data to support the BQ25792, which is a newer variant of the
> > BQ257xx family.
> >
> > BQ25792 shares similar logic of operation with the already supported
> > BQ25703A but has a completely different register map and different
> > electrical constraints.
> >
> > Tested-by: Chris Morgan <macromorgan@hotmail.com>
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > ---
> >  drivers/mfd/bq257xx.c       |  54 +++++-
> >  include/linux/mfd/bq257xx.h | 412 ++++++++++++++++++++++++++++++++++++=
++++++++
> >  2 files changed, 463 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/mfd/bq257xx.c b/drivers/mfd/bq257xx.c
> > index e9d49dac0a16..31654925afa5 100644
> > --- a/drivers/mfd/bq257xx.c
> > +++ b/drivers/mfd/bq257xx.c
> > @@ -39,6 +39,39 @@ static const struct regmap_config bq25703_regmap_con=
fig =3D {
> >       .val_format_endian =3D REGMAP_ENDIAN_LITTLE,
> >  };
> >
> > +static const struct regmap_range bq25792_writeable_reg_ranges[] =3D {
> > +     regmap_reg_range(BQ25792_REG00_MIN_SYS_VOLTAGE,
> > +                      BQ25792_REG18_NTC_CONTROL_1),
> > +     regmap_reg_range(BQ25792_REG28_CHARGER_MASK_0,
> > +                      BQ25792_REG30_ADC_FUNCTION_DISABLE_1),
> > +};
> > +
> > +static const struct regmap_access_table bq25792_writeable_regs =3D {
> > +     .yes_ranges =3D bq25792_writeable_reg_ranges,
> > +     .n_yes_ranges =3D ARRAY_SIZE(bq25792_writeable_reg_ranges),
> > +};
> > +
> > +static const struct regmap_range bq25792_volatile_reg_ranges[] =3D {
> > +     regmap_reg_range(BQ25792_REG19_ICO_CURRENT_LIMIT,
> > +                      BQ25792_REG27_FAULT_FLAG_1),
> > +     regmap_reg_range(BQ25792_REG31_IBUS_ADC,
> > +                      BQ25792_REG47_DPDM_DRIVER),
> > +};
> > +
> > +static const struct regmap_access_table bq25792_volatile_regs =3D {
> > +     .yes_ranges =3D bq25792_volatile_reg_ranges,
> > +     .n_yes_ranges =3D ARRAY_SIZE(bq25792_volatile_reg_ranges),
> > +};
> > +
> > +static const struct regmap_config bq25792_regmap_config =3D {
> > +     .reg_bits =3D 8,
> > +     .val_bits =3D 8,
> > +     .max_register =3D BQ25792_REG48_PART_INFORMATION,
> > +     .cache_type =3D REGCACHE_MAPLE,
> > +     .wr_table =3D &bq25792_writeable_regs,
> > +     .volatile_table =3D &bq25792_volatile_regs,
> > +};
> > +
> >  static const struct mfd_cell cells[] =3D {
> >       MFD_CELL_NAME("bq257xx-regulator"),
> >       MFD_CELL_NAME("bq257xx-charger"),
> > @@ -46,6 +79,7 @@ static const struct mfd_cell cells[] =3D {
> >
> >  static int bq257xx_probe(struct i2c_client *client)
> >  {
> > +     const struct regmap_config *rcfg;
> >       struct bq257xx_device *ddata;
> >       int ret;
> >
> > @@ -53,9 +87,21 @@ static int bq257xx_probe(struct i2c_client *client)
> >       if (!ddata)
> >               return -ENOMEM;
> >
> > +     ddata->type =3D (uintptr_t)i2c_get_match_data(client);
> >       ddata->client =3D client;
> >
> > -     ddata->regmap =3D devm_regmap_init_i2c(client, &bq25703_regmap_co=
nfig);
> > +     switch (ddata->type) {
> > +     case BQ25703A:
> > +             rcfg =3D &bq25703_regmap_config;
> > +             break;
> > +     case BQ25792:
> > +             rcfg =3D &bq25792_regmap_config;
> > +             break;
> > +     default:
> > +             return dev_err_probe(&client->dev, -EINVAL, "Unsupported =
device type\n");
>
> Nit: Shouldn't we be returning '-ENODEV' here for an unsupported device?

Hi Lee,

Indeed, I've had a quick look and other drivers seem to return -ENODEV
in similar situations. Shall I respin a new version with that change?

Thanks a lot,
Alexey
