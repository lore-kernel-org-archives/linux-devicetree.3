Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516857;
	b=VnPfmhTykEUn9Czn9Ff9xib7ZK/3FO9s61IH3AtcSzU9n4fTe4rhQPWvOtwYslRUeLxV
	 5YMs4GIDwttGzRkxPLZUGylOJBAnVSDa4BF87wZVjQZT6jSgG9yRADdICPU511Ig3PpFk
	 MMcUpUgexcL4QfvBxVUtjG+QvOsb5eJTCYoupXGgPpf1zlC0qDa7UU21CKZL97G6sLIc8
	 JMR2kObSF/k/3Mlsbjao3hYnPxLifoQmjgab/HkcrdX4HVsPlnVqyFJOzWMq/aA1r2Yw1
	 ixGSGNQ/JhJBDrLkKcSYbjT/6NOciLqzmzU7XYHgI0DwKOYTUGSczGXnIP0A/JvjYww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516857;
	h=DMARC-Filter:Message-ID:DKIM-Signature:DKIM-Signature:Subject:From:
	 To:Cc:Date:In-Reply-To:References:Organization:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Rb9J0hSRc+mSsT0T6DiOfhg76UjavfvENEi0jQslYHY=;
	b=ym9jD7Z/UlIajMLDO7Ly0fvDB/fizCZKDRCg+KxVIvhc/aVp3mvGwJSlIjESjKCh5rqP
	 QXIBvj4EA7VHHd03SJIqT/4zmHy4v+sh5tsi0X/+FpY5JX/owUeoHk05rfdMR2A95GZ8l
	 QyMRrAJ9tKLQbcOeTsdun3mIeVhxlPFBTm8GI1viM+MTDo2iUEEQf3EsXMzNjSpxpSEJW
	 r352RuYvKxcKarYuI8pQzHFWWOKSUNyUpZQd8W1+fpFPHhbKlxD+k+4OClYd5nUK3sZhW
	 qufnze2B+Lufnmtxcbz8gPVCopAO1YinrMZVXUCwPr96iiI5N74oz/BLkdeSTFrza8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HfngUNTA;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Axiv8UFE;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C61606A321;
	Tue, 24 Nov 2026 10:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61C61606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HfngUNTA;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Axiv8UFE
Message-ID: <fd998850d10838b97a3627ac7f9eafea6752846e.camel@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795516855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rb9J0hSRc+mSsT0T6DiOfhg76UjavfvENEi0jQslYHY=;
	b=HfngUNTA+8qnIMWJ74QOqK1c2HJEfoD/qO4IzC3JDW/2tIHlXQXhHOgTqN+xXYJIvM3c5/
	4O1NvveekJqzqBU/Y06WKA+o9dw8gcCfej164dJNWyHfYgwBUD+b52FStHhdPrz9xUWGZ+
	y9Ou/CsqameWQnrbnhD1lfFPp1Jg+93juKOK50jwSuaW4nesCGt5zwq5QSAPI/v1Myz0Nt
	PwbDEEQ7smN6VCih1I9mvDg/a3d0c9FYeGaC+iUCi6Q+EUGM+eVW/YbLRcMttrf8T7o1ze
	8c50gZwaIIRlYK32XpWisI6AkSvaegWtgKplSLm8bhz9EaNxkjj5060qE6SUWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795516855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rb9J0hSRc+mSsT0T6DiOfhg76UjavfvENEi0jQslYHY=;
	b=Axiv8UFEAkx0LUy5zK8nNlC5Fu/MLL+V2QMS0NLB7kh/BQL16vXNMFOw55zcFMXv5wWH72
	9qys7gGcmKmUOYAA==
Subject: Re: [PATCH net-next v5 3/9] dt-bindings: net: dsa: Add SoC-e SWIP
 switch function
From: Vasilij Strassheim <v.strassheim@linutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Vladimir
 Oltean <olteanv@gmail.com>,  "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Russell King <linux@armlinux.org.uk>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Eric
 Dumazet <edumazet@kernel.org>, Lee Jones <lee@kernel.org>,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, mfd@lists.linux.dev,  Martin Kaistra
 <martin.kaistra@linutronix.de>, Benedikt Spranger <b.spranger@linutronix.de>
Date: Tue, 24 Nov 2026 11:40:52 +0100
In-Reply-To: <20261122-camouflaged-pretty-camel-79f370@quoll>
References: 
	<20261120-devel-vstrassheim-soce-dsa-ml-v5-0-5de9225715e6@linutronix.de>
	 <20261120-devel-vstrassheim-soce-dsa-ml-v5-3-5de9225715e6@linutronix.de>
	 <20261122-camouflaged-pretty-camel-79f370@quoll>
Organization: Linutronix GmbH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, 2026-11-22 at 15:54 +0100, Krzysztof Kozlowski wrote:
> On Fri, Nov 20, 2026 at 03:52:20PM +0100, Vasilij Strassheim wrote:
> > +$ref: dsa.yaml#/$defs/ethernet-ports
> > +
> > +properties:
> > +  compatible:
> > +    const: soce,swip-switch-00-04-0c-10
> > +    description:
> > +      This compatible identifies the register layout; its suffix gives
> > +      the offsets of the core version and feature identification
> > +      registers (0x00, 0x04, 0x0c, and 0x10). Port counts and optional
> > +      features depend on the FPGA synthesis configuration and are
> > +      detected at runtime using this register layout.
> > +
> > +  reg:
> > +    description:
> > +      Register window of the IP core. Switch register blocks are locat=
ed at
> > +      offsets defined by the compatible. The MDIO controller and bus
> > +      multiplexer occupy separate subregions described by sibling node=
s.
> > +    maxItems: 1
> > +
> > +  ethernet-ports:
> > +    type: object
>=20
> I guess this should follow:
> https://lore.kernel.org/r/20261120002549.1908299-7-prabhakar.mahadev-lad.=
rj@bp.renesas.com/
>=20
> so: additionalProperties: true
>=20
> > +    patternProperties:
> > +      '^ethernet-port@[0-9a-f]+$':
>=20
> and:
> '^ethernet-port@':
>=20
> > +        type: object
>=20

Yes, that looks good. I will do that.

> Best regards,
> Krzysztof
>=20
Thanks for the tip!
Vasilij

