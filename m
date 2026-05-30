Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58DB2E7635;
	Sat, 30 May 2026 10:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780136144; cv=none; b=QzTS19V31r4QxhQkmYdQXRA7eabeJj3QHsUPv3umzCYn3ALD1d/HGu7w4FeGLRhT0Otz/GqRHUqVKpkh78Dzu8u5/ZGgoLeXm+r1T10DvCYreClseHe1SQQG80m4HDtWO+wp7dDB7p7D11UAcEY5IApOdUf4T1+FpVGFzbGl+ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780136144; c=relaxed/simple;
	bh=zvaQmf+JYcrSECFYTq4UgqqoBQXPSdcx+io6HmU0Skc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=jwzzjichdRtGGnCHbb/o6dbslEeEBnju0niTV2cfa7aiXxAJlXgmB/3907vhQje2O0GdxYKHiNBnh4vGDyMhFAFpVXIKYif8dJi5CCy5deGHgBmDp480M3QW6ApgN1l+fvrZIlBhV7aB0PmOmTZQvQvX5P+g0Y8z1+FySHd/edE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZSaTGwIJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZSaTGwIJ"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:382:6f:8c15:9eec:bfe9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 579157CA;
	Sat, 30 May 2026 12:15:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780136119;
	bh=zvaQmf+JYcrSECFYTq4UgqqoBQXPSdcx+io6HmU0Skc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ZSaTGwIJEU8eaobh6MC0b3gcnNDLpSV9zHMxVRStc4f8kSxSuDWq6QnARS2AUHlid
	 G7l8wSlvHfjDDzDW4muwKU7nMnF0XIvUHgrhuAkY8PK0s8g6c4IKdMUgzosQIYw0/x
	 1o8tHlJlfIH/2CGUQJyY7+wPUrssN6gDr5ZSGmGg=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260529144125.vs4bds6nwimqdnbg@quack>
References: <20260515-beagley-cameras-v2-0-f6acb66c9995@ideasonboard.com> <20260515-beagley-cameras-v2-1-f6acb66c9995@ideasonboard.com> <20260529144125.vs4bds6nwimqdnbg@quack>
Subject: Re: [PATCH v2 1/4] arm64: dts: ti: k3-am67a-beagley-ai: Add I2C2 pinctrl
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Robert Nelson <robertcnelson@gmail.com>, Andrew Davis <afd@ti.com>, Devarsh Thakkar <devarsht@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
Date: Sat, 30 May 2026 15:45:35 +0530
Message-ID: <178013613529.933414.3135232474616950291@freya>
User-Agent: alot/0.13.dev20+g31692a239

Hi Nishanth,

Quoting Nishanth Menon (2026-05-29 20:11:25)
> On 06:46-20260515, Jai Luthra wrote:
> > I2C2 is used by camera sensor devices connected on the 22-pin CSI0
> > connector. Add the pin definition here so I2C2 may be enabled by the
> > camera sensor overlays.
> >=20
>=20
> Why not add the i2c node here with the pinmux, but disable the node with a
> comment that this should be enabled for camera sensors? A bit confused
> seeing a orphan pinmux node. but i dont see any other function for the
> i2c2 other than support the camera sensors :)
>=20

Ah I saw main_i2c0 pins defined here already with no node (that's also only
used by CSI1/DSI0 connector), so I followed the same pattern here.

Will move them both here in v2.

Thanks,
    Jai

>=20
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm6=
4/boot/dts/ti/k3-am67a-beagley-ai.dts
> > index 5255e04b9ac7..06aac02a7668 100644
> > --- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
> > +++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
> > @@ -157,6 +157,13 @@ J722S_IOPAD(0x01e4, PIN_INPUT_PULLUP, 0) /* (B22) =
I2C0_SDA */
> >               bootph-all;
> >       };
> > =20
> > +     main_i2c2_pins_default: main-i2c2-default-pins {
> > +             pinctrl-single,pins =3D <
> > +                     J722S_IOPAD(0x00b0, PIN_INPUT_PULLUP, 1) /* (P22)=
 GPMC0_CSn2.I2C2_SCL */
> > +                     J722S_IOPAD(0x00b4, PIN_INPUT_PULLUP, 1) /* (P23)=
 GPMC0_CSn3.I2C2_SDA */
> > +             >;
> > +     };
> > +
> >       main_uart0_pins_default: main-uart0-default-pins {
> >               pinctrl-single,pins =3D <
> >                       J722S_IOPAD(0x01c8, PIN_INPUT, 0)       /* (A22) =
UART0_RXD */
> >=20
> > --=20
> > 2.54.0
> >=20
> >=20
>=20
>=20
> --=20
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DD=
B5 849D 1736 249D
> https://ti.com/opensource
