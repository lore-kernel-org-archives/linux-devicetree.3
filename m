Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA9F2222A9
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 20:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779050276; cv=none; b=dqC6++crlhuVReioYv/QdlGq+M8I2niqHZOWZ0Lp0FXfaRD5JgpfbMiSzkoj1EeGdfFlJRusA6irrlXTli8ueh7xh2+6zdRbqCCO6B+xj+0fuyMb5QVxlY+XylxffD+dKdrDONQHYqui5UOfs+ES90nSRo//MX/mGAGNifpydIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779050276; c=relaxed/simple;
	bh=rlbSlwGTV2AmvHlHO822z/zxZ++TLcjFgTSdirvXcOE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y8wjhMjhKbfbLnhhx7T2EBKoymFUpUbZXFfAoVliHzy813TH+jyHYoXnG78B7HayBsM42pf9chiqLdksnZi0Qy5wb7DOMi3LH43zRFl8AJg4Li3mOysgW4SpBRfKNQ/fUPz5R7sO+dS/wF7kmaRTWh9O17REov5FfnV9YkP5iLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iM4yFsuE; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iM4yFsuE"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48d146705b4so16491225e9.3
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 13:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779050274; x=1779655074; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fPgB9UynDfl3zmI3aakfTZKeiVVfht++/m5WoF0UhgA=;
        b=iM4yFsuE36OKLkdYR8UlUb0SlCYG0lfcic2OnFZAtGfs+HrmuuM5onYQ/wI5M7kZX/
         qhmsIln1sXKqvuBjTosMJfPqXmUYEgLSgI5LdlUPqM0oj1yFmlBYuJAO1V13TJPhxDpw
         yupV0NFlrZWeaPn/F2QPZJwa5A/UXjsm7prLQwfGfvwvl+GCqx2FgZir78FNg/Qko6CJ
         buacAm8N7E7jMyCXh+C0VYCirlFvtY6KEiQD4bYL8oImQX2Bf36PH6CV/IWRHF68V+lt
         WCKg+qAExf98RrJT6CtIaIyQAN1rlWqPEwcsX6HlTsOJi4QT0URsafnlCdT6MbLWjSvi
         7iZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779050274; x=1779655074;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fPgB9UynDfl3zmI3aakfTZKeiVVfht++/m5WoF0UhgA=;
        b=qKKX8wb6BFZbckc25aidfLtNAunL7rvcRGpLmSYGXd88qmI6AVBv4hQNO+qhGxwTlr
         UJXyyIrip64uac5DfxAX4mp06wD3cG13Jphcf2y9Jt1PS/0jX1ND5GRHdRgmeQaK2pZT
         dTYzAaKDj+d7awZSUTgsdNgC9sKwBxlS+PZXFQX4rGZN5INK260T17IJI6Hi73mQURKk
         CLCVUBgeoW4c7gzAA9O0iZWFofOrRUnM7N71ITVt9hCQi12XJ4R3f3XVte5bJzfj5Xyb
         TN6VuYKE8rV+ZCmqJj2u5e+5prnfv61rmoD3b78MPzB2A0eR8JGLqm/eTZlyELx7vSc8
         witA==
X-Forwarded-Encrypted: i=1; AFNElJ/PygvYAz71FylCnWN74deRw1YTCYDde/G/rc2v5J/BzrQ5w0S196ontcsgRvFgn+1P30EAuen3/bIq@vger.kernel.org
X-Gm-Message-State: AOJu0Ywty0IK4uA2Rub/X+2dwLQ97LGQgahca9+05XYJIXnDS3ENsk5U
	SFW4cqBAYrdbHikXxSQhbzciMCmSuBg9a009qHrjQYBOpTb5bxRX9CHs
X-Gm-Gg: Acq92OGDsTSHjQb7ghuYcUOiSZGZne2fSQ8Qn+BNe2/2vD8aZi7DKSo2FXwdqmY7Oqh
	o5e5T5/iyQfTu87sXbkk/6vR7fVEJ1dPJNbGEZjDQ9kpJ6tONKtCm4KutAN1dLw+ZBwYuv1Yiz6
	u7eIGZKrpJ9o3GUIsSvYO05rz/271/PGnsDPdsXFqyR3GNjiQpTLguTQoCtqdUKm3vEUHu8UrOc
	LG3T+jji+30q3NzKc9HZ12caVGGIy+pD2nTSyWBAwy3Tznoxu6dX4Q5Yz3uAnm2OVPTeHxIaP/H
	/FGbXQii9Fj6JfzVAuiOHi7yFWDSsyw/u1OaBna2hiXA9ITAbtdt3wO2bca10s8eY/xE5suyCMJ
	4LSmL6Gntk8Kw+HfDZK9GGfgVwFVD8F3yLNeo5afhm73K8KCv86MDlal6gtoNDlmGwG1eU/ifno
	xmNTzGdk20jBBDJwPg/98sKLAK8d1mDSj1X4Ol/qbRhZX4o1IojpBqLVzJGCayr4r/G4JCzt6Rc
	ro=
X-Received: by 2002:a05:600c:a293:b0:48f:e6de:1cc6 with SMTP id 5b1f17b1804b1-48fe6de1e03mr114181345e9.32.1779050273455;
        Sun, 17 May 2026 13:37:53 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5694fbfsm363386665e9.6.2026.05.17.13.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 13:37:52 -0700 (PDT)
Message-ID: <14a7e289ff5ffed8fcd6dcb9b2e8455a1b2c9420.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Sun, 17 May 2026 22:38:13 +0200
In-Reply-To: <2306dd3c-6362-40ee-8d9f-77f89be3a502@arm.com>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
	 <2306dd3c-6362-40ee-8d9f-77f89be3a502@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Andre,

thanks for the quick feedback!

On Mon, 2026-05-11 at 13:44 +0200, Andre Przywara wrote:
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
> > @@ -0,0 +1,162 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (c) 2025 Arm Ltd.
>=20
> Please put your own copyright here, even if that has been largely copied=
=20
> from an existing file.
>=20
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "sun50i-a100.dtsi"
> > +#include "sun50i-a100-cpu-opp.dtsi"
> > +
> > +/{
> > +	compatible =3D "baijie,helper-a133-core",
> > +		=C2=A0=C2=A0=C2=A0=C2=A0 "allwinner,sun50i-a100";
> > +
> > +	aliases {
> > +		serial1 =3D &uart1;	/* BT module */
>=20
> Do we really need an alias for the BT UART? And is the BT module=20
> supported already? Then please add a child node to the UART node.

That's the only thing I can do currently regarding BT: stabilize the
serial enumeration, because UART1 cannot be used for anything else
except BT module, because this is soldered inside "core" module.
We can avoid different tty enumeration, should the support for
BT be implemented in the future...

> Isn't the WiFi/BT module on the SoM? Then please mention and enable MMC1=
=20
> here. Provide the child node for the WiFi chip, even if there is no=20
> upstream support in the kernel for it yet.

So both the above BT and the WiFi is AW869A/AIC8800 combo chip, which
has neither upstream driver, nor [upstream] DT bindings. Even github
driver for AIC8800 doesn't seem to use DT, therefore it looks quite
pointless to me at this point to specify anything in the DT for the
chip which doesn't have the bindings idea even theoretically.

Nothing in the current DT shall block any future work on the AW869A
support though and the above "aliases" entry shall even guarantee
unchanged serial enumeration shall such support arise.

> > +&reg_aldo1 {
>=20
> What is aldo1 used for, actually? I don't see this referenced anywhere.=
=20
> I guess the kernel turns that off after booting?
> If you have access to the schematic, please check that. If that's for=20
> some peripheral not yet supported, please note the user anyway, ideally=
=20
> by an explaining regulator-name, or by a comment. Also if it's used for=
=20
> any of the required SoC VDD pins. See the Liontron .dts for comparison.
>=20
> > +	regulator-always-on;
        ^^^^^^^^^^^^^^^^^^^
I suppose it's not being switcdhed of because of the above.
It's used for both PLL supply for the whole SoC + as analog voltage referen=
ce
for LRADC (the buttons you've noticed on the board are connected to
this ADC via a resistor ladder).

>=20
> > +&reg_aldo2 {
> > +	regulator-always-on;
>=20
> For always-on regulators we definitely need an explanation. Does the=20
> board stop booting if you remove this line?
> Maybe it's for DRAM? Can you say what voltage it is, either from the=20
> reset default, or set by the bootloader?

Thanks for the hint! I'll put proper voltages into all regulators +
comment all the always-on regulators.

>=20
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dt=
s b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
> > new file mode 100644
> > index 000000000000..ccbca5d0a40c
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts

> And you should provide a top level 5V regulator here, to be the root of=
=20
> the regulator tree. Look at reg_vcc5v in the Liontron .dts.

It doesn't look to me as if Liontron had reg_vcc5v as its 5V "root" regulat=
or.
It seems to be only used for reg_usb1_vbus, while HelperBoard A133 doesn't
have USB power control. The second issue with Helper/Core split is that
all PMIC story is inside Core board which has 5V input rail, while HelperBo=
ard
around it has indeed 12V->5V DCDC regulator (similar to Liontron), but
putting it in the DT would introduce wierd dependency of the core to the
HelperBoard which carries it. Do you think it would make sense?

> So from the pictures I found online it looks like there is an USB-C port=
=20
> labelled "OTG", so can you please add an &usbotg reference here and=20
> describe that port.

Nice catch! I've missed the fact usbphy 0 has to be in peripheral mode,
not host mode. Will rework!

> > +&usbphy {
>=20
> Are the two USB ports always powered?
>=20
> And anyway, I see a *dual* USB-A socket on the pictures online, in=20
> addition to the USB-OTG port. So where does the third USB come from? The=
=20
> A133 only supports one host USB port plus the one OTG port. So is there=
=20
> an USB hub chip on the board?

There are two hubs, one on each usbphy. OTG side hub is even bus-powered,
two USB-A ports are always powered from the board's 12V->5V DCDC, no USB
load switches.
>=20

--=20
Alexander Sverdlin.
