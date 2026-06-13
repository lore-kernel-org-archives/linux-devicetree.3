Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9A2388386
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 08:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781340463; cv=none; b=JJOf4FyYm4HSvkJsqzEFf23a2cCLLC2pkHum44pVx4ZsxZv4mGPlF9rhnzaP3/AAfqgETFlY5wdMA2pV4/u+i2/eQ944ab2VuMxIuK8P+180Ul5Cq+69mycmXXmhK38IWoBphm1SRpAml29loyMCqKJHFqpZtLsNEMxPTtPgghw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781340463; c=relaxed/simple;
	bh=RO5qDwNntsWRVf3hk2MbhYoXXAqEmMOVwsDvzO/JX+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MCQsfbifih5ZvlxzXIkjFQJQESMVuxZR40+Yj0lqtc3jDEp9cFR+l6HoLIqL99guggMNe7ecQl+GIKc44tBYZkXaYjs3DvZvUnsW8EL6SCppj+ChbwXpITv4OprxakPHJ0uvDYa6FR+k/YgMtU7MqNVqh135aaw3EkGUfVxjxF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sirat.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sirat.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66077e888b2so1660527d50.3
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 01:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781340459; x=1781945259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jGiCJ3o3O6zZWSIlnyakLQENXzMeJV1nXpt/hPjZYFY=;
        b=LDRCQqbnHfWvc7nQgNsSR3AkjXfaIdZc4swrBLObw1PVsRDNnimqCBMc42gqEk5Ogd
         v7NAGVLcrOgA9p9qlhhanrMH+jyibGT5YemWjxWNYtW+T6sfhTF6tPaOQpFsifLwIia3
         sVu38r7P//JYVdCKjJnJzWUz8C+7oQGtWGHEsCQjsydHvzVc+9TaDKE5jfpeGRTKohS7
         a31iKruKtnsJYZOXvKf5WBPqpb+V6KTEYny3IzZ7h+C37F0Tlyze+263BD2gX80CesiE
         WVwmXGfFWrbCnPD0+TAuVxcy9R7ybZEXwuS3EtDMvwm563gFHzJ9oT/S9rDSSKkbbz70
         Rhvg==
X-Forwarded-Encrypted: i=1; AFNElJ91mOHw9MSZQwQi9rqOXJl+v5/Gyy6XCXGALTDqcHXV5Bd99KXdyVFAp8HYzJuz7+TA7Ccn91dmZqnl@vger.kernel.org
X-Gm-Message-State: AOJu0YysBN+E8Ll7vnqy0QzjXGbL8IrcwQ6rw0yra/XdF4UHMCKub43I
	0I9Xslks0T1umalv7jPxlhZdb1JOgNvLmIXPT3I8hL+RCJm4xARp2RJgUmJ/DLa8
X-Gm-Gg: Acq92OEvE/Nji0GH2koFMG+i6erzm1kYw2Y7vJeczPrFHdi86SHN7z2tru9nSXTrmjO
	aQxdKzEjcum31W/WapsrbA3PccXxt5TE/udSo47m4I2y9lWRX/Cn2bdwG9i7kZntY2fEsMtQdGo
	gpdueYT9bVtYFGa9w9yxsjmmsDFByDYAGH5zIQYELqnjDSYwnqZ+snQO8k82sRLr4TAylOni27c
	HHhc7CZWKrkx3WqZrXt8gmJPeSkxr1T4rZLoFUSlWLJwiaPt4yIZfIAJmRUYKyA7ir9gDsaupFG
	o4d1uLMmkp130mkGxdoIFxzZmlwhZojg+TaNjyQS+aUrFPJRF0yocg0s35TidEFFTpaENUzSmB5
	+sFpnI2edAAkKzivp/+0TkHC1x1DbzIDkA2ZNvDw9PmCsPumsD+LeVMuGZrg0M/O+gm0QCg1yC5
	ibY4hWD4A86fbvI5diU9LGXVUpICahw+vouVMv9lixnr3R8BA2QSUnTnbGwAJ/uB9eLu/N75MXV
	n/v2pZD/xsnBoJy0Fw4ZFMgJu3892pIkVY5n2ed1QJPSlywYnTHZ/ek/lfaFAzCtAjlkI1IcceH
	hdEDZ7VM4pOB9fpP06YJEWN4ZKAxCcW5wQJPc+BZdwPtqvfRsn44YQ0eog==
X-Received: by 2002:a05:690e:14ca:b0:660:5d71:7b37 with SMTP id 956f58d0204a3-66278335569mr5719277d50.54.1781340459082;
        Sat, 13 Jun 2026 01:47:39 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66274c43d95sm2240983d50.4.2026.06.13.01.47.38
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 01:47:38 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7dfceeaf168so18956077b3.0
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 01:47:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/iREaA4vr4qUIPHOC0N8Kd8ZKBx/HKCgGFcALUGGFCjGoNZqWJXv63DmFVZVVCQpT3VCUK90qM7mC/@vger.kernel.org
X-Received: by 2002:a05:690c:8d13:b0:7f8:7e31:28a9 with SMTP id
 00721157ae682-7f87e312c90mr32729197b3.49.1781340457950; Sat, 13 Jun 2026
 01:47:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612124557.13750-1-email@sirat.me> <20260612124557.13750-4-email@sirat.me>
 <20260612180235.3e505c66@jic23-huawei>
In-Reply-To: <20260612180235.3e505c66@jic23-huawei>
From: Sirat <email@sirat.me>
Date: Sat, 13 Jun 2026 14:47:25 +0600
X-Gmail-Original-Message-ID: <CANn+LWJoSiCY8cTBNZd9w0H-b-D6C7rH2j8QmB57eTKO0g-x_A@mail.gmail.com>
X-Gm-Features: AVVi8CfiNR2HD_SQ5WBiWnwoLYHNxM04uaXSAZAXJUuauVTe4aUCPJODiEkEFXs
Message-ID: <CANn+LWJoSiCY8cTBNZd9w0H-b-D6C7rH2j8QmB57eTKO0g-x_A@mail.gmail.com>
Subject: Re: [PATCH 3/3] iio: magnetometer: add driver for QST QMC5883L Sensor
To: Jonathan Cameron <jic23@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 11:02=E2=80=AFPM Jonathan Cameron <jic23@kernel.org=
> wrote:
>
> On Fri, 12 Jun 2026 18:45:27 +0600
> Siratul Islam <email@sirat.me> wrote:
>
> > Add driver for the QST QMC5883L 3-Axis Magnetic Sensor
> > connected via i2c.
> >
> > Signed-off-by: Siratul Islam <email@sirat.me>
>
> Trying to avoid repeating stuff Joshua already covered.
> Various comments inline.
>
> Thanks,
>
> Jonathan
>
> > diff --git a/drivers/iio/magnetometer/qmc5883l.c b/drivers/iio/magnetom=
eter/qmc5883l.c
> > new file mode 100644
> > index 000000000000..055e51570635
> > --- /dev/null
> > +++ b/drivers/iio/magnetometer/qmc5883l.c
...
> > +#define QMC5883L_OSR_512     FIELD_PREP_CONST(QMC5883L_OSR_MASK, 0x00)
> > +#define QMC5883L_OSR_256     FIELD_PREP_CONST(QMC5883L_OSR_MASK, 0x01)
> > +#define QMC5883L_OSR_128     FIELD_PREP_CONST(QMC5883L_OSR_MASK, 0x02)
> > +#define QMC5883L_OSR_64              FIELD_PREP_CONST(QMC5883L_OSR_MAS=
K, 0x03)
> These are used for matching - normally we'd add defines for the filed val=
ue and
> then use FIELD_GET() to extract it for matching.
> e.g.
> #define QMC5883L_OSR_512                0x0
> #define QMC5883L_OSR_256                0x1
> rather these.
>
I thought using _CONST would be better for compile time checks and not
needing to use FIELD_GET everywhere. The values 0x01, 0x02 don't have
a lot of meaning in a vacuum. But of course you would have more
experience about it and I'd love to know why we shouldn't use const.
> > +
...

> > +static const int qmc5883l_rng_avail[] =3D {
> > +     0, QMC5883L_SCALE_2G,   /* 2G */
>
> I'm not sure the defines really help. Perhaps push the value down here
> and then look it up from this array when matching.
>
But then the array will be serving more than 1 purpose? kind of like a
side effect I think.
>
...
> > +
> > +     /* DRDY pin no used in this version of the driver */
> > +     ret =3D regmap_write(data->regmap, QMC5883L_REG_CTRL2,
> > +                        QMC5883L_INT_DISABLE);
> I don't mind if these sorts of cases go a little over 80 chars as sometim=
es
> it helps readability.
>
I try to disable clang-format for cases like this. It's an oversight on my =
side.
>
> Does it really reset with interrupts on?  That's odd.  Mind you the
> INT_ENB sounds like it would be an enable but as you have named it here
> it is actually a disable so all bets are off when it comes to sensible ;)
>
The datasheet says "The interrupt can be disabled by set 0AH[0] =3D 1"
which I took as it's enabled by default.
I explicitly disable it just to be safe.
>
...
> > +static const struct of_device_id qmc5883l_match[] =3D {
> > +     { .compatible =3D "qstcorp,qmc5883l" },
> > +     { },
>
> As below, no comma.
>
I did it so that clang-format doesn't wrap it all in 1 line. I forgot
to remove the comma before sending the patch. Sorry.
> > +};
>

Thanks
Sirat
