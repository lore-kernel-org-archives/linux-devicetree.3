Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE503DC4DA
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 17:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779297922; cv=pass; b=IrBfE/4FD/QKldTmFkC9f7O91wqUXQuV2bJrAYaPydByErpRKWzGzoRnk6Tjh9Qtmm780yBlk2Zs9vHa9sZ37uszNwX2riHquzu02bJ+kR8/Pedu3DWtouILz1qwtpeHCNaEOYjYw3fQHpL8IvwtAT/Htri0uSjUOUub1fdRsU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779297922; c=relaxed/simple;
	bh=W2Zmr4LzjuX8U/fTumYg4RTnYzSgBW2304Rq62FECyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jC7zXB6agPxC0cNEkxuQ0Uerb1O5o+P567SvkdSRFg4SKXOU3jxIYd8Apd10qXrciXxDucAex6l1aDsNh9UKWz0JIav6vh/cHmgbvMq6Zb1291gzAFovzkeNx6ZxBDRFKvzsik++tyQHgO2GJ39qkxHmRWPBtgWOmIJ8HvrobMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAkANWxY; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAkANWxY"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2f0ad52830cso6636516eec.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:25:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779297920; cv=none;
        d=google.com; s=arc-20240605;
        b=ZVeubm3AOtl1Q2xP9jPCpQpChmgsJgmx8TKrslxoHYPC2cQq54ZNKQrUa00L0oGJm0
         NeJ7b8qumcsJh1qtEGCTVEqa52RO4Wuok6RR9UkDESge1xV1VkpIa8rpLQAz5H1HetW7
         Gjl+eXG6/LEfs3vxKznnUNqgnrPjTrR3fJkRTKGm0mccKkFvPz0N6bU+ppQL6jy3BOND
         N2urAkLrAyDPNwJE+oG8jwgZ6Y8cp6noZIEzVa909N9ov9Ew5bXrs84yTKAVkLy75VbN
         W2lJDhqouIdtp2pk6EmLSkQ2yo8zPUjjW3XvmleBdtJk1ESIyQqMjT+Vr2hgW1s05RcN
         PjEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pTJ+qpNqxTVRFJSoAdeWMwfmemEjKB7qZTfcUw2okZU=;
        fh=9gmVBvTRlowBSCeiS71yK91D1QoMSY1KBBS4NyK/eWg=;
        b=j0NM56QI0hofHdQQkqgDvRwcnon/C+9P4eJaYAPeiWOTg7h0O/nOTcIe2R8orQ4skY
         DitabIBlk5+412tH2k2F+oYU2Kb/K+FteCKsKd8TtRsqNgrtUwiL8uUWD8ioUGZyAKzg
         DPPGHP+HPNfV0OtqX04d7+HoOVyWajHlprAxnDGacJkncqMciQpleExy2maSORnL4HJQ
         E5zLZhZGCF2tjFpRPiJiuHbycLrSUrpI6uN27IZr7tZtARinbY5TC5ujiA8ObYan0rRU
         gmIKJ7nrzgZRRTfvTj+mSYJSz9Lb1mmA6UPSY+kpJn7JlKIPl403GI2bRy65Q8UCbopV
         fIOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779297920; x=1779902720; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTJ+qpNqxTVRFJSoAdeWMwfmemEjKB7qZTfcUw2okZU=;
        b=gAkANWxYemAGONkvLMT1fPXjq+Yt9PD1eHV23t/UFmaCX8k8McSRrj5tfiUjcqftiJ
         uSVc5DSjJp+hQoGF3CrxuedDFr8CUG70gU4x97mONWH4A+BO360ehTZvOcnWQnJP+53S
         iF+cnm2QmpJaGaGTSxUJmo9u8zVhsdnhFEn224A3t/ATpq9TaLJDsApuc2WevTRvgVxe
         j40yq35FYPx9PbYMToT/6Fd4WpccBSwJgYznwA37/b1yL2Jp/W4u0as9TH1+cDdeDz9m
         bt47CeJAqL9a4aM+LHDXEesTRZWS7534BZ324PhyAgmkg1MNhZP+VdJ7g1RQDFT3L9A+
         s9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779297920; x=1779902720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pTJ+qpNqxTVRFJSoAdeWMwfmemEjKB7qZTfcUw2okZU=;
        b=LO5W/XlFJllmBwDggGHeHlzzvwvm7qqeurHI6WHq0kjjSaSkJRpbAL/wyAcsYR3tDG
         qSPQzrOrC5l9aHcLaiRZSxSsB0OcJFxCbQ6f3dzQtMlKCN2C7N3isHPjy6cjzsECQvPR
         7bPAr071LIpQYx+2L6JgbFk6o4iRX2CA7MlP/Ojrv1B5xSncc1mLyubT7Tw/BMpVfIRw
         62y2jaWOcSxyayAWlfoI7vbPmSMw3pL5j3tHyZgNPbaRpsjK4IAKD637Y1pJonBpcCHF
         Uzt5E+t5zk0Tq4Z3SKkb3vgNzU4jKzD7OWNbe6njQtK/5XBm/2xrq5BlEHTwioAGlIto
         toTQ==
X-Forwarded-Encrypted: i=1; AFNElJ+dnqUzhuaYhaiAXGSIx8hntUI50wSNH3l4CpslRsSAlCZETnapQ7avJcPX4jfQXvT8/JYCKnBCkPY+@vger.kernel.org
X-Gm-Message-State: AOJu0YzlwmcCSqD519WPRrWAYiryq0A+5u0YXf/uEMvk0g+zwtwBw4yo
	fidjprZ+695uCQo8VhdDpB1COxYBRP2RPNes9mJ3hdEZAE/b7BsG1b5cmcOkzYQq4+/m6Svs8Ut
	tP8RJ/iTScsoUZmgbykK7HhulCt9mwn8=
X-Gm-Gg: Acq92OGaZpP2CfpbGk86cmTgSO43SWXI4fefGcXErBBfieIwa0UNeE8MuMw2xPN4XHW
	Ki1iMMiIusSucyezHk7Rb0RI4E+MkTxLREBED1TFPiG+FFdjThEao+tCG3kVtndMY+tFQSdO+G4
	oRHvkycYJb7JTCBRtwy/T8fUMibd9HLt/YWtgyxDsUcivr8lQ85sKuX7cMI5DqS4LsWOkaMcZNA
	B8xvEHBgPIgs1svf+0q/sz1t/tQjR+5kjsAzNh6YiWld3H5FqAlanFHFbDzBrBZoFRkY8nP1fck
	y1hJDm3ap7Qv8fDQlvY=
X-Received: by 2002:a05:7301:9f18:b0:2e2:4979:ec7 with SMTP id
 5a478bee46e88-30398188068mr12104364eec.10.1779297919372; Wed, 20 May 2026
 10:25:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510110804.33045-1-clamor95@gmail.com> <20260510110804.33045-6-clamor95@gmail.com>
 <20260520150758.GG2767592@google.com> <CAPVz0n0t4PXfmgWYQ1vSTFwfg=+g4oGU+-dwgnBVKxUoUwHGqw@mail.gmail.com>
 <20260520160548.GK2767592@google.com> <CAPVz0n2s32uYP76R9VNtWYnHrDQJKK+qC1uRRdkaX1ekF15Pww@mail.gmail.com>
 <20260520170234.GN2767592@google.com>
In-Reply-To: <20260520170234.GN2767592@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 20 May 2026 20:25:08 +0300
X-Gm-Features: AVHnY4JZhma2ixtU98PfXtnc_wi0qyCf3_sR6bNe6Gls04f5jclDHbIKfn1qbLE
Message-ID: <CAPVz0n29SdjJxj6nx7GPx4+L_a-wZ-i+5jiOpL2btR_FQdp47Q@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] mfd: motorola-cpcap: diverge configuration per-board
To: Lee Jones <lee@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Tony Lindgren <tony@atomide.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 20 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 20:0=
2 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, 20 May 2026, Svyatoslav Ryhel wrote:
>
> > =D1=81=D1=80, 20 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
19:05 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Wed, 20 May 2026, Svyatoslav Ryhel wrote:
> > >
> > > > =D1=81=D1=80, 20 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=
=BE 18:08 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > On Sun, 10 May 2026, Svyatoslav Ryhel wrote:
> > > > >
> > > > > > MFD have rigid subdevice structure which does not allow flexibl=
e dynamic
> > > > > > subdevice linking. Address this by diverging CPCAP subdevice co=
mposition
> > > > > > to take into account board specific configuration.
> > > > > >
> > > > > > Create a common default subdevice composition, rename existing =
subdevice
> > > > > > composition into cpcap_mapphone_mfd_devices since it targets ma=
inly
> > > > > > Mapphone board.
> > > > > >
> > > > > > Removed st,6556002 as it is no longer applicable to all cases a=
nd
> > > > > > duplicates motorola,cpcap, which is used as the default composi=
tion.
> > > > > >
> > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > ---
> > > > > >  drivers/mfd/motorola-cpcap.c       | 142 ++++++++++++++++-----=
--------
> > > > > >  include/linux/mfd/motorola-cpcap.h |   6 ++
> > > > > >  2 files changed, 87 insertions(+), 61 deletions(-)
> > > > >
> > > > > Looking much better, thanks.
> > > > >
> > > > > Nit: A patch-level changelog really is much more helpful to revie=
wers.
> > > > >
> > > >
> > > > Noted, but I will not guarantee that I will do patch-level changelo=
gs, sorry.
> > >
> > > That's fine.  All I can do is ask.
> > >
> > > Note that, helping out reviewers usually ends up helping you too.
> > >
> > > [...]
> > >
> > > > > > +static const struct mfd_cell cpcap_default_mfd_devices[] =3D {
> > > > > > +     MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0, "motorola,cpca=
p-adc"),
> > > > > > +     MFD_CELL_OF("cpcap_battery", NULL, NULL, 0, 0,
> > > > > > +                 "motorola,cpcap-battery"),
> > > > > > +     MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0,
> > > > > > +                 "motorola,cpcap-regulator"),
> > > > > > +     MFD_CELL_OF("cpcap-rtc", NULL, NULL, 0, 0, "motorola,cpca=
p-rtc"),
> > > > > > +     MFD_CELL_OF("cpcap-pwrbutton", NULL, NULL, 0, 0,
> > > > > > +                 "motorola,cpcap-pwrbutton"),
> > > > > > +     MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0,
> > > > > > +                 "motorola,cpcap-usb-phy"),
> > > > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 0, "motorola,cpca=
p-led-red"),
> > > > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 1, "motorola,cpca=
p-led-green"),
> > > > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 2, "motorola,cpca=
p-led-blue"),
> > > > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 3, "motorola,cpca=
p-led-adl"),
> > > > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpca=
p-led-cp"),
> > > > > > +     MFD_CELL_NAME("cpcap-codec"),
> > > > > > +};
> > > > >
> > > > > Nit: I wouldn't complain if you wanted to have all of these on a =
single
> > > > > line for neatness.
> > > > >
> > > >
> > > > Noted
> > > >
> > > > > > +static const struct mfd_cell cpcap_mapphone_mfd_devices[] =3D =
{
> > > > > > +     MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0,
> > > > > > +                 "motorola,mapphone-cpcap-adc"),
> > > > > > +     MFD_CELL_OF("cpcap_battery", NULL, NULL, 0, 0,
> > > > > > +                 "motorola,cpcap-battery"),
> > > > > > +     MFD_CELL_OF("cpcap-charger", NULL, NULL, 0, 0,
> > > > > > +                 "motorola,mapphone-cpcap-charger"),
> > > > > > +     MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0,
> > > > > > +                 "motorola,mapphone-cpcap-regulator"),
> > > > > > +     MFD_CELL_OF("cpcap-rtc", NULL, NULL, 0, 0, "motorola,cpca=
p-rtc"),
> > > > > > +     MFD_CELL_OF("cpcap-pwrbutton", NULL, NULL, 0, 0,
> > > > > > +                 "motorola,cpcap-pwrbutton"),
> > > > > > +     MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0,
> > > > > > +                 "motorola,mapphone-cpcap-usb-phy"),
> > > > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 0, "motorola,cpca=
p-led-red"),
> > > > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 1, "motorola,cpca=
p-led-green"),
> > > > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 2, "motorola,cpca=
p-led-blue"),
> > > > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 3, "motorola,cpca=
p-led-adl"),
> > > > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpca=
p-led-cp"),
> > > > > > +     MFD_CELL_NAME("cpcap-codec"),
> > > > > >  };
> > > > >
> > > > > A lot of these are duplicated, right?
> > > > >
> > > > > I would have a comment set, then the differences in separate cont=
ainers.
> > > >
> > > > It may be impossible to predict a generic setup since some devices =
may
> > > > require unique compatibles, other may not have LEDs, third may be
> > > > partially incompatible with existing cells. In other mfd cases
> > > > creating a generic bundle might be good, but in this case I would
> > > > suggest better to keep these separate entirely per-device. They wil=
l
> > > > not take much space, nor add confusion with these macros.
> > >
> > > I'm not sure we're understanding each other.  Let me give you an exam=
ple:
> > >
> > > static const struct mfd_cell cpcap_common_devices[] =3D {
> > >      MFD_CELL_OF("cpcap_battery", NULL, NULL, 0, 0, "motorola,cpcap-b=
attery"),
> > >      MFD_CELL_OF("cpcap-rtc", NULL, NULL, 0, 0, "motorola,cpcap-rtc")=
,
> > >      MFD_CELL_OF("cpcap-pwrbutton", NULL, NULL, 0, 0, "motorola,cpcap=
-pwrbutton"),
> > >      MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 0, "motorola,cpcap-led-r=
ed"),
> > >      MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 1, "motorola,cpcap-led-g=
reen"),
> > >      MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 2, "motorola,cpcap-led-b=
lue"),
> > >      MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 3, "motorola,cpcap-led-a=
dl"),
> > >      MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpcap-led-c=
p"),
> > >      MFD_CELL_NAME("cpcap-codec"),
> > > };
> > >
> > > static const struct mfd_cell cpcap_default_devices[] =3D {
> > >      MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0, "motorola,cpcap-adc")=
,
> > >      MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0, "motorola,cpcap=
-regulator"),
> > >      MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0, "motorola,cpcap-u=
sb-phy"),
> > > };
> > >
> > > static const struct mfd_cell cpcap_mapphone_devices[] =3D {
> > >      MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0, "motorola,mapphone-cp=
cap-adc"),
> > >      MFD_CELL_OF("cpcap-charger", NULL, NULL, 0, 0, "motorola,mapphon=
e-cpcap-charger"),
> > >      MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0, "motorola,mapph=
one-cpcap-regulator"),
> > >      MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0, "motorola,mapphon=
e-cpcap-usb-phy"),
> > > };
> > >
> > > This way, it's super easy to read / maintain the common and unique de=
vices.
> > >
> > > The only potential drawback would be 2 calls to mfd_add_devices() but
> > > that's common practice.
> > >
> > > Also notice that I droped the "_mfd" parts, which you should too.
> > >
> >
> > What if next added device does not have cpcap-battery, cpcap-led-adl,
> > cpcap-pwrbutton, uses external codec and would require cpcap-watchdog
> > which is not yet present. This will cause issues. Even Mot introduces
> > in the last patch of this patchset has slightly different composition.
>
> We usually just code-up what we have _today_.
>
> If new devices come in with different requirements, it takes 5 mins to re=
jig.
>

Ok, but I will take into account Mot commit when factoring out common.

> --
> Lee Jones
