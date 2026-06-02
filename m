Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4456E3D349A
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 10:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780395514; cv=pass; b=RuytiAYbQ2tSqdWILI5MS0za2tQqwLidzbyR+ZIrH8ZNrBdgQhx235puEE0j5wHq0VA66q+dk4wwSuVQl0ydmoeDf4iDpafqINS3RZ4LUa6pPfhcj2djzZIQKRrC4bbaVFkMYGaNAJdULbrPlsoLeTNrmZwqPF+iLm01g3iI6k8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780395514; c=relaxed/simple;
	bh=tsb+ShdNHjPhqRT+1y1ob/npW7bqLOA6CccHz+MAA/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T+qvpnqwlfoxk/S4c9SgVuyqGPJ6J6xKd7/j2QmIUERmvi0mP1DdImESdRJhvoFttPtkv9Afn7Q0UeuvdA0EXrfkfctgHykS+3DeyTUc/u3xAYRYjcNNSSoguz38g8cFeeUbQ9lOO7HK8633Ck0YglPap1RjbTMlqorFKLwmT50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LylQJDHM; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LylQJDHM"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304e58292d3so392100eec.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 03:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780395512; cv=none;
        d=google.com; s=arc-20240605;
        b=HFXEGJFP98Ln5J9CGbnNNNDf84qxFwFxLJIy9pidLRsPTECDdDjZTioF9va6OrZvOW
         /6iiDRdaakPay0hja63ENmk8KH+O5RNycf/8LQ1sJOdhvc2UMTJle8Al3ARt9T+IheDG
         hs2PgAmRWE4BrQIycjth5HimYBbl97HYBxHl8+6vm7VN+dKdG0+a2tF9HXGkMxImUm0m
         p6IW0L0B5omlDe4TjZ5Woca1gpHQ2PJ8WSBVsfTFE415KLJRIUnLC7uJ+GdM3eZHSLRV
         st8XXk5qRFeDHMjWoQ/aJY2qhTA5t6PjCIMLybcq9ewXz6JpL8/NJ+Wg4vHxpMbte+IW
         ykJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OFZUuzZ+0IS+9EDZyoznNJZXjuYIGtdVqC67r/Z0ScE=;
        fh=GCQZRiQLYCs7uEGTLbUxD4JukDvVCvpWrkr4hOjJqKE=;
        b=jNaMWhBwhhXoKC8796UVtR7f8b923FEAphszOZK7pT98JLHQe6EuJgC/swrqkgq/fL
         5g9yTYlkgDdVtToWqbjavlUQNnP2dV8Qyqv/bGeJCw8+77uCZ+5CiIxRFklUhzHovDOR
         bBfYdLdZ1xNkfclys9Kn/qyhsk6fkyO9OuPAnoP5umSHjM4eMo2g9lJ8uAdnfnmsy4ij
         cEGukVGCsTuE6LX05/r1mcgkOaDMJBa1q7zzgG+SIS7JjAw28Gk5X8AUHTsIDOehiUm4
         /C7sdosoE2DcfLsoFgZx/OO7JheTFQlNZxKizAqfImWlYURFBfN60zD3KRSQ/uLpHyFw
         GJag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780395512; x=1781000312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFZUuzZ+0IS+9EDZyoznNJZXjuYIGtdVqC67r/Z0ScE=;
        b=LylQJDHM7J3/c/sYuUUvJyKb0EF1e5Rl9EUfysxJVUAuGxlqlY7a+pI9K6pjiG4X6J
         q/3cWwz79o2Qxuir0eyyzKacKHOnNhh4k6bNnUrL1XZFRqgVAPYcuWDH9vw7Z2ZYFUms
         v62n8tEG782bboDoZdrAnJKQweTrNEgVMUyF7yo4ZQWk5Z3gtVUnFqYXQM+6bxci/yNw
         1riH9bioEJi/Vj3THhDWpzOkP06fmWgFm1tP6hV4hF/V2CDUofxrvycCfEX8sEZ05dBh
         zVHBYXWqsq7+r7CIW+5ZehlYiO+OLcqmHBWMKTKzB6NB8L5c5E1i3MzFm2ZSQLOSnMWa
         iwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780395512; x=1781000312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OFZUuzZ+0IS+9EDZyoznNJZXjuYIGtdVqC67r/Z0ScE=;
        b=qlfNNer54iHCoojHw9jRdz54x2NQ0hx+VXhs9kS6bzUV6RgyrM7O68HO3Rfa1YjuIJ
         lV4jj7mzJPTnW0JORyqO6gSKOMg4srN3lMcmEpuDDCBvd7WXLCrGdXQNeZcu+Bz7htCw
         KmMd/qlQzY4qWP6yq63WjzZzXLMfflKqcbkFPfYM1sBM1GKSx4okjAURRMzdyGh3hmRn
         53rZ3WXYgM3RgghZT+rH5r/I10zqAD7a0UqbxHA1tD5BqpJxmSW/wY9YVJ2GetVBMfo1
         uRVHdqVeQ9VMiPgmXGuhLc6DvvyqZIydUgLvI4rB52MhSletYlTVYSGVrnQY5nQYQy0N
         S79w==
X-Forwarded-Encrypted: i=1; AFNElJ8gh4D0RowO/SNCTlx20mzSEV7HyGTxYkd9OkMRvlOgvnJvzJAHnX20T03d65cb7EBhL8kNpywgXo7F@vger.kernel.org
X-Gm-Message-State: AOJu0YwUR+ScP6Sthmh2V/1ZNmD0PlYOrcKJ1GIw0koIUKDXolWOS+OA
	cWEIUfyYvZRKnTnO7Bj5Eh93ArwWTDg/RLR3gN/AZpyzX8esdHoR600t9tiR3H7e7WYE9nJCYhF
	wW6MEAr1AtSdtK3R/nwbyOMYDs+/8ZXI=
X-Gm-Gg: Acq92OHg79ev6Y+ciXskcVjEQH3V+Z9ZbAhsHlk3AuezIPsG4Nhl6T1Ka53AVAH0UhB
	eXcuORtvNx6oi7aEnXdD5BIpOdkM4AVHy3hBA9IH+zPd7QBsUQ0ZISXd/q66eqJyNNKPbQJcABQ
	EOtcsdn8svyXjISp4bA3NTksnfqyeSz3MD/Yjz30rmT41u6kS1Gbdi29fNOWrBbYBpg+NXHboSC
	vCBaFI1sEtmi0R/fa68PjRaqAqEpeSTeK9ecccgnsghW9cuIoWojXj16yPyNoNQoMWj7KGrBetI
	lKPPwVl71KI21XUbANgtjeJj1wDMLA==
X-Received: by 2002:a05:7300:5726:b0:2e2:3381:2fba with SMTP id
 5a478bee46e88-304fa523d3amr7629148eec.3.1780395512175; Tue, 02 Jun 2026
 03:18:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601151831.76350-1-clamor95@gmail.com> <20260601151831.76350-3-clamor95@gmail.com>
 <ah6O1h8SPwjf3rV1@ashevche-desk.local>
In-Reply-To: <ah6O1h8SPwjf3rV1@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 2 Jun 2026 13:18:20 +0300
X-Gm-Features: AVHnY4JHC1yQblwim_AIT-fQGP6xAd5YIyw3Q9PUntQ6X-j1sNWq1k3TeFJP-_c
Message-ID: <CAPVz0n2vRFMKagLP+Ssq7n0ECp4_4mT6k7Bo9z=rxrSNCfCRKg@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] mfd: lm3533: Remove driver specific regmap wrappers
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 2 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 11:05=
 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Jun 01, 2026 at 06:18:22PM +0300, Svyatoslav Ryhel wrote:
> > Remove driver-specific regmap wrappers in favor of using regmap helpers
> > directly. The wrappers are mostly equivalent to the standard helpers, w=
ith
> > two exceptions: regmap_read requires an unsigned int pointer, and
> > regmap_update_bits has the mask and value arguments swapped. These
> > differences were accounted for and adjusted accordingly.
>
> We refer to functions as func(), exempli gratia, regmap_read().
>

Noted.

> ...
>
> > static int lm3533_als_get_current(struct iio_dev *indio_dev, unsigned c=
hannel,
> >                                                               int *val)
> >  {
> >       u8 zone;
> > -     u8 target;
> > +     u32 target;
> >       int ret;
>
> While at it, move towards reversed xmas tree order
>
>         u32 target;
>         u8 zone;
>         int ret;
>

Noted.

>
> ...
>
> > -     ret =3D lm3533_update(als->lm3533, LM3533_REG_ALS_ZONE_INFO, val,=
 mask);
> > +     ret =3D regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_ZO=
NE_INFO,
> > +                              val, mask);
>
> It's better to replace this to use _set_bits()/_clear_bits() or even move=
 from
> the above conditional (not in this context) to _assign_bits().
>

I will take a look.

> ...
>
> >       else
> >               val =3D 0;        /* analog input */
> >
> > -     ret =3D lm3533_update(als->lm3533, LM3533_REG_ALS_CONF, val, mask=
);
> > +     ret =3D regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_CO=
NF,
> > +                              mask, val);
>
> Ditto.
>
> >       if (ret) {
> >               dev_err(&als->pdev->dev, "failed to set input mode %d\n",
> >                                                               pwm_mode)=
;
>
> ...
>
> >       /* Make sure interrupts are disabled. */
> > -     ret =3D lm3533_update(als->lm3533, LM3533_REG_ALS_ZONE_INFO, 0, m=
ask);
> > +     ret =3D regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_ZO=
NE_INFO,
> > +                              mask, 0);
>
> _clear_bits().
>
> >       if (ret) {
> >               dev_err(&als->pdev->dev, "failed to disable interrupts\n"=
);
> >               return ret;
>
> ...
>
> >       u8 mask =3D LM3533_ALS_ENABLE_MASK;
> >       int ret;
> >
> > -     ret =3D lm3533_update(als->lm3533, LM3533_REG_ALS_CONF, mask, mas=
k);
> > +     ret =3D regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_CO=
NF,
> > +                              mask, mask);
>
> _set_bits()
>
> >       if (ret)
> >               dev_err(&als->pdev->dev, "failed to enable ALS\n");
> >
>
> ...
>
> >       u8 mask =3D LM3533_ALS_ENABLE_MASK;
> >       int ret;
> >
> > -     ret =3D lm3533_update(als->lm3533, LM3533_REG_ALS_CONF, 0, mask);
> > +     ret =3D regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_CO=
NF,
> > +                              mask, 0);
>
> _clear_bits()
>
> >       if (ret)
> >               dev_err(&als->pdev->dev, "failed to disable ALS\n");
>
> ...
>
> >       else
> >               val =3D 0;
> >
> > -     ret =3D lm3533_update(led->lm3533, LM3533_REG_PATTERN_ENABLE, val=
, mask);
> > +     ret =3D regmap_update_bits(led->lm3533->regmap,
> > +                              LM3533_REG_PATTERN_ENABLE, mask, val);
>
> _assign_bits() and so on...
>
> >       if (ret) {
> >               dev_err(led->cdev.dev, "failed to enable pattern %d (%d)\=
n",
> >                                                       pattern, enable);
>
> ...
>
> >  extern int lm3533_ctrlbank_set_brightness(struct lm3533_ctrlbank *cb, =
u8 val);
> > -extern int lm3533_ctrlbank_get_brightness(struct lm3533_ctrlbank *cb, =
u8 *val);
> > +extern int lm3533_ctrlbank_get_brightness(struct lm3533_ctrlbank *cb, =
u32 *val);
>
> We don't need to keep 'extern' for ages.
>

I will no inflate this patchset further

> >  extern int lm3533_ctrlbank_set_max_current(struct lm3533_ctrlbank *cb,
> >                                                               u16 imax)=
;
> >  extern int lm3533_ctrlbank_set_pwm(struct lm3533_ctrlbank *cb, u8 val)=
;
> > -extern int lm3533_ctrlbank_get_pwm(struct lm3533_ctrlbank *cb, u8 *val=
);
> > -
> > -extern int lm3533_read(struct lm3533 *lm3533, u8 reg, u8 *val);
> > -extern int lm3533_write(struct lm3533 *lm3533, u8 reg, u8 val);
> > -extern int lm3533_update(struct lm3533 *lm3533, u8 reg, u8 val, u8 mas=
k);
> > +extern int lm3533_ctrlbank_get_pwm(struct lm3533_ctrlbank *cb, u32 *va=
l);
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
