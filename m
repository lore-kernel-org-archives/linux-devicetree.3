Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316D923B61B
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779294647; cv=pass; b=rO8HVvY98GakA0wEOmb2Do5tiL0SDLcVVPo9Oolq3HSC6jhSMWILdZ8h/kBrdyqCRBJK7prvM3VC1mhtK5hvB0mahd2cgfsFDzzB2opPR3NGEWozSF8/ZfCstaM+m7hX9TL3YvIvLzhlkeUJ0Ydncjo/7sBHJ9GoiNnSBXLNpiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779294647; c=relaxed/simple;
	bh=lqFBKQb+Gdpn+xtwjBFEch2E3UDsPsxKMgztcPJtks8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RjDsCdlKvN5iCRtJRG6Djm7hllc7DDpwaOsuG16gvxjr/Dxw90uP4yWTBmF+VZHkjyO1RJezYb1bU3YV7h/IJo4lkaTtVi3RJ7rlMcF/owOMi3ghnHKnoWJrf+UoqJZIIYERpfXU5Mh+8zG8V3Z5lfmjDmcR75E2BrKhXmXrFqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GsT4DFcB; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GsT4DFcB"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3042a388168so101593eec.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:30:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779294644; cv=none;
        d=google.com; s=arc-20240605;
        b=aGcCjBUcp5c+7+fU14am+dg6tyCHsNHbj5f2nySCYy1dNzQF3x+Wdg23wAvGkMsZOx
         +QvoNY9esj9V8XN/c2Hro64Ht8AhBE8XaMWsQvMyt9Uy5B4Y/KLSiTNajenvWLFeWXZH
         AWE/BMKdGxG6kfDSr5b06y6fsUV4e6kzJT1xaYVrQJmIAy/2Js+Un+QFutCvL2N3T9zY
         4Cb+QtPTlrvJS/eZBXhLTMYIn7eh5zpK2usIU0tyE6qsPnfpT9CYP5gWetfC16nbttFa
         b6n6/Hf3diYLa/+JmyFeISsKUJY2/uDi7B3+2ISk7vtlYs4KsUayu8oWOgzNTMo9GtlQ
         Vi6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b+JhhmILz9tlrVY7OUaZADi1RQEkDpXxHbma3Cjgx2o=;
        fh=6n+idP6Ny+ZxvT1EqYlyFmtSI4kg2nyORI2wEvlJh6E=;
        b=Fhy+g1+a2plfMuYx6X74ap+iHaAo/g8GvtcJOhU7dVYVv+7ZAxdiS53MOlSpeeh607
         2QiLXQOe9UGw7mLyFDArIigRnVmcKkRC01E+Ad3CiBxepB2/KX8WAVcCakPxkQAg0SpF
         eyijwjfp4SMvO87AGOUL8K5RM9IK0UmohGnivBCYPmn+LkuLlAlw7MRurvJu2hQxMqd4
         RFJR4QWGMYtIbNPFWfnITwklaJ1YNhSmCdfJkcUszIxD4zaoBga5teZIkp7kj2MiF+Yk
         mx5gsRDxao0pKM1ixasED8njLcZq9hr9F9D8Ke20K66n9kdWB/1YkixNwaMSDl3+NRUQ
         eXgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779294644; x=1779899444; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+JhhmILz9tlrVY7OUaZADi1RQEkDpXxHbma3Cjgx2o=;
        b=GsT4DFcBQgp80xs1xENIvwYc2WOm8v7zjQq/LF08lflb23Pk9qvyjJTGlTfhvqhGrm
         jdJ1LvS4D7uUsu3k35K6+ttEST+hhIY96mKx/uwde0Kc6zbbIzVp368cpbOqa9SkWcYY
         /cVCjNhJcoJ3q72++496ROxA1wKyQSdqqEn7plfo2a1GW/Cpteie71ogQq/xbazrI7pQ
         1T+E3FHNFl+X6q8WR2fIRwyzNepd0sNb6nnI41Ev719nlqiEfnG9fzsmFaC/E1chb7JV
         /rBa9+0GlHXmtWnIzkm0JpZHo7YZlAsRdtrEyqMTVOR5/ez774WkCukHDOWPrIldCVYO
         gBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779294644; x=1779899444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b+JhhmILz9tlrVY7OUaZADi1RQEkDpXxHbma3Cjgx2o=;
        b=jsqC77Lhv09GFp8l+FYALR2GOMUa37ZASU3BnyNLamb21vhNErSjn2EXUPMUC4LQWZ
         VJFZwOQBrHMlTZnd2z6SlHmBUvANs4J9UM87QruKcLxY//yFkYJA8Ct0Ykat5r6lRK1M
         +BTTZnqrxqqmBlWmMv+ynZoY8WaamRTWrdih3kTG2ZwB/5bVAhr1sO4j5ECHUZeWZ8Hs
         BGGnrxfHeNrQI7Nlya0o6yJaIyksKLAWSCpqfue44DJvxxoY75JxMEuF15zdbuPafgZG
         RNUN4DJHY0C9od7/BfDLRTVjdRx0tSlqFQNEpOKyf49OwzfeS2M6vBZ7lQLsPrV9yNxK
         6qbg==
X-Forwarded-Encrypted: i=1; AFNElJ9JX5PiQ4KVNJJMP24rN411XKHHl+Sq4oujt9LRdTItH+s+o/Sv6Eebu3dOA7lseefZduEIFE3SXhOv@vger.kernel.org
X-Gm-Message-State: AOJu0YxKA9YQXE6AQZltgnmZJWs4/tsCCGwK+xbQxJuMlC/zbmAUa4fY
	RpRGgWWxanXJrKPDwe4iL3DX+SOgyjOIx3gz1Q9OEZZOf1BvIhJYec74jfI7UC7g2o4Oijrsjoh
	+4x9ePj6o6GJsC6Lvo/LN/RuOYnm+sDY=
X-Gm-Gg: Acq92OEiDtdFKUhNHnbOhrLFTkwJb4L9UngySmF3gBGj0NBs5WoRkCUOUJykbZFdueG
	mW3KaHLrV7U7DAFvV2UHYzorcZBORir6SxX/sZF0qgRnWNOPYP5U0HSUzptQ9ZqJDcu8tr6Fphn
	x/yKZi8o465gOVUL15ytGvnqL3SlkSeg6BklTqnoxViB1/UD5t178xPbYkJpo2KSWYDOQC2w813
	Mmj7feJuCAuRfVF9OaDmVkAAQUB7Hdh0T1HTPII8gEGd401pJ9SMf/edxQYWtGyoNY+nRhsONQz
	EPx+IZrnPTkC32spUCk=
X-Received: by 2002:a05:7300:430d:b0:2d9:db50:c6ce with SMTP id
 5a478bee46e88-3042b30f58emr133987eec.3.1779294644194; Wed, 20 May 2026
 09:30:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510110804.33045-1-clamor95@gmail.com> <20260510110804.33045-6-clamor95@gmail.com>
 <20260520150758.GG2767592@google.com> <CAPVz0n0t4PXfmgWYQ1vSTFwfg=+g4oGU+-dwgnBVKxUoUwHGqw@mail.gmail.com>
 <20260520160548.GK2767592@google.com>
In-Reply-To: <20260520160548.GK2767592@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 20 May 2026 19:30:33 +0300
X-Gm-Features: AVHnY4JmTvba-tTOAJoJtR9Zh7F3ke9BpWduNjiTbbw6Iohr70Fgqlb_QaNL6ZQ
Message-ID: <CAPVz0n2s32uYP76R9VNtWYnHrDQJKK+qC1uRRdkaX1ekF15Pww@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] mfd: motorola-cpcap: diverge configuration per-board
To: Lee Jones <lee@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Tony Lindgren <tony@atomide.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 20 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 19:0=
5 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, 20 May 2026, Svyatoslav Ryhel wrote:
>
> > =D1=81=D1=80, 20 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
18:08 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sun, 10 May 2026, Svyatoslav Ryhel wrote:
> > >
> > > > MFD have rigid subdevice structure which does not allow flexible dy=
namic
> > > > subdevice linking. Address this by diverging CPCAP subdevice compos=
ition
> > > > to take into account board specific configuration.
> > > >
> > > > Create a common default subdevice composition, rename existing subd=
evice
> > > > composition into cpcap_mapphone_mfd_devices since it targets mainly
> > > > Mapphone board.
> > > >
> > > > Removed st,6556002 as it is no longer applicable to all cases and
> > > > duplicates motorola,cpcap, which is used as the default composition=
.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/mfd/motorola-cpcap.c       | 142 ++++++++++++++++---------=
----
> > > >  include/linux/mfd/motorola-cpcap.h |   6 ++
> > > >  2 files changed, 87 insertions(+), 61 deletions(-)
> > >
> > > Looking much better, thanks.
> > >
> > > Nit: A patch-level changelog really is much more helpful to reviewers=
.
> > >
> >
> > Noted, but I will not guarantee that I will do patch-level changelogs, =
sorry.
>
> That's fine.  All I can do is ask.
>
> Note that, helping out reviewers usually ends up helping you too.
>
> [...]
>
> > > > +static const struct mfd_cell cpcap_default_mfd_devices[] =3D {
> > > > +     MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0, "motorola,cpcap-ad=
c"),
> > > > +     MFD_CELL_OF("cpcap_battery", NULL, NULL, 0, 0,
> > > > +                 "motorola,cpcap-battery"),
> > > > +     MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0,
> > > > +                 "motorola,cpcap-regulator"),
> > > > +     MFD_CELL_OF("cpcap-rtc", NULL, NULL, 0, 0, "motorola,cpcap-rt=
c"),
> > > > +     MFD_CELL_OF("cpcap-pwrbutton", NULL, NULL, 0, 0,
> > > > +                 "motorola,cpcap-pwrbutton"),
> > > > +     MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0,
> > > > +                 "motorola,cpcap-usb-phy"),
> > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 0, "motorola,cpcap-le=
d-red"),
> > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 1, "motorola,cpcap-le=
d-green"),
> > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 2, "motorola,cpcap-le=
d-blue"),
> > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 3, "motorola,cpcap-le=
d-adl"),
> > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpcap-le=
d-cp"),
> > > > +     MFD_CELL_NAME("cpcap-codec"),
> > > > +};
> > >
> > > Nit: I wouldn't complain if you wanted to have all of these on a sing=
le
> > > line for neatness.
> > >
> >
> > Noted
> >
> > > > +static const struct mfd_cell cpcap_mapphone_mfd_devices[] =3D {
> > > > +     MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0,
> > > > +                 "motorola,mapphone-cpcap-adc"),
> > > > +     MFD_CELL_OF("cpcap_battery", NULL, NULL, 0, 0,
> > > > +                 "motorola,cpcap-battery"),
> > > > +     MFD_CELL_OF("cpcap-charger", NULL, NULL, 0, 0,
> > > > +                 "motorola,mapphone-cpcap-charger"),
> > > > +     MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0,
> > > > +                 "motorola,mapphone-cpcap-regulator"),
> > > > +     MFD_CELL_OF("cpcap-rtc", NULL, NULL, 0, 0, "motorola,cpcap-rt=
c"),
> > > > +     MFD_CELL_OF("cpcap-pwrbutton", NULL, NULL, 0, 0,
> > > > +                 "motorola,cpcap-pwrbutton"),
> > > > +     MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0,
> > > > +                 "motorola,mapphone-cpcap-usb-phy"),
> > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 0, "motorola,cpcap-le=
d-red"),
> > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 1, "motorola,cpcap-le=
d-green"),
> > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 2, "motorola,cpcap-le=
d-blue"),
> > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 3, "motorola,cpcap-le=
d-adl"),
> > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpcap-le=
d-cp"),
> > > > +     MFD_CELL_NAME("cpcap-codec"),
> > > >  };
> > >
> > > A lot of these are duplicated, right?
> > >
> > > I would have a comment set, then the differences in separate containe=
rs.
> >
> > It may be impossible to predict a generic setup since some devices may
> > require unique compatibles, other may not have LEDs, third may be
> > partially incompatible with existing cells. In other mfd cases
> > creating a generic bundle might be good, but in this case I would
> > suggest better to keep these separate entirely per-device. They will
> > not take much space, nor add confusion with these macros.
>
> I'm not sure we're understanding each other.  Let me give you an example:
>
> static const struct mfd_cell cpcap_common_devices[] =3D {
>      MFD_CELL_OF("cpcap_battery", NULL, NULL, 0, 0, "motorola,cpcap-batte=
ry"),
>      MFD_CELL_OF("cpcap-rtc", NULL, NULL, 0, 0, "motorola,cpcap-rtc"),
>      MFD_CELL_OF("cpcap-pwrbutton", NULL, NULL, 0, 0, "motorola,cpcap-pwr=
button"),
>      MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 0, "motorola,cpcap-led-red")=
,
>      MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 1, "motorola,cpcap-led-green=
"),
>      MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 2, "motorola,cpcap-led-blue"=
),
>      MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 3, "motorola,cpcap-led-adl")=
,
>      MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpcap-led-cp"),
>      MFD_CELL_NAME("cpcap-codec"),
> };
>
> static const struct mfd_cell cpcap_default_devices[] =3D {
>      MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0, "motorola,cpcap-adc"),
>      MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0, "motorola,cpcap-reg=
ulator"),
>      MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0, "motorola,cpcap-usb-p=
hy"),
> };
>
> static const struct mfd_cell cpcap_mapphone_devices[] =3D {
>      MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0, "motorola,mapphone-cpcap-=
adc"),
>      MFD_CELL_OF("cpcap-charger", NULL, NULL, 0, 0, "motorola,mapphone-cp=
cap-charger"),
>      MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0, "motorola,mapphone-=
cpcap-regulator"),
>      MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0, "motorola,mapphone-cp=
cap-usb-phy"),
> };
>
> This way, it's super easy to read / maintain the common and unique device=
s.
>
> The only potential drawback would be 2 calls to mfd_add_devices() but
> that's common practice.
>
> Also notice that I droped the "_mfd" parts, which you should too.
>

What if next added device does not have cpcap-battery, cpcap-led-adl,
cpcap-pwrbutton, uses external codec and would require cpcap-watchdog
which is not yet present. This will cause issues. Even Mot introduces
in the last patch of this patchset has slightly different composition.

> > > >  static int cpcap_probe(struct spi_device *spi)
> > > >  {
> > > >       struct cpcap_ddata *cpcap;
> > > > +     const struct mfd_cell *cells;
> > > > +     unsigned int num_cells;
> > > >       int ret;
> > > >
> > > >       cpcap =3D devm_kzalloc(&spi->dev, sizeof(*cpcap), GFP_KERNEL)=
;
> > > >       if (!cpcap)
> > > >               return -ENOMEM;
> > > >
> > > > +     cpcap->variant =3D (enum cpcap_variant)spi_get_device_match_d=
ata(spi);
> > > > +     if (!cpcap->variant)
> > > > +             return -ENODEV;
> > >
> > > Isn't this covered in the 'default' below?
> > >
> >
> > This is for case cpcap->variant =3D 0, it should never happen, but chec=
k
> > will not cause harm
>
> The 'default' branch in the switch below will pick that up too.  This
> check is superfluous.
>

Noted

> > > > +     switch (cpcap->variant) {
> > > > +     case CPCAP_DEFAULT:
> > > > +             cells =3D cpcap_default_mfd_devices;
> > > > +             num_cells =3D ARRAY_SIZE(cpcap_default_mfd_devices);
> > > > +             break;
> > > > +     case CPCAP_MAPPHONE:
> > > > +             cells =3D cpcap_mapphone_mfd_devices;
> > > > +             num_cells =3D ARRAY_SIZE(cpcap_mapphone_mfd_devices);
> > > > +             break;
> > > > +     default:
> > > > +             return dev_err_probe(&spi->dev, -EINVAL,
> > > > +                                  "Unknown device %d\n", cpcap->va=
riant);
> > >
> > > This should be -ENODEV.
> > >
> >
> > hm, match is ENODEV cause it looks for device, here driver checks
> > id/variant, so shouldn't it be EINVAL? I assume error message should
> > be "Unknown device version" or "Unknown device ID"
>
> All of your supported devices are represented in this switch statement.
> Any other request, regardless of the reason should results in
> "Unsupported device" and a -ENODEV - same as your check for
> !cpcap->variant above.
>

Noted

> --
> Lee Jones
