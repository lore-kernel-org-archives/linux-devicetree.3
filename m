Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDFA48AE38
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787157893; cv=none; b=hBKopNjKrs+/l/u1Zuoe9OOypjaEFMpQdqYlKQSJc+K1DI2MqxCpNerfNUsWlZy8A7EimpkyE7eiPPQeFfg3vgZCG2A7nNE1nLd1S1qrJ7jbUbpLGAcLPbDryavYaRnm2Vp7Eau0tHJGyMb2hr1FQ5M5301IQhYueZ+WR7H1Z20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787157893; c=relaxed/simple;
	bh=mdNBwbxqmYstQ5cxZydkMknvbdnzI6Ve+XXieIEKgxk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sOJcOQwdX60DlToYElyhYagezCYJ5c2EoGabm+Eji6YKi13LDK0apB0OEns1f4wQkNQeWYiFNNU9ePhOuTmA6NWHfjWNpsDaSGaONEcJuQyX5ImHzMNZ86euDiokT322vOgAmAC0ND629l0oMjmGTHQkZCXvvLnrcF43gVRfedM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HwL0OwLq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HwL0OwLq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B1421F000E9;
	Wed, 19 Aug 2026 16:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787157891;
	bh=AizUfvat3rwisswGV0rT0QRWm64gVptYdXHNHZ2kUSY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HwL0OwLqWJ8FJLI3/hdT9YXbhaRehKLyDEMJHaIeGEBgC5fl/ZUGxyaPS9XLkHPUE
	 srB4O7RNIV5vX/51s9vrheFxYQV9U0tmfRNveq+GIZbrPEQbbzHr76lDNXfZp9RduC
	 jpqacKrKt4Rln0j3qIesXqh7WmCtMsXc6g0oCYi83cxVG8s4dT0IXGUoBqGrxJryqC
	 JoA7J15aFhZM4gSucgJwet+h0QEEQ7iYESHpeGGaquaX0ZFSriSeZus/KkgDUVQFcK
	 xGI4Ac9wbH7rfTO8ZStdyT417G4LGDJaeDCI/SUPBxYr6sfp42afva+bN9XHNIWoAk
	 RmC+Ff5a90/bg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: usb: Document ST UCPD
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260819163410.119755-1-marex@nabladev.com>
References: <20260819163410.119755-1-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 16:44:50 +0000
Message-Id: <20260819164451.5B1421F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Missing array bounds constraint for `vconn-gpios` property
- [Low] Invalid 2-cell `interrupts` property in the GIC example
--

--- Patch [1]: [PATCH 1/4] dt-bindings: usb: Document ST UCPD ---
commit aa08ea31b02f8625de21d6b8fefbebccc2a9ddcf
Author: Marek Vasut <marex@nabladev.com>

dt-bindings: usb: Document ST UCPD

This commit introduces the device tree binding documentation for the ST
UCPD Type-C controller on STM32MP25. It describes the physical layer of
Power Delivery, CC signaling, and required external Vbus/Vconn controls.

> diff --git a/Documentation/devicetree/bindings/usb/st,stm32mp25-ucpd.yaml=
 b/Documentation/devicetree/bindings/usb/st,stm32mp25-ucpd.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/st,stm32mp25-ucpd.yaml
[ ... ]
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: phy
> +
> +  vconn-gpios:
> +    description: GPIOs used to control CC1 and CC2 Vconn

[Severity: Low]
Should this property have a constraint like maxItems: 2?

Since the description specifies it controls CC1 and CC2 Vconn, adding an
explicit array bounds constraint would prevent device tree validation from
silently accepting an arbitrary number of GPIOs.

> +
> +  vdd33-supply:
> +    description: Regulator that supplies the CC lines driver
[ ... ]
> +examples:
> +  - |
> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
> +
> +    ucpd: phy@480a0000 {
> +        compatible =3D "st,stm32mp25-ucpd";
> +        reg =3D <0x480a0000 0x1000>;
> +        access-controllers =3D <&rifsc 69>;
> +        clocks =3D <&rcc CK_BUS_USBTC>, <&rcc CK_KER_USBTC>;
> +        clock-names =3D "apb", "ker";
> +        interrupts =3D <46 IRQ_TYPE_LEVEL_HIGH>;

[Severity: Low]
Is this interrupt definition missing a cell?

The example includes arm-gic.h, which expects a 3-cell interrupt definition
such as <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>.=20

Using a 2-cell definition here might cause the dtbs_check validation to=20
complain about standard interrupt controllers, or it might lead developers=
=20
to copy an invalid configuration into their device trees.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819163410.1197=
55-1-marex@nabladev.com?part=3D1
