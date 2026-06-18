Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B5A1D432D
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781775941; cv=pass; b=fs2EHhaoXHQnH6rZsDEYPValDs2Qs7r96hCtxYh1/Cv9Ti+N8UR4VOMhbMJwRGZyA1COFt2RgWT0WQft0p9o3KAHDSoXEx/+ixGQHnhCCehr2JcmEvtH5AEPjGBVxv0iw3KpGdoRpgiW3GExAcoO5T1GhnwK8hH6bgqhSdOP/ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781775941; c=relaxed/simple;
	bh=6WaRfwC9Cd5kM/ixVZ9/4tMUscSveT87eGc4uHnIFFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iWdnindhB73R4/hHYyDhuRT2H/hSuAGE8OiiW/hjZfXUj8v4hEepmjUHEo67sLa21YvrPChjo0RtFqttXINwOhESCS4ToY60YS4oDu7BdfZP7SmlW/b3WwgQLV4Szfi4PDpXuMKpGuCVx+/hViPGnSYt0K7XdMNuTFSmXO+xedI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uzt93V0f; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uzt93V0f"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30bb7d20ad9so996399eec.1
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 02:45:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781775939; cv=none;
        d=google.com; s=arc-20240605;
        b=b7LFULUenXquVItFQQaUHA9fMguK9N1hALbylhrNmI4eq+31x6sbLOHusJtT10g7PY
         Ndck5oCHx8mB7+Aw+GbKswGlf7EqHMW8r2Bhwx0qUpgLj6dAK1TdwRyHmUnMu2PgVDQc
         Rm+DUEeSUkoBAtLc3AkZctrYTKAraQ7enCBRuc9kiE8XcXJ7/h+Og+pam4dXENNmZkQv
         sV8VvxYO2hLRCnXSep6sENzsIFfOus+CsxH31CSoU2dlFle2cRxb/F9NjFM7T+BT2G62
         gLLkCVIpHO93e8KK395HvuwtFoI5CiZsgj7qHhbD8UanJ60+mIcafVY6e/5OPDVG0uZy
         aScg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6WaRfwC9Cd5kM/ixVZ9/4tMUscSveT87eGc4uHnIFFc=;
        fh=i/rFeOidYtRDJXYhFKnfEJFL6vbnf7+z+J3LQ01IMU4=;
        b=lWAeOIEu2YuK0VaxYuO0drAZuQcYIZ7SZwtL1PK4HH/MVtTGvWtORyC5073oXsY+n2
         bF/vTp+gKg5lt7uWxQo+TR9EcEypVo7An5pBZFmAPWUfWKRmXod2LxHA4Nr7A63WjUkX
         IziFG+jrSXm6B1mCdOHtufBNSTQHpemyovnRADrDxz0Y5DmWVT2XpiAECTYlLIR94tC/
         osif/XyA5X/p5n9t23tiJSfBQia4G0D5Sg/Af4LLZQRewgSSGRb1dfzyQ1+ihRW2X+cj
         ZEFJAlHoA6eaCxeHTamiYTIhvK4Bnqt+4WAtcstMY3HZOsXSGZjCSW9vmL5sZLqEFXYh
         kzLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781775939; x=1782380739; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WaRfwC9Cd5kM/ixVZ9/4tMUscSveT87eGc4uHnIFFc=;
        b=Uzt93V0fxC7tDNJATZGvQ0/4lzHFccitA2lXeDlZHGrEjcIQSKnBrne731repvUD74
         W5/RQ999z+zohFq5ghTCIQ37NQsuSIGYY0w7GbWO2boR/ICn628Ud3Km97QYNVYsdlQh
         L3WDiVHdar50458I8k9cwpal600yaJJ6WmwyL6Caj2IEtbRoER8DJwzCbZz6aFu2NRTj
         S7p8l1304sP6G/XXjZKem+lx4Sv7/NmQFwF2fo+Y3X/0rVop2VS6HvLXzwaLzG/oG+dt
         RB+OQWxVW0ydv6FfKVvvr5dxLAac6XQ83NW2+zi5QZ6YJ6z2dwUrR87uBtWcXJs7rrC7
         BdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781775939; x=1782380739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6WaRfwC9Cd5kM/ixVZ9/4tMUscSveT87eGc4uHnIFFc=;
        b=f0zvGYtX38OuZ/wQmjj+FWfmElP219UAII+t90bgBxz2dUJYOA65i/2zt8yl7nrLPp
         vhLO4cWe5LrlnFmT90lt2QwUlcYsXNRnHZjF/Q+OT3aIiccySipkuP4Zi81BY5oByq/1
         tlUYP3QpQMtmEDkrxbfQ8b+aQcBlz6BgxIQYuq0mkr5jGVpEe3EUfv+cuy69P+1r7wSK
         Enowp6KdYykfqRHkkpsx2PgMVtW5VnXWhF38v95SbW0BGJ0iq07nFempwnFFiTBQkPKw
         MsliT+5BojqXbTTalakY4M4oyCPxZE4Z0uKuX/wWBwKWp9X2dv1kccg2Cl9b7OsgA36e
         57cA==
X-Forwarded-Encrypted: i=1; AFNElJ8JBNh/YkpC6Q0zPKLeJNs+JdsQ9Wb6qJ9mH1+F8S55Dy0qonA2xkazbuiiyjLQHHFyWf65umrGPXpm@vger.kernel.org
X-Gm-Message-State: AOJu0YxhM1AbBy/IwtbzXdUlQL4COpxN+Ww4H/FCitvA76IxZcwCRmYK
	ZSWp/NkdLP/kJklQXPDK5phCF1bBGxATY0w2vhNg3ZDEOaeiKXiT3mcQ/0ZIdgLfyEzZefU5tWf
	Q+awryNjMyjOA0utM0PQvsBN+vXFQOuU=
X-Gm-Gg: AfdE7cn+2HTPMSOYdyVpE3lhvMaskp0cINUDymwt202Q5e5x6B39GlfAzk7KDNQeCIm
	v8KfLgrjci8mkKw3klebkt8tUHijX6L8nk97jA5OqPNDwX6MZitqIsQEuyt0Ist+iIu3aQXwNMm
	nnIU2NYAT47I7YU212nlad9lK6IaeYo0qnBkqP4Vn0zsyew+T3A8tuAdHcEHpbLRXDx0//yWEVu
	rD9Tifs1zXk8zTGCFulXc0cOGDfTzj0DCB97GTnynFoj66h2ln8nUdq2dipi0tDHHIB6dy/WQ==
X-Received: by 2002:a05:7300:cc0c:b0:2d9:db50:c6a5 with SMTP id
 5a478bee46e88-30bf022da31mr1835449eec.0.1781775938951; Thu, 18 Jun 2026
 02:45:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528053203.9339-1-clamor95@gmail.com> <20260528053203.9339-5-clamor95@gmail.com>
 <ajDPtOyr8GJYaVYQ@google.com> <CAPVz0n2fnM6zYtP9bCtsY9mcLdce_R+1UPmMo0o4JRgjnhuhKA@mail.gmail.com>
 <ajGyejCSRMhY4G2R@google.com> <CAPVz0n0r-1SXH_dfS9HkQJrF7e-6+O5Me2bPjcscnizmfTfjZg@mail.gmail.com>
In-Reply-To: <CAPVz0n0r-1SXH_dfS9HkQJrF7e-6+O5Me2bPjcscnizmfTfjZg@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 18 Jun 2026 12:45:26 +0300
X-Gm-Features: AVVi8CdfRDGSXHDp2X9UrO1uFXgv2RAPSbOTQtrf0j8x2fqDzF-6zwOjp7eVP4g
Message-ID: <CAPVz0n1E5w6TB2empDF4TgVvMbNDwDRi31rQ4TFj-7voGf_i_g@mail.gmail.com>
Subject: Re: [PATCH v8 4/7] input: keyboard: Add driver for ASUS Transformer
 dock multimedia keys
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 18 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 12:1=
8 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D1=81=D1=80, 17 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 00=
:23 Dmitry Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Tue, Jun 16, 2026 at 09:25:25AM +0300, Svyatoslav Ryhel wrote:
> > > =D0=B2=D1=82, 16 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=
=BE 07:26 Dmitry Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=
=B5:
> > > >
> > > > Hi Svyatoslav,
> > > >
> > > > On Thu, May 28, 2026 at 08:32:00AM +0300, Svyatoslav Ryhel wrote:
> > > > > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > > > >
> > > > > Add support for multimedia top button row of ASUS Transformer's M=
obile
> > > > > Dock keyboard. Driver is made that function keys (F1-F12) are use=
d by
> > > > > default which suits average Linux use better and with pressing
> > > > > ScreenLock + AltGr function keys layout is switched to multimedia=
 keys.
> > > > > Since this only modifies codes sent by asus-ec-keys it doesn't af=
fect
> > > > > normal keyboards at all.
> > > >
> > > > I think using input handler to intercept ScreenLock + AltGr is quit=
e
> > > > awkward. I think this also passes the original key events (unless y=
ou
> > > > make it a filter not a regular handler).
> > > >
> > > > I do not see benefit for reacting to AltGr+ScreenLock on other keyb=
oards
> > > > to activate the special mode on this one. So given the fact that yo=
u
> > > > already mange the data stream when you split it into "serio" ports,
> > > > maybe just intercept this key combo right there and create the inpu=
t
> > > > device and signal input events right there?
> > > >
> > >
> > > Though it seems awkward at a first glance, media keys are integrated
> > > with a standard keyboard in a detachable dock. It is highly unlikely
> > > that media keys will be used with a different keyboard then the one
> > > that is integrated with dock. Additionally, the ScreenLock key has a
> > > code specific to this driver and is not in general use, so even if an=
y
> > > standard keyboard has AltGr but none has ScreenLock specific to this
> > > driver except the dock itself. Handler is also set as observer so it
> > > should not interfere with work of other input devices.
> >
> > I am not concerned about it interfering with other drivers, I am
> > concerned about it unnecessarily connecting to unrelated devices
> > (anything that declares EV_KEY).
> >

I can add check in asus_ec_input_connect() to strictly connect only to
dock keyboard, will this be sufficient?

> > Again, I think having input handler is not appropriate here. I would
> > fold this patch into the patch that introduces the 2 serio ports,
> > enhanced the data stream analysis to detect your key combo, and then
> > report through this new input device. You do not need to have the round
> > trip through atkbd and the new input handler for this.

This sounds like a load of additional work, I would rather remove
layout swapping entirely (even though it is a useful feature) then
rewrite everything from scratch.

> >
>
> I will try with filtering first if you don't mind. If that will not
> work I'll consider folding. Do you have any good examples of handler
> with filter to use as an inspiration? Thank you.
>
> > Thanks.
> >
> > --
> > Dmitry
