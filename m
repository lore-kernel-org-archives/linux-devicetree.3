Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521850;
	b=IiwyY14Nk7M+E5M6QxVdX4Rg7Z19dz6Qzsm4wVh+dV50SmRrp5vcONpEuMDbzUbzzuIs
	 y3ibuwHmGxLx6TXmwqbfxqZMnjUx1iTyskqriwV6Y63/37XiGyDGO9DhmA0KEHjXOotB+
	 +tH4Rdfyv9Gg9ejFnJTFFcMX7jKjAJHZWfld2boSACGJKzkBYIzv6bYOdVZHiG8YRZPoZ
	 c5j45FzaMbC4gcqOoT85r1m6Sau1V5sJAaI3zG22mHzIWk0mOxr9p/mFXXBF3GAC0r/7u
	 RNgytkQz2o3xpqeDhA70ZyyuPtSyhYS8q8y4YgYS+tOiAyz2Xi2nQp/RGpV/3Yz1inw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521850;
	h=DMARC-Filter:Message-ID:DKIM-Signature:DKIM-Signature:Subject:From:
	 To:Cc:Date:In-Reply-To:References:Organization:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=dOtQLZCrhUQO5+77tG8G7mFA+K9A/7D/ufirbjE1Ndc=;
	b=fldbN4n0PgMA0x75uj12cwddBOvrmroseYWmsvcKNJU5nHGayky+TllYENYygb1gaATO
	 duN3+Pn32q2rMtK/6H/F/5KSy9XENZNMm3Q9TMSpFqCK5LeZpgdzwkT+PEEckgvYefw9y
	 HGw43VaSH2z5RExQll+4SA3l0bYSqigJXm5k4mswdl9quoZB1e1K8qhajYrvS3eiYr9+L
	 6+hfeWI8ymIjGwXgK1HMGw941y/nfU2wKzZfXPeU4zS+e7DAHiYlhpNzn/TSR9Jo9bEEx
	 CBQyr6FiMzdUWaYEwggrlvbyQuEOOVBV1ryo4YSMiV5kzH/adt/HJCuTjJcAGbEl4eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=0RIDOwA3;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=kDmbdYqP;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625E3606A33B;
	Tue, 24 Nov 2026 12:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 625E3606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=0RIDOwA3;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=kDmbdYqP
Message-ID: <2914e08473cb0827bff626e17c9bcaeba93720c9.camel@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795521847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dOtQLZCrhUQO5+77tG8G7mFA+K9A/7D/ufirbjE1Ndc=;
	b=0RIDOwA3IRp+6mtG2XAbHpHG1LG4Drv4w4QJpDvVCmFAQYdbAhXbtRn6wZOXbAZfFanRAE
	Csq8cQH3IGtQmKsoePL+OxYJoDz0e6ltPfkrEZP3wR5gzlYdqnFdM0jAaBbRobwB1EFdeJ
	kdOUGE3MbEEKpnWJPIDrDdRdkkklYAzBxFLmW/8OvGeqIoGyBC5BEWOCMsutahjyiR7YoE
	dVrNnnKuik83Y4WQEqNtq5onoz01/ShIbre2MZb5xq4A2xUX24OimAowyOWGR9RIT3V0VD
	psQ9HL6XWvf1mKSCKIdkeHwXe1on/wacTpmohD+wUyVbi4qoILcHbBqtO7OrSg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795521847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dOtQLZCrhUQO5+77tG8G7mFA+K9A/7D/ufirbjE1Ndc=;
	b=kDmbdYqPhCxpxPelHe40FjJ5MfVh7rjlk4AxUvLpjfZDFFPgXYlTgvV0mSOxvwhuATdmu4
	cldDa+pgcxafB9CQ==
Subject: Re: [PATCH net-next v5 2/9] dt-bindings: net: Add SoC-e SWIP MDIO
 controller
From: Vasilij Strassheim <v.strassheim@linutronix.de>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, 
	conor+dt@kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Date: Tue, 24 Nov 2026 13:04:05 +0100
In-Reply-To: <sashiko-outbox-227106@kernel.org>
References: 
	<20261120-devel-vstrassheim-soce-dsa-ml-v5-0-5de9225715e6@linutronix.de>
	 <20261120-devel-vstrassheim-soce-dsa-ml-v5-2-5de9225715e6@linutronix.de>
	 <sashiko-outbox-227106@kernel.org>
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

On Sat, 2026-11-21 at 14:53 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] dt-bindings: net: soce,swip-mdio splits contiguous register
>   block and 32-bit control register
> --
>=20
> commit 9edcf12a958c9e727ec0bdb9d997f3a5d2655e08
> Author: Vasilij Strassheim <v.strassheim@linutronix.de>
>=20
> dt-bindings: net: Add SoC-e SWIP MDIO controller
>=20
> This commit adds a Device Tree binding schema for the MDIO controller
> integrated into SoC-e SWIP Ethernet switch IP cores.
>=20
> > diff --git a/Documentation/devicetree/bindings/net/soce,swip-mdio.yaml =
b/Documentation/devicetree/bindings/net/soce,swip-mdio.yaml
> > new file mode 100644
> > index 0000000000000..7a0b8bd3ab71b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/soce,swip-mdio.yaml
> > @@ -0,0 +1,47 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/soce,swip-mdio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SoC-e SWIP FPGA MDIO controller
> > +
> > +maintainers:
> > +  - Vasilij Strassheim <v.strassheim@linutronix.de>
> > +
> > +description:
> > +  MDIO controller integrated into the SoC-e Switch IP (SWIP) FPGA core=
.
> > +  External MDIO buses are selected through a sibling MMIO MDIO mux.
> > +
> > +$ref: mdio.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: soce,swip-mdio
> > +
> > +  reg:
> > +    items:
> > +      - description: MDIO parameter, write data, and read data registe=
rs
> > +      - description: Lower 16-bit half of the MDIO transaction control=
 register
> > +
> > +  reg-names:
> > +    items:
> > +      - const: data
> > +      - const: control
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    mdio@204 {
> > +        compatible =3D "soce,swip-mdio";
> > +        reg =3D <0x204 0xc>, <0x200 0x2>;
> > +        reg-names =3D "data", "control";
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +    };
>=20
> [Severity: Medium]
> As reported by Andrew Lunn on v3 [1], should this binding describe the
> controller's contiguous 16-byte register block at <0x200 0x10> instead of
> splitting it into out-of-order sub-ranges (<0x204 0xc> and <0x200 0x2>) a=
nd
> slicing the 32-bit control register at 0x200 across two DT nodes?
>=20
> In hardware, the 32-bit control register at 0x200 holds both the MDIO
> transaction control bits and the external bus selector bits, followed by =
the
> three data registers at 0x204..0x20f.  Partitioning that single 32-bit
> register into 16-bit halves so a sibling mdio-mux-mmioreg node can claim
> <0x202 0x2> encodes Linux driver details, little-endian byte offsets, 16-=
bit
> MMIO access assumptions, and an artificial mdio@204 unit address into the=
 DT
> binding ABI.  Describing reg =3D <0x200 0x10> on mdio@200 and modeling th=
e
> integrated bus mux directly in the controller binding would match the
> hardware layout.
>=20
> [1] https://lore.kernel.org/r/e5aa5cd8-e805-47d3-a105-07bf1b9eb9b8@lunn.c=
h

The comment in [1] was based on an error in a previous version of the
example.

A separate discussion led me to use mdio-mux-mmioreg.
The two 16-bit halves can be accessed independently by the controller
and mux. I would prefer to represent those ranges separately in this
binding.


