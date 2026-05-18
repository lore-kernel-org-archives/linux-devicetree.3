Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCC238AC8B
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 20:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779134729; cv=none; b=lEiddByfAsw9mA2Wrtwua8PtcFXlu7wS9hWwbTOH787cwoZH9kiRk8+uGYpDqJDy8ncbS8hh+FhSz6gGCSJSurZ+P/PuLNE555WEphy8aulLuSReK/MqSIdN3tNRQcKOHT+qSRCj6N+UAZ6VToJmu1FavDDY1TwcodQ0K6F+uBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779134729; c=relaxed/simple;
	bh=vb2AgGc35TL/XGOXSGbcvOchFSZiLg5xVi3rxt9C3Jc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FmuDBGU4IXIc2Krewugs6ISI/F0BeZgkQHFueixiAmiAZx/36iaAUwwIXbdo2PMzolzDuPb4XiCONeKp4CR3AAh/jf4QvDrXFAXFxGOKumRx/1C2Y4hsXYe8NOBDwZsSrWc/BtRklgVqTTM0lOfnHW+Di3PwdvcOMv+I3+ij/os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6EWyO55; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6EWyO55"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so134144f8f.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 13:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779134727; x=1779739527; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cAkY0vj7iSY+sZjzSMZGpI/xkJ9Jb7vUa4k3TiZjewI=;
        b=K6EWyO55U+qM4qMSlAm8EKx1RPPf6yoJiz9flsaJXpScaXdbQghCcqcpDV2w/Qlh4O
         5HJSjPjAKzJ+a9THNHNlFwRDsRMn3bs8X475OpyT+vXh4nwSG6p0vo4KGoTn0L/3u59X
         E3ZW+86E8W7ugUvXTY/adTodcUCYk+J4Qi6mEkYtT75XyHuY8i8HoolTTCb9pObeGE64
         ReDTPG2SJiR8YBos1+dyKrHqwqFOIt8nwRrvBw4r83pCSw+vssYZnc/m2FFtbxa0rTXL
         b3nqrzb4WoQIKF0rb7pJkpacQqmtkCYuPfA+CuENx3afnfdNJcViBwY38tLsmZxcjHEC
         hc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779134727; x=1779739527;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cAkY0vj7iSY+sZjzSMZGpI/xkJ9Jb7vUa4k3TiZjewI=;
        b=RMyO2FotZHBu6E2doPUAKqgdxH9/dAqHQdu2EsGS/quCXxnhmOpVP7w8PQbC1hUMKK
         798caAhVupm6KvxuLwDLRt0LxYUs85Q0LQWeiN3d1NNVTLRTAKDCP5inrK27MXHghsNZ
         050fIeXh1dcQy1aqU+X/gjDi5AB7ZuJDp3bh4/pzm4bF/O+uTWvFYa+C2L8g0uLMjmVh
         iPaVieHs7rQZbdut69O0WOfLbE+imIqXuKYaDjOyR/MY+NGGIMZ3X9mHRN6O1aYIICEs
         tdEnXpM40UL2uekf2c8iblpHgsRtaAZyLBoWbwMBXhcZ10mO5xg0KpYMw3F2ETidOXj+
         R4vQ==
X-Forwarded-Encrypted: i=1; AFNElJ+NPotexpjvYd58kkQMdkMPaXnWaPUkNgjSeKSiP68L41YnvrLllPxCQ14Vrx6zkAHFD1wqsZVTQR0c@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr2faIvgrppvQt1CJNh54Mz850WmUduY9aI4YoZliVRMKB7QQE
	l0iHlfEgQm/lNhMfpNjIyO49IUnFc8YCDaaVTBkY4YFi+CJ+YsBMrgas
X-Gm-Gg: Acq92OGKwU/7cN9nndGuKkOC4I5CQzATmT9JPQmG2+kl6biC2d/dh9pqTng7oD5tlyJ
	IVQK8cZh6cA2F+1xrY/49qtBi+cegmZpeMaEjf8BfScpywSHPx34HZtOSl7osmL6rBS9noCRki8
	EaIiuu8c07G0CCup+GYq3MgGi6rim1S2AWWv8OHi/Ujwd/nvVCpvvAqVL/3YR8P2f1FaMh4SAg6
	9KiRiWvopCnm2epL5X9dg5hR1ERoaVcHxn//YNnF1xFtfUQ9SFBg96nvH2dNyWv+eZ4V2gQsuaW
	EXr1CpGVE5EadDF14viiQM4K4F3OH43MGfctPsOsFwF55Xu6K1zMpuCJtE0k21dyGDMO/2rcJye
	Hh4oHp1Q/LJwMcvPg8XbWQ+UYovH3M4OK9VJARDcV8SRXI//78kj4IuzowWE8hXZiofU9ARQwcI
	X2UzZpdM4MRxDwYwWxoUnHAEbDMBONcop9hSQ0+fQ6KXHN9KZ0h/TzRDb9WkUHHkGyW+ucZF8cg
	kI=
X-Received: by 2002:a5d:584c:0:b0:446:db72:e8ec with SMTP id ffacd0b85a97d-45e5c587281mr26781621f8f.23.1779134726576;
        Mon, 18 May 2026 13:05:26 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19c2dsm40825454f8f.21.2026.05.18.13.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 13:05:26 -0700 (PDT)
Message-ID: <04da68168f92b196cce4d49c766fc62702bf6472.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 22:05:25 +0200
In-Reply-To: <agr9m_tidBr6Cu2h@collins>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
	 <agr9m_tidBr6Cu2h@collins>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Paul,

thanks for the review!

On Mon, 2026-05-18 at 13:52 +0200, Paul Kocialkowski wrote:
>=20
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi =
b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
> > new file mode 100644
> > index 000000000000..65b094f30bf5
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi

[]

> You should add:
>=20
> 	chosen {
> 		stdout-path =3D "serial0:115200n8";
> 	};

I actually have it in .dts, but it's theoretically possible to deploy
the core board in a way that serial0 is *not* a console, so the above
probably will not be valid in all cases in .dtsi.

>=20
>=20
>=20
> > +&reg_dcdc2 {
> > +	regulator-always-on;
> > +	regulator-min-microvolt =3D <500000>;
> > +	regulator-max-microvolt =3D <1300000>;
>=20
> Should be:
> 	regulator-min-microvolt =3D <900000>;
> 	regulator-max-microvolt =3D <1300000>;

0.81..1.2v according to A133 Datasheet Revision 1.1 Jul.14, 2020?

>=20
> > +&reg_dcdc4 {
> > +	regulator-always-on;
> > +	regulator-min-microvolt =3D <500000>;
> > +	regulator-max-microvolt =3D <1300000>;
> > +	regulator-name =3D "vdd-sys";
>=20
> Should be:
> 	regulator-min-microvolt =3D <810000>;
> 	regulator-max-microvolt =3D <990000>;
> 	regulator-name =3D "vcc-usb-sys";

I'm a bit puzzled here: datasheet says 0.9..1.0v
and it has no "Typ" value, similar to VDD_CPU, but
VDD_SYS is not part of OPP tables, so who is going
to adjust this? Or shall it be just

regulator-min-microvolt =3D <950000>;
regulator-max-microvolt =3D <950000>;

?

>=20
> > +};
> > +
> > +&reg_dcdc5 {
> > +	regulator-always-on;
> > +	regulator-min-microvolt =3D <800000>;
> > +	regulator-max-microvolt =3D <1840000>;
> > +	regulator-name =3D "vcc-dram";
>=20
> Should be:
> 	regulator-min-microvolt =3D <1100000>;
> 	regulator-max-microvolt =3D <1100000>;
> 	regulator-name =3D "vcc-dram-2";
>=20
> ALDO2 is the main DRAM supply, this is the second one.

Core schematics mentions 1.1V/1.2/1.35/1.5 on this rail...
Currently U-Boot has CONFIG_AXP_DCDC5_VOLT=3D1100, but potentially
this is adjustable, right? At some point LPDDR4 chips they
are soldering today will be unavailable. And in the current
market it will happen rather sooner than later...

>=20
> > +};
> > +
> > +/* DCDC6 unused */
> > +
> > +&reg_dldo1 {
> > +	regulator-min-microvolt =3D <700000>;
> > +	regulator-max-microvolt =3D <3300000>;
> > +	regulator-enable-ramp-delay =3D <1000>;
>=20
> Should be:
> 	regulator-min-microvolt =3D <1800000>;
> 	regulator-max-microvolt =3D <1800000>;
> 	regulator-name =3D "vcc-pg";

Do suggest to drop vendor's

regulator-enable-ramp-delay =3D <1000>;

in all cases?

> >=20
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dt=
s b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
> > new file mode 100644
> > index 000000000000..ccbca5d0a40c
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts

[]

> > +	aliases {
> > +		serial0 =3D &uart0;
>=20
> The is best added to the core dtsi.
>=20
> > +	};
> > +
> > +	chosen {
> > +		stdout-path =3D "serial0:115200n8";
>=20
> Ditto.

But it only physically materializes in Helperboard, the carrier.
Potentially this one can be left floating or used for something else.

--=20
Alexander Sverdlin.
