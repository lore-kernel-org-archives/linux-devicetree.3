Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3C33403F9
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 04:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785817938; cv=pass; b=dANz6U7UzFNh+cIKbwN127nML2C27UVasOItM3F907zRBhHUH+gb4vIItA9lrhC/7eBepoeo+a86BIfMBuRsTWi7r63sWQt49lGKvJgZObL6DSZcvvTdoCNoFTJ6ypU6fCfOYrydXsLdV6guIDh0LAQt2ByRUVd99AYR5G1mry0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785817938; c=relaxed/simple;
	bh=GiIFhUl7eFI3+MXUktDiqoIE9NJ1C/ZSCqWdRAOmTaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ct0fjaTTm8JVjW8d/cQbPxJi0CUYBSyimyqLg3+k4OLnT1tRWSAReMvLks8KZ74mp9a6VVJhWJOuBsN1Uk1tdq8T25gIFkxqBBB4n8gYwNkhD80xBxHsGdGXg+L3nznTQgaAdio9VSp34fYr8HdD6wgbQkkW+kh24S/s7qASrbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ecEDPy5i; arc=pass smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ecEDPy5i"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c2c96286f0so2037158e0c.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 21:32:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785817935; cv=none;
        d=google.com; s=arc-20260327;
        b=oQkclaMEbiQ5o19PkQkzBdGEg39E80pK7zZ9sIMvC5bTW3OYbFup5H+syuCRupuas1
         u/YhbXy5hSbzhH1QSipuy5nMtR0CKsFfM3u1lWzp7teaVDWTjMWXoDIGXeDbttv2q8z5
         M2HVKXkFoT7yKUIljrUvOaEkuCby+Br/73bGcwycAqRtE9sPz5yboKcNZnWFtv9xs8hp
         PI5PNey83Z2vSqB7ADU/r5UaP8W1Kh+DyMicVZbyipirv2qL7ZXNbdfrVSdCSR9A6XgZ
         th4kv1Vfjl6+EZCegCvKiOGXA8DQTY6MZu0vQV1mhYhNkBsAR3zhD7czIONCPyw+aKnY
         neMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LUfG70xuwTFgcp+8i3Kan+grkhw/1qDG9gV+zT/fD6Q=;
        fh=N5y5GPI/t1d38eTRio3sp3PoItX9FUJad/NsmQ953Jk=;
        b=YRvbnqQ/pDaG9SobXMZRtXIAn7w9c962VD48wE1Tbhmp+Z2huyjN1OUfBe73i8AbL5
         RxsCWdlF3pw5S32YNjhwmyPOxDGdWdwDWt39hWHnycsFVE/qk8JefDuhu27ot+iupb2r
         inAZxdvPHZvT6SGV2mYrprG/J/bvl16VZnDE15f+prRoNdCzM53o/HZ8UrQodGEoCzFO
         BFF3faME8nhwL2Nz/p97VI7YxOIvqyg6SFIVHJSMAGOKJfBOFMI/bSpLw3uaFVIaBWLT
         gct1hxJyNGv3r3PDXTFzJt2TcEjhyVwv2Iz5owR1suFbNPhSzJKIkPhPexjTDCtvjpUa
         7u3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785817935; x=1786422735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LUfG70xuwTFgcp+8i3Kan+grkhw/1qDG9gV+zT/fD6Q=;
        b=ecEDPy5iAhpVTwsa6wEoo8WMAvzMX7UuivammsLWC/ZJxD+SDjqioKBq7YTEAYcjbr
         8ZtkAkY3hO5GuFQ3nU2pTUA5ntC5zdzzPRxhqHA9Euk0Hjl2b749a7EvCLCWLGHfLjb7
         nAwJ0vBAqePSYZeh6nhzTCmBvK/PNoqfm7NMyby26EX+2OMjCU0mq8dSvLQpRbgRklwP
         7OhaBWVnHmaBENAh50nuu2CSRo7KBiyoryVEo8iyqHHKR0hMR5NPD6C3PUxw3O7MgBDz
         dZnI3gRMi01frserumU7GfhIsfroT450ToZ5UWPrQDF9P2kbsdH3IETDhqxLcR7f9by6
         Qc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785817935; x=1786422735;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LUfG70xuwTFgcp+8i3Kan+grkhw/1qDG9gV+zT/fD6Q=;
        b=Mz3tDeSahPJaGrhk+F8iGCVH/LpOxzjIYC5ZTF1HYVFamnRrWiib8KOEZqEHOXHVXz
         XMg5zvXo46XiVMQ7jO9dHvbf+4NlfCMa7Ci0T70775K4VAjieOCKSPMNZ6QOdYLuLEbT
         EoweOSVP91SPZIjwtWkZ6wi/foTgqnt0lhLOKO2kwaRDO5Fj1kM3Nj5cit5zfbsr813v
         J9zfCRi2awSUNm8kvKG7vAYssyAdmnFcgHmTFMEYOjj7LSnUXb1h8RkdRdCd0/zHkRti
         uqaap6NfuNm7Aaolmw307QO3FYCwKxmM8slw8Q8IvGLCldKrKrqsbL1gZBhGcj7u7jMv
         PMlA==
X-Forwarded-Encrypted: i=1; AHgh+Rpzyw+a1+7JhzZMzf9E646BV+77u+FwwyekMSaSVZOaLcs+m6w7ukjvssM8AHIzxjgsXMWV9a6EdOUA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0aku1ijvx1KZQiD2Ic6f5EAXeZ5xS4n9Ak/d9mEGH4+VJ2D5x
	cVbjiqDjZzHtwsOh0HU1WkT023NQw9ha6rIFkNN/yCIYnHzKO3b/drd+mNWCas50Dgm6L3IMDNl
	5HPucWK6JXPgvzxQvXDrdJX7rul4dYV8=
X-Gm-Gg: AR+sD11pK4N14HdHuSeUYTpFzC3uWKuMeyX7LoUhGbk/SE/Ebn7Gww71XZB0yf2cFaZ
	EdmfXMQvXqVzgqM7/2QkbwWbQSNcOhKFiWva3SSJO3renkI1DS31vnTenDZCpPGEV6wZLCaPYjP
	I82ONme7p+fL7wPTLR1gOc47JDpKalFKKUUYZxN+0j0RiIr8Hnhn4m9v+Sdjmxgmhf6Nd3TkInh
	+mIIxGDWOI7U53Av+0ibB9DcI585TZhwf0lvC0CH+ElJnaYh3MZolAatHKECbSWi7DouV2JKC8S
	NtG5xzYYYx+X6X0isY5viHCBZnzc1V1YxwGiI0Q2u4UmosMvZi7upRShg7wM5SuVbVz9hi33ZNV
	6zsf376/iFYL+m1sT+J/JZnx4YqsdxjYCEYHOpWYSX/crQdPlfGa11yTqz/4StBfhEjN5I4F5VX
	oyjvpFB38fwBr7PDG+w2txCLMdlySZX5PbR2lh
X-Received: by 2002:a05:6102:15a3:b0:738:be73:55e0 with SMTP id
 ada2fe7eead31-75b237677ffmr8262959137.12.1785817935136; Mon, 03 Aug 2026
 21:32:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-10-0a53cd9e21cc@gmail.com>
 <05b1e6a2-725e-4b8e-8629-249637bbcb81@lunn.ch> <CADvTj4o0JdjoO+FC4pO=qnjEQ8MRyzQdKp2Hxy9NsPU-gym5OQ@mail.gmail.com>
 <9b8be475-1fde-409c-a82e-be4b2e402650@lunn.ch> <CADvTj4pBovti19MXgQjFpxm=7aRm0sYQz9jxfo8bu3txH94THQ@mail.gmail.com>
 <CAGb2v64U9ZQxfb7M3VfoGH60iMHL01XDy6tjs8VbFPLfyaJWgw@mail.gmail.com>
In-Reply-To: <CAGb2v64U9ZQxfb7M3VfoGH60iMHL01XDy6tjs8VbFPLfyaJWgw@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 22:32:04 -0600
X-Gm-Features: AUfX_mzUkHY4di871Z-oeEmg1mv3oYLeo3scVGxNss1cbpF1OmuFzb1N7ZoUB_U
Message-ID: <CADvTj4rCaL+Kf5C_Sd8-p5nJHxF8GR2i8oHFJd1Nz=egx9RcYg@mail.gmail.com>
Subject: Re: [PATCH 10/21] net: phy: add X-Powers AC200 EPHY control driver
To: wens@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>, Richard Genoud <richard.genoud@bootlin.com>, 
	Maxime Ripard <mripard@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 8:07=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wrote=
:
>
> On Tue, Aug 4, 2026 at 2:45=E2=80=AFAM James Hilliard <james.hilliard1@gm=
ail.com> wrote:
> >
> > On Mon, Aug 3, 2026 at 11:57=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > On Mon, Aug 03, 2026 at 10:09:01AM -0600, James Hilliard wrote:
> > > > On Mon, Aug 3, 2026 at 7:51=E2=80=AFAM Andrew Lunn <andrew@lunn.ch>=
 wrote:
> > > > >
> > > > > > +static int
> > > > > > +ac200_ephy_ctl_set_led_outputs(struct acx00_ephy_control *cont=
rol,
> > > > > > +                            unsigned long outputs)
> > > > > > +{
> > > > > > +}
> > > > >
> > > > > > +static int
> > > > > > +ac200_ephy_ctl_set_led_polarity(struct acx00_ephy_control *con=
trol,
> > > > > > +                             bool active_low)
> > > > > > +{
> > > > > > +}
> > > > >
> > > > > I've not looked into the details, but these look like pinmux. Doe=
s
> > > > > this I2C device have a GPIO controller? Can these pins be used fo=
r
> > > > > other things than LEDs? Maybe you should be implementing a GPIO a=
nd
> > > > > pinmux driver. The Ethernet PHY driver can then just select the
> > > > > correct pinmux configuration.
> > > >
> > > > These do not appear to be GPIO or muxable pins. The AC200
> > > > documentation describes them as three dedicated EPHY LED
> > > > outputs: link/activity, speed, and duplex. The bits in SYS_EPHY_CTL=
1
> > > > enable those output pads, while EPHY_CTL provides their shared
> > > > polarity setting. I have not found any documented GPIO data
> > > > registers or alternative functions for these pins.
> > >
> > > So what i'm trying to do with both of these is make it look more like
> > > standard Linux building blocks.
> > >
> > > If that is not possible, i would actually put all this code into the
> > > PHY driver. You then have a regmap property to gain access to the I2C
> > > registers.
> >
> > I understand the goal of using standard Linux building blocks where the=
y
> > fit, but I do not think folding these control paths into the common PHY
> > driver gives the right device model here.
> >
> > The AC200 and AC300 expose the same Clause 22 PHY interface, but their
> > control functions are separate devices with different transports and
> > lifetimes. The AC200 control function is an MFD child accessed through
> > the parent I2C regmap. The AC300 control function is a separately
> > addressed non-PHY MDIO device. A regmap reference only describes the
> > AC200 transport; it does not represent the AC300 control device.
> >
> > Folding both implementations into the common PHY driver would make that
> > driver manage AC200 MFD registers and resources as well as an AC300 MDI=
O
> > control endpoint. That would mix the package-specific control transport=
s
> > with the otherwise common Clause 22 implementation.
> >
> > The current split uses standard subsystems wherever they provide a
> > matching abstraction: MFD, regmap, MDIO devices, clocks, regulators,
> > NVMEM, device links, and the PHY LED framework. The narrow private
> > interface covers only the compound operation which those frameworks
> > cannot express: calibrating, addressing, configuring, and sequencing th=
e
> > package control block before the Clause 22 interface becomes usable.
> >
> > The link address is an important example. It is defined once by
> > phydev->mdio.addr. AC200 must program that value through its I2C contro=
l
> > interface, while AC300 must validate it against the address of its MDIO
> > control endpoint. Generic PHY operations do not carry a consumer MDIO
> > address. Encoding it in a phys specifier or control-node property would
> > duplicate the PHY node's reg value. Giving the common PHY driver a raw
> > regmap avoids passing the address only by moving the provider-specific
> > implementation across the driver boundary.
> >
> > The LED pad-enable and polarity bits are similarly part of the package
> > control function. They control dedicated EPHY outputs rather than GPIOs
> > or muxable pins. The common PHY driver still owns the PHY LED semantics=
,
> > while the selected control driver performs the package-specific registe=
r
> > access.
> >
> > For those reasons, I think keeping the transport-specific control drive=
rs
> > and the common Clause 22 PHY driver separate is the cleaner division.
>
> I think what Andrew is saying is that you can expose the regmap from the
> MFD node, which you then reference from the PHY node with a custom phandl=
e.
>
> In the PHY driver, the first thing to do is retrieve the syscon, and if i=
t
> is not available yet, return -EPROBE_DEFER. Then you program all the bits
> you currently do, just without going through a layer of redirection.
> You can fetch the PHY address to program from the device tree. The downsi=
de
> to doing all the setup in the PHY driver is that the PHY node has to have
> the PHY ID in the compatible, as it is no longer generic. But you already
> have that.

I agree that direct regmap access would be reasonable for an
AC200-only driver, but I do not think it is a good fit for the
combined AC200/AC300 case.

The proposed phandle only models AC200. AC300 has no corresponding
MFD regmap: its control block is a separate non-PHY Clause 22
endpoint, with its own clock, regulator and sequencing requirements.
Folding everything into the link-PHY driver would therefore still
require two transport-specific implementations -- raw AC200 I2C
regmap access and raw AC300 MDIO access -- plus conditional resource
acquisition and cleanup. It would remove the function-pointer calls,
but merely replace them with AC200/AC300 branches throughout the
common driver.

This also matters for boards sharing one board identity but
containing either package, as selected by SID. Fixed boards can
reference one control provider, while variant boards can reference
both and let the common link-PHY driver select exactly one. The
selected provider then owns its transport-specific resources and
lifetime. That avoids making an MDIO PHY driver directly manage an
I2C MFD function on one system and a second MDIO device on another.

The control interface is also used for more than initial probe. It
participates in suspend/resume and reset sequencing, interface-mode
changes once the MAC attaches, and package LED-pad configuration.
Consequently, exposing a raw regmap would not reduce this to a
one-time register setup; the common driver would still need
package-specific implementations of all those operations.

The PHY address should not be read from firmware again. The MDIO core
has already parsed reg, and the authoritative address is
phydev->mdio.addr. Passing that address to the selected provider
avoids duplicating or independently interpreting the firmware
description. Similarly, the forced ethernet-phy-id0044.1400
compatible is required in either design because the identification
registers are inaccessible until the package control block has been
initialized; it is not a consequence of using a separate control
driver.

Also, AC200 is an I2C MFD rather than a syscon. Exposing its regmap as
a syscon solely so another bus device can perform raw accesses would
blur the ownership of the AC200 function.

The private interface is intentionally narrow: it contains only the
operations whose implementation differs between the two packages,
while all normal Clause 22 behavior remains in one shared PHY driver.
Given the AC200-only, AC300-only and runtime-selected board
configurations, I think that separation provides a cleaner boundary
than moving both control backends into the common link-PHY driver.
