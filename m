Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B01937B415
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 13:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776606401; cv=pass; b=np+bwPKD+wb8xhO1fmco1vXht4eQ7yeN9XUwzstpuOCoONzGYbjLoeg//+kWWfENCCXnwiSVfJDHBPxldXp7uf2EdoFUL9lvu5AJ2uQCN9mUDqSrFoW/tPCw/4cfZ2ZD4MVUdrmnIbiF8wg7bp1DyoUW9Q/EdzHxgTPNW7nbrSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776606401; c=relaxed/simple;
	bh=qFptuGNZkmWSENWkgWeSTiypA6pxk0Bss8JmWP01E2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFkhponIvQyFcQ/xx9XGr+VJbJzXG33voYUMzJjao6zVT3Utly112QHTIsCpuTiq9RzRJsVdZEJum1icLNpaC5LkMCRid4hCah641SpFd+5XSQIBtJ2MpcM4SG7S5GYVo7UBPe1a6ODXOMU8VdHWnLfP4XlmhuwQ47Sv8rjTD6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZ217TpC; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZ217TpC"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488a4bc360bso12926215e9.0
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 06:46:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776606398; cv=none;
        d=google.com; s=arc-20240605;
        b=SSwhk0ZmWc4BFhZVEXD2AOd49syYZk8kPfz6Gcrpp85lOaerz9j/3tsC2SyqbD32M9
         F+wpTe9kv6zATeQIhb6OSZ5xsSCOTfe2WqgIkpWE1DWX8Qs7ElIKM3dJhnYZlqvZ0mvn
         X5dUc/cuvBV/7gN9W9lyEyjl5szqozgKqx8DhjQuRjEEnU1FMnU0P4Mgpc9kRQ0WmF3D
         M+stieQT1lONKVcf1cfJZq6JEc9TWf9R+3U+9G61/uPihSRD8athls8IVwWTRvAvArF8
         INdaoiDb80q9zoyUoD11/QyG27ng3CB7JzGcS+ffvrP63fU0LAPuSSPBrEtwePwxPabP
         surw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jsz5uA7mB3aQz6UuprfjwX+wOOHCxT6ua21vZZ7zV1o=;
        fh=HbFvbebDYgBrERUPRWt108MxxLogTD3kjTK56KEcUKE=;
        b=VP3sHKQw9d+v9TDojEFQ6XI5oDIzraxBHLEkwsZte/Gcj7KM7NYKCp7IRG9zvJ5BP3
         a9YMrvjVLll2CK0uDnMPcOSNGzTCHDPF7MdGcB+NpvR/U/0fscOD5f7kEwWyC/CExRY1
         VOwG6Rbgk9muX4pvwwmBK7hZ6P3ShDCqFlIgQBsJT1NiTfLhlv9fqDhjIxYY0B66M5h+
         K5+dEvWCG+j0F2Cur+RXdz1ofDbfxadJR/emp/CFTiYyaLZbEqUoJvPL3INi3VlqrRVI
         s4ViJ2ffXr2XY3Qv3BsNrVsoeOQORYVhupVLoNgOMgI+nbLD8h6OkT0AIYb31bQvYcCg
         7ung==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776606398; x=1777211198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsz5uA7mB3aQz6UuprfjwX+wOOHCxT6ua21vZZ7zV1o=;
        b=kZ217TpCkubuYMwnRHX511MtxPiavBgfcoPrPliI5XAUi4PmLXKRSuTrdZaNR8Mlt+
         gjzh5erYPTEQgBdOKsqRvGCq+GnFXWjG9wt3z6kRvyJAo3d9Q514xjWvEVaCQGdDllKy
         nwSEM8LkjTRiTRPRqLFk4bI2mv8om9FUY1Bq70Z67s26HoGPlvHUWAEpiybqr9bomOnh
         PQ3VyfmHvKus78h5Mo1MgAfbqerKT3axaQ72gzemIVXNM0oozn97PtoDZBhfczVW05yK
         7uflch10bugef1acDJ1+lwSpvNA973WkwtWNlDSQ+mdC8gSJ6uAEbuMzJT7/BJflt335
         Ia1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776606398; x=1777211198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jsz5uA7mB3aQz6UuprfjwX+wOOHCxT6ua21vZZ7zV1o=;
        b=GxvQn33LFzQiCOEMxc90Om941Fj81b0G5mhqC/UuWTqL9daS8D0C6L40qRSzgBDc0R
         0Q9VsxhPQhtNeV+79YvknX5ctDxCNBYTHdn9FNbnIqwfqOid9AOwDscmPqI7ItPU62Gw
         7/9fmC0hhlbOF4plYV4EyQ2X4PSnV9uUjhg4GlmyU7MXXYiA0PgB+Ey8YHphjBVeBSS8
         Gep9uVdO0mZhEGX7cpJmDpmPzZfnC/Wc8lYG0aSYjbxac1ilKX9PJoc0dGrNnw90kB2F
         9JRwx29M9cfLoiqQga7PDAUoCnyibsJXWt1mQ4UspwBtU1tYRf7DR84DdLm3j2LbUgtk
         p+YQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Jyq6EUBGFrRjGT3lYN41qQCap0Rpq29VEQXxg2zvLRiajxpUbdLedrNBW2dv8hd6luxylB+5ocSh8@vger.kernel.org
X-Gm-Message-State: AOJu0YyHNgp/sTAO47B59OB3MXpyNNa/Roln9IKv1qCqDBtZsy6F9Zds
	xU26J+1aZ3LOQq2MXERaKMeWYjixjpB5I9zsqE5Bs/q2Qkj3IFAPPABp6b9Hq5EFowljfwiTGUq
	m/X3g0qKJ2d1m7sYP4y+tv0Q7vs4UklM=
X-Gm-Gg: AeBDieuCH1lNf/aD5kedmC2bNF0EP+1k0NfS4Tq6wZbr+iwZvQhtS9YEOUJxitgDuxm
	TXkjWaY+h+MnRXAEF7dg2fmybkbEzVCC5SXMOAbqtHY6wCmGj20H/eL8+KzT5eXOchVSt3vODZh
	EQ8qYrea2jRAQF8WEra9Im60qM+8H9Ax+WJCaSUbOTu5/fSK2/HdE8h6FG0bDOBUB3OgfBt5XKf
	evjacJxOwIZ/YsmwD5PU2PmaHSimHnewzueZK9Su/vDF2aobMJNlII/QbwUV7uCyS0uo3etYIsE
	eg5RDeqxYBk4yX7ZZ1Y=
X-Received: by 2002:a5d:584b:0:b0:43d:300b:2285 with SMTP id
 ffacd0b85a97d-43fe3dc5c58mr14983269f8f.11.1776606397785; Sun, 19 Apr 2026
 06:46:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419083125.35572-1-clamor95@gmail.com> <20260419083125.35572-3-clamor95@gmail.com>
 <20260419143751.11ec0b69@jic23-huawei>
In-Reply-To: <20260419143751.11ec0b69@jic23-huawei>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 19 Apr 2026 16:46:25 +0300
X-Gm-Features: AQROBzDHUz7Bq4Yx9C52FIvc2ZHcHpmYflBENb0J-YXx8dYIQFe3jx1jZbIQtS0
Message-ID: <CAPVz0n048kPMAnGQpOk0_SPtQ+hz=-p6jdyRYPB5d+CD9i7_Cw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] iio: tsl2772: add support for Avago APDS9900/9901
 ALS/Proximity sensor
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 19 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:3=
8 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, 19 Apr 2026 11:31:23 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > The Avago APDS990x has the same register set as the TAOS/AMS TSL2772 so
>
> A Sashiko review comment makes me wonder about one thing below if the
> register set does match.  Maybe it's a bit more subtle than this
> patch description suggests?
>
> > just add the correct bindings and the appropriate LUX table derived fro=
m
> > the values in the datasheet. Driver was tested on the LG Optimus Vu P89=
5.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/iio/light/tsl2772.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/drivers/iio/light/tsl2772.c b/drivers/iio/light/tsl2772.c
> > index c8f15ba95267..8dab34bf00ca 100644
> > --- a/drivers/iio/light/tsl2772.c
> > +++ b/drivers/iio/light/tsl2772.c
> > @@ -127,6 +127,7 @@ enum {
> >       tmd2672,
> >       tsl2772,
> >       tmd2772,
> > +     apds990x,
> >       apds9930,
> >  };
> >
> > @@ -221,6 +222,12 @@ static const struct tsl2772_lux tmd2x72_lux_table[=
TSL2772_DEF_LUX_TABLE_SZ] =3D {
> >       {     0,      0 },
> >  };
> >
> > +static const struct tsl2772_lux apds990x_lux_table[TSL2772_DEF_LUX_TAB=
LE_SZ] =3D {
> > +     { 52000,  115960 },
> > +     { 36400,   73840 },
> > +     {     0,       0 },
> > +};
> > +
> >  static const struct tsl2772_lux apds9930_lux_table[TSL2772_DEF_LUX_TAB=
LE_SZ] =3D {
> >       { 52000,  96824 },
> >       { 38792,  67132 },
> > @@ -238,6 +245,7 @@ static const struct tsl2772_lux *tsl2772_default_lu=
x_table_group[] =3D {
> >       [tmd2672] =3D tmd2x72_lux_table,
> >       [tsl2772] =3D tsl2x72_lux_table,
> >       [tmd2772] =3D tmd2x72_lux_table,
> > +     [apds990x] =3D apds990x_lux_table,
> >       [apds9930] =3D apds9930_lux_table,
> >  };
> >
> > @@ -289,6 +297,7 @@ static const int tsl2772_int_time_avail[][6] =3D {
> >       [tmd2672] =3D { 0, 2730, 0, 2730, 0, 699000 },
> >       [tsl2772] =3D { 0, 2730, 0, 2730, 0, 699000 },
> >       [tmd2772] =3D { 0, 2730, 0, 2730, 0, 699000 },
> > +     [apds990x] =3D { 0, 2720, 0, 2720, 0, 696000 },
> >       [apds9930] =3D { 0, 2730, 0, 2730, 0, 699000 },
> >  };
> >
> > @@ -316,6 +325,7 @@ static const u8 device_channel_config[] =3D {
> >       [tmd2672] =3D PRX2,
> >       [tsl2772] =3D ALSPRX2,
> >       [tmd2772] =3D ALSPRX2,
> > +     [apds990x] =3D ALSPRX,
>
> This is different from tsl2772?

yes, lux table is different and made according to datasheet,
tsl2772_int_time_avail differs, ALSPRX configuration assumes that
proximity sensor needs no calibration which is true for apds9900/1
while tsl2772 needs calibration, device ID is different 0x20/0x29 for
apds and 0x30 for tsl2772

>
> >       [apds9930] =3D ALSPRX2,
> >  };
>
