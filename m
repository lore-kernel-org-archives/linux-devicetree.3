Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795461883;
	b=CTZ+E1mkFSB1QlH1Y4OXP8i2o3iH8MNHXuHRm2QE9VAZYp5E+VYUTn0vF5l+dvo/mRjB
	 PS2M6/drAWYdd9GHSC5YtXncX0kKA4wLi2mLK4QXEMB3hhdeSdosPORWHxUxnoAx6T1lG
	 8LDREfwJuRMLhSNhtveWqZv/6ORTf1Ued2ovtwOVUYL7NgZFInPToiSznFqkZlxnyR9y9
	 BS3iw3wU8k1OQLCms93/P7HevDMKYkMMrYnk5InK8Gu4Zfxk2gM3di8bmPmpz93ctWV34
	 K5B9MSzPRRVGpmH0YcKZwR7DIgT8VXe9LYoh8t54+hgizvggJalaTsdL4vqrAWOYfqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mu3NpxL0VDL/oCB28gOtk5lf+/OEsMsSKxF2nMbAOns=;
	b=qZiuWIsoUTarIdN02/YMl6koFDYFG7iUbAG98lVUr5OPsfgNezkn08uJvVFmt/9R/auR
	 JoCAR+kz3zC6quMqqtgerkDZaWANOPFH80dsWXuW9u8Ru10+PhHWhGToJkso4Z6U+UQpa
	 k1Da2onyVEqLF1lkv0DWW8Z/lXp+JR6mWwL8c2ZlvZHKLOzDyULIwAs6vP70J4PUYLuFW
	 qSn7/5C2GspWI1s5c45p9b4QoibzM2+VukWHlz26wuoNVxvlM1gQkMDfvaJewAGZalxkU
	 CTAFTFx7aMkSTN18zdxSSzFTAKb11xT4fbSly18DzKNSEEhcgHgls/V0PjYAQ9N/j4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h7jDIIKH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0905606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0905606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h7jDIIKH
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38644aedba1so5566311eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:24:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795461882; cv=none;
        d=google.com; s=arc-20260327;
        b=S2J9K1LlZvkxqE4Uyd6OSO3sB9MvtgzafA/H+vF3qznedpS9EnuTaK8lXLjed2D8/K
         +DTnXKFl63dMAaX41/n8o6YBMoUbW9RxyoNSHNBbELmwQ+as4/GRYDnLv7hJI64ATR4j
         DSupL4YdFfugPPvCD15P5yp8YYsI09byNCxl1t7t426jh1We+fFeZ+Uk5tRT3uIMYZX1
         FC7Zqn0jFQGvJl1FLwC37FS3QTQjpb9gG8hqSZOJTiKQw/b+q250tU1R/ObS9Rm1kJov
         VOSp4LP9hrNchQ5x3QBD0vILvfz5YPmtLpDgR2UhR3/YrCi/M49+tGSQSnjxjwunqQlR
         OJ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mu3NpxL0VDL/oCB28gOtk5lf+/OEsMsSKxF2nMbAOns=;
        fh=Tqe14x9iDnDO4POYMrewemU/lgBDe5cmOdeXfvE/6Cc=;
        b=Va5zJkr0L11k+zWcNSsubYTuRVfmwfV4tBlo4aqnmTcIe910g4lgPLiRXBG+h5l97E
         XLosJgmQg1J9KWdKqCSp6TJEAkGrIBEczDR2Tl0HZL+Ge7+J3lHPXYz2pSIg6UsWPV+Q
         WD695M++/zuaX6ET9nFN4aK3njFZ4r4RY2CvJP3Gvo0Vfa1l6i4W307y2NeJgghKO2C4
         MTBRmYH4OrTP1MBJ/+99cOV/emb5//CHzC+UH0fAUXgwbZVZegPWCUEz4AbHhWHWymfp
         4ny9RsJvbEVw6vLHNJK+kjYPOu+eWodgNlMjdFszxwk8unRvMHUPKcZFk9wAM8jwKkNo
         bEsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795461882; x=1796066682; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mu3NpxL0VDL/oCB28gOtk5lf+/OEsMsSKxF2nMbAOns=;
        b=h7jDIIKHDbwAJU/+rLgBlKd7MZbSjgSI1Al9rnYKD7Yk1+Eo/U/PcalKvg0hiCo55L
         P919qWgeYHhUTFV7zKjK3i6tOoZ8PIQ9VnO1VbPPzSM0qUr+4lPoQmpM3OvBKEuj1qSX
         wl+kYIZ4Q+rDehFY0h4XMPUxGhB6McliNkn6T/hcwrbwPXrJ5reTHx68UpF9NheNB5tB
         haVNO1NKTLML/nh8jnfoURMF0PQB1kcIZ3j5aMP562Lm9UCCOXBz3UNcM/3i2HDCffQB
         7Qiq5zBBxmYq7LdrBX4r/aLNaQRclterA05Q6Kmal1JoUOMKFL7bLnApornbOIQG7KpG
         WS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461882; x=1796066682;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mu3NpxL0VDL/oCB28gOtk5lf+/OEsMsSKxF2nMbAOns=;
        b=bOKERyR5pD/SI0io8mU0qInQYPw1AdUbUYAjS3sdTd2dkFga1I1ZPAIDMzL4H5inNQ
         Rsze6sWK2dvjRt5+SPtdLLxgzwyQ6Mt2Vt8M28shnobsatI+2m/W7ivh80UBnw48ktK1
         kW/j+sNb5mRTTn7dkX6oLM/E0oOQnyrHI4OzRzOlxN7m97GUqXHCiFjOmoKNzlOCFurv
         FSTHKpKKzlgYbnoOqlLuym1RtQv6FoP7yfIJFHi2TkwCuOqZmb1l89cYnMkzMfCa817L
         8flb01lKq2GiQH4nfiASajvxYVjqzerjUJ30QZFUSuKXKD2oPpAYPL/V9OLTRfAnXjrn
         ZSYA==
X-Forwarded-Encrypted: i=1; AL+hErELTaduLzcFcAc5VaNpNtddOSmI0+uAfsK142dvG0h7aqz8xm/ty5eaI5TWSnvW362k11j8qxRcB2PQ@vger.kernel.org
X-Gm-Message-State: APuU4Z8fXG+Qcva9OrGlMLkyU5MbVbqH71BjAJgw3/KQQGAWUNzBU1Nm
	N9nwIIbfMETZ+lgVHzkkzZ0r0Qaj/6Y/a1aJvi4FJwIIsNj63P2YgbCBYW3wyONQJmagjQvqrC7
	XDqezk2xtsLv0oCRT7mq/mH83LdvjInrjZJgI
X-Gm-Gg: AZFdTZewBWU4TeVj0MkWDEYCmjSZhAcEIDm/1PfTclgROanGQt8baL0NgjqrXvPnDZx
	em67j0ckLOcQlyjDFLzKxD0zSaIwgXVRfpJvSnag8oodHuCN6H5k9/pKNsISlTsqraedWdoT2Nc
	qfsWhLCC0pqDc5SdaExWBo1fN49kr4OwmoDkRh47YXaGlWN0AnHTtuO2q29eu4u0ogxV1XNWBk0
	n7GsDYF6XYBfT4XrfhohjtNNB1vyKQjd24JxHudIGosbeixXPHqN7+dxtaE8u9CQhje0cVeCdii
	oZWfXaxIYsr6141Cfz2z/GNjrjof0UlV8grHKAZzx5e1szz/jymNw4U2oFqqXvLJIQIBVl2gUaX
	TElKEe4UqP4/FBAQSpJSwFoiNXufNDN7fVhuClLlFQImgaX/XilszO/qqcqYjf6Hkdya//x+/O4
	jn1r8pk5ia6KuIE7vVPyAFTrvi5gsuMA==
X-Received: by 2002:a05:693c:8641:20b0:383:50b7:1d78 with SMTP id
 5a478bee46e88-38571223ee7mr14067601eec.40.1795461881820; Mon, 23 Nov 2026
 11:24:41 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123150725.212836-1-clamor95@gmail.com> <20261123150725.212836-4-clamor95@gmail.com>
 <awSNc2piI26LgyAU@ashevche-desk.local>
In-Reply-To: <awSNc2piI26LgyAU@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 23 Nov 2026 21:24:30 +0200
X-Gm-Features: Aa3M54p9p3fpa_qpWITuz1CQVJO7lvIEsLxGf_QiAXXT24x-6L6prR2LGWA5Z2I
Message-ID: <CAPVz0n2yBtFh-TJ13cH8WXtiyzR3tOrbhACyq8MThi_6+7DOYg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] iio: adc: Add support for MAX8907 ADC cell
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-iio@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 23 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 21:0=
1 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Nov 23, 2026 at 05:07:24PM +0200, Svyatoslav Ryhel wrote:
> > The MAX8907 PMIC has a dedicated ADC cell, which provides 8 ADC channel=
s
> > with information about different parts of the power system, including t=
he
> > battery, charger/plug, jack and thermal readings.
>
> ...
>
> > +#define MAX8907_CHAN(_type, _idname, _datasheet_name) {              \
> > +     .type =3D (_type),                                        \
> > +     .address =3D MAX8907_REG_##_idname##_MSB |                \
> > +                MAX8907_REG_##_idname##_MEASURE << 8,        \
> > +     .indexed =3D 1,                                           \
> > +     .channel =3D (_idname),                                   \
> > +     .info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |          \
> > +                           BIT(IIO_CHAN_INFO_SCALE),         \
> > +     .scan_index =3D (_idname),                                \
>
> Using () means that you expect an expression as a possible input. In such
> a case the macro is buggy as it will evaluate it twice for _idname. The
> simple solution is to drop these parentheses and expect that this macro
> won't ever be used with the expressions in the parameters.
>

You have a point but current state should not cause issues as well.

> > +     .scan_type =3D {                                          \
> > +             .format =3D IIO_SCAN_FORMAT_UNSIGNED_INT,         \
> > +             .realbits =3D 12,                                 \
> > +             .storagebits =3D 16,                              \
> > +             .endianness =3D IIO_CPU,                          \
> > +     },                                                      \
> > +     .datasheet_name =3D (_datasheet_name),                    \
> > +}
>
> ...
>
> > +static int max8907_adc_read(struct iio_dev *indio_dev,
> > +                         struct iio_chan_spec const *chan,
> > +                         int *val, int *val2, long mask)
> > +{
> > +     struct regmap **regmap =3D iio_priv(indio_dev);
>
> Then logically better to go further and have
>
>         struct regmap *map =3D *regmap;
>

This is matter of taste, I was inspired by MAX77541 ADC which uses
exactly this approach.

> > +     __be16 data;
> > +     int ret;
> > +
> > +     switch (mask) {
> > +     case IIO_CHAN_INFO_RAW:
> > +             ret =3D regmap_write(*regmap, MAX8907_TO_MEASURE(chan->ad=
dress), 0);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             ret =3D regmap_bulk_read(*regmap, MAX8907_TO_REG(chan->ad=
dress), &data, sizeof(data));
>
> This is a bit too long.
>

101 char, yeah 1 char too long, though maybe it is not wort resending
for a single char too long?

>                 ret =3D regmap_bulk_read(map, MAX8907_TO_REG(chan->addres=
s),
>                                        &data, sizeof(data));
>
> > +             if (ret)
> > +                     return ret;
> > +
> > +             *val =3D be16_to_cpu(data) >> 4;
> > +
> > +             return IIO_VAL_INT;
> > +
> > +     case IIO_CHAN_INFO_SCALE:
> > +             *val =3D max8907_default_ref[chan->channel];
> > +             *val2 =3D chan->scan_type.realbits;
> > +
> > +             return IIO_VAL_FRACTIONAL_LOG2;
> > +
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +}
>
> ...
>
> > +static int max8907_adc_init(struct regmap *regmap)
>
> Why not name it 'map'?
>

Because regmap is more explicit and is used consistently across the driver.

> > +{
> > +     u32 value;
> > +     int ret;
> > +
> > +     /* Enable internal voltage reference. Exact purpose of bits is no=
t known. */
> > +     ret =3D regmap_update_bits(regmap, MAX8907_REG_TSC_CNFG1, GENMASK=
(1, 0), BIT(1));
>
>         ret =3D regmap_update_bits(map, MAX8907_REG_TSC_CNFG1, GENMASK(1,=
 0), BIT(1));
>

which map? bitmap? statemap? or maybe geographical map?

> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Check for internal reference IRQ */
>
> Please, make style of one-line comments consistent ("all or none" are wit=
h or
> without period, same for the first letter =E2=80=94 capital or small).
>

First comment has 2 sentences, that is why it has periods. Second only
one, so it does not need period.  "same for the first letter =E2=80=94 capi=
tal
or small" - have you even checked the patch?


> > +     ret =3D regmap_read_poll_timeout(regmap, MAX8907_REG_TSC_STA_INT,=
 value,
> > +                                    !(value & MAX8907_MASK_NREF_OK), 1=
0, 1000);
>
>         ret =3D regmap_read_poll_timeout(map, MAX8907_REG_TSC_STA_INT, va=
lue,
>                                        !(value & MAX8907_MASK_NREF_OK),
>                                        10, 1 * USEC_PER_MSEC);
>

hmm, replace 1000 (4 chars, pretty readable) with USEC_PER_MSEC (12
chars and twice wrapped line and needs tinkering or looking into
units.h), I don't think so.

> > +     if (ret)
> > +             return ret;
> > +
> > +     return regmap_update_bits(regmap, MAX8907_REG_ADC_SCHED,
> > +                               MAX8907_ADC_SCHED_AUTOSCH_ENABLE |
> > +                               MAX8907_ADC_SCHED_AUTOSCH_TIME,
> > +                               MAX8907_ADC_SCHED_AUTOSCH_ENABLE);
> > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>

I would like to hear what Jonathan has to say.
