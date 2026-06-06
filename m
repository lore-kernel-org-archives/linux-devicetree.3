Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E7F2E7F3A
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 07:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780730576; cv=pass; b=EZibf4YZ4Xo+kNW6mGelyVbRFl08k1tKuE9OxXSkHV0YXx/NcYm4f5r0jGU6gZ+uyK/SkROQs3ZlUZgLrxEd6z3ih687o4n9WrgAXDpJayzyq/nNv4pRARFOOBr0hC3tHZ755ng9wi+wIO/b3oVW4t/U2CkIVW3XNlrUZ8twt0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780730576; c=relaxed/simple;
	bh=EdOBiUbIj1sa3p5dKmb4uizhrFu5/uX1E3lqCuVG5ss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H0kNoN7o8B7hH/S8HX2yhm30BOcge1xHhsPF+adkJiDT9utggSB2dL7fcHSPUWSwa+DJDpiq4X7GbguidpawnSQwKJt84IeZ+PO4+SYBB/HCvDxyCQcyKCCoOrwtZpHOjWtR69ry+JVFayA/IRhlshdF+kodWv0RX51Mmj6M544=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHj0iA4M; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHj0iA4M"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-13721dfd471so3573281c88.1
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 00:22:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780730574; cv=none;
        d=google.com; s=arc-20240605;
        b=MMTXYrhW8zYU3IMd3hjAVx8mJvRkjzBaWiOqNgAEh5ge+448ikiERVnG8Lav1UAVkU
         mNXyr4WkjyacAlY64sylx+9RBl4H3KUHL+QpxCdqEa4zxp22oii6qiL0wNPJyuEudOJp
         cblEUAlGpZL3/M09nxez897abIFfbe8dNRJ3yfjoSoacPH7Li53t8ZhUPYQyN5MljX3c
         SRLTTh4Lsfza0vfGhNGckOKd+ucQBVCscNLZd30e+Q+7aAOxdSocTZoTViG8H3zg6PiR
         zfYdR2UCG4NxxZuEGPE1m0RCte3QuwBN/KrNHij/Q8jqa2ys8nM7+kzqYWzHsyK0THL8
         WgvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XNsDZHZrfK8USkMmXJwaiXlbXh0rWP0T8pk6zwRtmPo=;
        fh=RiKzCeYysPbz4AtGZJhEk1S+Mb/wi0zqbddJkLYHXLo=;
        b=ggoaH7zQ5rMjpIZkGy2/qFhab7TgTz9P0Lw19p2I4r8NosXPwMQFBLLfIDjjoy4dIl
         GpuQT6/dkuwiM5OSGfK01kb68OAnfZaUhfycOH50HSGnikfETXk2zucmtskQz1RtzxdP
         S1AXMUxeFgEhy8hpfYAktZfaYyg1vNnldHN0ksXuFPffrtW33BIc/qzvavapesiiTvW0
         dlYTVdV47iFaD4Qyy/1tEIhjPF81OZmKYBoBp6peVZfhkYOVzMJXFVl617Tg2Zm8PgN6
         tiRkRzO86Fu3Y/lkCE4m5VQj+mm/MQ0rUV1wsJ4VFLxcZa0Ov0zbsog4F4+Ofu5rcAup
         d4ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780730574; x=1781335374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNsDZHZrfK8USkMmXJwaiXlbXh0rWP0T8pk6zwRtmPo=;
        b=DHj0iA4M2k7kxU3V8wQh5By6avliWmgAIP8i2RXC38vVXqIbyj6ixd+xPE1hnrbIRx
         xdL0+Db4Z1QKzlEQqn/2H93YR5A/Sdm5v9IUnSgxg9bOQdEX6jTHPFjViVAeFaW6qxVP
         8C881cTVozbthUaZTYYusj4q1m3AYXWKMUqtV+TBx+PtEBsotHOP3lPuXIJyvW3lTc1h
         nMRbWjk3jxsqV4j1dxmW8gOibRJFk44JdHPZ8bfY6FvXCS5mXjXf405MvzNyp/8kAR4Z
         9umR9Z3CLlwDjFQgOFXGD2fgOHxenL/np+vj54ZUAFIC1rkdmiMZHdCYhJ9a8OldM6Rm
         c3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780730574; x=1781335374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XNsDZHZrfK8USkMmXJwaiXlbXh0rWP0T8pk6zwRtmPo=;
        b=QmwQpna5ZhyMlPZr/5Bf5VmluJlDZg0k2pZA4PlJBObECQOneVa8LhTRMwnIdRcBQO
         5QjQEWnGnvrqQd+e6xA9A0JwhcugtrxmGuLN14lwozlcQ8k/wJve3xjl3Fh+CyCxrUfr
         p073qhafA2xtTDRbUBrmAKjsgDSR8z+ADBe7v6z3OSo0e3HYfKOXTFlevzCT+SvOhD94
         ytq1jQRihgfhe5ad5chjU818WkyrqGrLs3VwtJlceJmDr2lUvTfhFWxNoAvv02OVZPVp
         9uLbhyDP6Xj+xUoxKcl3032AtLPM0mHN/V+FGDK9/gmLJKDUPSMUgNJ2D7aKJWRSURSb
         EtwQ==
X-Forwarded-Encrypted: i=1; AFNElJ9XMiYbB99hDk2a1aknYDl8nxCMHj+mh+r6KdtASZwIj/qiszlSAtIK+2XL2U2hT8VnngO3FSJ5TrfX@vger.kernel.org
X-Gm-Message-State: AOJu0Ywirf3SM1/0QUaWLFgSwNQ8YT6k1GV0FMQgBk8Tsu/gpCYEO0ia
	Rb2tvFS8YsD1UIHT43eCIcwHAbSbsemWXyTS/t50MNjOOm8WBvb8mHvTtYRp349WKa4BA/8om7n
	n4tki/GEx7Lfsx1IBsDOFKcoxKGKTAsk=
X-Gm-Gg: Acq92OHV1PsxE6mG+8fjl2wsYakbNThIVzXNyGKm/8khPuS6vYi9NTiKRikYX2u48dW
	/O6fCBDX8MFYijMlrLfYuPXtKe7wvPXvuWxRHCEd3jDQ2uWyhBwwPifMAUhP07ZMXY82h8Z2hB5
	s7fHOGgQfxPVmDjS1XcYQeMhPzILVEYt936NTVIsMSkH/ZS8GPSRNn2DaXjEvUVP9pdhZkU+B4D
	zSGJlAPSg5sn86PYPyI35HwnxodlK88QXZJ5kstvT2paqaX4hZb/00r/W8m2r3F7uc5n2eHl+ya
	AxfEOdhb0gXHM6r4/26c+Xup1gJrng==
X-Received: by 2002:a05:7300:7488:b0:2cb:4b8f:b2bd with SMTP id
 5a478bee46e88-3077af30ab5mr4444661eec.6.1780730574227; Sat, 06 Jun 2026
 00:22:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606045738.21050-1-clamor95@gmail.com> <20260606045738.21050-3-clamor95@gmail.com>
 <aiPDzdKuccdLIvlF@ashevche-desk.local>
In-Reply-To: <aiPDzdKuccdLIvlF@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 6 Jun 2026 10:22:43 +0300
X-Gm-Features: AVVi8Ceg74fnSrmdqpxPSKGHcf0CnCmmeoCyMtr9C-KzyjgDa-9lYe4AaFHwWbI
Message-ID: <CAPVz0n2rdgw8Xr3uxVdQGwrHTNFqK4SKQDFU2FEB8LzLwPhQ_A@mail.gmail.com>
Subject: Re: [PATCH v4 02/14] mfd: lm3533: Remove driver specific regmap wrappers
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

=D1=81=D0=B1, 6 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 09:53=
 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Jun 06, 2026 at 07:57:26AM +0300, Svyatoslav Ryhel wrote:
> > Remove driver-specific regmap wrappers in favor of using regmap helpers
> > directly.
>
> I like the idea of this patch. Nevertheless I have some suggestions below=
.
>
> ...
>
> >  {
> >       struct lm3533_als *als =3D iio_priv(indio_dev);
> >       u8 reg;
> > -     u8 val;
> > +     u32 val;
>
> Strictly speaking this should be unsigned int. The regmap API use unsigne=
d int.
>

Yes, though regmap defines only 8 bit to be used so it should not matter

> ...
>
> >  static int lm3533_als_set_int_mode(struct iio_dev *indio_dev, int enab=
le)
> >  {
> >       struct lm3533_als *als =3D iio_priv(indio_dev);
> > -     u8 mask =3D LM3533_ALS_INT_ENABLE_MASK;
> > -     u8 val;
> >       int ret;
> >
> > -     if (enable)
> > -             val =3D mask;
> > -     else
> > -             val =3D 0;
> > -
> > -     ret =3D lm3533_update(als->lm3533, LM3533_REG_ALS_ZONE_INFO, val,=
 mask);
> > +     ret =3D regmap_assign_bits(als->lm3533->regmap, LM3533_REG_ALS_ZO=
NE_INFO,
> > +                              LM3533_ALS_INT_ENABLE_MASK, enable);
>
> In cases like this perhaps leaving mask would be fine and together with

I prefer to remove intermediate variables it the helper allows to
directly pass needed value.

>
>         struct regmap *map =3D als->lm3533->regmap;
>

next patch drops lm3533 so there will be als->regmap which IMHO is
more logical instead of passing entire lm3533 to child devices.

> this be nice one-liner:
>
>         ret =3D regmap_assign_bits(map, LM3533_REG_ALS_ZONE_INFO, mask, e=
nable);
>
> >       if (ret) {
> >               dev_err(&indio_dev->dev, "failed to set int mode %d\n",
> >                                                               enable);
>
> In many cases it won't increase LoC count.
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
> >  extern int lm3533_ctrlbank_set_pwm(struct lm3533_ctrlbank *cb, u8 val)=
;
> > -extern int lm3533_ctrlbank_get_pwm(struct lm3533_ctrlbank *cb, u8 *val=
);
> > +extern int lm3533_ctrlbank_get_pwm(struct lm3533_ctrlbank *cb, u32 *va=
l);
>
> Now they become asymmetrical. Perhaps to replace setters, but be careful =
about
> upper bits.
>

Yes, I have same thoughts. Upper beats should be irrelevant since
regmap should use only fist 8 bits but I will be careful, thanks.

> --
> With Best Regards,
> Andy Shevchenko
>
>
