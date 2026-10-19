Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421717;
	b=dRYqIONCTPvmhLso1fkN4IwTbz1twUAr2FEyGhRoWGpGTzXr+9g5La+DkdBzPmp5Oqat
	 mzTrOh0Qw1FE5c7ipY2Wc0d3F7k5u6O5Ftx7bqPSHCShT5jtEmQjGrRCdyQitorPZIhHB
	 LPxkZphZDOZL0mZHp66qPBHQRR6MKVBH/UcenU+2wV2tt7myBGHdpoRSxl/3nWS0hf+G2
	 iYCcV4y3gh6SUX4HUJ0M0JYiAcnE7VwwTvcoB9E6H3VP27BixC0/jJdlGa+/SY/ijvtwX
	 FtV7lQ3r/oXuoZlEXyYS/Kki4w8qWS5Ns+FwTJMd2Zau/EKnYG+EjTGxSmiNFjODx8A==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421717;
	h=Received:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1JVa4anZLJXOQzT6DdFCFiAtwNU6Km/IK3O7kS1gknE=;
	b=40N/sIrRCHh5VA/q5+MGVG3YZUKgozdHqTGC+qhMvQpJRB4X24Y6Qmz8pJ7/XNUpOGfA
	 lFvn17KQggdLKuK2cPquiHE2WNsoFJaMQb2kFt6Xs7NJ2l89gTjLchiYuNsyc98gQDzIR
	 HIVcRhodyNOOLyxyuLY/BweFvxisDSxmHlUqyDIIY3VKMJ5AsZVSp8pIcUEZVtzAKbiAB
	 /kHvVkCb+sn2Xfzzn3/ePR++1LkA7n7kGqwtv7pXxDI0SuGomWNRWQL5V3ySfqiz3P3Pb
	 90+ig9pWyHt9SWYnjdWXgg/D1mcSChW4qyPNviRG/xQtDaLPR4OzETJvU74Q/p1c9ug==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IOaySC7U;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D02606EFFE
	for <devicetree.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IOaySC7U
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43D86513C1
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421717; cv=pass; b=VWdfMWZEcZ8KhRAVRXxv2og153D6tPaAYMyGAwHHbPQxb1DDe1Gf0rMDV4qaroOVtVO96bCc7kGdYv3kn3PnHCrHovyvWqaRTTqoFjRTawArC9/SY/Acw47pr5Eg+7x6WI2SHsVM0PV8BG3xM574aa+JKTIDXKypqvcBjZmpnYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421717; c=relaxed/simple;
	bh=AKW3t68ZOk81dPuxPw32ZX6gYuPNE52T8jj7L1+y7RM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZRGGZo9PiLQePBLqtTYBpqrsSIuHkzXWLhQc3d7e2+v2fmvgazMVFOBFYeL7RX/Kj/XCvocC4e0ujeiaf/UnH7x3dOoBjlCFqB1FYrrN5oBVndJFHYdba/o0c55aDvDWhySbRb23lza+n+nYsv9IHGlKkdmGQueq0VSEB9iPybQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IOaySC7U; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15ea896ddc8so2645110c88.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:55:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792421715; cv=none;
        d=google.com; s=arc-20260327;
        b=iGe1UNaSdRO4AYCvYQfQG1IZy6+gDLNMHnJa7A9tU0hdO9Xo4qfF6NKBYG7V/rbr7v
         XT/cefwK2/ABWWG+k92dz6AElDu/mEAtuq1aIPq2fsSrvwHzo847XaV0JGG5QdEBbCrc
         dNJVBpy0an2jWQPV1dVtEW+NH4XofeL0rMOk01xHaOaO6JVEdmbtjDotDHQLQEQkz788
         MO9Haw1cN0R20W1EHXolBMjNwtqvcG4l8+KT2FHyQRZv9/SKMYnHYX/DrKzg4s8bibd3
         ggdxfhvShrZOy17gHf6Q9dAudPXRJ/JzncfNy3FIDWWFs+1hdLbNjGuhdE+v9nxZQ5uD
         flLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1JVa4anZLJXOQzT6DdFCFiAtwNU6Km/IK3O7kS1gknE=;
        fh=T/MEuG7WLhHarQYY6+rwtQ+lbVSCRikhbEbdzaRCJUQ=;
        b=Hv11gniuhKGT8idwAvtpErD/+osjN0k1u9o3VrNuZPXv5RCAqRW/l1Ducd3mPqU4p+
         KFMlgWQtA0DmU1vSYJEhVxG1uWlsHy7f9m3w0VzT68rJEkdmaP2Whd2L0hn3EdWXRHGF
         E7ilx1ArfmH8SkhGftrkz26VO8TwUyzUOh8RPTHLVFzSEup1onm0LILfPgrjEkDqeJpU
         DZiwja59x85yeB3TJo0XzpF1y/HaKF/RFeQLkMyH77ogillonEq7RyeUXU8KN6WfdI1H
         wTewOa3R0Yqh/oSCP40JCmBOdqB52rZVymPPDTaFXqXVs9xgmdzggTe7vMdE1ApsxZhS
         u4DA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792421715; x=1793026515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1JVa4anZLJXOQzT6DdFCFiAtwNU6Km/IK3O7kS1gknE=;
        b=IOaySC7U7W3uf19SUIgQObLWJ1HaLaEi8jv+lORJA1D3mjRjX/AMccUsulTefGV2X7
         LssP+DVlzVD6X7WdIIo6/p2/khhDwe0+x6Ylo3djuwxncoOMlPQCexPT9dOFbLa9nz6V
         kVEuvNC1cCl6DJlAybsPj2wGhHApWyLYxk9DPidR/P8zhVTzXr9Btl/5upVkpGurwFkZ
         jVI00O/WHa7aNmeupJ4Bo68cZlmX+mBEIkNVgy7kdJHAqb9gpQPlmOyp0mPqbzkTewFE
         azcdcRBkYIOd8SPDf4fTzO7P9QFEQg78Q61TxDUNiiFSRcuUPYnclPj+yAaGVDluFz7o
         BZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421715; x=1793026515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JVa4anZLJXOQzT6DdFCFiAtwNU6Km/IK3O7kS1gknE=;
        b=mgZP8JOQP/ijR/bi2MwvePP3IngM17tVeLCvhzZVcacSRKFK8FOCY3HHg/I5FN366O
         eS7jZX1DfJbudYvDS7RbFLw9VPh3Q3egMdVXyHIcG9Mopfwrt+DYiLNkPae8ssoxwuF1
         n+tBEm0+Rp3iIq5lx/3MCNLF+67Enflh+VdFOkdATScvwqttX4GCquNTA5g0VeIPaf8p
         28WNpoQ5T0F1i4VABJzTV1x5SDm4hJ/VVb9xtg4MSo8KTyHha4ecAFry3XQAMvIZQwGk
         uayER1RbHhcYgNj+qZorVv5Pu0wm5ABXF7P/YdM/4FgT903joRSy6hlqQPcaNHlfkbn4
         TQlA==
X-Forwarded-Encrypted: i=1; AKwUvByysBgCRgCY6ufUBypfVGdoDTT3MOstwhh6+AUCgNyGj/nXlpr1b47v9K15fAZ58d5jJHTBA3DFCYXT@vger.kernel.org
X-Gm-Message-State: AFq9FYLbVMsgbl74JaUGvQkXoNiYvEpTfgwL1KYtry+8Frbo+blyA0Rp
	tO21Qn1TA3XWD16yzGC9rX6laRqhnMq6sAYRGZ+S3ouryB1oER6l/VFcUVxWAo2H7/2jWy5Z+ne
	1gswgH1VrC/if0FzHnrlmyqZjXUjxFqU=
X-Gm-Gg: AYBFou0ekOKVeJ53w9rVzBiyJdUvoz9U5zQ5eNzDaBTgJcO5zD0nPoWKtIp/FHXkhh8
	xdZYHCujLRp0XfTaD9+Kivqr/c/Ql7obmpYuTdr4bJOIhgd6Fh/3XkNFJHd3qitrSVXI+1IE6yc
	zhFwbTunh2yaKKsDtX3EMhcfMss6Cwg5tXd1KX1IUN9Uj40iAOxU6i9h5H4fglBZAtinadkwc+d
	sE4pkK7qGZq5MWXspHJ1J1WX2J3U0qenUve1Wbrg8u2HDocXEXgBO5ilt1f8S2VTBry6zHjTvKZ
	ruNQKcJTIAvaPgiET/783FhocSlI3GMeVJOWp9A3A4wEdD7PX+a/wIbMCkbprEfeH65lf771HWZ
	MBQHIvlyetFxT
X-Received: by 2002:a05:693c:87ca:b0:35b:c1d2:eab9 with SMTP id
 5a478bee46e88-361a2e3d3abmr10553103eec.39.1792421714834; Mon, 19 Oct 2026
 07:55:14 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013180933.487013-1-clamor95@gmail.com> <20261013180933.487013-3-clamor95@gmail.com>
 <179198332384.839288.13126529382772558553@kernel.org>
In-Reply-To: <179198332384.839288.13126529382772558553@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 19 Oct 2026 17:55:03 +0300
X-Gm-Features: AclHuK-mou-LoaLS3qywfc3GD7SbgOiLXnwqTE0Jl9qjYTR1SQVKYSakF-bo474
Message-ID: <CAPVz0n14BhmK4P-tqnt6AMrAh=W-HPoBbP0ztdOrRd_JocRSqQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] mfd: aat2870: Derive brightness steps from max current
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 19 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:4=
4 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Wrong subject line.
>

What do you mean by "Wrong subject line"? Specify.

> Please review, explain or fix the Sashiko review(s).
> If this is a set, this request includes the other patches too.
>
> > The AAT2870 allows only 32 steps of brightness, with this amount define=
d
> > by the maximum supported current. Remove the need for max_brightness by
> > calculating the allowed number of steps from the maximum current.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/video/backlight/aat2870_bl.c | 30 ++++++++++------------------
> >  1 file changed, 10 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backl=
ight/aat2870_bl.c
> > index 8b790df1e842b..eb686e315921d 100644
> > --- a/drivers/video/backlight/aat2870_bl.c
> > +++ b/drivers/video/backlight/aat2870_bl.c
> > @@ -24,18 +24,6 @@ struct aat2870_bl_driver_data {
> >       int brightness; /* current brightness */
> >  };
> >
> > -static inline int aat2870_brightness(struct aat2870_bl_driver_data *aa=
t2870_bl,
> > -                                  int brightness)
> > -{
> > -     struct backlight_device *bd =3D aat2870_bl->bd;
> > -     int val;
> > -
> > -     val =3D brightness * (aat2870_bl->max_current - 1);
> > -     val /=3D bd->props.max_brightness;
> > -
> > -     return val;
> > -}
> > -
> >  static inline int aat2870_bl_enable(struct aat2870_bl_driver_data *aat=
2870_bl)
> >  {
> >       struct aat2870_data *aat2870
> > @@ -69,10 +57,11 @@ static int aat2870_bl_update_status(struct backligh=
t_device *bd)
> >       dev_dbg(&bd->dev, "brightness=3D%d, power=3D%d, state=3D%d\n",
> >                bd->props.brightness, bd->props.power, bd->props.state);
> >
> > -     ret =3D aat2870->write(aat2870, AAT2870_BLM,
> > -                          (u8)aat2870_brightness(aat2870_bl, brightnes=
s));
> > -     if (ret < 0)
> > -             return ret;
> > +     if (brightness) {
> > +             ret =3D aat2870->write(aat2870, AAT2870_BLM, (u8)brightne=
ss - 1);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> >
> >       if (brightness =3D=3D 0) {
> >               ret =3D aat2870_bl_disable(aat2870_bl);
> > @@ -150,10 +139,11 @@ static int aat2870_bl_probe(struct platform_devic=
e *pdev)
> >       else
> >               aat2870_bl->max_current =3D AAT2870_CURRENT_27_9;
> >
> > -     if (pdata->max_brightness > 0)
> > -             bd->props.max_brightness =3D pdata->max_brightness;
> > -     else
> > -             bd->props.max_brightness =3D 255;
> > +     /*
> > +      * The maximum number of brightness steps is determined by the ma=
x current.
> > +      * The aat2870_current enum maps directly to the allowed brightne=
ss steps.
> > +      */
> > +     bd->props.max_brightness =3D pdata->max_current;
>
> What happens if 'pdata->max_current' is 0?  Above, we fall back to
> AAT2870_CURRENT_27_9 when assigning 'aat2870_bl->max_current'.  Shouldn't=
 this
> use 'aat2870_bl->max_current' instead, and if 'aat2870_bl->max_current' i=
s no
> longer used anywhere else, should it be dropped from 'aat2870_bl_driver_d=
ata'?
>

Resolved in v4

https://lore.kernel.org/lkml/20261019100930.110954-1-clamor95@gmail.com/

> >
> >       aat2870_bl->brightness =3D 0;
> >       bd->props.power =3D BACKLIGHT_POWER_ON;
> > --
> > 2.53.0
> >
>
> --
> Lee Jones
