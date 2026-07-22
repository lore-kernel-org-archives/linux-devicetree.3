Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9FB3F9FB;
	Wed, 22 Jul 2026 07:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784703651; cv=none; b=PKEqsYuGCEjERTDROu5gJlSPCzWHYat2X5ta6y3ae0V9Kaf3twntzG+2uNa2/AVfgtqa0XQXDhZta34ZTCZbQfI2cK8k2KWR/VL6RYCYGYKM06aFSYlaseexp8NgPbwdBgJyB2OXvITcA0gW9JzgZ8sI77Wv959lmJ653B+ObaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784703651; c=relaxed/simple;
	bh=sMNG4ftk+nBwdcwV6Qoyp6aGByONnUoFIW5RFwmTIHo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fIiibY0AoNW6ucfow6dbizXF/jGkjyMjaYallO2jKBcJFnsEJK7Ss9Up5VHkkgRopvlVEsY14aTc0In6iIPRY2VNRlB8SdZLwZIqtuFM9wvtQPWmKOxdummsRTpKjTG2rs4JR6tlqfaXOyGsb5jzmOct9wFiMTXHh9MrMo332mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=L4ROw7Wm; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="L4ROw7Wm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784703648;
	bh=C55jJmDfmGi6xpILXoNlr/fLTzAI61lVTFq8ZnYY1Ss=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=L4ROw7WmxD0DtmLKlIjP2iYeD33ovUCxgEUFLf71Ovsb1jkdAagvaoppTpL0ATlN/
	 NQXSxgO8Nx0vj91tGSZACMYqo0NGJ+fjv53HUK4niolcSHps04ETXjiB3gAVNRsF96
	 qOPyznz4DllyhGchKA14oBLQWTmX4FGnhNWfq0jhv8Xwa2AWGmNxRC4bjV/cb33QT+
	 HY+1jeTBEB1Sr4YCBUbGGsTcUVhcHpP42qJ49UeT5ZZ73Fz3bA7Ol7p2wA2SQ7UVr7
	 z/AExnCM14rq2P04jrvVGWPQ8lk/f7vTzM5DCJQYAyOMi6iRR7j0wp/wy4H90Du5iV
	 S1bCyb8/Aycmw==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 23BB465B37;
	Wed, 22 Jul 2026 15:00:47 +0800 (AWST)
Message-ID: <ca289e45bbde8e8a2f823a1660aa0a8f88e94bc4.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/3] phy: add AST2700 usb3.2 phy driver
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>, Philipp Zabel
 <p.zabel@pengutronix.de>
Cc: "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
 "devicetree@vger.kernel.org"
	 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Wed, 22 Jul 2026 16:30:46 +0930
In-Reply-To: <TY2PPF5CB9A1BE6AE5B658D558EBDF24450F2F82@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20260116-upstream_usb3phy-v2-0-0b0c9f3eb6f4@aspeedtech.com>
		 <20260116-upstream_usb3phy-v2-2-0b0c9f3eb6f4@aspeedtech.com>
	 <ddb133ca1a3be605ee776b2276c1907c9ad32491.camel@codeconstruct.com.au>
	 <TY2PPF5CB9A1BE6AE5B658D558EBDF24450F2F82@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-07-15 at 05:55 +0000, Ryan Chen wrote:
>=20
> >=20
> > > +	}
> > > +
> > > +	/* Wait for USB3 PHY internal SRAM initialization done */
> > > +	ret =3D readl_poll_timeout(aspeed_phy->regs + PHY3S00, val,
> > > +				 val & PHY3S00_INIT_DONE,
> > > +				 USEC_PER_MSEC, 10 * USEC_PER_MSEC);
> > > +	if (ret) {
> > > +		dev_err(aspeed_phy->dev, "SRAM init timeout\n");
> > > +		goto err_assert_reset;
> > > +	}
> > > +
> > > +	val =3D readl(aspeed_phy->regs + PHY3S00);
> > > +	val |=3D PHY3S00_SRAM_BYPASS;
> > > +	writel(val, aspeed_phy->regs + PHY3S00);
> >=20
> > According to the datasheet PHY3S00[15] (PHY3S00_INIT_DONE above)
> > indicates that the PHY internal SRAM initialisation is complete. The da=
tasheet
> > reports the SRAM is used for configuration of calibration among other t=
hings.
> > PHY3S00[6] instructs the PHY that software has completed loading the
> > configuration data into SRAM, however PHY3S00_SRAM_BYPASS (PHY3S00[7])
> > tells the PHY to load configuration from "hard wired" values.
> >=20
> > Is it necessary to wait for SRAM initialisation to complete if we're by=
passing it?
> > Or are there other side-effects involved in the setting of PHY3S00[15]?
>=20
> Yes, it is necessary to wait SRAM initial, the driver polls PHY3S00[15].
> It reports that the boot loader in the PCS has finished initialising the=
=20
> SRAM (loading the contents into the PCS), and that initialisation has
> to complete before sram_bypass (PHY3S00[7]) may be asserted.=20
>=20

Can you improve the comment then to make it clear that the wait is
necessary despite the bypass?

Andrew
