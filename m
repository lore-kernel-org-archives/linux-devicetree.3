Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9AA2D46CE;
	Tue, 31 Mar 2026 20:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774988454; cv=none; b=a0STYnW8LCS+30dYq5QzevFRS2+BxIgXj/GpWG/61MUj43s15ClFAwvBEtMSGYo7gWel4OMtaXDuI1N7C14jbfUKQh377QlQ8+t+e5CAzytGgm3pC4c5G3XlbTyTed6rmnH/+wPv9O5zGJeQxNnDVXbXF0yiAxSks6XRd/COyj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774988454; c=relaxed/simple;
	bh=DDf77+4N4LhLprCTibbv//x45CHKg/s8+b5TX20o5ZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CNf5K3Z0XGbLUIidBf5dHpyjHqr8F4Pkw+rScKXkjSOFY63hYcaZV11FfCt+BAxZJpZUEOrOolBB9eJSr05GqptQm1HJ7+zkmExgZgaBp7x9hwgGEZkHlvqmYdQVxRrgwQpsIpyEAbbmP4sTPB4Odv8LO/NZ9/BNtnIi9bYVqv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=dMmFTAQK; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="dMmFTAQK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=j0M0/sXX/s0DXkkv0+EF2fIkGOqZ6C31hkXqcBioYKU=; b=dMmFTAQKdHoK+OMMZ3qvudqnUZ
	4rainb2qsrUHgHOP8R3lPswoGe4ucx+aqtz6sk1eZ0HRM1mTT+QpN8ZdcE7tmTimxinxyvclzImRZ
	rG7gHw2rRZgr+4aMdFknFtkiR23scQZZBBRxWw7pS4M6x2iqb3mZo9bysBw65vl02YInjsf1Jsn5i
	y6i04IKp2U0Jv1hI2U+VKaWjndyOdwY6CAluE4xfowMd481CiK7bPi0bZYrbvpzW5lhh4uQnWs8G2
	Z5kaLATQs5x8Fj9r+SMm31c7fZGXe7UA0JADZw1OIGNK7Ln1HCvdg62W2piCE0HgR6QbG6YNvSRZW
	p+S9lLsQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Alexey Charkov <alchark@gmail.com>, Dennis Gilmore <dennis@ausil.us>
Cc: Jimmy Hon <honyuenkwun@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 FUKAUMI Naoki <naoki@radxa.com>, Hsun Lai <i@chainsx.cn>,
 Jonas Karlman <jonas@kwiboo.se>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 John Clark <inindev@gmail.com>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, Andrew Lunn <andrew@lunn.ch>,
 Chukun Pan <amadeus@jmu.edu.cn>, Peter Robinson <pbrobinson@gmail.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 Mykola Kvach <xakep.amatop@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v4 3/3] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
Date: Tue, 31 Mar 2026 22:19:50 +0200
Message-ID: <2545205.jE0xQCEvom@phil>
In-Reply-To:
 <CAABkxwsD_59G3YrpMdUi7D1fVHruSuDHn9-gQAZbwTdxGBHaBA@mail.gmail.com>
References:
 <20260310031002.3921234-1-dennis@ausil.us>
 <CABjd4Yz3MKOp-gE8kNc4EOt3-a0mKZsxvbVYCN4KsbqTRDtWgA@mail.gmail.com>
 <CAABkxwsD_59G3YrpMdUi7D1fVHruSuDHn9-gQAZbwTdxGBHaBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Dennis,

Am Dienstag, 31. M=C3=A4rz 2026, 21:41:50 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Dennis Gilmore:
> On Wed, Mar 11, 2026 at 9:26=E2=80=AFAM Alexey Charkov <alchark@gmail.com=
> wrote:
> >
> > On Wed, Mar 11, 2026 at 5:29=E2=80=AFAM Dennis Gilmore <dennis@ausil.us=
> wrote:
> > >
> > > On Tue, Mar 10, 2026 at 7:20=E2=80=AFPM Jimmy Hon <honyuenkwun@gmail.=
com> wrote:
> > > >
> > > > <snip>
> > > > > +
> > > > > +       vcc5v0_otg: regulator-vcc5v0-otg {
> > > > > +               compatible =3D "regulator-fixed";
> > > > > +               enable-active-high;
> > > > > +               gpios =3D <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>;
> > > > > +               pinctrl-names =3D "default";
> > > > > +               pinctrl-0 =3D <&vcc5v0_otg_en>;
> > > > > +               regulator-always-on;
> > > > > +               regulator-boot-on;
> > > > regulator-always-on and regulator-boot-on does not seem right.
> > > >
> > > > Why were these added? The vendor did not have them.
> > > > https://github.com/orangepi-xunlong/linux-orangepi/blob/232ed4b97b6=
5da2b7b647c4e3c496f8594b9f3f1/arch/arm64/boot/dts/rockchip/rk3588s-orangepi=
=2D5-pro.dts#L216-L226
> > > >
> > > > Was this mistakenly taken from the regulator usb 20 which is poweri=
ng
> > > > the onboard usb2.0 hub?
> > > > https://github.com/orangepi-xunlong/linux-orangepi/blob/232ed4b97b6=
5da2b7b647c4e3c496f8594b9f3f1/arch/arm64/boot/dts/rockchip/rk3588s-orangepi=
=2D5-pro.dts#L111-L119
> > >
> > > It may have been a missreading of the schematic, but it was added to
> > > get power to the USB3 port. before I added it devices plugged into the
> > > USB 3 port would not power on
> >
> > Hi Dennis,
> >
> > The schematic says that this regulator supplies the VBUS voltage for
> > the USB3 part of your Type-A OTG connector. If you make it always-on,
> > you'll likely lose the possibility to use this port in device mode
> > (which you would need e.g. for flashing images over a USB cable in
> > U-boot which also takes device tree sources from Linux via
> > devicetree-rebasing).
> >
> > You also link it up as the PHY supply of the USB2 controller, which
> > doesn't describe the actual hardware.
> >
> > Please see if you'd rather define a connector node for your Type-A
> > port, and list this regulator as its VBUS supply explicitly. I've
> > recently submitted a patch [1] to make the "onboard_usb_dev" driver
> > take care of enabling VBUS in exactly this type of situations (it's in
> > usb-testing now and will hopefully hit -next sometime soon). If you
> > need an example for its use, please refer to [2].
> >
> > Best regards,
> > Alexey
> >
> > [1] https://lore.kernel.org/all/20260217-typea-vbus-v1-1-657b4e55a4c2@f=
lipper.net/
> > [2] https://github.com/flipperdevices/flipper-linux-kernel/blob/2f814cd=
f07f50e901fc1b1328213e76460864c20/arch/arm64/boot/dts/rockchip/rk3576-flipp=
er-one-rev-f0b0c1.dts#L303-L328
>=20
> Sorry for the delay, I am taking a look at it now. Please let me know
> when it lands in -next. In the meantime, I believe what I have is in
> good shape and is working well here. I am happy to make a change once
> support lands upstream.

Review comments should be addressed before patches get applied.

So there is no waiting for "when it lands upstream" to make additional
fixes, when you know at submission time, that things need improvement.


Heiko


