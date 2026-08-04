Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FBE331ECC
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 04:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785818284; cv=pass; b=L5MngaQEQbvDRHsFjZCZOlPyA1jax8BcO2TTE6KrW4dQs/r/BGUMod/CIjlAwE0GCgvDaArelFjFt9t+yeG9y+eZHt2nXeCJUHG7zIYIq5MXIW7nwcNMWtzwVro60YusFLj8Y8wG8TniPlTLf3w9JVLwJ+kksm5aR4WjCyRnoIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785818284; c=relaxed/simple;
	bh=KCujiFsubPppZdIzZBFgzB0FHL+kaNCYcrxKl9k6kYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B6v19ZryoZnqJdbO0S+Mx+dXO7FskSo5RXJzVVNldt/gPXgRp8zj6HUL1Z36btJPErkSe0uAJ7FPBG40c/35P5O40WzZz7AkXq+7cKeF24OBu2QIi684AIryGZAHA9TMI7KtYDs1g/SxBHhH/lsX/Z7B+ZT+IU8GM4nMxqNrjHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=liNCeUs4; arc=pass smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="liNCeUs4"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-969524c1aefso1387776241.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 21:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785818282; cv=none;
        d=google.com; s=arc-20260327;
        b=CAxuaa+Jrr0cDZ/eb8Ovq+kJP4gKWM1vUlnhzGkK6v0IXvYONXQJuPIUF/1hCrpkNo
         oTm02Fgg39zk/t7ZGKdsDa/wopfNQgLUsYE98NeBAlliQKrPyR4PGLiUnt0VfpyM+PJX
         c+a8Tt7oS1l46IViWS0cD7+UPMEpGnotTYH3YI2rDyuNaIQCD/3hhzFvH3O8C0sJqv8/
         dGQM3Lw1NV/4kx/3z4kL+Jv0LylzMa3ND2Kr4MJDR6iPVOuCyc6qSxJJsYsujRsiBfFY
         D+pLZCRxTuogpI7vq1BSRyeF48tFphkbf3tNJGNyl/HyzKsnRqUvbUdmY6ZPqEZkFu5z
         IpGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KCujiFsubPppZdIzZBFgzB0FHL+kaNCYcrxKl9k6kYk=;
        fh=gkhlXbHxuVcjs8tAcxApEGJ44daBXSjTuVD0miY/r2s=;
        b=KehlQEc1biyn8Jvi67jZB19jyfWCPnI4K/wjTa4xV8K7FkQYFPjE7blwRdg7HROZsP
         dqgcb3HaRtysUyzepdBWAjnxKilOTcvXv0/Uh7mrYyT5FMTbUdnzgIp3ebkmomoeG7l7
         Z8/v1T3nOz3sPMkd4Gd5eMr/i1qfAaddPOSzDq1UHKkGsdsIfJHG8AfQgMxEQGNQnFj8
         uCF+n8QFdEE31TGWc1bYPS/yVcPK/RAkRR4CkrJIQUKD2NZng3PRZDj8m6e0Lp5hO12e
         jDzJj4VjsHIarCDp3SQwTyzEsTKztA4ZOwIxODt7vOfvK4OY5mVYb8/QbqrztIzeomHb
         XJuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785818282; x=1786423082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KCujiFsubPppZdIzZBFgzB0FHL+kaNCYcrxKl9k6kYk=;
        b=liNCeUs4ECDJvcEZ4Rc0Abd4lQbDzvcu7iOIFYL9wXpzEvtDs2yKblPq4exJb/iLVw
         eDCmk7AHckSRnc+1K5xQ43URrohTb+uNgiHt6PEQ4r5rJBqZmdLTdL/8Djn3WTHYzZtA
         X9TC3QSLxfg905jpGEvTaY7nQ8GcyMsadgbm5R9pbZIHXgONSDcoYWAoirSK7bXwv9fc
         s3BY8/wWskDBTM2zXwqq+cCH4u4FDn89YsSGOzJ7Gi1hhpoEumm3JPvDpWVkrEOnJWiJ
         xLhv1i4xZJpofa4T198bCQBrrpG6lATK8IGztX5pFZ3a7iCqtI7SHfn8c9t525JdoigM
         CvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785818282; x=1786423082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KCujiFsubPppZdIzZBFgzB0FHL+kaNCYcrxKl9k6kYk=;
        b=nsPP1dd2TBdlZbuSXgwU8FkWleM8jTEsF2eh1F1itlLpnaP5CGMW+rp+EMfHgVyt50
         qr295nvLJrD1rHZBnaW+LYxjJtmAl0fDIv8+VvX3lMZViDLo78UOP9GzHvKxS9uDzMeZ
         69B6/4vvzVz0YxQnaOyCz9oYqFm70EIkQnBZl+GtL7czhMX2rWTCJBFaj7hfrDPTxe9l
         Eh8ZP3wVegvXGIi3MG5+9E6G6TSDAjP0+lcm3Qe0J6BuQw65bS0d97pOCChTD/ZbS0xW
         gnbgJPqKguYy7aiwPCDY8lVc3wJ2EaUEbQWOEn5+C3L5Sy4Wrrr9LH1C26eKz99AlbfN
         BL3w==
X-Forwarded-Encrypted: i=1; AHgh+RoyD8qDPADPSPdwhMVi9i+CUm322YIjXcSpmwSdpy2kmM1y8WArK9JrYWi/nyMYYsLSs+PEemldEAtz@vger.kernel.org
X-Gm-Message-State: AOJu0YyeVwxyMKo7XX5oOGLS+2M8T0mYYeq+o1zlpx8HcZVE3qbhqjEg
	DpAMdA3Ljd9m/s2QuK0N4+4bdq96HOVs9ikIacvCfLFZQzTE+3JxIgYEXL1MclbWcuu87qdNbU2
	Ox7Q7jdsL2qBV1jZiwzVsUjCuhyz+eWA=
X-Gm-Gg: AR+sD12+of0otD/FXFczeQYc3LwTzNXb+W6uNQzPIV8Ri4ck3t8+6OhjX1/lw8tN0ZN
	ZBToxYaqOuQiQ+jTLN4rI/rzXBd4lDcKI51IidfyV1gX6afQ92dN9+2xJ7KP/IjMcHtB868dlJP
	SN9j+Md/P0OfZ5wU3YyU+U/hPhwV+TI7+b+BUMdVZPzqJFGYP90smlJg8W7X14tEnQFMQhYPvwf
	SE3eUY4+byJx4blePnk1+iUl/O0b/8r9EJ2acf+bnc+5fTlQGv7VUxcAxqcmbfR/7eTkjF6AOmc
	Bl/+L64r8xskBNiLrHvjv8E0AyODY12qngOwPevknUp14eIqGPbYwytMa1l86Ch63dIyzCo3dYl
	NmCOpkWXhzBqJYvO6XgRV2/9GPRDjPY2rDtwgrmA1jPuwxFBlUjDSiP/twKyJJUMDSAA3FmNqUd
	uK+Fsm6xHj9I9H6R2ZDKO7RkLobS/ux+IfDpw4yJPFrH1f0QP5
X-Received: by 2002:a05:6102:1492:b0:745:78d4:4856 with SMTP id
 ada2fe7eead31-75b2226b36dmr8916982137.7.1785818282020; Mon, 03 Aug 2026
 21:38:02 -0700 (PDT)
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
 <a9ce53dd-0873-41c0-ad6a-fb42e6cc7aaa@lunn.ch>
In-Reply-To: <a9ce53dd-0873-41c0-ad6a-fb42e6cc7aaa@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 22:37:51 -0600
X-Gm-Features: AUfX_my4YsBDZd6K0e5M7YLW68aLI1B4Ub2Wc8OS8k7km2q52f4ciX_OEuUghsE
Message-ID: <CADvTj4qpHU3F0DrEmc0vFi+JiwTNERniiMHKo1LmBd8sg58wJA@mail.gmail.com>
Subject: Re: [PATCH 10/21] net: phy: add X-Powers AC200 EPHY control driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 8:22=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
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
>
> Given how messy this hardware is, i doubt it is discoverable. We have
> been pushing back on hacks to enable various things before probe in
> order to make it discoverable. So you are going to end up putting IDs
> in DT so that the driver probes without it being discovered. That
> means you can put any ID you want in DT, and the driver. So you have
> two different phy driver structs, two different probe functions, etc.

I agree that the link PHY cannot be identified by reading its
registers before the package control sequence has run. I do not agree
that this means an arbitrary ID should be placed in DT, though.

The Ethernet PHY binding explicitly defines
ethernet-phy-idAAAA.BBBB as the correct contents of the PHY identifier
registers. It also documents using that compatible when clocks,
resets, supplies, or another initialization sequence must be applied
before those registers can be read. That is exactly our situation, so
ethernet-phy-id0044.1400 lets phylib create the phy_device without an
initial MDIO read. Once the selected control provider has powered the
hardware, the driver can read MII_PHYSID1 and MII_PHYSID2 and validate
that ID.

Both AC200 and AC300 expose the same link-side PHY ID and register
layout. The package choice changes how that PHY is initialized, not
the identity of the link PHY itself. Inventing separate IDs would turn
the compatible into a Linux driver selector and would describe values
which the hardware never reports.

The package variant is discoverable independently through the SID
configuration field. Fixed boards can reference one control provider,
while boards shipped with either package can use SID to select between
the AC200 I2C control provider and the AC300 MDIO control provider.

For that reason, I do not think two phy_driver structures and two PHY
probe functions model the hardware correctly. There is one common
link PHY, so its Clause 22 implementation should remain in one PHY
driver. The two different implementations belong at the control
endpoints, where AC200 and AC300 genuinely differ in transport,
resources, and lifetime.
